# Phase 16 — Student : Révisions (Suppléments personnels)

> Système de suppléments avec chapitres, cartes multi-types, et liaison cours

---

## Vue d'ensemble

Cette phase implémente le système complet de **révisions personnelles** pour l'élève :
- **Suppléments** : collections de notes liées ou non à des cours
- **Chapitres** : organisation hiérarchique des cartes
- **Cartes** : contenus multi-types (NOTE, LESSON, VIDEO, EXERCISE, QUIZ)
- **Fichiers** : attachements aux cartes
- **Attribution** : liaison many-to-many avec les cours

**Modèles Prisma :**
```
StudentSupplement → StudentChapter → StudentCard → StudentFile
                                                 → StudentQuiz → StudentQuizAttempt
StudentSupplementCourse (table de liaison many-to-many)
```

**Fichiers créés :**
```
src/app/(dashboard)/student/revisions/page.tsx
src/app/(dashboard)/student/revisions/create/page.tsx
src/app/(dashboard)/student/revisions/[id]/page.tsx
src/app/api/student/supplements/route.ts
src/app/api/student/supplements/[id]/route.ts
src/app/api/student/supplements/[id]/chapters/route.ts
src/app/api/student/supplements/[id]/chapters/[chapterId]/route.ts
src/app/api/student/cards/route.ts
src/app/api/student/cards/[id]/route.ts
src/components/features/student/revisions/RevisionsHeader.tsx
src/components/features/student/revisions/RevisionsTabs.tsx
src/components/features/student/revisions/SupplementCard.tsx
src/components/features/student/revisions/CreateSupplementForm.tsx
src/components/features/student/revisions/SupplementDetailHeader.tsx
src/components/features/student/revisions/StudentChapterManager.tsx
src/components/features/student/revisions/StudentCardExpanded.tsx
src/components/features/student/revisions/StudentCardEditor.tsx
src/components/features/student/revisions/StudentFilesManager.tsx
src/components/features/student/revisions/CourseAttributionDialog.tsx
src/components/features/student/revisions/inline-editors/
```

---

## Tâche 16.1 — Modèles Prisma suppléments élève

### Contexte
Schéma de données pour le système de révisions personnelles avec relation many-to-many vers les cours.

### Description
Ajouter les modèles dans `prisma/schema.prisma` pour les suppléments, chapitres, cartes et fichiers.

### Prompt
```
Ajoute les modèles Prisma pour le système de révisions élève.

=== StudentSupplement ===
model StudentSupplement {
  id          String   @id
  studentId   String
  title       String
  description String?
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  Student     StudentProfile            @relation(fields: [studentId], references: [id], onDelete: Cascade)
  Chapters    StudentChapter[]
  Courses     StudentSupplementCourse[] // many-to-many
  
  @@index([studentId])
}

=== StudentSupplementCourse (liaison many-to-many) ===
model StudentSupplementCourse {
  id           String   @id @default(cuid())
  supplementId String
  courseId     String
  createdAt    DateTime @default(now())
  
  Supplement   StudentSupplement @relation(fields: [supplementId], references: [id], onDelete: Cascade)
  Course       Course            @relation(fields: [courseId], references: [id], onDelete: Cascade)
  
  @@unique([supplementId, courseId])
  @@index([supplementId])
  @@index([courseId])
}

=== StudentChapter ===
model StudentChapter {
  id           String   @id
  supplementId String
  title        String
  description  String?
  orderIndex   Int      @default(0)
  createdAt    DateTime @default(now())
  
  Supplement   StudentSupplement @relation(fields: [supplementId], references: [id], onDelete: Cascade)
  Cards        StudentCard[]
  
  @@index([supplementId])
  @@index([orderIndex])
}

=== StudentCard ===
model StudentCard {
  id         String          @id
  chapterId  String
  title      String
  content    String
  cardType   StudentCardType @default(NOTE)
  orderIndex Int             @default(0)
  createdAt  DateTime        @default(now())
  updatedAt  DateTime        @updatedAt
  
  Chapter    StudentChapter @relation(fields: [chapterId], references: [id], onDelete: Cascade)
  Files      StudentFile[]
  Quiz       StudentQuiz?
  
  @@index([chapterId])
  @@index([orderIndex])
}

=== StudentFile ===
model StudentFile {
  id        String   @id
  cardId    String
  filename  String
  fileType  String
  url       String
  createdAt DateTime @default(now())
  
  Card      StudentCard @relation(fields: [cardId], references: [id], onDelete: Cascade)
  
  @@index([cardId])
}

=== StudentQuiz ===
model StudentQuiz {
  id          String   @id
  cardId      String   @unique
  questions   Json
  aiGenerated Boolean  @default(false)
  createdAt   DateTime @default(now())
  
  Card        StudentCard          @relation(fields: [cardId], references: [id], onDelete: Cascade)
  Attempts    StudentQuizAttempt[]
}

=== StudentQuizAttempt ===
model StudentQuizAttempt {
  id          String   @id
  quizId      String
  score       Int
  answers     Json
  completedAt DateTime @default(now())
  
  Quiz        StudentQuiz @relation(fields: [quizId], references: [id], onDelete: Cascade)
  
  @@index([quizId])
}

=== Enum StudentCardType ===
enum StudentCardType {
  NOTE
  LESSON
  VIDEO
  EXERCISE
  QUIZ
}

Note : Ajouter aussi la relation inverse dans Course :
  StudentSupplementCourses StudentSupplementCourse[]

Lancer : npx prisma migrate dev --name add_student_supplements
```

---

## Tâche 16.2 — API GET/POST suppléments

### Contexte
API pour lister et créer les suppléments de l'élève avec support many-to-many pour les cours.

### Description
Créer `src/app/api/student/supplements/route.ts` avec GET (liste) et POST (création).

### Prompt
```
Crée src/app/api/student/supplements/route.ts - API liste et création suppléments.

=== GET - Liste des suppléments ===
Paramètres query :
- courseId (optionnel) : filtrer par cours lié

Retour :
{
  success: true,
  data: [{
    id, title, description,
    // Many-to-many
    courseIds: string[],
    courses: { id, title, teacher }[],
    // Backward compat
    courseId: string | null,
    course: { id, title, teacher } | null,
    chapterCount: number,
    cardCount: number,
    createdAt, updatedAt
  }]
}

Prisma include :
- Courses → Course → TeacherProfile.User
- Chapters → _count.Cards

=== POST - Créer un supplément ===
Body :
{
  title: string (min 3 chars),
  description?: string,
  courseId?: string,      // rétro-compat
  courseIds?: string[]    // nouveau format many-to-many
}

Validation :
- title.trim().length >= 3
- Si courseIds fourni, vérifier que tous existent

Création :
- Générer id avec pattern "supp_xxx"
- Créer StudentSupplement
- Si courseIds, créer les StudentSupplementCourse

Helper suggéré : getStudentProfileId(userId) pour récupérer le studentId.
```

---

## Tâche 16.3 — API CRUD supplément individuel

### Contexte
API pour récupérer, modifier et supprimer un supplément avec ses chapitres et cartes.

### Description
Créer `src/app/api/student/supplements/[id]/route.ts` avec GET, PUT, DELETE.

### Prompt
```
Crée src/app/api/student/supplements/[id]/route.ts - CRUD individuel supplément.

=== GET - Détail complet ===
Vérifications :
- Auth + récupérer studentId
- Vérifier ownership (studentId du supplément)

Include Prisma :
- Courses → Course → TeacherProfile.User
- Chapters (orderBy orderIndex) → Cards (orderBy orderIndex) → Files, Quiz

Retour :
{
  success: true,
  data: {
    id, title, description,
    courseIds, courses,
    chapters: [{
      id, title, description, orderIndex,
      cards: [{
        id, title, content, cardType, orderIndex,
        files: [{ id, filename, fileType, url }],
        quiz: { id, aiGenerated, attemptCount } | null
      }]
    }],
    createdAt, updatedAt
  }
}

=== PUT - Modifier titre/description/cours ===
Body possible :
- { title?: string }
- { description?: string }
- { courseIds?: string[] } → remplacer les liaisons cours

Transaction pour modifier les cours :
1. Supprimer tous les StudentSupplementCourse existants
2. Créer les nouveaux

=== DELETE - Supprimer ===
Cascade automatique via Prisma (Chapters → Cards → Files).
```

---

## Tâche 16.4 — API CRUD chapitres supplément

### Contexte
API pour gérer les chapitres à l'intérieur d'un supplément.

### Description
Créer les routes pour les chapitres :
- `[id]/chapters/route.ts` : POST créer chapitre
- `[id]/chapters/[chapterId]/route.ts` : PUT/DELETE

### Prompt
```
Crée les API de gestion des chapitres de supplément.

=== src/app/api/student/supplements/[id]/chapters/route.ts ===
POST - Créer un chapitre :
Body : { title: string, order?: number }
- Vérifier ownership du supplément
- Générer id avec pattern "schap_xxx"
- orderIndex = order ?? count chapitres existants
- Retourner le chapitre créé

=== src/app/api/student/supplements/[id]/chapters/[chapterId]/route.ts ===
PUT - Modifier un chapitre :
Body : { title?: string, description?: string, orderIndex?: number }

DELETE - Supprimer un chapitre :
- Cascade sur Cards

Les deux routes vérifient :
1. Auth + studentId
2. Ownership du supplément
3. Le chapitre appartient bien au supplément

Pattern params : { params: Promise<{ id: string; chapterId: string }> }
```

---

## Tâche 16.5 — API CRUD cartes élève

### Contexte
API pour gérer les cartes de révision avec leurs différents types.

### Description
Créer les routes pour les cartes :
- `src/app/api/student/cards/route.ts` : POST créer
- `src/app/api/student/cards/[id]/route.ts` : GET/PUT/DELETE

### Prompt
```
Crée les API de gestion des cartes élève.

=== src/app/api/student/cards/route.ts ===
POST - Créer une carte :
Body :
{
  chapterId: string,
  title: string,
  content?: string,
  cardType?: StudentCardType (default 'NOTE')
}

Vérifications :
- Récupérer le chapitre
- Vérifier que le supplément parent appartient à l'élève

Création :
- id pattern "scard_xxx"
- orderIndex = count cartes existantes

=== src/app/api/student/cards/[id]/route.ts ===
GET - Récupérer le contenu complet :
- Utile si content omis dans les listes
- Include Files, Quiz

PUT - Modifier :
Body : { title?, content?, cardType?, orderIndex? }

DELETE - Supprimer :
- Cascade sur Files

Vérification ownership :
Card → Chapter → Supplement.studentId === current studentId
```

---

## Tâche 16.6 — Composant RevisionsHeader

### Contexte
Header de la page révisions avec titre, description, bouton création et 4 stats.

### Description
Créer `src/components/features/student/revisions/RevisionsHeader.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/RevisionsHeader.tsx - Header avec stats.

Interface props :
interface RevisionsHeaderProps {
  stats: {
    totalSupplements: number;
    linkedToCourse: number;
    personalCourses: number;
    totalCards: number;
  } | null;
}

Structure :
1. Titre "📚 Mes Révisions" avec description
2. Bouton "Nouveau" → Link /student/revisions/create

3. Grid 4 StatCards :
   - "Suppléments" - Book (blue) - totalSupplements
   - "Liés aux cours" - FileText (green) - linkedToCourse
   - "Cours perso" - Brain (purple) - personalCourses
   - "Total cartes" - FileText (orange) - totalCards

Chaque StatCard :
- Icon coloré
- Valeur grande (2xl font-bold)
- Label small muted

Composants : Card, CardContent, Button de shadcn/ui.
"use client" pour les interactions.
```

---

## Tâche 16.7 — Composant RevisionsTabs

### Contexte
Onglets pour filtrer les suppléments : Tous, Liés aux cours, Cours perso.

### Description
Créer `src/components/features/student/revisions/RevisionsTabs.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/RevisionsTabs.tsx - Tabs de filtrage.

Interface props :
interface Supplement {
  id: string;
  title: string;
  description: string | null;
  courseId: string | null;
  course: { id: string; title: string; teacher: string | null } | null;
  chapterCount: number;
  cardCount: number;
  createdAt: Date;
  updatedAt: Date;
}

interface RevisionsTabsProps {
  supplements: Supplement[];
}

3 onglets :
1. "Tous" (BookOpen) - tous les suppléments
2. "Liés aux cours" (Link2) - supplements.filter(s => s.courseId)
3. "Cours perso" (User) - supplements.filter(s => !s.courseId)

Chaque tab affiche le count entre parenthèses.

State : activeTab useState('all')

Contenu :
- Si filtered.length === 0 → EmptyState avec message approprié
- Sinon → Grid 3 colonnes de SupplementCard

EmptyState messages :
- all: "Aucune révision - Créez votre premier supplément..."
- linked: "Aucun supplément lié - Ajoutez des notes à vos cours..."
- personal: "Aucun cours personnel - Créez un cours perso..."

Composants : Tabs, TabsList, TabsTrigger, TabsContent de shadcn/ui.
```

---

## Tâche 16.8 — Composant SupplementCard

### Contexte
Card affichant un supplément avec ses stats, badge cours lié, et menu actions.

### Description
Créer `src/components/features/student/revisions/SupplementCard.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/SupplementCard.tsx - Card supplément.

Interface props :
interface Supplement {
  id: string;
  title: string;
  description: string | null;
  courseIds?: string[];
  courses?: { id: string; title: string; teacher: string | null }[];
  courseId?: string | null;   // backward compat
  course?: { ... } | null;
  chapterCount: number;
  cardCount: number;
  createdAt: Date;
  updatedAt: Date;
}

Structure card :
<Card className="hover:shadow-md transition-shadow">
  <CardHeader>
    {/* Titre avec icône (Book si lié, FileText si perso) */}
    <Link href={`/student/revisions/${id}`}>
      {icon} {title}
    </Link>
    
    {/* Menu actions (3 dots) */}
    <DropdownMenu>
      - Éditer → Link /student/revisions/[id]
      - Lier à un cours → ouvre CourseAttributionDialog
      - Supprimer (rouge) → DELETE API + router.refresh()
    </DropdownMenu>
    
    {/* Badges cours liés ou "+ Lier à un cours" */}
    {linkedCourses.map(c => <Badge>🔗 {c.title}</Badge>)}
    {!hasLinkedCourses && <Badge variant="outline">+ Lier à un cours</Badge>}
  </CardHeader>
  
  <CardContent>
    {description && <p className="line-clamp-2">{description}</p>}
    
    {/* Stats */}
    <span><Layers /> {chapterCount} chap.</span>
    <span><FileText /> {cardCount} cartes</span>
    
    {/* Date relative */}
    <span><Clock /> Modifié {formatDistanceToNow(updatedAt, { locale: fr })}</span>
  </CardContent>
</Card>

State : showAttributionDialog pour la modale de liaison cours.
Dépendance : date-fns avec locale fr.
```

---

## Tâche 16.9 — Page liste révisions

### Contexte
Page principale Server Component qui récupère les suppléments et affiche header + tabs.

### Description
Créer `src/app/(dashboard)/student/revisions/page.tsx`.

### Prompt
```
Crée src/app/(dashboard)/student/revisions/page.tsx - Page liste révisions.

Server Component (pas "use client").

Fonction async getStudentSupplements(userId: string) :
1. Récupérer StudentProfile
2. Query StudentSupplement avec :
   - Courses → Course → TeacherProfile.User
   - Chapters → _count.Cards
3. Calculer stats :
   - totalSupplements
   - linkedToCourse = filter(s => s.Courses.length > 0).length
   - personalCourses = filter(s => s.Courses.length === 0).length
   - totalCards = sum of all chapter card counts

export default async function RevisionsPage() {
  const session = await auth();
  if (!session?.user?.id) redirect('/login');
  
  const { supplements, stats } = await getStudentSupplements(session.user.id);
  
  return (
    <div className="space-y-6">
      <RevisionsHeader stats={stats} />
      <Suspense fallback={<RevisionsSkeleton />}>
        <RevisionsTabs supplements={supplements} />
      </Suspense>
    </div>
  );
}

RevisionsSkeleton : Skeleton pour tabs et grid 3 cards.
```

---

## Tâche 16.10 — Composant CreateSupplementForm

### Contexte
Formulaire de création avec choix du type (lié/personnel) et sélection de cours.

### Description
Créer `src/components/features/student/revisions/CreateSupplementForm.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/CreateSupplementForm.tsx - Formulaire création.

Interface props :
interface Course {
  id: string;
  title: string;
  subject: string;
  teacher: string | null;
}

interface CreateSupplementFormProps {
  courses: Course[];
}

Champs :
1. Titre (Input, required, minLength 3)
2. Description (Textarea, optionnel)
3. Type (RadioGroup) :
   - "personal" : Cours personnel (User icon, purple)
   - "linked" : Lié à un cours (Book icon, blue)
4. Si type === 'linked' : Select du cours

State :
- title, description, type, selectedCourseId
- isLoading, error

handleSubmit :
- Validation title >= 3 chars
- POST /api/student/supplements
- Si success → router.push(`/student/revisions/${data.id}`)

Structure card avec CardHeader (retour + titre), CardContent (champs), CardFooter (Annuler + Créer).
```

---

## Tâche 16.11 — Page création supplément

### Contexte
Page Server Component qui récupère les cours disponibles et affiche le formulaire.

### Description
Créer `src/app/(dashboard)/student/revisions/create/page.tsx`.

### Prompt
```
Crée src/app/(dashboard)/student/revisions/create/page.tsx - Page création.

Server Component.

Fonction async getStudentCourses(userId: string) :
1. Récupérer StudentProfile avec classId
2. Query CourseAssignment pour la classe
3. Retourner les cours avec : id, title, subject, teacher

export default async function CreateSupplementPage() {
  const session = await auth();
  if (!session?.user?.id) redirect('/login');
  
  const courses = await getStudentCourses(session.user.id);
  
  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Nouveau supplément</h1>
        <p className="text-muted-foreground">
          Créez des notes liées à un cours ou un cours personnel
        </p>
      </div>
      <CreateSupplementForm courses={courses} />
    </div>
  );
}

Note : Les cours viennent des CourseAssignment de la classe de l'élève.
```

---

## Tâche 16.12 — Composant SupplementDetailHeader

### Contexte
Header de la page détail avec titre éditable, badges cours, et boutons actions.

### Description
Créer `src/components/features/student/revisions/SupplementDetailHeader.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/SupplementDetailHeader.tsx - Header détail.

Interface props :
interface Supplement {
  id: string;
  title: string;
  description: string | null;
  courseIds: string[];
  courses: { id: string; title: string; teacher: string | null }[];
}

interface SupplementDetailHeaderProps {
  supplement: Supplement;
}

Structure :
<div className="flex items-center justify-between">
  {/* Gauche : retour + titre */}
  <div className="flex items-center gap-4">
    <Button variant="ghost" asChild>
      <Link href="/student/revisions"><ArrowLeft /></Link>
    </Button>
    <div>
      <h1 className="text-2xl font-bold">{title}</h1>
      {description && <p className="text-muted-foreground">{description}</p>}
      {/* Badges cours liés */}
      <div className="flex gap-1 mt-1">
        {courses.map(c => <Badge variant="secondary">🔗 {c.title}</Badge>)}
      </div>
    </div>
  </div>
  
  {/* Droite : actions */}
  <div className="flex gap-2">
    <Button variant="outline" onClick={() => setShowAttribution(true)}>
      <Link2 /> Cours
    </Button>
    <Button variant="destructive" onClick={handleDelete}>
      <Trash2 /> Supprimer
    </Button>
  </div>
</div>

CourseAttributionDialog intégré pour modifier les liaisons.
```

---

## Tâche 16.13 — Composant StudentChapterManager

### Contexte
Gestionnaire de chapitres avec création, édition inline, et liste de cartes dépliables.

### Description
Créer `src/components/features/student/revisions/StudentChapterManager.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/StudentChapterManager.tsx - Gestionnaire chapitres.

Interface props :
interface Chapter {
  id: string;
  title: string;
  description?: string | null;
  orderIndex: number;
  cards: StudentCardData[];
}

interface StudentChapterManagerProps {
  supplementId: string;
  chapters: Chapter[];
}

State :
- chapters (local, initialisé depuis props)
- newChapterTitle, isAddingChapter
- expandedChapters: Set<string>
- expandedCardId: string | null (une seule carte dépliée à la fois)
- creatingCardForChapter: string | null (modale création)
- editingChapterId, editingChapterTitle (édition inline titre)

Structure :
{chapters.length === 0 ? (
  <Card className="border-dashed">Aucun chapitre...</Card>
) : (
  chapters.map(chapter => (
    <Collapsible key={chapter.id}>
      {/* Header chapitre */}
      <div className="flex items-center gap-2 p-3 bg-muted/50">
        <GripVertical /> {/* Drag handle */}
        <CollapsibleTrigger>
          {expandedChapters.has(chapter.id) ? <ChevronDown /> : <ChevronRight />}
        </CollapsibleTrigger>
        
        {editingChapterId === chapter.id ? (
          {/* Input édition titre */}
          <Input value={editingChapterTitle} onChange={...} />
          <Button onClick={() => saveChapterTitle(chapter.id)}><Check /></Button>
          <Button onClick={cancelEditingChapter}><X /></Button>
        ) : (
          <span>{chapter.title}</span>
          <Badge>{chapter.cards.length} cartes</Badge>
          <Button onClick={() => startEditingChapter(chapter)}><Pencil /></Button>
          <Button onClick={() => handleDeleteChapter(chapter.id)}><Trash2 /></Button>
        )}
      </div>
      
      <CollapsibleContent>
        {/* Liste cartes */}
        {chapter.cards.map(card => (
          <StudentCardExpanded
            key={card.id}
            card={card}
            isExpanded={expandedCardId === card.id}
            onToggle={() => handleToggleCard(card.id)}
            onDelete={() => handleDeleteCard(card.id)}
          />
        ))}
        
        {/* Bouton ajouter carte */}
        <Button onClick={() => setCreatingCardForChapter(chapter.id)}>
          <Plus /> Ajouter une carte
        </Button>
      </CollapsibleContent>
    </Collapsible>
  ))
)}

{/* Input ajouter chapitre */}
<div className="flex gap-2">
  <Input placeholder="Nouveau chapitre..." value={newChapterTitle} />
  <Button onClick={handleAddChapter} disabled={isAddingChapter}>
    <Plus /> Ajouter
  </Button>
</div>

{/* Modale création carte */}
{creatingCardForChapter && (
  <StudentCardEditor
    chapterId={creatingCardForChapter}
    onSave={handleCardCreated}
    onCancel={() => setCreatingCardForChapter(null)}
  />
)}

API calls :
- POST /api/student/supplements/{supplementId}/chapters
- PUT /api/student/supplements/{supplementId}/chapters/{chapterId}
- DELETE /api/student/supplements/{supplementId}/chapters/{chapterId}
- DELETE /api/student/cards/{cardId}
```

---

## Tâche 16.14 — Composant StudentCardExpanded

### Contexte
Carte dépliable avec header (titre, type, actions) et contenu avec éditeur inline selon le type.

### Description
Créer `src/components/features/student/revisions/StudentCardExpanded.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/StudentCardExpanded.tsx - Carte dépliable.

Interface StudentCardData :
{
  id: string;
  title: string;
  content: string | null;
  cardType: 'NOTE' | 'LESSON' | 'VIDEO' | 'EXERCISE' | 'QUIZ';
  orderIndex: number;
  files?: { id: string; filename: string; fileType: string; url: string }[];
  quiz?: { id: string; aiGenerated: boolean; attemptCount: number } | null;
  createdAt: Date;
  updatedAt: Date;
}

Interface props :
{
  card: StudentCardData;
  supplementId: string;
  isExpanded: boolean;
  onToggle: () => void;
  onDelete: () => void;
  onContentSaved?: () => void;
  onTitleSaved?: (newTitle: string) => void;
}

State :
- cardData (local, pour updates)
- hasUnsavedChanges, pendingContent
- saving, loadingContent

Structure :
<Collapsible open={isExpanded} onOpenChange={handleOpenChange}>
  <Card>
    {/* Header avec titre, badge type, indicateur contenu, boutons */}
    <StudentCardHeader
      card={cardData}
      isExpanded={isExpanded}
      hasContent={Boolean(cardData.content)}
      onDelete={onDelete}
      onTitleSaved={handleTitleSaved}
    />
    
    <CollapsibleContent>
      <div className="p-4 border-t bg-muted/20">
        {/* Barre modifications non sauvegardées */}
        {hasUnsavedChanges && (
          <UnsavedChangesBar saving={saving} onCancel={cancelChanges} onSave={saveContent} />
        )}
        
        {loadingContent ? (
          <Loader2 className="animate-spin" />
        ) : (
          <>
            {/* Éditeur selon cardType */}
            {renderEditor({ cardType, content, onChange: handleContentChange })}
            
            {/* Gestionnaire fichiers */}
            <StudentFilesManager
              cardId={card.id}
              files={cardData.files || []}
              onFileUploaded={...}
              onFileDeleted={...}
            />
          </>
        )}
      </div>
    </CollapsibleContent>
  </Card>
</Collapsible>

renderEditor switch sur cardType :
- NOTE → NoteEditorInline
- LESSON → LessonEditorInline
- VIDEO → VideoEditorInline
- EXERCISE → ExerciseEditorInline
- QUIZ → QuizEditorInline

Lazy load content : si content === null, fetch GET /api/student/cards/{id} à l'ouverture.
```

---

## Tâche 16.15 — Composant StudentCardEditor (modale création)

### Contexte
Modale pour créer une nouvelle carte avec titre, type et contenu initial.

### Description
Créer `src/components/features/student/revisions/StudentCardEditor.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/StudentCardEditor.tsx - Modale création carte.

Interface props :
{
  chapterId: string;
  card?: StudentCardData;     // Si édition (optionnel)
  onSave: (card: StudentCardData) => void;
  onCancel: () => void;
}

Types de cartes :
const cardTypes = [
  { value: 'NOTE', label: '📝 Note' },
  { value: 'LESSON', label: '📖 Leçon' },
  { value: 'VIDEO', label: '🎬 Vidéo' },
  { value: 'EXERCISE', label: '✏️ Exercice' },
  { value: 'QUIZ', label: '❓ Quiz' },
];

State :
- title, content, cardType
- isSaving

Structure :
<Dialog open onOpenChange={(open) => !open && onCancel()}>
  <DialogContent>
    <DialogHeader>
      <DialogTitle>{isEditing ? 'Modifier' : 'Nouvelle carte'}</DialogTitle>
    </DialogHeader>
    
    <div className="space-y-4">
      {/* Titre */}
      <Input value={title} placeholder="Titre de la carte..." />
      
      {/* Type */}
      <Select value={cardType} onValueChange={setCardType}>
        {cardTypes.map(t => <SelectItem>{t.label}</SelectItem>)}
      </Select>
      
      {/* Contenu basique */}
      <Textarea value={content} placeholder="Écrivez vos notes..." rows={8} />
    </div>
    
    <DialogFooter>
      <Button variant="outline" onClick={onCancel}>Annuler</Button>
      <Button onClick={handleSave} disabled={!title.trim() || isSaving}>
        {isSaving ? 'Enregistrement...' : 'Créer'}
      </Button>
    </DialogFooter>
  </DialogContent>
</Dialog>

handleSave :
- POST /api/student/cards si nouveau
- PUT /api/student/cards/{id} si édition
- onSave(savedCard)

Note : Après création, l'utilisateur pourra éditer le contenu riche via les éditeurs inline.
```

---

## Tâche 16.16 — Éditeurs inline par type

### Contexte
Éditeurs spécialisés selon le type de carte, intégrés dans le contenu déplié.

### Description
Créer les éditeurs inline dans `src/components/features/student/revisions/inline-editors/`.

### Prompt
```
Crée les éditeurs inline pour les cartes élève.

=== inline-editors/index.ts ===
export { NoteEditorInline } from './NoteEditorInline';
export { LessonEditorInline } from './LessonEditorInline';
// Réutiliser les éditeurs partagés du professeur pour Quiz, Video, Exercise
export { 
  QuizEditorInline,
  VideoEditorInline,
  ExerciseEditorInline 
} from '@/components/features/shared/inline-editors';

=== inline-editors/NoteEditorInline.tsx ===
Éditeur simple avec Textarea pour notes libres.

interface Props {
  content: string;
  onChange: (content: string) => void;
}

<div className="space-y-2">
  <Label>Contenu de la note</Label>
  <Textarea
    value={content}
    onChange={(e) => onChange(e.target.value)}
    placeholder="Écrivez vos notes ici..."
    rows={10}
    className="font-mono"
  />
  <p className="text-xs text-muted-foreground">
    Supporte le Markdown basique
  </p>
</div>

=== inline-editors/LessonEditorInline.tsx ===
Éditeur riche TipTap pour les leçons structurées.

Parse/stringify le content JSON : { html: string, summary?: string }

<div className="space-y-4">
  {/* TipTap editor */}
  <div className="border rounded-lg p-4 min-h-[200px]">
    {/* Editor avec toolbar basique */}
  </div>
</div>

Note : Les éditeurs Quiz, Video, Exercise sont réutilisés depuis shared/ car identiques au professeur.
```

---

## Tâche 16.17 — Composant CourseAttributionDialog

### Contexte
Modale pour modifier la liaison entre un supplément et un ou plusieurs cours.

### Description
Créer `src/components/features/student/revisions/CourseAttributionDialog.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/CourseAttributionDialog.tsx - Modale attribution.

Interface props :
{
  open: boolean;
  onOpenChange: (open: boolean) => void;
  supplementId: string;
  supplementTitle: string;
  currentCourseIds: string[];
}

State :
- selectedCourseIds: Set<string> (init depuis currentCourseIds)
- availableCourses: Course[] (fetch)
- isLoading, isSaving

Fetch cours disponibles :
GET /api/student/courses → récupérer la liste des cours de l'élève

Structure :
<Dialog>
  <DialogContent>
    <DialogHeader>
      <DialogTitle>Lier "{supplementTitle}" à des cours</DialogTitle>
      <DialogDescription>
        Sélectionnez les cours auxquels rattacher ce supplément
      </DialogDescription>
    </DialogHeader>
    
    <div className="space-y-2 max-h-[300px] overflow-y-auto">
      {availableCourses.map(course => (
        <div className="flex items-center gap-2 p-2 border rounded hover:bg-muted/50">
          <Checkbox
            checked={selectedCourseIds.has(course.id)}
            onCheckedChange={(checked) => toggleCourse(course.id, checked)}
          />
          <div>
            <span className="font-medium">{course.title}</span>
            <span className="text-sm text-muted-foreground">{course.teacher}</span>
          </div>
        </div>
      ))}
    </div>
    
    <DialogFooter>
      <Button variant="outline" onClick={() => onOpenChange(false)}>Annuler</Button>
      <Button onClick={handleSave} disabled={isSaving}>
        {isSaving ? 'Enregistrement...' : 'Enregistrer'}
      </Button>
    </DialogFooter>
  </DialogContent>
</Dialog>

handleSave :
PUT /api/student/supplements/{supplementId} avec { courseIds: [...selectedCourseIds] }
router.refresh() après succès
```

---

## Tâche 16.18 — Page détail supplément

### Contexte
Page Server Component affichant le header et le gestionnaire de chapitres.

### Description
Créer `src/app/(dashboard)/student/revisions/[id]/page.tsx`.

### Prompt
```
Crée src/app/(dashboard)/student/revisions/[id]/page.tsx - Page détail supplément.

Server Component.

Fonction async getSupplement(supplementId: string, userId: string) :
- Vérifier StudentProfile existe
- Query StudentSupplement avec :
  - Courses → Course → TeacherProfile.User
  - Chapters (orderBy orderIndex) → Cards (orderBy orderIndex) → Files, Quiz
- Si non trouvé ou pas owner → null

export default async function SupplementDetailPage({ params }: PageProps) {
  const { id } = await params;
  
  const session = await auth();
  if (!session?.user?.id) redirect('/login');
  
  const supplement = await getSupplement(id, session.user.id);
  if (!supplement) notFound();
  
  return (
    <div className="space-y-6">
      <SupplementDetailHeader supplement={supplement} />
      <StudentChapterManager
        supplementId={supplement.id}
        chapters={supplement.chapters}
      />
    </div>
  );
}

Interface PageProps :
{ params: Promise<{ id: string }> }

Imports : auth, redirect, notFound, prisma.
```

---

## Tâche 16.19 — Composant StudentFilesManager

### Contexte
Gestionnaire de fichiers attachés à une carte avec upload et suppression.

### Description
Créer `src/components/features/student/revisions/StudentFilesManager.tsx`.

### Prompt
```
Crée src/components/features/student/revisions/StudentFilesManager.tsx - Gestion fichiers.

Interface props :
{
  cardId: string;
  files: { id: string; filename: string; fileType: string; url: string }[];
  onFileUploaded: (file: FileData) => void;
  onFileDeleted: (fileId: string) => void;
}

State :
- isUploading
- dragOver (pour drag & drop)

Structure :
<div className="mt-4 border-t pt-4">
  <h4 className="font-medium mb-2">Fichiers attachés</h4>
  
  {/* Liste fichiers existants */}
  {files.length > 0 ? (
    <div className="space-y-2">
      {files.map(file => (
        <div className="flex items-center gap-2 p-2 bg-muted/30 rounded">
          {getFileIcon(file.fileType)}
          <span className="flex-1 truncate">{file.filename}</span>
          <Button variant="ghost" size="icon" onClick={() => handleDownload(file)}>
            <Download />
          </Button>
          <Button variant="ghost" size="icon" onClick={() => handleDelete(file.id)}>
            <Trash2 className="text-destructive" />
          </Button>
        </div>
      ))}
    </div>
  ) : (
    <p className="text-sm text-muted-foreground">Aucun fichier attaché</p>
  )}
  
  {/* Zone upload */}
  <div 
    className={cn("border-2 border-dashed rounded-lg p-4 mt-2", dragOver && "border-primary")}
    onDragOver={...} onDrop={handleDrop}
  >
    <Input type="file" onChange={handleFileSelect} className="hidden" ref={inputRef} />
    <Button variant="outline" onClick={() => inputRef.current?.click()}>
      <Upload /> Ajouter un fichier
    </Button>
  </div>
</div>

handleUpload :
- FormData avec file
- POST /api/student/cards/{cardId}/files
- onFileUploaded(data)

handleDelete :
- DELETE /api/student/cards/{cardId}/files/{fileId}
- onFileDeleted(fileId)
```

---

## Résumé des fichiers

| Fichier | Rôle |
|---------|------|
| `prisma/schema.prisma` | Modèles StudentSupplement, StudentChapter, StudentCard, etc. |
| `api/student/supplements/route.ts` | GET liste + POST création |
| `api/student/supplements/[id]/route.ts` | GET/PUT/DELETE individuel |
| `api/student/supplements/[id]/chapters/...` | CRUD chapitres |
| `api/student/cards/route.ts` | POST création carte |
| `api/student/cards/[id]/route.ts` | GET/PUT/DELETE carte |
| `revisions/page.tsx` | Page liste (Server Component) |
| `revisions/create/page.tsx` | Page création supplément |
| `revisions/[id]/page.tsx` | Page détail supplément |
| `RevisionsHeader.tsx` | Header avec stats |
| `RevisionsTabs.tsx` | Onglets filtrage |
| `SupplementCard.tsx` | Card preview supplément |
| `CreateSupplementForm.tsx` | Formulaire création |
| `SupplementDetailHeader.tsx` | Header détail |
| `StudentChapterManager.tsx` | Gestionnaire chapitres/cartes |
| `StudentCardExpanded.tsx` | Carte dépliable avec éditeur |
| `StudentCardEditor.tsx` | Modale création carte |
| `StudentFilesManager.tsx` | Gestion fichiers attachés |
| `CourseAttributionDialog.tsx` | Modale liaison cours |
| `inline-editors/` | Éditeurs par type de carte |

---

## Validation

```bash
# Migration Prisma
npx prisma migrate dev --name add_student_supplements
npx prisma generate

# Lint
npm run lint

# Tester manuellement
# 1. /student/revisions → voir liste vide ou suppléments
# 2. Créer un supplément (personnel ou lié)
# 3. Ajouter chapitres et cartes
# 4. Éditer le contenu des cartes (inline)
# 5. Attacher des fichiers
# 6. Modifier l'attribution de cours
# 7. Supprimer supplément
```

---

## Points d'attention

1. **Many-to-many cours** : Un supplément peut être lié à plusieurs cours via StudentSupplementCourse
2. **Types de cartes** : 5 types (NOTE, LESSON, VIDEO, EXERCISE, QUIZ) avec éditeurs différents
3. **Lazy loading** : Le contenu complet des cartes est chargé à l'ouverture uniquement
4. **Unsaved changes** : Barre d'alerte avec Sauvegarder/Annuler si modifications non enregistrées
5. **Ownership** : Toutes les API vérifient que le supplément appartient à l'élève connecté
6. **Réutilisation éditeurs** : Quiz, Video, Exercise partagés avec le système professeur
