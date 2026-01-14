# Phase 15 — Student : Mes Cours

> Liste des cours assignés, navigation chapitres/sections, viewers par type, progression

---

## Vue d'ensemble

Cette phase implémente le système complet de consultation des cours pour l'élève :
- **Liste des cours** avec filtres multi-sélection et stats globales
- **Détail d'un cours** avec tabs (Informations, Cours)
- **Viewers spécialisés** par type de section (Lesson, Video, Quiz, Exercise)
- **Suivi de progression** avec mise à jour en temps réel

**Fichiers créés :**
```
src/app/(dashboard)/student/courses/page.tsx
src/app/(dashboard)/student/courses/[id]/page.tsx
src/app/api/student/courses/route.ts
src/app/api/student/courses/[id]/route.ts
src/app/api/student/courses/[id]/progress/route.ts
src/app/api/student/courses/[id]/sections/[sectionId]/score/route.ts
src/components/features/student/StudentCoursesStatsHeader.tsx
src/components/features/student/StudentCoursesFiltersMulti.tsx
src/components/features/student/StudentCoursesTable.tsx
src/components/features/student/StudentChaptersViewer.tsx
src/components/features/student/viewers/LessonViewer.tsx
src/components/features/student/viewers/VideoViewer.tsx
src/components/features/student/viewers/ExerciseViewer.tsx
src/components/features/student/viewers/quiz/QuizViewer.tsx
src/components/features/student/viewers/quiz/QuizSubComponents.tsx
src/components/features/student/viewers/quiz/types.ts
```

---

## Tâche 15.1 — API GET liste des cours élève

### Contexte
L'élève accède aux cours via sa classe. La chaîne est : `StudentProfile.Class.TeacherProfile[].Course[]`. L'API doit retourner les cours avec leur progression calculée et des options de filtrage.

### Description
Créer `src/app/api/student/courses/route.ts` :
- Authentification + vérification role STUDENT
- Récupérer StudentProfile avec classe et professeurs
- Récupérer tous les cours des professeurs de la classe (isDraft = false)
- Calculer la progression via le modèle `Progression`
- Retourner liste + overview stats + options de filtres

### Prompt
```
Crée src/app/api/student/courses/route.ts - API GET liste des cours élève.

Contexte :
- L'élève accède aux cours via sa classe
- Chaîne : StudentProfile.Class.TeacherProfile[].Course[]
- Seuls les cours publiés (isDraft = false) sont visibles

Interface StudentCourseData :
{
  id: string;
  title: string;
  subject: { id: string; name: string };
  theme: string | null;
  teacher: { id: string; firstName: string; lastName: string };
  chaptersCount: number;
  exercisesCount: number; // sections type EXERCISE + QUIZ
  progressPercent: number; // depuis Progression.percentage
  status: 'not-started' | 'in-progress' | 'completed';
}

Interface StudentCoursesOverview :
{
  totalCourses: number;
  completedCourses: number;
  inProgressCourses: number;
  averageProgress: number;
}

Logique progression :
- Récupérer Progression via studentId + courseId
- status = not-started si percentage === 0
- status = completed si percentage === 100
- status = in-progress sinon

Retour API :
{
  success: true,
  data: {
    courses: StudentCourseData[],
    overview: StudentCoursesOverview,
    filters: {
      subjects: { id, name }[],
      teachers: { id, name }[],
      themes: string[]
    }
  }
}

Structure Prisma :
- StudentProfile → Class → TeacherProfile[]
- TeacherProfile → Course[] (include Subject, Chapter avec count Section par type)
- Progression { studentId, courseId, percentage }

Pattern : auth(), prisma queries, calcul stats, format response.
```

---

## Tâche 15.2 — Composant StudentCoursesStatsHeader

### Contexte
Header avec 4 KPIs affichant les statistiques globales des cours de l'élève.

### Description
Créer `src/components/features/student/StudentCoursesStatsHeader.tsx` :
- Grid 2x2 (ou 4 colonnes sur desktop)
- Cards : Mes Cours, Terminés, En Cours, Progression moyenne
- Icônes : BookOpen, CheckCircle, Clock, TrendingUp
- Couleurs distinctives par card

### Prompt
```
Crée src/components/features/student/StudentCoursesStatsHeader.tsx - Header KPIs cours élève.

Interface props :
interface StudentCoursesOverview {
  totalCourses: number;
  completedCourses: number;
  inProgressCourses: number;
  averageProgress: number;
}

4 cards en grid responsive (2 colonnes mobile, 4 desktop) :

1. "Mes Cours" - BookOpen - totalCourses - bg-blue
2. "Terminés" - CheckCircle - completedCourses - bg-green  
3. "En Cours" - Clock - inProgressCourses - bg-orange
4. "Progression" - TrendingUp - averageProgress% - bg-purple

Chaque card :
- Icône colorée (cercle de fond + icône)
- Valeur grande et bold
- Label descriptif en muted

Composants : Card, CardContent de shadcn/ui.
Format "use client".
```

---

## Tâche 15.3 — Composant StudentCoursesFiltersMulti

### Contexte
Filtres multi-sélection avec cascade : les sujets dépendent des professeurs sélectionnés, les thèmes dépendent des deux.

### Description
Créer `src/components/features/student/StudentCoursesFiltersMulti.tsx` :
- 4 filtres : Matière, Professeur, Thématique, Statut
- Multi-select avec badges pour les sélections actives
- Logique de cascade pour les options disponibles
- Bouton "Réinitialiser" si filtres actifs

### Prompt
```
Crée src/components/features/student/StudentCoursesFiltersMulti.tsx - Filtres multi-sélection avec cascade.

Interface props :
interface Props {
  // Options disponibles (depuis API)
  subjects: { id: string; name: string }[];
  teachers: { id: string; name: string }[];
  themes: string[];
  
  // Sélections actuelles
  selectedSubjects: string[];
  selectedTeachers: string[];
  selectedThemes: string[];
  selectedStatuses: string[];
  
  // Callbacks onChange
  onSubjectsChange: (ids: string[]) => void;
  onTeachersChange: (ids: string[]) => void;
  onThemesChange: (themes: string[]) => void;
  onStatusesChange: (statuses: string[]) => void;
  
  // Pour filtrage cascade
  courses: StudentCourseData[];
}

Statuts fixes : ["not-started", "in-progress", "completed"]
Labels statuts : "Non commencé", "En cours", "Terminé"

Logique cascade :
- Si teachers sélectionnés → subjects filtrés aux cours de ces profs
- Si teachers + subjects → themes filtrés aux cours correspondants
- useMemo pour recalculer options disponibles

UI : Flex wrap avec 4 Popovers (bouton + liste checkboxes).
Badge count sur chaque bouton si sélections actives.
Bouton "Réinitialiser" visible si au moins un filtre actif.

Composants : Button, Popover, Checkbox, Badge de shadcn/ui.
```

---

## Tâche 15.4 — Composant StudentCoursesTable

### Contexte
Table affichant la liste des cours avec colonnes : Matière, Thème, Professeur, Chapitres, Exercices, Progression, Statut, Action.

### Description
Créer `src/components/features/student/StudentCoursesTable.tsx` :
- Table responsive avec colonnes définies
- Badge coloré pour la matière
- Progress bar pour la progression
- Badge de statut (not-started/in-progress/completed)
- Bouton "Voir" vers /student/courses/[id]

### Prompt
```
Crée src/components/features/student/StudentCoursesTable.tsx - Table des cours élève.

Interface props :
interface Props {
  courses: StudentCourseData[];
  isLoading?: boolean;
}

Colonnes :
1. Matière - Badge coloré avec subject.name
2. Thème - theme ou "—"
3. Professeur - "Prénom Nom"
4. Chapitres - chaptersCount
5. Exercices - exercisesCount
6. Progression - Progress bar + percentage
7. Statut - Badge variant selon status
8. Action - Button "Voir" → Link /student/courses/[id]

Status badges :
- not-started → variant="secondary", "Non commencé"
- in-progress → variant="default" (bleu), "En cours"
- completed → variant="success" (vert), "Terminé"

Table responsive : colonnes Thème, Chapitres, Exercices hidden sur mobile (hidden sm:table-cell).

État vide : Message "Aucun cours trouvé" avec icône BookOpen.

Composants : Table, TableHeader, TableRow, TableCell, Badge, Progress, Button de shadcn/ui.
```

---

## Tâche 15.5 — Page liste des cours élève

### Contexte
Page principale affichant les stats, filtres et table des cours avec filtrage client-side.

### Description
Créer `src/app/(dashboard)/student/courses/page.tsx` :
- Fetch SWR vers /api/student/courses
- État local pour les 4 filtres
- Filtrage client-side avec useMemo
- Composition : StatsHeader + FiltersMulti + CoursesTable

### Prompt
```
Crée src/app/(dashboard)/student/courses/page.tsx - Page liste des cours élève.

Structure page :
1. Titre "Mes Cours" avec description
2. StudentCoursesStatsHeader (overview stats)
3. StudentCoursesFiltersMulti (4 filtres)
4. StudentCoursesTable (liste filtrée)

State :
- selectedSubjects: string[]
- selectedTeachers: string[]
- selectedThemes: string[]
- selectedStatuses: string[]

Fetch avec SWR :
const { data, isLoading } = useSWR('/api/student/courses', fetcher);

Filtrage client-side (useMemo) :
const filteredCourses = useMemo(() => {
  if (!data?.courses) return [];
  return data.courses.filter(course => {
    if (selectedSubjects.length && !selectedSubjects.includes(course.subject.id)) return false;
    if (selectedTeachers.length && !selectedTeachers.includes(course.teacher.id)) return false;
    if (selectedThemes.length && course.theme && !selectedThemes.includes(course.theme)) return false;
    if (selectedStatuses.length && !selectedStatuses.includes(course.status)) return false;
    return true;
  });
}, [data?.courses, selectedSubjects, selectedTeachers, selectedThemes, selectedStatuses]);

Loading state : Skeleton pour stats et table.
"use client" car useState + useMemo.
```

---

## Tâche 15.6 — API GET détail d'un cours

### Contexte
API retournant les détails complets d'un cours avec ses chapitres, sections et fichiers.

### Description
Créer `src/app/api/student/courses/[id]/route.ts` :
- Vérifier accès (professeur de la classe de l'élève)
- Vérifier cours publié (isDraft = false)
- Inclure chapitres avec sections ordonnées
- Calculer progression et marquer chapitres complétés

### Prompt
```
Crée src/app/api/student/courses/[id]/route.ts - API GET détail cours élève.

Interface CourseDetailParams :
{ params: Promise<{ id: string }> }

Vérifications :
1. Auth + role STUDENT
2. Récupérer StudentProfile avec Class.TeacherProfile[]
3. Vérifier cours existe
4. Vérifier teacherId dans la liste des profs de la classe
5. Vérifier isDraft = false

Prisma include :
- Subject (id, name)
- TeacherProfile.User (firstName, lastName)
- Chapter (orderBy order asc) → Section (orderBy order asc)
- Section.files (documents attachés)
- CourseFile (fichiers globaux du cours)
- Progression (where studentId)

Calcul progression :
- progressPercent = Progression.percentage || 0
- completedChaptersCount = floor((progressPercent/100) * totalChapters)
- Marquer les N premiers chapitres comme isCompleted = true

Interface CourseData retournée :
{
  id, title, description,
  subject: { id, name },
  teacher: { id, firstName, lastName },
  chapters: [{
    id, title, description, order, isCompleted,
    sections: [{ id, title, type, order, content, files }]
  }],
  files: [{ id, filename, fileType, url }],
  stats: { totalChapters, completedChapters, progressPercent }
}

Retour : { success: true, data: { course } }
```

---

## Tâche 15.7 — Composant StudentChaptersViewer

### Contexte
Accordion affichant les chapitres avec leurs sections. Clic sur section ouvre le viewer approprié.

### Description
Créer `src/components/features/student/StudentChaptersViewer.tsx` :
- Accordion avec chapitres numérotés
- Liste des sections avec icônes par type
- Badge isCompleted sur chapitres terminés
- Clic section → ouvre modale SectionViewerModal
- Bouton "Marquer chapitre terminé"

### Prompt
```
Crée src/components/features/student/StudentChaptersViewer.tsx - Viewer chapitres/sections.

Interface props :
interface Chapter {
  id: string;
  title: string;
  description: string | null;
  order: number;
  isCompleted: boolean;
  sections: Section[];
}

interface Section {
  id: string;
  title: string;
  type: 'LESSON' | 'VIDEO' | 'QUIZ' | 'EXERCISE';
  order: number;
  content: string | null;
  files?: SectionFile[];
}

interface Props {
  chapters: Chapter[];
  courseId: string;
  onProgressUpdate: () => void; // refetch le cours
}

Structure UI :
<Accordion type="single" collapsible>
  {chapters.map(chapter => (
    <AccordionItem key={chapter.id}>
      <AccordionTrigger>
        <div className="flex items-center gap-3">
          <span className="rounded-full bg-primary/10 w-8 h-8 flex items-center justify-center">
            {chapter.order}
          </span>
          <span>{chapter.title}</span>
          {chapter.isCompleted && <Badge variant="success">Terminé</Badge>}
        </div>
      </AccordionTrigger>
      <AccordionContent>
        {/* Liste sections */}
        {chapter.sections.map(section => (
          <div onClick={() => openSection(section)} className="cursor-pointer hover:bg-muted/50">
            {getSectionIcon(section.type)}
            <span>{section.title}</span>
            {getSectionTypeBadge(section.type)}
          </div>
        ))}
        {/* Bouton marquer terminé */}
        {!chapter.isCompleted && (
          <Button onClick={() => markComplete(chapter.id)}>
            Marquer comme terminé
          </Button>
        )}
      </AccordionContent>
    </AccordionItem>
  ))}
</Accordion>

Icônes par type :
- LESSON → FileText (blue)
- VIDEO → Video (pink)
- QUIZ → HelpCircle (purple)
- EXERCISE → PenTool (orange)

State :
- selectedSection: Section | null
- modalOpen: boolean

Modale SectionViewerModal :
- Dialog avec titre section
- Switch sur type pour afficher le bon viewer
- Passer courseId pour sauvegarde scores

markComplete : POST /api/student/courses/[courseId]/progress avec { chapterId, completed: true }
```

---

## Tâche 15.8 — API POST progression chapitre

### Contexte
API pour marquer un chapitre comme terminé et mettre à jour le pourcentage global.

### Description
Créer `src/app/api/student/courses/[id]/progress/route.ts` :
- Validation Zod du body
- Vérifier chapitre appartient au cours
- Calculer nouveau pourcentage
- Upsert dans Progression

### Prompt
```
Crée src/app/api/student/courses/[id]/progress/route.ts - API POST progression.

Schema Zod :
const progressSchema = z.object({
  chapterId: z.string().min(1),
  completed: z.boolean(),
});

Logique :
1. Auth + role STUDENT
2. Récupérer StudentProfile
3. Vérifier chapitre appartient au courseId
4. Compter total chapitres du cours
5. Calculer incrementPerChapter = 100 / totalChapters
6. Si completed → newPercentage = min(100, current + increment)

Upsert Progression :
await prisma.progression.upsert({
  where: { studentId_courseId: { studentId, courseId } },
  update: { percentage: newPercentage, lastActivity: new Date() },
  create: { id: randomUUID(), studentId, courseId, percentage: newPercentage, lastActivity: new Date() }
});

Retour : { success: true, data: { progression: { percentage, lastActivity } } }

Note : Simplification - en production on stockerait les chapitres individuellement complétés.
```

---

## Tâche 15.9 — Viewer LessonViewer

### Contexte
Viewer pour sections de type LESSON. Affiche le contenu HTML/Markdown et les fichiers attachés.

### Description
Créer `src/components/features/student/viewers/LessonViewer.tsx` :
- Parser le content JSON (format { html: string })
- Fallback Markdown si pas JSON
- Afficher les fichiers attachés avec download/preview
- Modal pour visualiser les fichiers

### Prompt
```
Crée src/components/features/student/viewers/LessonViewer.tsx - Viewer sections leçon.

Interface props :
interface SectionFile {
  id: string;
  filename: string;
  fileType: string;
  url: string;
  size?: number;
  textContent?: string | null;
}

interface LessonViewerProps {
  content: string | null;
  files?: SectionFile[];
}

Parsing content :
- Try JSON.parse → si { html: "..." } → dangerouslySetInnerHTML
- Sinon → ReactMarkdown fallback

Section fichiers :
- Si files.length > 0 → afficher liste avec icônes par type
- FileCard avec preview/download buttons
- FileViewerDialog pour preview (PDF, images, texte)

Helpers :
- formatFileSize(bytes) → "1.2 MB"
- getFileIcon(fileType) → FileImage | FileVideo | FileText | etc.
- downloadFile(url, filename) → fetch + blob + download

Composants : Card, Dialog, Button de shadcn/ui.
Dépendance : react-markdown.

État : viewingFile: SectionFile | null pour la modale.
```

---

## Tâche 15.10 — Viewer VideoViewer

### Contexte
Viewer pour sections de type VIDEO. Supporte YouTube, Vimeo et vidéos uploadées.

### Description
Créer `src/components/features/student/viewers/VideoViewer.tsx` :
- Parser le content pour extraire les infos vidéo
- Embed YouTube/Vimeo avec iframe responsive
- Player natif pour vidéos uploadées
- Fallback lien externe

### Prompt
```
Crée src/components/features/student/viewers/VideoViewer.tsx - Viewer sections vidéo.

Interface VideoContent :
{
  type: 'youtube' | 'vimeo' | 'uploaded' | 'other';
  videoId?: string;
  embedUrl?: string;
  directUrl?: string;
  originalUrl?: string;
  files?: { url: string; filename: string; type?: string }[];
}

Parsing :
1. JSON.parse(content)
2. Extraire videoId depuis URL YouTube (youtu.be/xxx ou v=xxx)
3. Extraire videoId depuis URL Vimeo (/xxx)
4. Fallback type='other' avec directUrl

Embed YouTube :
<iframe 
  src={`https://www.youtube.com/embed/${videoId}`}
  className="aspect-video w-full rounded-lg"
  allowFullScreen
/>

Embed Vimeo :
<iframe 
  src={`https://player.vimeo.com/video/${videoId}`}
  ...
/>

Vidéo uploadée :
<video controls className="w-full rounded-lg max-h-[50vh]">
  <source src={directUrl} type="video/mp4" />
</video>

Fallback lien externe :
<a href={url} target="_blank">Voir la vidéo <ExternalLink /></a>

Support multi-vidéos si files[] présent.
```

---

## Tâche 15.11 — Viewer QuizViewer

### Contexte
Viewer interactif pour les quiz avec questions à choix multiples, feedback et sauvegarde du score.

### Description
Créer `src/components/features/student/viewers/quiz/` :
- QuizViewer.tsx : logique principale
- QuizSubComponents.tsx : composants UI
- types.ts : interfaces et helpers

### Prompt
```
Crée src/components/features/student/viewers/quiz/ - Viewer quiz interactif.

=== types.ts ===
Interface QuizContent :
{
  title?: string;
  questions: QuizQuestion[];
}

Interface QuizQuestion :
{
  question: string;
  options: QuizOption[] | string[]; // Supporte les 2 formats
  correctAnswer?: string | number;
  explanation?: string;
}

Interface QuizOption :
{ id: string; text: string; isCorrect?: boolean }

Helpers :
- normalizeOptions(options) → QuizOption[] (convertit string[] en objets)
- getCorrectOptionId(question, options) → trouve l'option correcte

=== QuizSubComponents.tsx ===
Composants :
- QuizProgress({ current, total, score, answeredQuestions })
- AnswerOption({ option, showResult, isCorrect, isSelected })
- AnswerFeedback({ isCorrect, explanation })
- QuizActions({ showResult, selectedAnswer, isLast, hasFinished, onSubmit, onNext, onReset })
- FinalScore({ score, total, onReset, isSaving, saved })

=== QuizViewer.tsx ===
Props : { content, courseId?, sectionId?, onScoreUpdate? }

State :
- currentQuestion: number
- selectedAnswer: string | null
- showResult: boolean
- score: number
- answeredQuestions: Set<number>
- isSaving, saved: boolean

Flow :
1. Afficher question courante avec RadioGroup options
2. Submit → vérifier réponse → showResult
3. Afficher feedback (correct/incorrect + explanation)
4. Next → question suivante
5. Fin → FinalScore + saveScore automatique

saveScore : POST /api/student/courses/{courseId}/sections/{sectionId}/score
  body: { score: percentage, status: 'COMPLETED' }
```

---

## Tâche 15.12 — Viewer ExerciseViewer

### Contexte
Viewer pour exercices avec notation IA. L'élève répond aux questions, soumet, reçoit une correction IA.

### Description
Créer `src/components/features/student/viewers/ExerciseViewer.tsx` :
- Parser les questions depuis content JSON
- Input/Textarea pour réponses
- Submit → appel API /api/ai/grade-exercise
- Affichage résultat avec feedback par question

### Prompt
```
Crée src/components/features/student/viewers/ExerciseViewer.tsx - Viewer exercices avec notation IA.

Interface ExerciseContent :
{
  title?: string;
  instructions?: string;
  items?: ExerciseItem[]; // Format éditeur
  questions?: ExerciseItem[]; // Legacy
  totalPoints?: number;
}

Interface ExerciseItem :
{
  id: string;
  question: string;
  answer?: string; // Réponse attendue (pour IA)
  points?: number;
  hint?: string;
  type?: 'short' | 'long' | 'code';
}

Interface GradingResult :
{
  score: number;
  maxScore: number;
  feedback: string;
  questionResults: {
    questionId: string;
    score: number;
    maxScore: number;
    feedback: string;
  }[];
}

Props : { content, sectionId, sectionTitle, courseId?, onScoreUpdate? }

State :
- answers: Record<string, string>
- isSubmitting: boolean
- gradingResult: GradingResult | null
- error: string | null

Flow :
1. Afficher questions avec Input ou Textarea (selon type)
2. Counter "X/Y répondu"
3. Submit → POST /api/ai/grade-exercise avec { sectionId, sectionTitle, questions, answers }
4. Afficher GradingResult : score global + feedback par question
5. Auto-save score après notation

Composants UI :
- QuestionCard avec badge points
- AnswerInput (Input ou Textarea selon type)
- GradingFeedback avec CheckCircle/AlertCircle par question
- Button Reset pour recommencer
```

---

## Tâche 15.13 — API POST score section

### Contexte
API pour sauvegarder le score d'une section (quiz ou exercice) dans la progression.

### Description
Créer `src/app/api/student/courses/[id]/sections/[sectionId]/score/route.ts` :
- Sauvegarder le score dans un modèle dédié ou dans Progression

### Prompt
```
Crée src/app/api/student/courses/[id]/sections/[sectionId]/score/route.ts - Sauvegarde score.

Schema Zod :
const scoreSchema = z.object({
  score: z.number().min(0).max(100),
  status: z.enum(['COMPLETED', 'IN_PROGRESS']).default('COMPLETED'),
});

Logique :
1. Auth + role STUDENT
2. Récupérer StudentProfile
3. Vérifier section appartient au cours
4. Upsert dans SectionScore (ou table similaire)

Si pas de modèle SectionScore, stocker dans un JSON dans Progression :
progression.sectionScores = { [sectionId]: { score, completedAt } }

Retour : { success: true, data: { score, sectionId } }

Note : Cette implémentation peut varier selon le schéma Prisma existant.
```

---

## Tâche 15.14 — Page détail cours élève

### Contexte
Page complète du détail d'un cours avec onglets Informations et Cours (contenu).

### Description
Créer `src/app/(dashboard)/student/courses/[id]/page.tsx` :
- Fetch SWR pour course, scores, supplements
- Header avec titre, matière, professeur
- Barre de progression avec KPIs
- Tabs : Informations (description) et Cours (chapitres)
- Section suppléments personnels liés

### Prompt
```
Crée src/app/(dashboard)/student/courses/[id]/page.tsx - Page détail cours élève.

"use client" car interactions.

Params :
interface Props { params: Promise<{ id: string }> }

Fetch multiple :
- useSWR(`/api/student/courses/${courseId}`) → course data
- useSWR(`/api/student/courses/${courseId}/scores`) → scores sections
- useSWR(`/api/student/courses/${courseId}/supplements`) → suppléments liés

Structure page :

1. Header :
   - Button retour → /student/courses
   - Titre + Badge matière
   - "Par Prénom Nom"

2. Card progression :
   - Progress bar avec percentage
   - "X / Y chapitres terminés" + "Z sections au total"
   - CourseScoreKPIs compact si scores disponibles

3. Tabs :
   <Tabs defaultValue="cours">
     <TabsList>
       <TabsTrigger value="informations">Informations</TabsTrigger>
       <TabsTrigger value="cours">Cours</TabsTrigger>
     </TabsList>
     
     <TabsContent value="informations">
       <CourseInfoTab course={course} />
     </TabsContent>
     
     <TabsContent value="cours">
       <StudentChaptersViewer 
         chapters={course.chapters}
         courseId={courseId}
         onProgressUpdate={mutate}
       />
       
       {/* Suppléments personnels */}
       <Card>
         <CardTitle>Mes suppléments</CardTitle>
         <LinkedSupplementsList supplements={supplements} />
       </Card>
     </TabsContent>
   </Tabs>

Modal SectionViewer intégrée :
- selectedSection state
- Dialog avec viewer approprié selon section.type

Composants utilisés :
- Tabs, Card, Badge, Progress, Button, Dialog, Accordion
- StudentChaptersViewer, LessonViewer, VideoViewer, QuizViewer, ExerciseViewer
```

---

## Tâche 15.15 — Export barrel viewers

### Contexte
Créer les fichiers index.ts pour faciliter les imports des viewers.

### Description
Créer les exports barrel pour le dossier viewers.

### Prompt
```
Crée les fichiers index.ts pour les viewers :

=== src/components/features/student/viewers/index.ts ===
export { LessonViewer } from './LessonViewer';
export { VideoViewer } from './VideoViewer';
export { ExerciseViewer } from './ExerciseViewer';
export { QuizViewer } from './quiz/QuizViewer';

=== src/components/features/student/viewers/quiz/index.ts ===
export { QuizViewer } from './QuizViewer';
export { QuizProgress, AnswerOption, AnswerFeedback, QuizActions, FinalScore } from './QuizSubComponents';
export type { QuizContent, QuizQuestion, QuizOption, NormalizedOption } from './types';
export { normalizeOptions, getCorrectOptionId } from './types';

Ces exports simplifient l'import depuis la page détail :
import { LessonViewer, VideoViewer, QuizViewer, ExerciseViewer } from '@/components/features/student/viewers';
```

---

## Résumé des fichiers

| Fichier | Rôle |
|---------|------|
| `api/student/courses/route.ts` | Liste cours avec progression et filtres |
| `api/student/courses/[id]/route.ts` | Détail cours avec chapitres/sections |
| `api/student/courses/[id]/progress/route.ts` | Marquer chapitre terminé |
| `api/student/courses/[id]/sections/[sectionId]/score/route.ts` | Sauvegarder score quiz/exercice |
| `student/courses/page.tsx` | Liste avec filtres multi-select |
| `student/courses/[id]/page.tsx` | Détail avec tabs et viewers |
| `StudentCoursesStatsHeader.tsx` | 4 KPIs globaux |
| `StudentCoursesFiltersMulti.tsx` | Filtres cascade |
| `StudentCoursesTable.tsx` | Table avec progression |
| `StudentChaptersViewer.tsx` | Accordion chapitres/sections |
| `viewers/LessonViewer.tsx` | Affiche HTML/Markdown + fichiers |
| `viewers/VideoViewer.tsx` | Embed YouTube/Vimeo ou player natif |
| `viewers/ExerciseViewer.tsx` | Questions avec notation IA |
| `viewers/quiz/QuizViewer.tsx` | Quiz interactif avec score |

---

## Validation

```bash
# Lint
npm run lint

# Vérifier les imports
npx tsc --noEmit

# Tester manuellement
# 1. /student/courses → voir liste avec stats et filtres
# 2. Cliquer sur un cours → voir chapitres
# 3. Cliquer sur une section → viewer approprié s'ouvre
# 4. Compléter un quiz → score sauvegardé
# 5. Marquer chapitre terminé → progression mise à jour
```

---

## Points d'attention

1. **Cascade des filtres** : Les options disponibles changent selon les sélections précédentes
2. **Types de sections** : 4 viewers différents (LESSON, VIDEO, QUIZ, EXERCISE)
3. **Sauvegarde scores** : Automatique après quiz/exercice terminé
4. **Progression simplifiée** : Basée sur pourcentage global, pas par section
5. **Suppléments** : Cartes personnelles liées au cours (système révisions)
6. **Notation IA** : Les exercices utilisent `/api/ai/grade-exercise`
