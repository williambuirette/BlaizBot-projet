# Phase 14 — Student : Agenda

> Agenda élève avec vue calendrier, liste groupée par date, filtres multi-critères, et événements personnels.

---

## Vue d'ensemble

Cette phase implémente l'agenda élève avec :
- **Fusion de 3 sources** : assignations professeur + cours sans assignation + événements personnels
- **Vue calendrier** avec react-big-calendar localisé français
- **Vue liste** groupée par date avec indicateurs retard/aujourd'hui/à venir
- **Filtres** par type, professeur, matière, cours, statut, plage de dates
- **Événements personnels** créables/modifiables par l'élève

---

## Tâche 14.1 — Interface AgendaItem

### Contexte
L'agenda fusionne différentes sources (assignations, cours, événements perso). L'interface AgendaItem unifie ces données avec un type discriminant.

### Description
Définir l'interface AgendaItem dans la page ou un fichier types.ts.

### Prompt
```
Dans src/app/(dashboard)/student/agenda/page.tsx, définir :

export interface AgendaItem {
  id: string
  title: string
  description?: string | null
  startDate: string  // ISO
  endDate: string    // ISO (deadline)
  type: 'assignment' | 'personal' | 'course'
  source: 'teacher' | 'student'
  priority?: 'LOW' | 'MEDIUM' | 'HIGH'
  status?: 'NOT_STARTED' | 'IN_PROGRESS' | 'COMPLETED'
  targetType?: string
  course?: { 
    id: string
    title: string
    subject?: { name: string; color?: string } 
  }
  class?: { id: string; name: string; color?: string | null }
  color: string      // Couleur CSS pour le calendrier
  isEditable: boolean  // true si événement personnel
}

type ViewMode = 'calendar' | 'list'

interface AgendaFiltersState {
  type: 'all' | 'teacher' | 'personal'
  teacherIds: string[]
  subjectIds: string[]
  courseId: string | null
  status: 'all' | 'pending' | 'completed'
  dateRange: { start: Date; end: Date } | null
}
```

---

## Tâche 14.2 — AgendaStats

### Contexte
Les statistiques affichent 4 KPIs en haut de page : Total, En retard, Aujourd'hui, À venir. Chaque stat a son icône et couleur.

### Description
Créer AgendaStats.tsx : grille de 4 cartes stats.

### Prompt
```
Crée src/components/features/student/agenda/AgendaStats.tsx :

'use client'

PROPS :
stats: { total: number, overdue: number, today: number, upcoming: number, personal: number }

UI :
<div className="grid grid-cols-4 gap-4">

4 StatCard :
1. Total : BookOpen, text-blue-600, bg-blue-100
2. En retard : AlertTriangle, text-red-600, bg-red-100
3. Aujourd'hui : Clock, text-orange-600, bg-orange-100
4. À venir : CalendarDays, text-green-600, bg-green-100

COMPOSANT INTERNE StatCard :
Props : label, value, icon, color, bgColor

<Card>
  <CardContent className="p-4">
    <div className="flex items-center justify-between">
      <span className={cn('p-2 rounded-full', bgColor, color)}>{icon}</span>
      <span className="text-2xl font-bold">{value}</span>
    </div>
    <p className="text-xs text-muted-foreground mt-1">{label}</p>
  </CardContent>
</Card>
```

---

## Tâche 14.3 — StudentAgendaFilters

### Contexte
Les filtres permettent de filtrer par type (tout/prof/perso), professeur(s), matière(s), cours, statut, et plage de dates. Les options sont chargées via API.

### Description
Créer StudentAgendaFilters.tsx : barre de filtres collapsible avec multi-select.

### Prompt
```
Crée src/components/features/student/agenda/StudentAgendaFilters.tsx :

'use client'

EXPORT interface AgendaFiltersState {
  type: 'all' | 'teacher' | 'personal'
  teacherIds: string[]
  subjectIds: string[]
  courseId: string | null
  status: 'all' | 'pending' | 'completed'
  dateRange: { start: Date; end: Date } | null
}

PROPS : filters: AgendaFiltersState, onFiltersChange(filters)

ÉTATS :
subjects, courses, teachers : options chargées via API
datePopoverOpen, isCollapsed

EFFET : Au mount, charger /api/student/agenda/filter-options

COMPUTED :
- filteredSubjects : si teacherIds sélectionnés, filtrer par profs
- filteredCourses : filtrer par teacherIds ET subjectIds
- hasFilters : au moins un filtre actif
- activeFiltersCount : nombre de filtres actifs

UI Card :
Header cliquable (toggle collapse) :
- <Filter icon> "Filtres"
- Badge {activeFiltersCount} si > 0
- ChevronDown/Up

CardContent (collapsible) :
Grid de filtres avec gap-4 :

1. Select "Type" : Tout / Devoirs prof / Objectifs perso
2. MultiSelectDropdown "Professeur(s)" avec teachers
3. MultiSelectDropdown "Matière(s)" avec filteredSubjects
4. Select "Cours" avec filteredCourses (+ option "Tous")
5. Select "Statut" : Tous / À faire / Terminé
6. Popover "Période" avec 2 Calendar (from/to)

Button "Réinitialiser" si hasFilters

Utiliser MultiSelectDropdown de @/components/shared/filters
```

---

## Tâche 14.4 — StudentAgendaCalendar

### Contexte
La vue calendrier utilise react-big-calendar avec localisation française. Les événements sont affichés sur la date deadline (endDate) avec couleur selon type/priorité.

### Description
Créer StudentAgendaCalendar.tsx : calendrier avec style par événement.

### Prompt
```
Crée src/components/features/student/agenda/StudentAgendaCalendar.tsx :

'use client'

IMPORTS :
- Calendar, dateFnsLocalizer, Views, View de react-big-calendar
- format, parse, startOfWeek, getDay de date-fns
- fr de date-fns/locale
- 'react-big-calendar/lib/css/react-big-calendar.css'
- '@/styles/calendar.css'

LOCALIZER : dateFnsLocalizer avec weekStartsOn: 1

PROPS :
items: AgendaItem[], isLoading: boolean, onEventClick(item)
calendarView: View, onCalendarViewChange(view)
calendarDate: Date, onCalendarDateChange(date)
typeFilter?: 'all' | 'teacher' | 'personal'

INTERFACE CalendarEvent :
{ id, title, start: Date, end: Date, allDay: boolean, resource: AgendaItem }

MESSAGES français :
{ today: "Aujourd'hui", previous: 'Précédent', next: 'Suivant', month: 'Mois', week: 'Semaine', day: 'Jour', agenda: 'Agenda', noEventsInRange: 'Aucun événement' }

COMPUTED events :
items.map(item => ({
  id: item.id,
  title: `${item.type === 'personal' ? '🟢' : '📘'} ${item.title}`,
  start: new Date(item.endDate),  // Afficher sur deadline uniquement
  end: new Date(item.endDate),
  allDay: true,
  resource: item
}))

CALLBACK eventStyleGetter :
Retourner style avec backgroundColor: event.resource.color

UI :
Skeleton si isLoading

Card avec :
- CardHeader : "Vue Calendrier" + badges count (Prof, Perso)
- CardContent : Calendar h-[780px] avec toutes les props

Props Calendar :
localizer, events, view, onView, date, onNavigate,
views: [Views.MONTH, Views.WEEK, Views.DAY, Views.AGENDA],
messages, culture: "fr", onSelectEvent: handleSelectEvent,
eventPropGetter: eventStyleGetter, popup
```

---

## Tâche 14.5 — StudentAgendaList

### Contexte
La vue liste groupe les événements par date deadline avec indicateurs visuels : en retard (rouge), aujourd'hui (orange), à venir (normal).

### Description
Créer StudentAgendaList.tsx : liste groupée par date.

### Prompt
```
Crée src/components/features/student/agenda/StudentAgendaList.tsx :

'use client'

PROPS : items: AgendaItem[], isLoading: boolean, onEventClick(item)

CONSTANTES :
priorityLabels = { HIGH: { label: 'Haute', color: 'bg-red-100 text-red-700' }, ... }
statusLabels = { NOT_STARTED: 'À faire', IN_PROGRESS: 'En cours', COMPLETED: 'Terminé' }

COMPUTED groupedByDate :
Grouper items par format(endDate, 'yyyy-MM-dd'), trier les clés

UI vide : Skeleton si loading, message si items.length === 0

UI liste :
<div className="space-y-4">
Pour chaque [dateKey, dateItems] :
  <DateGroup date={dateKey} items={dateItems} onEventClick />
</div>

COMPOSANT DateGroup :
Props : date: string, items: AgendaItem[], onEventClick

COMPUTED :
- parsedDate = parseISO(date)
- isOverdue = isPast(parsedDate) && !isToday(parsedDate)
- formatDateLabel() : "Aujourd'hui", "Demain", ou format EEEE d MMMM

UI Card avec border-red si isOverdue :
- CardHeader : dateLabel + count + icône (AlertTriangle/Clock/CalendarDays)
- CardContent : liste d'items avec :
  - Emoji type (📘 assignment, 🟢 personal, 📚 course)
  - Titre
  - Badge priorité (si assignment)
  - Badge statut
  - Badge cours (si disponible)
  - Si isEditable : DropdownMenu avec Edit
```

---

## Tâche 14.6 — NewPersonalEventModal

### Contexte
L'élève peut créer/modifier/supprimer des événements personnels (objectifs). Le modal gère la création et l'édition selon la présence d'editingEvent.

### Description
Créer NewPersonalEventModal.tsx : dialog création/édition événement.

### Prompt
```
Crée src/components/features/student/agenda/NewPersonalEventModal.tsx :

'use client'

PROPS :
open: boolean, onOpenChange(open), onSuccess()
editingEvent?: AgendaItem | null

ÉTATS :
isSubmitting, isDeleting: boolean
title, description, startDate, startTime, endDate, endTime: string

COMPUTED isEditing = !!editingEvent

EFFET : Si editingEvent && open → pré-remplir les champs
        Si !open → reset tous les champs

HANDLER handleSubmit() :
1. Valider title, startDate, endDate requis
2. Construire startDateTime et endDateTime
3. URL = isEditing ? `/api/student/agenda/events/${editingEvent.id}` : '/api/student/agenda/events'
4. Method = isEditing ? 'PUT' : 'POST'
5. Body : { title, description, startDate: ISO, endDate: ISO }
6. Toast success, onSuccess()

HANDLER handleDelete() :
Si !editingEvent → return
DELETE /api/student/agenda/events/${id}
Toast "Objectif supprimé", onSuccess()

UI Dialog :
- DialogTitle : "Modifier l'objectif" ou "Nouvel objectif personnel"
- Formulaire :
  - Input "Titre *"
  - Textarea "Description" (optionnel)
  - Grid 2 cols : Input date début + Input time début
  - Grid 2 cols : Input date fin + Input time fin
- DialogFooter :
  - Si isEditing : Button Trash2 "Supprimer" (text-red) avec loading
  - Button "Annuler"
  - Button "Créer" ou "Modifier" avec loading
```

---

## Tâche 14.7 — Barrel export

### Contexte
Le dossier agenda exporte tous les composants et types via un fichier index.ts.

### Description
Créer index.ts avec tous les exports.

### Prompt
```
Crée src/components/features/student/agenda/index.ts :

export { AgendaStats } from './AgendaStats'
export { StudentAgendaFilters, type AgendaFiltersState } from './StudentAgendaFilters'
export { StudentAgendaCalendar } from './StudentAgendaCalendar'
export { StudentAgendaList } from './StudentAgendaList'
export { NewPersonalEventModal } from './NewPersonalEventModal'
```

---

## Tâche 14.8 — API GET /api/student/agenda

### Contexte
L'API fusionne 3 sources : assignations ciblées sur l'élève/classe, cours publiés sans assignation, événements personnels. Elle calcule les stats et applique les filtres.

### Description
Créer route.ts avec le GET fusionné.

### Prompt
```
Crée src/app/api/student/agenda/route.ts :

AUTH : session, role STUDENT

QUERY PARAMS :
type ('all'|'teacher'|'personal'), teacherIds (CSV), subjectIds (CSV), courseId, status ('all'|'pending'|'completed'), startDate, endDate

CONSTANTES :
PRIORITY_COLORS = { HIGH: '#ef4444', MEDIUM: '#f97316', LOW: '#22c55e' }
PERSONAL_COLOR = '#10b981'
COURSE_COLOR = '#6366f1'

LOGIQUE :
1. Récupérer StudentProfile (pour classId)

2. Si type = 'all' ou 'teacher' :
   a) Récupérer CourseAssignment avec :
      - OR: [{ studentId: userId }, { classId }, { targetType: 'CLASS', classId }]
      - Appliquer filtres subjectIds, courseId, teacherIds, dateRange
      - Include: Course.Subject, Class, StudentProgress (where studentId)
   
   b) Pour chaque assignment :
      - Récupérer status depuis StudentProgress[0] ou 'NOT_STARTED'
      - Appliquer filtre status (pending/completed)
      - Construire AgendaItem avec color depuis Class.color ou PRIORITY_COLORS

   c) Récupérer cours publiés sans assignation :
      - Profs de la classe
      - isDraft: false, id not in assignedCourseIds
      - Pour chaque : status selon Progression.percentage
      - AgendaItem avec type: 'course', color: COURSE_COLOR

3. Si type = 'all' ou 'personal' :
   - Récupérer CalendarEvent (ownerId: userId, isTeacherEvent: false)
   - Appliquer filtre dateRange
   - AgendaItem avec type: 'personal', isEditable: true

4. Trier items par startDate

5. Calculer stats :
   - overdue : assignments non completed avec endDate < today
   - today : assignments avec endDate aujourd'hui
   - upcoming : assignments/courses avec endDate > today ou cours sans deadline
   - personal : count type === 'personal'

RESPONSE : { success: true, data: items[], stats }
```

---

## Tâche 14.9 — API /api/student/agenda/filter-options

### Contexte
L'API retourne les options de filtrage : professeurs de la classe, leurs matières et cours.

### Description
Créer route.ts dans filter-options/.

### Prompt
```
Crée src/app/api/student/agenda/filter-options/route.ts :

AUTH : session, role STUDENT

LOGIQUE :
1. Récupérer StudentProfile avec classId
2. Récupérer Class avec TeacherProfile.User et Subject
3. Récupérer tous les cours des profs de la classe

RESPONSE :
{
  success: true,
  data: {
    teachers: [{ id, firstName, lastName, subjectIds: [], courseIds: [] }],
    subjects: [{ id, name, teacherIds: [] }],
    courses: [{ id, title, subjectId, teacherId }]
  }
}
```

---

## Tâche 14.10 — API CRUD /api/student/agenda/events

### Contexte
L'élève peut créer, modifier et supprimer ses événements personnels (CalendarEvent avec isTeacherEvent: false).

### Description
Créer route.ts dans events/ avec POST, et [id]/route.ts avec PUT/DELETE.

### Prompt
```
Crée src/app/api/student/agenda/events/route.ts :

--- POST ---
AUTH : session, role STUDENT

BODY : { title: string, description?: string, startDate: ISO, endDate: ISO }

CREATE :
prisma.calendarEvent.create({
  data: {
    id: randomUUID(),
    title, description,
    startDate: new Date(startDate),
    endDate: new Date(endDate),
    ownerId: userId,
    isTeacherEvent: false
  }
})

RESPONSE : { success: true, data: event }

---

Crée src/app/api/student/agenda/events/[id]/route.ts :

--- PUT ---
AUTH : session, vérifier ownerId === userId

BODY : { title?, description?, startDate?, endDate? }

UPDATE : prisma.calendarEvent.update avec champs fournis

RESPONSE : { success: true, data: event }

--- DELETE ---
AUTH : session, vérifier ownerId === userId

DELETE : prisma.calendarEvent.delete({ where: { id } })

RESPONSE : { success: true }
```

---

## Tâche 14.11 — Page student/agenda

### Contexte
La page orchestre les vues calendrier/liste, les filtres, le modal d'événement, et le chargement des données via SWR ou fetch.

### Description
Créer page.tsx avec tous les composants et la logique.

### Prompt
```
Crée src/app/(dashboard)/student/agenda/page.tsx :

'use client'

IMPORTS :
- AgendaStats, StudentAgendaFilters, StudentAgendaCalendar, StudentAgendaList, NewPersonalEventModal de @/components/features/student/agenda
- AgendaFiltersState
- View, Views de react-big-calendar

ÉTATS :
view: ViewMode = 'calendar'
items: AgendaItem[] = []
stats: { total: 0, overdue: 0, today: 0, upcoming: 0, personal: 0 }
filters: AgendaFiltersState = initialFilters
isLoading: boolean = true
isModalOpen: boolean = false
calendarView: View = Views.MONTH
calendarDate: Date = new Date()
editingEvent: AgendaItem | null = null

CONSTANTE initialFilters :
{ type: 'all', teacherIds: [], subjectIds: [], courseId: null, status: 'all', dateRange: null }

CALLBACK fetchAgenda() :
1. Construire URLSearchParams depuis filters
2. GET /api/student/agenda?${params}
3. setItems(json.data), setStats(json.stats)

EFFET : fetchAgenda() quand filters change

HANDLER handleEventClick(item) :
- Si item.isEditable → setEditingEvent(item), setIsModalOpen(true)
- Sinon → TODO: afficher détails read-only

HANDLER handleModalClose() :
- setIsModalOpen(false), setEditingEvent(null)

UI :
Header :
- Titre "Mon Agenda" + description
- Toggle vue (Calendar/List icons)
- Button RefreshCcw (refresh)
- Button "Nouvel objectif" (+) → setIsModalOpen(true)

AgendaStats stats={stats}

StudentAgendaFilters filters={filters} onFiltersChange={setFilters}

Contenu conditionnel :
- Si view === 'calendar' → StudentAgendaCalendar
- Si view === 'list' → StudentAgendaList

NewPersonalEventModal open, onOpenChange: handleModalClose, onSuccess, editingEvent
```

---

## Résumé Phase 14

| Fichier | Rôle |
|---------|------|
| `agenda/AgendaStats.tsx` | Grille 4 KPIs (total, retard, today, upcoming) |
| `agenda/StudentAgendaFilters.tsx` | Filtres collapsibles multi-critères |
| `agenda/StudentAgendaCalendar.tsx` | Vue calendrier react-big-calendar |
| `agenda/StudentAgendaList.tsx` | Vue liste groupée par date |
| `agenda/NewPersonalEventModal.tsx` | Modal CRUD événement personnel |
| `agenda/index.ts` | Barrel export |
| `api/student/agenda/route.ts` | GET fusionné (assignments + courses + events) |
| `api/student/agenda/filter-options/route.ts` | Options filtres (profs, matières, cours) |
| `api/student/agenda/events/route.ts` | POST événement |
| `api/student/agenda/events/[id]/route.ts` | PUT/DELETE événement |
| `student/agenda/page.tsx` | Page principale |

### Sources de données fusionnées
| Type | Source | isEditable |
|------|--------|------------|
| `assignment` | CourseAssignment (ciblé élève/classe) | false |
| `course` | Course publié sans assignation | false |
| `personal` | CalendarEvent (ownerId = élève) | true |

---

*Phase 14 terminée — L'agenda élève fusionne devoirs, cours et objectifs personnels avec filtrage avancé.*
