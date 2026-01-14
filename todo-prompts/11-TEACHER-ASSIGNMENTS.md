# Phase 11 — Teacher : Assignations

> Système complet d'assignation de sections de cours aux élèves, avec wizard multi-étapes, calendrier interactif, vue liste groupée par date, et création en masse.

---

## Vue d'ensemble

Cette phase implémente le système d'assignation pour le professeur :
- **Wizard 7 étapes** pour créer des assignations (matières → cours → sections → classes → élèves → deadline → validation)
- **Vue calendrier** avec react-big-calendar et code couleur par priorité/classe
- **Vue liste** groupée par date avec statistiques (en retard, aujourd'hui, à venir)
- **API bulk** pour création en masse avec déduplication
- **Suivi StudentProgress** pour chaque assignation/élève

---

## Tâche 11.1 — Types et constantes assignations

### Contexte
Le système d'assignation utilise des types complexes : Subject, Course, Chapter, Section, ClassOption, Student, AssignmentFormData. Les constantes définissent les icônes par type de section et les options de priorité.

### Description
Créer le fichier types.ts avec tous les types partagés et les constantes visuelles (SECTION_TYPE_ICONS, PRIORITY_OPTIONS).

### Prompt
```
Crée src/components/features/assignments/types.ts avec :

TYPES PARTAGÉS :
interface Subject { id: string; name: string }
interface Course { id: string; title: string; subject?: { id: string; name: string }; subjectId?: string }
interface Chapter { id: string; title: string; courseId: string }
interface Section { id: string; title: string; type: string; chapterId: string; courseId?: string }
interface ClassOption { id: string; name: string }
interface Student { id: string; firstName: string; lastName: string; classId: string }

interface AssignmentFormData {
  selectedSubjects: string[]
  selectedCourses: string[]
  selectedSections: string[]
  selectedClasses: string[]
  selectedStudents: string[]
  dueDate?: Date
  priority: 'LOW' | 'MEDIUM' | 'HIGH'
  instructions: string
}

CONSTANTES VISUELLES :
SECTION_TYPE_ICONS: Record<string, { icon: string; label: string }> = {
  LESSON: { icon: '📚', label: 'Leçon' },
  EXERCISE: { icon: '✍️', label: 'Exercice' },
  QUIZ: { icon: '📝', label: 'Quiz' },
  VIDEO: { icon: '🎬', label: 'Vidéo' },
  DOCUMENT: { icon: '📄', label: 'Document' }
}

PRIORITY_OPTIONS = [
  { value: 'HIGH' as const, label: 'Haute', color: 'text-red-600 border-red-200' },
  { value: 'MEDIUM' as const, label: 'Moyenne', color: 'text-orange-600 border-orange-200' },
  { value: 'LOW' as const, label: 'Basse', color: 'text-green-600 border-green-200' }
]

Exporter tous les types et constantes.
```

---

## Tâche 11.2 — Hook useAssignmentForm

### Contexte
Le wizard de création d'assignation nécessite un hook complexe gérant : le chargement des données (matières, cours, chapitres, sections, classes, élèves), les sélections utilisateur, les filtres dynamiques (cours filtrés par matière, étudiants filtrés par classe), et les helpers de sélection.

### Description
Créer useAssignmentForm.ts : hook de gestion du formulaire avec chargement API cascade, états de sélection, computed values, et helpers (toggleSelection, selectAll, toggleClassStudents, isClassFullySelected).

### Prompt
```
Crée src/components/features/assignments/useAssignmentForm.ts :

INTERFACE DE RETOUR UseAssignmentFormReturn :
// Data chargée via API
subjects: Subject[], courses: Course[], chapters: Chapter[], sections: Section[], classes: ClassOption[], students: Student[]

// États de sélection
selectedSubjects, selectedCourses, selectedSections, selectedClasses, selectedStudents: string[]
dueDate?: Date, dueTime?: string, priority: 'LOW' | 'MEDIUM' | 'HIGH', instructions: string

// Computed
filteredCourses: Course[] (filtrés par selectedSubjects)
filteredStudents: Student[] (filtrés par selectedClasses)
sectionsByChapter: Record<string, { chapter: Chapter; sections: Section[] }>
studentsByClass: Record<string, { classInfo: ClassOption; students: Student[] }>

// Loading
isLoading: boolean

// Setters pour chaque état

// Helpers
toggleSelection(id, selected, setSelected) - ajoute/retire un ID
selectAll(items, setSelected) - sélectionne tous les IDs
clearAll(setSelected) - vide la sélection
toggleClassStudents(classId) - sélectionne/désélectionne tous les élèves d'une classe
isClassFullySelected(classId) - vérifie si tous les élèves sont sélectionnés

// Reset
reset() - remet tout à zéro

LOGIQUE DE CHARGEMENT :
1. À l'ouverture (open=true), charger subjects, courses, classes
2. Quand selectedCourses change → charger chapters et sections via /api/teacher/courses/[id]/chapters et /api/teacher/courses/[id]/sections
3. Quand selectedClasses change → charger students via /api/teacher/classes/[id]/students
4. Utiliser useRef pour éviter les boucles infinies (prevSelectedCoursesRef, prevSelectedClassesRef)
5. Reset automatique quand open passe à false

COMPUTED sectionsByChapter :
Grouper sections par chapitre : { chapterId: { chapter, sections: [...] } }

COMPUTED studentsByClass :
Grouper students par classe : { classId: { classInfo, students: [...] } }

toggleClassStudents :
Si tous sélectionnés → désélectionner tous les élèves de cette classe
Sinon → sélectionner tous les élèves de cette classe
```

---

## Tâche 11.3 — Hook useAssignmentSubmit

### Contexte
La soumission d'assignation peut créer une seule assignation (PUT si édition) ou plusieurs en masse (POST bulk). Le hook gère le build de la date finale (date + heure), la déduplication par clé courseId-studentId, et l'envoi vers l'API appropriée.

### Description
Créer useAssignmentSubmit.ts : hook de soumission avec gestion édition (PUT) et création bulk (POST), construction de la liste d'assignations avec déduplication, toasts de feedback.

### Prompt
```
Crée src/components/features/assignments/useAssignmentSubmit.ts :

INTERFACE SubmitParams :
editingAssignment: AssignmentWithDetails | null | undefined
selectedCourses, selectedSections, selectedStudents, selectedClasses: string[]
courses: Array<{ id: string; title: string }>
sections: Array<{ id: string; title: string; courseId?: string }>
students: Array<{ id: string; classId: string | null }>
dueDate?: Date, dueTime?: string
priority: string, instructions: string
onSuccess: () => void

HOOK useAssignmentSubmit() retourne { submit }

LOGIQUE buildFinalDueDate(dueDate, dueTime) :
- Si pas de dueDate → undefined
- Si dueTime fourni → set hours/minutes depuis "HH:mm"
- Sinon → 23:59:00

LOGIQUE handleUpdate (mode édition) :
PUT /api/teacher/assignments/[id] avec { title, instructions, dueDate, priority }
Toast "Assignation modifiée" sur succès

LOGIQUE buildAssignments (mode création) :
1. Grouper les sections par cours : Map<courseId, sectionIds[]>
2. Pour chaque (courseId, sectionIds) et chaque studentId :
   - Clé = `${courseId}-${studentId}` pour déduplication via Set
   - Construire assignment : {
       courseId, sectionIds (JSON.stringify), studentId,
       classId (depuis student.classId), targetType: 'STUDENT',
       title: `${courseName} - ${studentName}`,
       instructions, dueDate, priority
     }
3. Retourner le tableau d'assignments

LOGIQUE submit :
- Si editingAssignment → handleUpdate
- Sinon si 1 seul assignment → POST /api/teacher/assignments
- Sinon → POST /api/teacher/assignments/bulk avec { assignments: [...] }
- Toast de succès avec nombre d'assignations créées
- Appeler onSuccess()
```

---

## Tâche 11.4 — Composants wizard (steps/)

### Contexte
Le wizard de création comporte 7 étapes, chacune dans un composant séparé. Chaque step reçoit les données et callbacks en props, affiche une liste de sélection avec checkboxes, et permet "Tout sélectionner / Tout désélectionner".

### Description
Créer les 7 composants steps : StepSubjects, StepCourses, StepSections, StepClasses, StepStudents, StepDeadline, StepValidation + barrel export.

### Prompt
```
Crée src/components/features/assignments/steps/ avec 7 composants + index.ts :

1. StepSubjects.tsx :
Props : subjects: Subject[], selectedSubjects: string[], onToggle(id), onSelectAll(), onClearAll()
UI : Grille de cartes cliquables avec checkbox, boutons "Tout sélectionner / Tout désélectionner"

2. StepCourses.tsx :
Props : courses: Course[], selectedCourses: string[], onToggle(id), onSelectAll(), onClearAll(), hasSubjectFilter: boolean
UI : Liste de cours avec checkbox, afficher la matière si disponible, message si filtrage actif

3. StepSections.tsx :
Props : chapters: Chapter[], sections: Section[], sectionsByChapter: Record<...>, selectedSections: string[], onToggleSection(id)
UI : Accordéon par chapitre, liste de sections avec icône type (SECTION_TYPE_ICONS), checkbox par section

4. StepClasses.tsx :
Props : classes: ClassOption[], selectedClasses: string[], onToggle(id), onSelectAll(), onClearAll()
UI : Grille de cartes classes avec checkbox, afficher nombre d'élèves si disponible

5. StepStudents.tsx :
Props : studentsByClass: Record<...>, selectedStudents: string[], onToggleStudent(id), onToggleClass(classId), isClassFullySelected(classId), totalStudents: number
UI : Groupé par classe avec checkbox "toute la classe", liste élèves avec checkbox individuel, compteur "X/Y sélectionnés"

6. StepDeadline.tsx :
Props : dueDate?: Date, onDateChange(date), dueTime?: string, onTimeChange(time), priority: Priority, onPriorityChange(p), instructions: string, onInstructionsChange(text)
UI : DatePicker (Popover + Calendar), Input type="time", RadioGroup priorité avec PRIORITY_OPTIONS, Textarea instructions

7. StepValidation.tsx :
Props : tous les subjects/courses/sections/classes/students + selected* + dueDate + priority + instructions
UI : Récapitulatif avec badges : X matières, Y cours, Z sections, W classes, N élèves, deadline, priorité, aperçu instructions

index.ts : export { StepSubjects, StepCourses, StepSections, StepClasses, StepStudents, StepDeadline, StepValidation }
```

---

## Tâche 11.5 — StepProgressBar

### Contexte
Le wizard affiche une barre de progression montrant les 7 étapes avec leur état (complété, actuel, à venir). Chaque étape a un numéro, un label et une icône.

### Description
Créer StepProgressBar.tsx avec la constante STEPS et le composant affichant la progression horizontale.

### Prompt
```
Crée src/components/features/assignments/StepProgressBar.tsx :

CONSTANTE STEPS (export) :
Array de 7 étapes : { number: 1-7, label: string, icon: string }
1. Matières (📚), 2. Cours (📖), 3. Sections (📑), 4. Classes (👥), 5. Élèves (🎓), 6. Deadline (📅), 7. Validation (✅)

COMPOSANT StepProgressBar :
Props : currentStep: number

UI :
- Flex horizontal avec justify-between
- Pour chaque étape :
  - Cercle numéroté avec couleur conditionnelle :
    - step < currentStep → bg-green-500 text-white (complété)
    - step === currentStep → bg-blue-500 text-white (actuel)
    - step > currentStep → bg-gray-200 text-gray-500 (à venir)
  - Label sous le cercle, même logique de couleur
  - Ligne connectant les cercles (sauf dernier)
- Responsive : sur mobile, afficher seulement le cercle actuel avec "Étape X/7"
```

---

## Tâche 11.6 — NewAssignmentModal

### Contexte
Le modal de création/édition d'assignation orchestre le wizard : navigation entre étapes, validation par étape, pré-remplissage en mode édition, soumission finale.

### Description
Créer NewAssignmentModal.tsx : Dialog contenant StepProgressBar, rendu conditionnel de chaque Step, navigation Précédent/Suivant/Créer.

### Prompt
```
Crée src/components/features/assignments/NewAssignmentModal.tsx :

PROPS :
open: boolean, onOpenChange(open), onSuccess(), editingAssignment?: AssignmentWithDetails | null

ÉTATS :
currentStep: number (1-7), isSubmitting: boolean
Utiliser useAssignmentForm(open) et useAssignmentSubmit()

EFFET édition :
Si editingAssignment et open → pré-remplir le form avec les valeurs existantes et sauter à étape 6

EFFET reset :
Si !open → reset currentStep à 1

VALIDATION canProceed() par étape :
1: toujours true (matières optionnelles)
2: selectedCourses.length > 0 (ou isEditing)
3: selectedSections.length > 0 (ou isEditing)
4: selectedClasses.length > 0 (ou isEditing)
5: selectedStudents.length > 0 (ou isEditing)
6: dueDate !== undefined
7: toujours true

RENDU renderStep() :
Switch sur currentStep, rendre le composant Step* correspondant avec les props du form

SOUMISSION handleSubmit() :
setIsSubmitting(true), try await submit({...}), finally setIsSubmitting(false)

UI Dialog :
- DialogHeader avec DialogTitle "Nouvelle assignation" ou "Modifier l'assignation"
- StepProgressBar currentStep
- ScrollArea avec renderStep()
- DialogFooter :
  - Button "Précédent" (disabled si step 1)
  - Button "Suivant" (si step < 7, disabled si !canProceed())
  - Button "Créer les assignations" (si step 7, avec Loader2 si isSubmitting)
```

---

## Tâche 11.7 — AssignmentsCalendar

### Contexte
Le calendrier affiche les assignations avec react-big-calendar, localisé en français. Chaque événement est coloré selon la priorité (HIGH=rouge, MEDIUM=orange, LOW=vert) et peut afficher la couleur de la classe.

### Description
Créer AssignmentsCalendar.tsx : composant calendrier avec toolbar personnalisée, événements cliquables, sélection de date, support des vues mois/semaine/jour/agenda.

### Prompt
```
Crée src/components/features/assignments/AssignmentsCalendar.tsx :

IMPORTS :
- Calendar, dateFnsLocalizer, Views, View, ToolbarProps de react-big-calendar
- format, parse, startOfWeek, getDay de date-fns
- fr de date-fns/locale
- Importer 'react-big-calendar/lib/css/react-big-calendar.css' et '@/styles/calendar.css'

LOCALIZER :
dateFnsLocalizer avec format, parse, startOfWeek (weekStartsOn: 1), getDay, locales: { fr }

CONSTANTES :
PRIORITY_COLORS = { HIGH: { bg: 'bg-red-500', text: 'text-white' }, MEDIUM: ..., LOW: ... }
TARGET_TYPE_ICONS = { CLASS: '👥', TEAM: '👤', STUDENT: '🎓' }
messages = { today: "Aujourd'hui", previous: 'Précédent', next: 'Suivant', month: 'Mois', week: 'Semaine', day: 'Jour', agenda: 'Agenda', noEventsInRange: 'Aucune assignation sur cette période' }

PROPS :
assignments: AssignmentWithDetails[], onSelectDate(date), onSelectAssignment(assignment)
calendarView: View, onCalendarViewChange(view), calendarDate: Date, onCalendarDateChange(date)
selectedClassIds?: string[]

INTERFACE CalendarEvent :
{ id, title, start: Date, end: Date, allDay: boolean, resource: AssignmentWithDetails }

COMPOSANT CustomToolbar :
Toolbar sans bouton "Aujourd'hui", avec Précédent/Suivant + boutons vue (Mois/Semaine/Jour/Agenda)

LOGIQUE :
1. Charger allClasses du professeur au mount via /api/teacher/classes
2. Convertir assignments en events : { id, title, start: parseISO(dueDate), end: idem, allDay: true, resource: assignment }
3. eventStyleGetter : retourner style avec backgroundColor selon priorité ou couleur de classe

UI :
Card contenant Calendar avec :
- localizer, events, views: [month, week, day, agenda]
- view: calendarView, onView: onCalendarViewChange
- date: calendarDate, onNavigate: onCalendarDateChange
- onSelectSlot: ({ start }) => onSelectDate(start)
- onSelectEvent: (event) => onSelectAssignment(event.resource)
- messages, components: { toolbar: CustomToolbar }
- eventPropGetter: eventStyleGetter
```

---

## Tâche 11.8 — AssignmentsList

### Contexte
La vue liste affiche les assignations groupées par date avec des indicateurs visuels (en retard en rouge, aujourd'hui en orange, à venir en bleu). Un header montre les statistiques globales.

### Description
Créer AssignmentsList.tsx : liste groupée par date avec stats, indicateur de date sélectionnée, et rendu des AssignmentCard.

### Prompt
```
Crée src/components/features/assignments/AssignmentsList.tsx :

PROPS :
assignments: AssignmentWithDetails[], selectedDate: Date | null
onSelectAssignment(assignment), onDeleteAssignment?(id), onAssignmentUpdated?()

COMPUTED groupedByDate :
Grouper assignments par date (format 'yyyy-MM-dd'), trier les clés chronologiquement

COMPUTED stats :
{ overdue: nombre avec dueDate passée, today: nombre avec isToday, upcoming: total - overdue - today, total }

UI VIDE :
Si assignments.length === 0 → Card avec icône CalendarDays, "Aucune assignation", message contextuel selon selectedDate

UI STATS HEADER :
Badges : {overdue} en retard (AlertTriangle, rouge), {today} aujourd'hui (Clock, orange), {upcoming} à venir (bleu)

UI INDICATEUR DATE :
Si selectedDate → Card bleu "Vue filtrée : {date formatée}"

UI LISTE :
Pour chaque dateKey dans groupedByDate :
- Header avec date formatée (EEEE d MMMM yyyy)
- Icône contextuelle : AlertTriangle rouge si isPast, Clock orange si isToday, CalendarDays bleu sinon
- Pour chaque assignment de ce groupe : AssignmentCard avec les handlers

Helpers formatDateHeader(dateKey) :
Retourner "Aujourd'hui", "Demain", ou date complète selon le cas
```

---

## Tâche 11.9 — AssignmentCard

### Contexte
Chaque assignation est affichée dans une carte uniforme avec : titre, cours, section(s), cible (classe/élève), deadline, priorité, et barre de progression. La carte supporte édition et suppression.

### Description
Créer AssignmentCard.tsx : carte d'assignation avec toutes les infos, menu actions (éditer, supprimer), barre de progression.

### Prompt
```
Crée src/components/features/assignments/AssignmentCard.tsx :

INTERFACE AssignmentCardData :
id, title, courseName, sectionTitle, targetName, targetType, dueDate, priority
stats: { total, completed, inProgress, notStarted, completionRate }

PROPS :
assignment: AssignmentWithDetails, onSelect(a), onDelete?(id), onUpdated?()

CONSTANTES :
PRIORITY_BADGES = { HIGH: 'bg-red-100 text-red-700', MEDIUM: 'bg-orange-100 text-orange-700', LOW: 'bg-green-100 text-green-700' }

COMPUTED :
- isPastDue: dueDate et isPast(parseISO(dueDate))
- progressPercent: assignment.stats?.completionRate || 0

UI Card (cliquable via onClick) :
Header :
- Titre avec truncate
- Badge priorité
- DropdownMenu (MoreHorizontal) : "Modifier" (Pencil), "Supprimer" (Trash2, text-red-600)

Body :
- Cours : BookOpen + courseName
- Section(s) : FileText + sectionTitle (ou "X sections" si plusieurs)
- Cible : TARGET_TYPE_ICONS[targetType] + targetName
- Deadline : Calendar + format(dueDate, 'dd/MM/yyyy HH:mm'), rouge si isPastDue

Footer :
- Barre de progression (div avec width: progressPercent%)
- Texte "{completed}/{total} terminés ({progressPercent}%)"

Suppression :
AlertDialog de confirmation "Supprimer cette assignation ?"
onConfirm : await onDelete(id), onUpdated?.()
```

---

## Tâche 11.10 — AssignmentFiltersBar

### Contexte
La barre de filtres permet de filtrer les assignations par cours, chapitre, section, classe, élève, priorité, et période. Elle utilise des MultiSelectDropdown pour les sélections multiples.

### Description
Créer AssignmentFiltersBar.tsx avec MultiSelectDropdown et tous les filtres.

### Prompt
```
Crée src/components/features/assignments/AssignmentFiltersBar.tsx :

INTERFACE AssignmentFiltersState :
courseIds: string[], chapterIds: string[], sectionIds: string[], classIds: string[], studentIds: string[]
priorities: ('LOW' | 'MEDIUM' | 'HIGH')[], dateRange: { from?: Date; to?: Date }

PROPS :
filters: AssignmentFiltersState, onChange(filters), onClearAll()
courses, chapters, sections, classes, students: données pour les dropdowns

COMPOSANT MultiSelectDropdown (interne ou séparé) :
Props : label, options: { value, label }[], selectedValues: string[], onChange(values)
UI : Popover avec trigger Button montrant "{label} ({count})", contenu avec liste de checkboxes

UI :
Flex wrap avec gap-2 :
- MultiSelectDropdown "Cours" avec courses
- MultiSelectDropdown "Chapitres" avec chapters (filtré par courses sélectionnés)
- MultiSelectDropdown "Sections" avec sections (filtré par chapters sélectionnés)
- MultiSelectDropdown "Classes" avec classes
- MultiSelectDropdown "Élèves" avec students (filtré par classes sélectionnées)
- MultiSelectDropdown "Priorité" avec PRIORITY_OPTIONS
- DateRangePicker "Période" (Popover avec 2 DatePickers from/to)
- Button "Réinitialiser" (X icon) si au moins un filtre actif

Chaque changement appelle onChange avec le nouveau state complet.
```

---

## Tâche 11.11 — API GET /api/teacher/assignments

### Contexte
L'API GET retourne les assignations du professeur avec filtrage multi-critères et statistiques de progression. Elle inclut les relations Course, Chapter, Section, Class, Team, User.

### Description
Implémenter GET dans route.ts avec tous les filtres et le calcul des stats par assignation.

### Prompt
```
Crée src/app/api/teacher/assignments/route.ts (GET) :

AUTH : Vérifier session, role TEACHER

QUERY PARAMS :
courseId?, chapterId?, sectionId?, classId?, studentId?, priority?, startDate?, endDate?

QUERY PRISMA :
where: {
  teacherId: session.user.id
  ...(courseId && { courseId })
  ...(chapterId && { chapterId })
  ...(sectionId && { sectionId })
  ...(classId && { classId })
  ...(studentId && { studentId })
  ...(priority && { priority })
  ...(startDate || endDate) && { dueDate: { gte: startDate, lte: endDate } }
}
include: {
  Course: true, Chapter: true, Section: true, Class: true, Team: true
  User_CourseAssignment_studentIdToUser: true // élève ciblé
  StudentProgress: true // pour calculer les stats
}
orderBy: { dueDate: 'asc' }

CALCUL STATS par assignation :
Pour chaque assignment :
- total = StudentProgress.length
- completed = StudentProgress.filter(sp => sp.status === 'COMPLETED' || sp.status === 'GRADED').length
- inProgress = StudentProgress.filter(sp => sp.status === 'IN_PROGRESS').length
- notStarted = total - completed - inProgress
- completionRate = total > 0 ? Math.round((completed / total) * 100) : 0
- kpiScore = moyenne des StudentProgress.continuousScore (si disponible)

RESPONSE :
{ success: true, data: assignments[] avec stats intégrées }
```

---

## Tâche 11.12 — API POST /api/teacher/assignments

### Contexte
L'API POST crée une assignation et génère automatiquement les StudentProgress pour tous les élèves ciblés (via classId, teamId, ou studentId direct).

### Description
Implémenter POST dans route.ts avec création de l'assignation et des StudentProgress associés.

### Prompt
```
Ajoute POST à src/app/api/teacher/assignments/route.ts :

AUTH : Vérifier session, role TEACHER

BODY :
{ courseId, chapterId?, sectionId?, classId?, teamId?, studentId?, targetType: 'CLASS'|'TEAM'|'STUDENT', title, instructions?, dueDate, priority: 'LOW'|'MEDIUM'|'HIGH' }

VALIDATION :
- courseId requis
- targetType requis
- Selon targetType : classId OU teamId OU studentId requis
- dueDate requis

LOGIQUE :
1. Vérifier que le cours appartient au professeur
2. Créer CourseAssignment :
   { teacherId, courseId, chapterId, sectionId, classId, teamId, studentId, targetType, title, instructions, dueDate, priority }

3. Déterminer les élèves cibles :
   - Si targetType === 'CLASS' → tous les élèves de la classe
   - Si targetType === 'TEAM' → tous les membres de l'équipe
   - Si targetType === 'STUDENT' → élève unique

4. Créer StudentProgress pour chaque élève :
   prisma.studentProgress.createMany({
     data: students.map(s => ({
       studentId: s.id,
       courseId: assignment.courseId,
       chapterId: assignment.chapterId,
       sectionId: assignment.sectionId,
       assignmentId: assignment.id,
       status: 'NOT_STARTED',
       startedAt: null, completedAt: null
     }))
   })

RESPONSE :
{ success: true, data: assignment avec stats { total: students.length, completed: 0, ... } }
```

---

## Tâche 11.13 — API PUT/DELETE /api/teacher/assignments/[id]

### Contexte
L'API PUT permet de modifier une assignation (deadline, priorité, instructions). L'API DELETE supprime l'assignation et ses StudentProgress associés.

### Description
Créer route.ts dans [id]/ avec handlers PUT et DELETE.

### Prompt
```
Crée src/app/api/teacher/assignments/[id]/route.ts :

AUTH (commun) : Vérifier session, role TEACHER, assignment appartient au teacher

--- PUT ---
BODY : { title?, instructions?, dueDate?, priority? }

UPDATE :
prisma.courseAssignment.update({
  where: { id },
  data: { ...body (champs non-undefined) }
})

RESPONSE : { success: true, data: assignment }

--- DELETE ---
LOGIQUE :
1. Supprimer tous les StudentProgress liés :
   prisma.studentProgress.deleteMany({ where: { assignmentId: id } })
2. Supprimer l'assignation :
   prisma.courseAssignment.delete({ where: { id } })

RESPONSE : { success: true, message: 'Assignation supprimée' }

--- GET (optionnel, détail) ---
Retourner l'assignation avec toutes les relations et stats calculées
```

---

## Tâche 11.14 — API POST /api/teacher/assignments/bulk

### Contexte
L'API bulk permet de créer plusieurs assignations en une seule transaction, avec vérification des doublons (même cours + même élève = doublon).

### Description
Créer route.ts dans bulk/ avec création transactionnelle et déduplication.

### Prompt
```
Crée src/app/api/teacher/assignments/bulk/route.ts :

AUTH : Vérifier session, role TEACHER

BODY :
{ assignments: Array<{
  courseId, sectionIds?: string (JSON), studentId, classId?, targetType, title, instructions?, dueDate, priority
}> }

VALIDATION :
- assignments est un array non vide
- Chaque assignment a les champs requis

DÉDUPLICATION :
1. Récupérer les assignations existantes du professeur :
   prisma.courseAssignment.findMany({ where: { teacherId, courseId: { in: courseIds } } })
2. Pour chaque assignment du body, vérifier si (courseId, studentId) existe déjà
3. Ne créer que les non-doublons

TRANSACTION :
prisma.$transaction(async (tx) => {
  const createdAssignments = []
  for (const a of uniqueAssignments) {
    // Créer l'assignation
    const assignment = await tx.courseAssignment.create({ data: { ... } })
    
    // Créer le StudentProgress
    await tx.studentProgress.create({
      data: {
        studentId: a.studentId,
        courseId: a.courseId,
        assignmentId: assignment.id,
        status: 'NOT_STARTED'
      }
    })
    createdAssignments.push(assignment)
  }
  return createdAssignments
})

RESPONSE :
{ success: true, data: { created: createdAssignments.length, skipped: duplicatesCount, assignments: createdAssignments } }
```

---

## Tâche 11.15 — Page teacher/assignments

### Contexte
La page principale orchestre les vues calendrier et liste, les filtres, le modal de création, et le chargement des données avec SWR.

### Description
Créer page.tsx avec toggle vue, filtres, chargement SWR, et gestion du state global.

### Prompt
```
Crée src/app/(dashboard)/teacher/assignments/page.tsx :

INTERFACE AssignmentWithDetails (export) :
Extension de CourseAssignment avec :
- Course, Chapter, Section, Class, Team, User_CourseAssignment_studentIdToUser: relations
- stats: { total, completed, inProgress, notStarted, completionRate }
- kpiScore?: number

TYPE ViewMode = 'calendar' | 'list'

ÉTATS :
view: ViewMode = 'calendar'
filters: AssignmentFiltersState (voir 11.10)
isModalOpen: boolean = false
selectedDate: Date | null = null
calendarView: View = Views.MONTH
calendarDate: Date = new Date()
editingAssignment: AssignmentWithDetails | null = null

SWR :
Charger /api/teacher/assignments avec les filtres en query params
Charger /api/teacher/courses, /api/teacher/classes pour les filtres

HANDLERS :
handleSelectDate(date) : setSelectedDate, ajouter dateRange au filtre
handleSelectAssignment(a) : ouvrir modal détail ou édition
handleDeleteAssignment(id) : DELETE puis mutate
handleSuccess() : fermer modal, mutate, toast

UI :
Header :
- Titre "Assignations"
- Toggle vue (Calendar/List icons)
- Button "Nouvelle assignation" ouvre le modal

AssignmentFiltersBar :
Avec les données courses/classes et handlers

Contenu conditionnel :
- Si view === 'calendar' → AssignmentsCalendar
- Si view === 'list' → AssignmentsList

NewAssignmentModal :
open, onOpenChange, onSuccess, editingAssignment

Skeleton loading pendant chargement SWR
```

---

## Tâche 11.16 — Styles calendrier

### Contexte
react-big-calendar nécessite des styles personnalisés pour s'intégrer au design system (dark mode, couleurs shadcn, etc.).

### Description
Créer calendar.css avec les overrides de styles pour react-big-calendar.

### Prompt
```
Crée src/styles/calendar.css :

RESET react-big-calendar :
.rbc-calendar { font-family: inherit; }

HEADER :
.rbc-toolbar { flex-wrap: wrap; gap: 0.5rem; margin-bottom: 1rem; }
.rbc-toolbar-label { font-weight: 600; font-size: 1.125rem; }

ÉVÉNEMENTS :
.rbc-event { 
  border-radius: 0.375rem; 
  padding: 0.25rem 0.5rem;
  font-size: 0.75rem;
  border: none;
}
.rbc-event-content { overflow: hidden; text-overflow: ellipsis; }

CELLULES :
.rbc-day-bg { transition: background-color 0.2s; }
.rbc-day-bg:hover { background-color: hsl(var(--accent)); }
.rbc-today { background-color: hsl(var(--accent) / 0.5); }
.rbc-off-range-bg { background-color: hsl(var(--muted) / 0.5); }

DARK MODE :
.dark .rbc-calendar { color: hsl(var(--foreground)); }
.dark .rbc-header { background-color: hsl(var(--muted)); }
.dark .rbc-day-bg { border-color: hsl(var(--border)); }
.dark .rbc-today { background-color: hsl(var(--accent) / 0.3); }

VUE AGENDA :
.rbc-agenda-view { font-size: 0.875rem; }
.rbc-agenda-date-cell { font-weight: 500; }
```

---

## Résumé Phase 11

| Fichier | Rôle |
|---------|------|
| `assignments/types.ts` | Types partagés + constantes visuelles |
| `assignments/useAssignmentForm.ts` | Hook formulaire avec chargement cascade |
| `assignments/useAssignmentSubmit.ts` | Hook soumission (create/update/bulk) |
| `assignments/steps/*.tsx` | 7 composants wizard |
| `assignments/StepProgressBar.tsx` | Barre de progression wizard |
| `assignments/NewAssignmentModal.tsx` | Modal création/édition |
| `assignments/AssignmentsCalendar.tsx` | Vue calendrier react-big-calendar |
| `assignments/AssignmentsList.tsx` | Vue liste groupée par date |
| `assignments/AssignmentCard.tsx` | Carte individuelle |
| `assignments/AssignmentFiltersBar.tsx` | Barre de filtres multi-critères |
| `api/teacher/assignments/route.ts` | GET filtré + POST create |
| `api/teacher/assignments/[id]/route.ts` | PUT + DELETE |
| `api/teacher/assignments/bulk/route.ts` | Création en masse |
| `teacher/assignments/page.tsx` | Page principale |
| `styles/calendar.css` | Styles react-big-calendar |

---

*Phase 11 terminée — Le système d'assignation permet au professeur de créer, gérer et suivre les assignations avec wizard multi-étapes et vues calendrier/liste.*
