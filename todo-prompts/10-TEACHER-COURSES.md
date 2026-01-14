# Phase 10 — Teacher : Cours

> Création et édition de cours avec chapitres, sections et statistiques de performance

---

## Vue d'ensemble

Le module cours permet aux professeurs de créer et gérer leurs contenus pédagogiques :

| Composant | Type | Rôle |
|-----------|------|------|
| Page liste | Client | Liste des cours avec stats performance |
| Page détail | Client | Onglets Informations + Structure (chapitres) |
| CoursesTable | Client | Tableau avec badges performance |
| CourseFormModal | Client | Création/édition rapide de cours |
| ChaptersManager | Client | Gestion arborescente chapitres/sections |
| API courses | Server | CRUD cours avec stats agrégées |
| API chapters | Server | CRUD chapitres |
| API sections | Server | CRUD sections (LESSON, QUIZ, EXERCISE, VIDEO) |

---

## Tâches

### 10.1 Types Course Stats

#### Contexte
Les types définissent la structure des statistiques de performance des cours : score combiné (60% exercices + 40% IA), grades A+ à D, et overview global.

#### Description
Créer `src/types/course-stats.ts` avec les interfaces de performance.

#### Prompt
```
Crée src/types/course-stats.ts :

1. Type PerformanceGrade = 'A+' | 'A' | 'B' | 'C' | 'D'

2. Interface CoursePerformance :
   - studentScoreAvg: number (0-100)
   - aiScoreAvg: number (0-100)
   - globalScore: number (combiné : student*0.6 + ai*0.4)
   - grade: PerformanceGrade
   - enrolledCount: number
   - activeCount: number

3. Interface CourseWithStats :
   - id, title, description
   - subject: { id, name }
   - performance: CoursePerformance | null
   - aiComprehensionAvg: number | null

4. Interface CoursesOverview :
   - totalCourses, totalStudents, averagePerformance, coursesWithData

5. Fonction calculateGrade(score: number): PerformanceGrade
   - >= 90 → 'A+', >= 80 → 'A', >= 70 → 'B', >= 60 → 'C', else 'D'

6. Fonction getGradeColor(grade): string
   - A+ → 'bg-emerald-600 text-white'
   - A → 'bg-green-500 text-white'
   - B → 'bg-amber-500 text-white'
   - C → 'bg-orange-500 text-white'
   - D → 'bg-red-500 text-white'
   - null → 'bg-gray-300 text-gray-600'
```

---

### 10.2 API GET /api/teacher/courses

#### Contexte
L'API retourne la liste des cours du professeur avec leurs statistiques de performance calculées à partir de StudentScore et AIActivityScore.

#### Description
Créer `src/app/api/teacher/courses/route.ts` avec GET qui calcule les stats.

#### Prompt
```
Crée src/app/api/teacher/courses/route.ts (GET) :

1. Imports : NextResponse, auth, prisma, types course-stats

2. Helper getSchoolYearStart() :
   - Retourne Date du 1er septembre de l'année scolaire en cours
   - Si mois >= 8 (septembre), utiliser année courante, sinon année - 1

3. GET handler :
   - Vérifier TEACHER + TeacherProfile
   - Query prisma.course.findMany :
     - where: { teacherId: teacherProfile.id }
     - include: Subject, StudentScore (depuis schoolYearStart), AIActivityScore
     - orderBy: { createdAt: 'desc' }

4. Pour chaque cours, calculer :
   - studentScoreAvg : moyenne des finalScore ou (quizAvg + exerciseAvg) / 2
   - aiScoreAvg : moyenne AIActivityScore.finalScore
   - globalScore : (studentScoreAvg * 0.6) + (aiScoreAvg * 0.4)
   - grade : calculateGrade(globalScore)
   - enrolledCount : Set des studentIds uniques
   - activeCount : nombre de StudentScore

5. Calculer overview :
   - totalCourses, totalStudents (union des sets), averagePerformance, coursesWithData

6. Retourner { success: true, data: { courses: CourseWithStats[], overview } }
```

---

### 10.3 API POST /api/teacher/courses

#### Contexte
La création de cours utilise une transaction pour créer simultanément le cours, un premier chapitre et une première section LESSON si du contenu est fourni.

#### Description
Ajouter POST à route.ts avec validation Zod et transaction.

#### Prompt
```
Ajoute POST à src/app/api/teacher/courses/route.ts :

1. Schéma Zod createCourseSchema :
   - title: z.string().min(3)
   - description: z.string().optional()
   - subjectId: z.string().min(1)
   - content: z.string().optional()
   - difficulty: z.enum(['EASY', 'MEDIUM', 'HARD']).optional()
   - duration: z.number().int().positive().optional().nullable()
   - objectives, tags: z.array(z.string()).optional()
   - isDraft: z.boolean().optional()
   - chapterName: z.string().min(1).optional()
   - files: z.array({ filename, url }).optional()

2. POST handler :
   - Vérifier TEACHER + TeacherProfile
   - Valider body avec schema
   - Vérifier que subjectId existe

3. Transaction prisma.$transaction :
   - Créer le cours avec randomUUID() comme id
   - isDraft: true par défaut
   - Si files : créer CourseFile associés

   - Si chapterName fourni :
     - Créer Chapter avec order: 1
     - Si content : créer Section LESSON avec { html: content }

4. Retourner { course: { id, title, ... }, status: 201 }
```

---

### 10.4 API GET/PUT/DELETE /api/teacher/courses/[id]

#### Contexte
Les routes dynamiques permettent de récupérer un cours avec ses détails enrichis, de le modifier (y compris isDraft pour publish/unpublish) et de le supprimer.

#### Description
Créer `src/app/api/teacher/courses/[id]/route.ts`.

#### Prompt
```
Crée src/app/api/teacher/courses/[id]/route.ts :

1. Schéma updateCourseSchema (tous optionnels) :
   - title, description, subjectId, content
   - difficulty, duration, objectives, tags, isDraft
   - files: [{ id?, filename, url }]

2. Helper verifyCourseOwnership(courseId, userId) :
   - Trouver TeacherProfile
   - course.findFirst where id + teacherId, include Subject, Chapter, CourseFile
   - Retourne course ou null

3. Helper getCourseWithCounts(courseId, userId) :
   - Pareil mais avec _count: { Chapter, Resource, CourseAssignment }

4. GET handler :
   - Vérifier ownership
   - Retourner { course: { ...données, _count, files } }

5. PUT handler :
   - Vérifier ownership
   - Valider avec updateCourseSchema
   - Gérer files : supprimer ceux absents, créer les nouveaux
   - prisma.course.update
   - Retourner course mis à jour

6. DELETE handler :
   - Vérifier ownership
   - prisma.course.delete (cascade chapters/sections via schema)
   - Retourner { success: true }
```

---

### 10.5 API CRUD Chapters

#### Contexte
Les chapitres appartiennent à un cours. L'API vérifie que le chapitre/cours appartient au professeur.

#### Description
Créer `src/app/api/teacher/chapters/[id]/route.ts`.

#### Prompt
```
Crée src/app/api/teacher/chapters/[id]/route.ts :

1. Helper verifyChapterOwnership(chapterId, userId) :
   - Trouver TeacherProfile
   - chapter.findFirst where id + Course.teacherId
   - Include Course { id, title }, _count: Section, Section ordered

2. GET handler :
   - Vérifier ownership
   - Retourner chapter avec sections

3. PUT handler :
   - Vérifier ownership
   - Body : { title?, description?, order? }
   - Valider title non vide si fourni
   - prisma.chapter.update
   - Retourner chapter mis à jour

4. DELETE handler :
   - Vérifier ownership
   - prisma.chapter.delete (cascade sections)
   - Retourner { success: true }
```

---

### 10.6 API CRUD Sections

#### Contexte
Les sections ont un type (LESSON, EXERCISE, QUIZ, VIDEO) et un contenu JSON. L'API gère la mise à jour du contenu et de la durée.

#### Description
Créer `src/app/api/teacher/sections/[id]/route.ts`.

#### Prompt
```
Crée src/app/api/teacher/sections/[id]/route.ts :

1. Import SectionType depuis @prisma/client

2. Helper verifySectionOwnership(sectionId, userId) :
   - Trouver TeacherProfile
   - section.findFirst where id + Chapter.Course.teacherId
   - Include Chapter avec Course { id, title }

3. GET handler :
   - Vérifier ownership
   - Retourner section avec contexte (chapter, course)

4. PUT handler :
   - Vérifier ownership
   - Body : { title?, type?, content?, order?, duration? }
   - Valider type dans ['LESSON', 'EXERCISE', 'QUIZ', 'VIDEO']
   - prisma.section.update
   - Retourner section mise à jour

5. DELETE handler :
   - Vérifier ownership
   - prisma.section.delete
   - Retourner { success: true }
```

---

### 10.7 Composant CoursesTable

#### Contexte
Le tableau affiche la matière, le titre (lien vers détail), et un badge de performance avec grade coloré.

#### Description
Créer `src/components/features/teacher/CoursesTable.tsx`.

#### Prompt
```
Crée src/components/features/teacher/CoursesTable.tsx :

1. 'use client'

2. Interface CourseData :
   - id, title, description
   - subject?: { id, name }, subjectId?, subjectName?
   - performance?: CoursePerformance | null
   - aiComprehensionAvg?: number | null

3. Props : courses: CourseData[], onEdit, onDelete

4. Si courses.length === 0 : message + icône BookOpen "Aucun cours"

5. Table avec colonnes :
   - Matière : Badge variant="secondary" avec subject.name
   - Thème : Link vers /teacher/courses/{id} avec hover:underline
   - Performance : <CoursePerformanceBadge performance={...} />
   - Actions : DropdownMenu (Modifier le cours, Supprimer)

6. handleDelete : confirm puis appel onDelete
```

---

### 10.8 Composant CourseFormModal

#### Contexte
Modale simple pour créer ou éditer les infos de base d'un cours (titre, description, matière).

#### Description
Créer `src/components/features/teacher/CourseFormModal.tsx`.

#### Prompt
```
Crée src/components/features/teacher/CourseFormModal.tsx :

1. 'use client'

2. Props interface :
   - open, onOpenChange
   - course?: CourseData | null
   - subjects: { id, name }[]
   - onSubmit: (data: { title, description, subjectId }) => Promise<void>

3. États : title, description, subjectId, loading, error
   - isEditMode = !!course

4. useEffect : pré-remplir si course

5. handleSubmit :
   - Validation : title requis, subjectId requis
   - Appeler onSubmit
   - onOpenChange(false) si succès

6. Dialog avec :
   - Titre dynamique (Modifier/Nouveau cours)
   - Input title *
   - Textarea description
   - Select matière * avec liste subjects
   - Erreur si présente
   - Boutons Annuler / Créer|Enregistrer
```

---

### 10.9 Composant ChaptersManager

#### Contexte
Composant central pour gérer l'arborescence chapitres/sections d'un cours. Utilise des dialogs pour créer/éditer et des AlertDialog pour confirmer les suppressions.

#### Description
Créer `src/components/features/courses/ChaptersManager.tsx`.

#### Prompt
```
Crée src/components/features/courses/ChaptersManager.tsx :

1. 'use client'

2. Props : courseId: string

3. États :
   - chapters: Chapter[]
   - loading, expandedChapters (Set)
   - expandedSectionId (pour édition inline)
   - chapterDialogOpen, sectionDialogOpen
   - editingChapter, editingSection
   - deleteChapterId, deleteSectionId (pour confirmation)

4. fetchChapters() : GET /api/teacher/courses/{courseId}/chapters
   - Ouvrir tous les chapitres par défaut

5. Handlers chapitres :
   - handleChapterSubmit : POST ou PUT selon editingChapter
   - handleDeleteChapter : DELETE après confirmation

6. Handlers sections :
   - handleSectionSubmit : POST ou PUT selon editingSection
   - handleDeleteSection : DELETE après confirmation

7. Helpers pour ouvrir dialogs :
   - openCreateChapter, openEditChapter
   - openCreateSection(chapterId), openEditSection

8. Render :
   - Si loading : Loader2
   - Si chapters vide : message + bouton "Créer un chapitre"
   - Sinon : map chapters avec ChapterItem
   - ChapterFormDialog et SectionFormDialog
   - AlertDialog pour confirmations delete
```

---

### 10.10 Composants ChapterFormDialog et SectionFormDialog

#### Contexte
Dialogs réutilisables pour créer/éditer chapitres et sections. SectionFormDialog inclut un select pour le type de section.

#### Description
Créer les deux composants dialog.

#### Prompt
```
Crée src/components/features/courses/ChapterFormDialog.tsx :

1. 'use client', utilise react-hook-form

2. Props : open, onOpenChange, chapter: Chapter | null, onSubmit

3. useForm avec reset sur open/chapter change

4. Form avec :
   - Input title * (required)
   - Textarea description (optionnel)
   - Boutons Annuler / Créer|Enregistrer

---

Crée src/components/features/courses/SectionFormDialog.tsx :

1. 'use client', utilise react-hook-form + Controller

2. Type SectionType = 'LESSON' | 'EXERCISE' | 'QUIZ' | 'VIDEO'

3. sectionTypes constant :
   - LESSON : BookOpen, "Leçon", "Contenu pédagogique"
   - VIDEO : Video, "Vidéo", "Vidéo explicative"
   - EXERCISE : PenTool, "Exercice", "Exercice pratique"
   - QUIZ : FileQuestion, "Quiz", "Questions à choix"

4. Props : open, onOpenChange, section: Section | null, onSubmit

5. Form avec :
   - Input title *
   - Select type * avec sectionTypes (icône + label + description)
   - Input duration (minutes, optionnel)
   - Boutons Annuler / Créer|Enregistrer
```

---

### 10.11 Page Teacher Courses Liste

#### Contexte
Page client qui charge les cours et matières, affiche les stats header et le tableau avec modale de création rapide.

#### Description
Créer `src/app/(dashboard)/teacher/courses/page.tsx`.

#### Prompt
```
Crée src/app/(dashboard)/teacher/courses/page.tsx :

1. 'use client'

2. États : courses[], overview, subjects[], loading, modalOpen, editingCourse

3. fetchCourses() : GET /api/teacher/courses
   - Extraire courses et overview depuis data

4. fetchSubjects() : GET /api/teacher/subjects
   - Extraire subjects

5. useEffect : Promise.all([fetchCourses, fetchSubjects])

6. Handlers :
   - handleEdit(course) : setEditingCourse, setModalOpen
   - handleDelete(courseId) : confirm, DELETE, refresh
   - handleSubmit : POST ou PUT, refresh

7. Render :
   - Header "Mes Cours" + description + Button Link vers /teacher/courses/new
   - Si overview : <CoursesStatsHeader overview={overview} />
   - <CoursesTable courses={courses} onEdit onDelete />
   - <CourseFormModal ... />
```

---

### 10.12 Page Teacher Course Détail

#### Contexte
Page avec onglets : Informations (métriques IA, détails) et Cours (ChaptersManager). Permet de publier/dépublier le cours.

#### Description
Créer `src/app/(dashboard)/teacher/courses/[id]/page.tsx`.

#### Prompt
```
Crée src/app/(dashboard)/teacher/courses/[id]/page.tsx :

1. 'use client'

2. Interface CourseData enrichi avec difficulty, duration, objectives, tags, isDraft, files, _count

3. États : courseId, course, loading, publishing
   - activeTab depuis searchParams (défaut 'cours')

4. Résoudre params async → setCourseId

5. fetchCourse() : GET /api/teacher/courses/{courseId}
   - Redirect si 404/403

6. handleTabChange(value) : router.push avec ?tab=value

7. handleTogglePublish() : PUT { isDraft: !course.isDraft }

8. Render :
   - Header avec :
     - Bouton retour vers /teacher/courses
     - Titre + Badge (Brouillon/Publié)
     - Matière
     - Bouton Publier/Dépublier

   - Tabs avec 2 onglets :
     - "informations" : <CourseInfoTab course courseId onUpdate />
     - "cours" : <ChaptersManager courseId />

9. CourseInfoTab (sous-composant) :
   - ThemeAIMetrics
   - Card infos générales (titre, description, matière, difficulté, durée)
   - Card objectifs et tags
```

---

## Checklist de validation

- [ ] Types course-stats.ts avec grades et fonctions couleur
- [ ] API GET /api/teacher/courses calcule performance par cours
- [ ] API POST /api/teacher/courses crée cours + chapitre + section en transaction
- [ ] API [id] GET/PUT/DELETE gère ownership et fichiers
- [ ] API chapters [id] GET/PUT/DELETE avec vérification ownership
- [ ] API sections [id] GET/PUT/DELETE avec types LESSON/QUIZ/EXERCISE/VIDEO
- [ ] CoursesTable avec badges performance colorés
- [ ] CourseFormModal avec select matière
- [ ] ChaptersManager avec CRUD chapitres et sections
- [ ] Dialogs utilisent react-hook-form
- [ ] Page liste affiche overview stats
- [ ] Page détail avec onglets et bouton publish/unpublish

---

## Liens

- [Phase précédente : 09-TEACHER-DASHBOARD.md](09-TEACHER-DASHBOARD.md)
- [Phase suivante : 11-TEACHER-CLASSES.md](11-TEACHER-CLASSES.md)
