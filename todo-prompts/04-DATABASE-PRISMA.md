# Phase 04 — Database Prisma

> Schéma Prisma complet, connexion Neon et données de seed

---

## 4.1 — Configuration Prisma

### 4.1.1 — Installer Prisma

#### Contexte
Prisma est l'ORM moderne pour Node.js/TypeScript. Il génère un client typé à partir du schéma.

#### Description
Packages à installer :
- `prisma` : CLI et générateur (devDependency)
- `@prisma/client` : Client runtime

#### Prompt
```
Installe Prisma :

npm install prisma --save-dev
npm install @prisma/client

Initialise Prisma avec PostgreSQL :

npx prisma init --datasource-provider postgresql

Fichiers créés :
- prisma/schema.prisma (schéma vide)
- .env (avec DATABASE_URL placeholder)
```

---

### 4.1.2 — Configurer la connexion Neon

#### Contexte
Neon est un PostgreSQL serverless gratuit, idéal pour le développement et Vercel.

#### Description
Neon fournit 2 URLs :
- `DATABASE_URL` : URL poolée (pour les requêtes normales)
- `DIRECT_URL` : URL directe (pour les migrations)

#### Prompt
```
1. Créer un compte sur https://neon.tech
2. Créer un projet "blaizbot"
3. Copier les URLs dans .env :

# .env
DATABASE_URL="postgresql://user:pass@ep-xxx.region.aws.neon.tech/neondb?sslmode=require"
DIRECT_URL="postgresql://user:pass@ep-xxx.region.aws.neon.tech/neondb?sslmode=require"

4. Configurer prisma/schema.prisma :

generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider  = "postgresql"
  url       = env("DATABASE_URL")
  directUrl = env("DIRECT_URL")
}

Note : Ne jamais commiter .env ! Ajouter à .gitignore.
```

---

### 4.1.3 — Créer le client Prisma

#### Contexte
On centralise l'instance Prisma pour éviter les connexions multiples en développement (hot reload).

#### Description
Pattern singleton pour éviter "Too many connections" en dev.

#### Prompt
```
Crée src/lib/prisma.ts :

import { PrismaClient } from "@prisma/client";

const globalForPrisma = globalThis as unknown as {
  prisma: PrismaClient | undefined;
};

export const prisma =
  globalForPrisma.prisma ??
  new PrismaClient({
    log: process.env.NODE_ENV === "development" ? ["error", "warn"] : ["error"],
  });

if (process.env.NODE_ENV !== "production") {
  globalForPrisma.prisma = prisma;
}

Ce pattern évite la multiplication des connexions lors du hot reload Next.js.
```

---

## 4.2 — Modèles de base

### 4.2.1 — Enum Role et User

#### Contexte
Le modèle User est central. Chaque utilisateur a un rôle (ADMIN, TEACHER, STUDENT, PARENT).

#### Description
```
User
├── id (CUID)
├── email (unique)
├── passwordHash (bcrypt)
├── role (enum)
├── firstName, lastName
├── contact info (phone, address, city, postalCode)
├── isActive, lastLogin
└── timestamps
```

#### Prompt
```
Ajoute au schéma Prisma :

enum Role {
  ADMIN
  TEACHER
  STUDENT
  PARENT
}

model User {
  id           String    @id @default(cuid())
  email        String    @unique
  passwordHash String
  role         Role
  firstName    String
  lastName     String
  phone        String?
  address      String?
  city         String?
  postalCode   String?
  isActive     Boolean   @default(true)
  lastLogin    DateTime?
  createdAt    DateTime  @default(now())
  updatedAt    DateTime  @updatedAt

  // Relations (à ajouter progressivement)
  StudentProfile  StudentProfile?
  TeacherProfile  TeacherProfile?
  Notification    Notification[]
  Message         Message[]
  CalendarEvent   CalendarEvent[]
}

Note : Les relations seront complétées au fur et à mesure.
```

---

### 4.2.2 — Modèles Level et Subject

#### Contexte
Les niveaux scolaires (9H, 10H, 11H) et les matières (Maths, Français...) sont des données de référence.

#### Description
- Level : niveau scolaire avec ordre d'affichage
- Subject : matière enseignée

#### Prompt
```
Ajoute les modèles de référence :

model Level {
  id        String   @id @default(cuid())
  name      String   @unique
  order     Int      @default(0)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  Class     Class[]
}

model Subject {
  id        String   @id @default(cuid())
  name      String   @unique
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  Course         Course[]
  Conversation   Conversation[]
  KnowledgeBase  KnowledgeBase[]
  StudentProfile StudentProfile[] @relation("StudentSubjects")
  TeacherProfile TeacherProfile[] @relation("TeacherSubjects")
}

Exemples de données :
- Levels : "9H", "10H", "11H"
- Subjects : "Mathématiques", "Français", "Histoire-Géographie"...
```

---

### 4.2.3 — Modèle Class

#### Contexte
Une classe regroupe des élèves d'un même niveau (ex: "9H-A").

#### Description
```
Class
├── id, name (unique)
├── levelId → Level
├── color (pour l'UI)
└── timestamps
```

#### Prompt
```
Ajoute le modèle Class :

model Class {
  id        String   @id @default(cuid())
  name      String   @unique
  levelId   String
  color     String?  @default("#3b82f6")
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  Level          Level            @relation(fields: [levelId], references: [id])
  StudentProfile StudentProfile[]
  TeacherProfile TeacherProfile[] @relation("TeacherClasses")
  Assignment     Assignment[]
  Conversation   Conversation[]
  Team           Team[]

  @@index([levelId])
}

La couleur permet de distinguer visuellement les classes dans l'UI.
```

---

## 4.3 — Profils utilisateurs

### 4.3.1 — StudentProfile

#### Contexte
Chaque élève a un profil qui le lie à sa classe et stocke ses informations spécifiques.

#### Description
Relation 1:1 avec User via userId unique.

#### Prompt
```
Ajoute StudentProfile :

model StudentProfile {
  id          String   @id @default(cuid())
  userId      String   @unique
  classId     String
  parentEmail String?

  User        User         @relation(fields: [userId], references: [id], onDelete: Cascade)
  Class       Class        @relation(fields: [classId], references: [id])
  Subject     Subject[]    @relation("StudentSubjects")
  Grade       Grade[]
  Progression Progression[]
  Supplement  StudentSupplement[]
}

L'option onDelete: Cascade supprime le profil si l'utilisateur est supprimé.
```

---

### 4.3.2 — TeacherProfile

#### Contexte
Les professeurs ont des relations many-to-many avec les classes et matières qu'ils enseignent.

#### Description
```
TeacherProfile
├── userId → User (1:1)
├── Class[] (many-to-many)
└── Subject[] (many-to-many)
```

#### Prompt
```
Ajoute TeacherProfile :

model TeacherProfile {
  id     String @id @default(cuid())
  userId String @unique

  User    User      @relation(fields: [userId], references: [id], onDelete: Cascade)
  Class   Class[]   @relation("TeacherClasses")
  Subject Subject[] @relation("TeacherSubjects")
  Course  Course[]
  CourseAssignment CourseAssignment[]
}

Les relations many-to-many utilisent des tables implicites gérées par Prisma.
```

---

## 4.4 — Contenu pédagogique

### 4.4.1 — Modèle Course

#### Contexte
Un cours est créé par un professeur pour une matière. Il peut être un dossier ou un cours avec contenu.

#### Description
```
Course
├── title, description, content
├── subjectId → Subject
├── teacherId → TeacherProfile
├── parentFolderId → Course? (arborescence)
├── isFolder, isDraft
├── difficulty (EASY, MEDIUM, HARD)
├── objectives[], tags[]
├── aiObjective, aiExerciseTypes[] (config IA)
└── timestamps
```

#### Prompt
```
Ajoute les enums et le modèle Course :

enum Difficulty {
  EASY
  MEDIUM
  HARD
}

model Course {
  id             String     @id @default(cuid())
  title          String
  description    String?
  content        String?
  subjectId      String
  teacherId      String
  parentFolderId String?
  isFolder       Boolean    @default(false)
  isDraft        Boolean    @default(true)
  difficulty     Difficulty @default(MEDIUM)
  duration       Int?
  objectives     String[]
  tags           String[]
  aiObjective    String?
  aiExerciseTypes String[]
  createdAt      DateTime   @default(now())
  updatedAt      DateTime   @updatedAt

  Subject        Subject        @relation(fields: [subjectId], references: [id])
  TeacherProfile TeacherProfile @relation(fields: [teacherId], references: [id])
  Parent         Course?        @relation("CourseToCourse", fields: [parentFolderId], references: [id])
  Children       Course[]       @relation("CourseToCourse")

  Chapter      Chapter[]
  Assignment   Assignment[]
  Resource     Resource[]
  Progression  Progression[]
  StudentScore StudentScore[]
}

La relation self-referential permet l'arborescence dossiers/cours.
```

---

### 4.4.2 — Modèles Chapter et Section

#### Contexte
Un cours est divisé en chapitres, eux-mêmes divisés en sections (leçons, exercices, quiz).

#### Description
```
Course → Chapter[] → Section[]
```

#### Prompt
```
Ajoute Chapter et Section :

enum SectionType {
  LESSON
  EXERCISE
  QUIZ
  VIDEO
}

model Chapter {
  id          String   @id @default(cuid())
  courseId    String
  title       String
  description String?
  order       Int      @default(0)
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt

  Course  Course    @relation(fields: [courseId], references: [id], onDelete: Cascade)
  Section Section[]

  @@index([courseId])
  @@index([order])
}

model Section {
  id        String      @id @default(cuid())
  chapterId String
  title     String
  type      SectionType @default(LESSON)
  content   String?
  order     Int         @default(0)
  duration  Int?
  createdAt DateTime    @default(now())
  updatedAt DateTime    @updatedAt

  Chapter Chapter       @relation(fields: [chapterId], references: [id], onDelete: Cascade)
  files   SectionFile[]

  @@index([chapterId])
  @@index([order])
}

model SectionFile {
  id          String   @id @default(cuid())
  sectionId   String
  filename    String
  fileType    String
  url         String
  size        Int?
  textContent String?
  createdAt   DateTime @default(now())

  Section Section @relation(fields: [sectionId], references: [id], onDelete: Cascade)

  @@index([sectionId])
}

L'ordre permet de réorganiser les chapitres/sections par drag & drop.
```

---

### 4.4.3 — Modèle Resource

#### Contexte
Ressources attachées à un cours (liens, vidéos YouTube, PDF...).

#### Description
Types de ressources supportés :
- LINK, YOUTUBE, PDF, IMAGE, DOCUMENT, EXCEL, POWERPOINT

#### Prompt
```
Ajoute Resource :

enum ResourceType {
  LINK
  YOUTUBE
  PDF
  IMAGE
  DOCUMENT
  EXCEL
  POWERPOINT
}

model Resource {
  id          String       @id @default(cuid())
  courseId    String
  title       String
  description String?
  type        ResourceType
  url         String?
  fileUrl     String?
  order       Int          @default(0)
  createdAt   DateTime     @default(now())
  updatedAt   DateTime     @updatedAt

  Course Course @relation(fields: [courseId], references: [id], onDelete: Cascade)

  @@index([courseId])
  @@index([type])
}
```

---

## 4.5 — Assignations et progression

### 4.5.1 — Modèle Assignment (legacy)

#### Contexte
Assignation simple d'un cours à une classe ou un élève.

#### Description
Modèle de base pour les assignations.

#### Prompt
```
Ajoute les enums et Assignment :

enum AssignmentStatus {
  ACTIVE
  COMPLETED
  CANCELLED
}

enum AssignmentTargetType {
  CLASS
  STUDENT
}

model Assignment {
  id         String               @id @default(cuid())
  courseId   String
  targetType AssignmentTargetType
  classId    String?
  studentId  String?
  dueDate    DateTime?
  status     AssignmentStatus     @default(ACTIVE)
  sectionIds String?
  createdAt  DateTime             @default(now())
  updatedAt  DateTime             @updatedAt

  Course Course @relation(fields: [courseId], references: [id])
  Class  Class? @relation(fields: [classId], references: [id])
}
```

---

### 4.5.2 — Modèle CourseAssignment (avancé)

#### Contexte
Version enrichie des assignations avec support équipes, récurrence et priorité.

#### Description
```
CourseAssignment
├── teacherId → TeacherProfile
├── courseId?, chapterId?, sectionId?
├── targetType (CLASS, TEAM, STUDENT)
├── classId?, teamId?, studentId?
├── title, instructions
├── startDate, dueDate
├── priority (LOW, MEDIUM, HIGH)
├── isRecurring, recurrenceRule, parentId
└── timestamps
```

#### Prompt
```
Ajoute CourseAssignment :

enum CourseAssignmentTarget {
  CLASS
  TEAM
  STUDENT
}

enum AssignmentPriority {
  LOW
  MEDIUM
  HIGH
}

model CourseAssignment {
  id             String                 @id @default(cuid())
  teacherId      String
  courseId       String?
  chapterId      String?
  sectionId      String?
  targetType     CourseAssignmentTarget
  classId        String?
  teamId         String?
  studentId      String?
  title          String
  instructions   String?
  startDate      DateTime?
  dueDate        DateTime?
  priority       AssignmentPriority     @default(MEDIUM)
  isRecurring    Boolean                @default(false)
  recurrenceRule String?
  parentId       String?
  createdAt      DateTime               @default(now())
  updatedAt      DateTime               @updatedAt

  TeacherProfile  TeacherProfile      @relation(fields: [teacherId], references: [id])
  Course          Course?             @relation(fields: [courseId], references: [id], onDelete: Cascade)
  Chapter         Chapter?            @relation(fields: [chapterId], references: [id], onDelete: Cascade)
  Section         Section?            @relation(fields: [sectionId], references: [id], onDelete: Cascade)
  Class           Class?              @relation(fields: [classId], references: [id], onDelete: Cascade)
  Team            Team?               @relation(fields: [teamId], references: [id], onDelete: Cascade)
  Student         User?               @relation(fields: [studentId], references: [id])
  Parent          CourseAssignment?   @relation("Recurrence", fields: [parentId], references: [id], onDelete: Cascade)
  Children        CourseAssignment[]  @relation("Recurrence")
  StudentProgress StudentProgress[]

  @@index([teacherId])
  @@index([courseId])
  @@index([classId])
  @@index([dueDate])
}
```

---

### 4.5.3 — Modèle StudentProgress

#### Contexte
Suivi de la progression d'un élève sur une assignation.

#### Description
États : NOT_STARTED → IN_PROGRESS → COMPLETED → GRADED

#### Prompt
```
Ajoute les enums et StudentProgress :

enum ProgressStatus {
  NOT_STARTED
  IN_PROGRESS
  COMPLETED
  GRADED
}

model StudentProgress {
  id           String           @id @default(cuid())
  assignmentId String
  studentId    String
  sectionId    String?
  status       ProgressStatus   @default(NOT_STARTED)
  score        Float?
  timeSpent    Int?
  completedAt  DateTime?
  createdAt    DateTime         @default(now())
  updatedAt    DateTime         @updatedAt

  CourseAssignment CourseAssignment @relation(fields: [assignmentId], references: [id], onDelete: Cascade)
  Student          User             @relation(fields: [studentId], references: [id], onDelete: Cascade)
  Section          Section?         @relation(fields: [sectionId], references: [id], onDelete: Cascade)

  @@unique([assignmentId, studentId])
  @@index([studentId])
  @@index([sectionId])
}
```

---

## 4.6 — Messagerie

### 4.6.1 — Modèle Conversation

#### Contexte
Les conversations peuvent être de classe (générale ou par topic) ou privées.

#### Description
Types :
- CLASS_GENERAL : toute la classe
- CLASS_TOPIC : sous-groupe thématique
- PRIVATE : conversation privée

#### Prompt
```
Ajoute les enums et Conversation :

enum ConversationType {
  CLASS_GENERAL
  CLASS_TOPIC
  PRIVATE
}

model Conversation {
  id             String           @id @default(cuid())
  type           ConversationType
  subjectId      String?
  topicName      String?
  participantIds String[]
  creatorId      String?
  classId        String?
  courseId       String?
  schoolYear     String           @default("2024-2025")
  createdAt      DateTime         @default(now())
  updatedAt      DateTime         @updatedAt

  Subject Subject?  @relation(fields: [subjectId], references: [id])
  Class   Class?    @relation(fields: [classId], references: [id])
  Course  Course?   @relation(fields: [courseId], references: [id])
  Creator User?     @relation("ConversationCreator", fields: [creatorId], references: [id])
  Message Message[]
}
```

---

### 4.6.2 — Modèles Message et MessageReadStatus

#### Contexte
Les messages sont dans une conversation. Le statut de lecture est tracké par utilisateur.

#### Description
```
Conversation → Message[] → MessageReadStatus[]
```

#### Prompt
```
Ajoute Message et MessageReadStatus :

model Message {
  id             String    @id @default(cuid())
  conversationId String
  senderId       String
  content        String
  attachments    Json?
  createdAt      DateTime  @default(now())

  Conversation      Conversation        @relation(fields: [conversationId], references: [id], onDelete: Cascade)
  Sender            User                @relation(fields: [senderId], references: [id])
  MessageReadStatus MessageReadStatus[]
}

model MessageReadStatus {
  id        String    @id @default(cuid())
  messageId String
  userId    String
  readAt    DateTime?

  Message Message @relation(fields: [messageId], references: [id], onDelete: Cascade)
  User    User    @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@unique([messageId, userId])
}
```

---

## 4.7 — Intelligence Artificielle

### 4.7.1 — Modèle AISettings

#### Contexte
Configuration globale de l'IA (provider, modèle, restrictions).

#### Description
Un seul enregistrement pour toute la plateforme.

#### Prompt
```
Ajoute les enums et AISettings :

enum AIProvider {
  OPENAI
  GOOGLE
  ANTHROPIC
  MISTRAL
  CUSTOM
}

enum AIRestrictionLevel {
  STRICT
  BALANCED
  CREATIVE
}

model AISettings {
  id                  String             @id @default("ai-settings")
  provider            AIProvider         @default(OPENAI)
  apiKey              String
  model               String             @default("gpt-4o")
  endpoint            String?
  restrictionLevel    AIRestrictionLevel @default(BALANCED)
  enablePdfAnalysis   Boolean            @default(true)
  allowTeacherPrompts Boolean            @default(true)
  maintenanceMode     Boolean            @default(false)
  platformName        String             @default("Blaiz'bot")
  defaultLanguage     String             @default("fr")
  updatedAt           DateTime           @updatedAt
}
```

---

### 4.7.2 — Modèles AIConversation et AIMessage

#### Contexte
Conversations avec l'assistant IA (séparées des messages humains).

#### Description
```
AIConversation → AIMessage[]
```

#### Prompt
```
Ajoute AIConversation et AIMessage :

model AIConversation {
  id            String      @id @default(cuid())
  userId        String
  title         String?
  courseIds     String[]
  systemPrompt  String?
  isPinned      Boolean     @default(false)
  messageCount  Int         @default(0)
  lastMessageAt DateTime?
  createdAt     DateTime    @default(now())
  updatedAt     DateTime    @updatedAt
  deletedAt     DateTime?

  user     User        @relation(fields: [userId], references: [id], onDelete: Cascade)
  messages AIMessage[]

  @@index([userId, lastMessageAt(sort: Desc)])
  @@index([userId, deletedAt])
}

model AIMessage {
  id             String   @id @default(cuid())
  conversationId String
  role           String   // "user" | "assistant" | "system"
  content        String
  attachments    Json?
  artifact       Json?
  sources        Json?
  createdAt      DateTime @default(now())

  conversation AIConversation @relation(fields: [conversationId], references: [id], onDelete: Cascade)

  @@index([conversationId, createdAt])
}
```

---

### 4.7.3 — Modèles StudentCoachSession et StudentCoachDaily

#### Contexte
Suivi pédagogique IA avec scores de compréhension, autonomie et rigueur.

#### Description
- Session : métriques par conversation
- Daily : agrégation journalière

#### Prompt
```
Ajoute StudentCoachSession et StudentCoachDaily :

model StudentCoachSession {
  id                 String   @id @default(cuid())
  conversationId     String   @unique
  userId             String
  comprehension      Float    @default(50)
  autonomy           Float    @default(50)
  rigor              Float    @default(50)
  comprehensionTrend Float    @default(0)
  autonomyTrend      Float    @default(0)
  rigorTrend         Float    @default(0)
  messageCount       Int      @default(0)
  durationSeconds    Int      @default(0)
  lastAdvice         String?
  createdAt          DateTime @default(now())
  updatedAt          DateTime @updatedAt

  conversation AIConversation @relation(fields: [conversationId], references: [id], onDelete: Cascade)
  user         User           @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId, createdAt])
}

model StudentCoachDaily {
  id               String   @id @default(cuid())
  userId           String
  date             DateTime @db.Date
  avgComprehension Float
  avgAutonomy      Float
  avgRigor         Float
  sessionCount     Int
  totalMessages    Int
  totalSeconds     Int
  badgesEarned     String[]

  user User @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@unique([userId, date])
  @@index([userId, date])
}

model StudentBadge {
  id        String   @id @default(cuid())
  userId    String
  badgeType String
  earnedAt  DateTime @default(now())

  user User @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@unique([userId, badgeType])
}
```

---

## 4.8 — Notifications et calendrier

### 4.8.1 — Modèle Notification

#### Contexte
Notifications in-app pour informer les utilisateurs (messages, assignations, notes...).

#### Description
Types : MESSAGE, ASSIGNMENT, GRADE, SYSTEM

#### Prompt
```
Ajoute Notification :

enum NotificationType {
  MESSAGE
  ASSIGNMENT
  GRADE
  SYSTEM
}

model Notification {
  id        String           @id @default(cuid())
  userId    String
  type      NotificationType
  title     String
  message   String
  link      String?
  read      Boolean          @default(false)
  createdAt DateTime         @default(now())

  User User @relation(fields: [userId], references: [id], onDelete: Cascade)
}
```

---

### 4.8.2 — Modèle CalendarEvent

#### Contexte
Événements personnels du calendrier (rendez-vous, rappels).

#### Description
Distincts des assignations, pour les événements libres.

#### Prompt
```
Ajoute CalendarEvent :

model CalendarEvent {
  id             String   @id @default(cuid())
  ownerId        String
  title          String
  description    String?
  startDate      DateTime
  endDate        DateTime
  isTeacherEvent Boolean  @default(false)
  createdAt      DateTime @default(now())
  updatedAt      DateTime @updatedAt

  User User @relation(fields: [ownerId], references: [id], onDelete: Cascade)
}
```

---

## 4.9 — Migrations et seed

### 4.9.1 — Générer la migration initiale

#### Contexte
Prisma Migrate crée les tables dans PostgreSQL à partir du schéma.

#### Description
La commande génère un fichier SQL et l'applique.

#### Prompt
```
Génère et applique la migration initiale :

npx prisma migrate dev --name init

Cette commande :
1. Compare le schéma avec la base (vide)
2. Génère un fichier SQL dans prisma/migrations/
3. Applique la migration
4. Régénère @prisma/client

Vérification :
- prisma/migrations/ contient un dossier avec le SQL
- npm run prisma:generate passe
```

---

### 4.9.2 — Créer le script de seed

#### Contexte
Le seed remplit la base avec des données de test (admin, profs, élèves, cours...).

#### Description
Le fichier `prisma/seed.ts` contient les données initiales.

#### Prompt
```
Crée prisma/seed.ts avec la structure :

import { PrismaClient, Role } from "@prisma/client";
import { hash } from "bcryptjs";

const prisma = new PrismaClient();

// --- DONNÉES ---

const SUBJECTS = [
  { id: "subject-mathematiques", name: "Mathématiques" },
  { id: "subject-francais", name: "Français" },
  { id: "subject-histoire-geo", name: "Histoire-Géographie" },
  { id: "subject-svt", name: "SVT" },
  { id: "subject-physique-chimie", name: "Physique-Chimie" },
  { id: "subject-anglais", name: "Anglais" },
];

const LEVELS = [
  { id: "level-9h", name: "9H", order: 1 },
  { id: "level-10h", name: "10H", order: 2 },
  { id: "level-11h", name: "11H", order: 3 },
];

const CLASSES = [
  { id: "class-9h-a", name: "9H-A", levelId: "level-9h", color: "#3b82f6" },
  { id: "class-9h-b", name: "9H-B", levelId: "level-9h", color: "#8b5cf6" },
  { id: "class-10h-a", name: "10H-A", levelId: "level-10h", color: "#ec4899" },
  { id: "class-10h-b", name: "10H-B", levelId: "level-10h", color: "#f59e0b" },
  { id: "class-11h-a", name: "11H-A", levelId: "level-11h", color: "#10b981" },
  { id: "class-11h-b", name: "11H-B", levelId: "level-11h", color: "#06b6d4" },
];

// Admin, Teachers, Students... (voir seed complet)

async function main() {
  console.log("🌱 Seeding database...");
  
  // 1. Créer les matières
  for (const subject of SUBJECTS) {
    await prisma.subject.upsert({
      where: { id: subject.id },
      update: {},
      create: subject,
    });
  }
  
  // 2. Créer les niveaux
  for (const level of LEVELS) {
    await prisma.level.upsert({
      where: { id: level.id },
      update: {},
      create: level,
    });
  }
  
  // 3. Créer les classes
  // 4. Créer les utilisateurs
  // 5. Créer les profils
  // 6. Créer des cours d'exemple
  
  console.log("✅ Seed completed!");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
```

---

### 4.9.3 — Configurer et exécuter le seed

#### Contexte
Il faut configurer package.json pour que `prisma db seed` fonctionne.

#### Description
Ajouter la configuration prisma.seed dans package.json.

#### Prompt
```
1. Ajoute dans package.json :

{
  "prisma": {
    "seed": "tsx prisma/seed.ts"
  }
}

2. Installe tsx si pas déjà fait :

npm install tsx --save-dev

3. Exécute le seed :

npx prisma db seed

Vérification : la base contient les données de test.
Tu peux vérifier avec Prisma Studio :

npx prisma studio
```

---

## 4.10 — Scripts npm

### 4.10.1 — Ajouter les scripts Prisma

#### Contexte
Scripts npm pour simplifier les commandes Prisma courantes.

#### Description
Ajouter dans package.json scripts.

#### Prompt
```
Ajoute ces scripts dans package.json :

{
  "scripts": {
    "prisma:generate": "prisma generate",
    "prisma:migrate": "prisma migrate dev",
    "prisma:push": "prisma db push",
    "prisma:seed": "prisma db seed",
    "prisma:studio": "prisma studio",
    "prisma:reset": "prisma migrate reset --force"
  }
}

Usage :
- npm run prisma:generate → régénère le client
- npm run prisma:migrate → applique les migrations
- npm run prisma:push → sync sans migration (dev rapide)
- npm run prisma:seed → remplit avec données test
- npm run prisma:studio → interface graphique
- npm run prisma:reset → ⚠️ reset complet (supprime tout!)
```

---

## 4.11 — Commit Phase 04

### 4.11.1 — Commit du schéma Prisma

#### Contexte
Sauvegarder tout le travail de modélisation.

#### Description
Commit avec le schéma complet.

#### Prompt
```
Commit le schéma Prisma :

git add .
git commit -m "feat: add Prisma schema with all models

Models:
- User, StudentProfile, TeacherProfile
- Level, Subject, Class
- Course, Chapter, Section, Resource
- Assignment, CourseAssignment, StudentProgress
- Conversation, Message, MessageReadStatus
- AISettings, AIConversation, AIMessage
- StudentCoachSession, StudentCoachDaily, StudentBadge
- Notification, CalendarEvent

Seed script for test data"

Vérification : git log montre le commit.
```

---

## ✅ Checklist Phase 04

- [ ] Prisma installé
- [ ] Connexion Neon configurée (.env)
- [ ] Client Prisma singleton créé
- [ ] Modèle User avec enum Role
- [ ] Modèles Level, Subject, Class
- [ ] Modèles StudentProfile, TeacherProfile
- [ ] Modèles Course, Chapter, Section
- [ ] Modèles Assignment, CourseAssignment
- [ ] Modèle StudentProgress
- [ ] Modèles Conversation, Message
- [ ] Modèles AI (Settings, Conversation, Message)
- [ ] Modèles Coach (Session, Daily, Badge)
- [ ] Modèles Notification, CalendarEvent
- [ ] Migration initiale générée
- [ ] Script de seed créé et exécuté
- [ ] Scripts npm ajoutés
- [ ] Commit effectué

---

## 📊 Récapitulatif des modèles

| Catégorie | Modèles |
|:----------|:--------|
| **Utilisateurs** | User, StudentProfile, TeacherProfile |
| **Référentiel** | Level, Subject, Class |
| **Contenu** | Course, Chapter, Section, Resource, SectionFile |
| **Assignations** | Assignment, CourseAssignment, StudentProgress |
| **Messagerie** | Conversation, Message, MessageReadStatus |
| **IA** | AISettings, AIConversation, AIMessage, AIChat |
| **Coach** | StudentCoachSession, StudentCoachDaily, StudentBadge |
| **Système** | Notification, CalendarEvent, SystemSetting |

**Total** : ~30 modèles + ~15 enums

---

*Phase suivante : [05-AUTHENTIFICATION.md](05-AUTHENTIFICATION.md)*
