# 6. Architecture Minimale

> Ce chapitre documente l'architecture technique : schéma des données, interactions entre composants et intégration de l'IA.

---

## 6.1 Philosophie architecturale

### 6.1.1 Principe "Juste ce qu'il faut"

En Vibe Coding, l'architecture doit être :

| ✅ À faire | ❌ À éviter |
| :--- | :--- |
| Simple et lisible | Over-engineering |
| Documentée | Architecture implicite |
| Évolutive | Monolithe rigide |
| Compréhensible par l'IA | Abstractions complexes |

### 6.1.2 Architecture choisie

```
┌─────────────────────────────────────────────────────────────┐
│                        FRONTEND                             │
│                  Next.js 15 (App Router)                    │
│         React Server Components + Client Components         │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                       API LAYER                             │
│                  Next.js API Routes                         │
│              /api/auth, /api/student, etc.                  │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                         ORM                                 │
│                       Prisma                                │
│              Type-safe queries, migrations                  │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                       DATABASE                              │
│                PostgreSQL (Supabase)                        │
│              Users, Classes, Courses, etc.                  │
└─────────────────────────────────────────────────────────────┘
```

## 6.2 Schéma des données (entités)

### 6.2.1 Modèle conceptuel

```
┌─────────┐       ┌─────────┐       ┌─────────┐
│  User   │──────▶│ Student │──────▶│  Class  │
│         │       │         │       │         │
└────┬────┘       └─────────┘       └────┬────┘
     │                                   │
     │            ┌─────────┐            │
     └───────────▶│ Teacher │◀───────────┘
                  │         │
                  └────┬────┘
                       │
                       ▼
                  ┌─────────┐       ┌─────────┐
                  │ Course  │──────▶│ Subject │
                  │         │       │         │
                  └────┬────┘       └─────────┘
                       │
                       ▼
                  ┌─────────┐
                  │Progression│
                  │         │
                  └─────────┘
```

### 6.2.2 Schéma Prisma simplifié

```prisma
// Utilisateur de base (auth)
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  role      Role     @default(STUDENT)
  createdAt DateTime @default(now())
  
  student   Student?
  teacher   Teacher?
}

enum Role {
  STUDENT
  TEACHER
  ADMIN
}

// Profil élève
model Student {
  id           String        @id @default(cuid())
  userId       String        @unique
  classId      String
  
  user         User          @relation(fields: [userId], references: [id])
  class        Class         @relation(fields: [classId], references: [id])
  progressions Progression[]
  messages     Message[]
}

// Profil professeur
model Teacher {
  id        String   @id @default(cuid())
  userId    String   @unique
  
  user      User     @relation(fields: [userId], references: [id])
  classes   Class[]
  courses   Course[]
}

// Classe
model Class {
  id        String    @id @default(cuid())
  name      String
  level     String
  teacherId String
  
  teacher   Teacher   @relation(fields: [teacherId], references: [id])
  students  Student[]
}

// Matière
model Subject {
  id      String   @id @default(cuid())
  name    String
  color   String?
  
  courses Course[]
}

// Cours
model Course {
  id          String   @id @default(cuid())
  title       String
  content     String   @db.Text
  subjectId   String
  teacherId   String
  createdAt   DateTime @default(now())
  
  subject     Subject  @relation(fields: [subjectId], references: [id])
  teacher     Teacher  @relation(fields: [teacherId], references: [id])
}

// Progression élève
model Progression {
  id         String   @id @default(cuid())
  studentId  String
  subjectId  String
  score      Int      @default(0)
  updatedAt  DateTime @updatedAt
  
  student    Student  @relation(fields: [studentId], references: [id])
}
```

*Listing 6.1 : Schéma Prisma des entités principales*

### 6.2.3 Relations clés

| Relation | Type | Description |
| :--- | :--- | :--- |
| User → Student/Teacher | 1:1 | Un user a un profil selon son rôle |
| Teacher → Class | 1:N | Un prof a plusieurs classes |
| Class → Student | 1:N | Une classe a plusieurs élèves |
| Teacher → Course | 1:N | Un prof crée plusieurs cours |
| Course → Subject | N:1 | Un cours appartient à une matière |

## 6.3 Schéma des interactions

### 6.3.1 Structure des routes (App Router)

```
src/app/
├── (auth)/                    # Routes publiques
│   ├── login/
│   │   └── page.tsx          # Formulaire connexion
│   └── register/
│       └── page.tsx          # Inscription
│
├── (dashboard)/               # Routes protégées
│   ├── student/
│   │   ├── page.tsx          # Dashboard élève
│   │   ├── chat/
│   │   │   └── page.tsx      # Chat Blaiz'bot
│   │   └── courses/
│   │       └── page.tsx      # Liste cours
│   │
│   ├── teacher/
│   │   ├── page.tsx          # Dashboard prof
│   │   ├── classes/
│   │   │   └── page.tsx      # Gestion classes
│   │   └── courses/
│   │       ├── page.tsx      # Liste cours
│   │       └── new/
│   │           └── page.tsx  # Création cours
│   │
│   └── admin/
│       ├── page.tsx          # Dashboard admin
│       └── users/
│           └── page.tsx      # Gestion users
│
└── api/                       # API Routes
    ├── auth/
    │   └── [...nextauth]/
    │       └── route.ts      # NextAuth handler
    ├── student/
    │   ├── progress/
    │   │   └── route.ts
    │   └── chat/
    │       └── route.ts      # Chat IA
    ├── teacher/
    │   ├── classes/
    │   │   └── route.ts
    │   └── courses/
    │       └── route.ts
    └── admin/
        └── users/
            └── route.ts
```

### 6.3.2 Flow d'une requête

```
┌─────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────┐
│ Client  │────▶│  API Route  │────▶│   Prisma    │────▶│   DB    │
│ (React) │     │ /api/...    │     │   Query     │     │ (Supabase)│
└─────────┘     └─────────────┘     └─────────────┘     └─────────┘
     │                │                    │                  │
     │◀───────────────│◀───────────────────│◀─────────────────│
     │     JSON       │     Type-safe      │       SQL        │
     │    Response    │       Data         │      Result      │
```

## 6.4 Intégration IA

### 6.4.1 Où intervient l'IA

| Fonctionnalité | Modèle | Route |
| :--- | :--- | :--- |
| Chat assistant | GPT-4 | `/api/student/chat` |
| Génération planning | GPT-4 | `/api/student/planning` |
| Amélioration cours | GPT-4 | `/api/teacher/ai/enhance` |
| Résumé progression | GPT-3.5 | `/api/teacher/ai/summary` |

### 6.4.2 Architecture du chat

```typescript
// /api/student/chat/route.ts

import { openai } from '@ai-sdk/openai';
import { streamText } from 'ai';

export async function POST(req: Request) {
  const { messages, context } = await req.json();
  
  const systemPrompt = `
    Tu es Blaiz'bot, un assistant éducatif bienveillant.
    Contexte de l'élève : ${context.studentLevel}
    Matière actuelle : ${context.subject}
    
    Règles :
    - Donner des indices, jamais la réponse directe
    - Encourager et féliciter les efforts
    - Adapter le niveau d'explication
  `;
  
  const result = streamText({
    model: openai('gpt-4'),
    system: systemPrompt,
    messages,
  });
  
  return result.toDataStreamResponse();
}
```

*Listing 6.2 : Route API pour le chat IA avec streaming*

### 6.4.3 Formats attendus

| Endpoint | Input | Output |
| :--- | :--- | :--- |
| `/api/student/chat` | `{ messages: [...], context: {...} }` | Stream text |
| `/api/teacher/ai/enhance` | `{ courseContent: string }` | `{ enhanced: string }` |

### 6.4.4 Garde-fous anti-hallucination

```typescript
// Validation des réponses IA
const guardrails = {
  // Ne pas inventer de faits
  factCheck: (response: string) => {
    const uncertainPhrases = ['je pense que', 'probablement'];
    return !uncertainPhrases.some(p => response.includes(p));
  },
  
  // Ne pas donner de réponses directes
  hintOnly: (response: string, question: string) => {
    // Vérifier que la réponse ne contient pas la solution
    return true; // Logique de vérification
  },
  
  // Longueur raisonnable
  maxLength: (response: string) => response.length < 2000,
};
```

## 6.5 Décisions architecturales

### 6.5.1 ADR (Architecture Decision Records)

| # | Décision | Alternatives | Raison du choix |
| :--- | :--- | :--- | :--- |
| ADR-001 | Next.js full-stack | Next + Express séparé | Simplicité, un seul déploiement |
| ADR-002 | Prisma ORM | Raw SQL, Drizzle | Type-safety, DX excellent |
| ADR-003 | Supabase | PlanetScale, Neon | Gratuit, auth intégrée |
| ADR-004 | Vercel AI SDK | LangChain | Plus simple pour chat |
| ADR-005 | shadcn/ui | Material UI, Chakra | Personnalisable, léger |

## 6.6 Preuves

### 6.6.1 Captures requises

- [ ] `06-architecture/schema-donnees.png` - Diagramme ER
- [ ] `06-architecture/structure-routes.png` - Arborescence app/
- [ ] `06-architecture/flow-requete.png` - Séquence request

### 6.6.2 Journal de bord

```
Date/heure : [À compléter]
Étape : 6 - Architecture technique
Objectif : Définir la structure du projet de production
Prompt utilisé : "Propose une architecture Next.js pour..."
Résultat : Structure App Router + API Routes + Prisma
Décision : Full-stack Next.js (pas de backend séparé)
Justification : Simplicité de déploiement, un seul repo
Preuve : BlaizBot-V1/docs/02-ARCHITECTURE_GLOBALE.md
```

---

**Mots-clés** : architecture, Prisma, API Routes, intégration IA, ADR
**Statut** : ✅ Documenté (BlaizBot-V1/docs/)
