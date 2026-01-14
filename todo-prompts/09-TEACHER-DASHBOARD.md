# Phase 09 — Teacher : Dashboard

> Dashboard professeur avec KPIs, Centre de Pilotage et alertes élèves

---

## Vue d'ensemble

Le dashboard professeur est une **Server Component** avec un **Centre de Pilotage** client-side :

| Composant | Type | Rôle |
|-----------|------|------|
| Page | Server | Charge TeacherProfile + données initiales |
| TeacherStatsCard | Server | Cards cliquables (classes, cours, messages) |
| ControlCenterDashboard | Client | Filtres + KPIs + Panels avec SWR |
| DashboardFilterBar | Client | Filtres classe/matière/cours/période |
| KPIGrid | Client | 4 KPIs avec status coloré |
| CoursesPerformancePanel | Client | Top/Flop cours |
| StudentsAlertsPanel | Client | Liste élèves à surveiller |

---

## Tâches

### 9.1 Types Dashboard

#### Contexte
Les types définissent les structures pour les filtres, KPIs, alertes et performances. Ils sont centralisés dans un fichier dédié.

#### Description
Créer `src/types/dashboard-filters.ts` avec tous les types du Centre de Pilotage.

#### Prompt
```
Crée src/types/dashboard-filters.ts :

1. Types Filtres :
   - DashboardPeriod = 'week' | 'month' | 'trimester' | 'year' | 'all'
   - AlertLevel = 'all' | 'critical' | 'warning' | 'good'
   - DashboardFilters interface :
     - classId, subjectId, courseId, chapterId: string | null
     - period: DashboardPeriod
     - alertLevel: AlertLevel
     - studentSearch: string
   - DEFAULT_DASHBOARD_FILTERS constant (period: 'month', alertLevel: 'all')

2. Types KPIs :
   - DashboardKPIs interface :
     - averageScore, successRate, progressionRate, engagementRate: number (0-100)
     - activeAlerts: number
     - aiAverageScore: number
   - TrendDirection = 'up' | 'down' | 'stable'
   - KPITrend interface : { value, trend, trendValue }

3. Types Performance Cours :
   - CoursePerformance interface :
     - courseId, courseTitle: string
     - chapterTitle?: string
     - averageScore, studentCount: number
     - trend: TrendDirection
     - weakPoint?: string
   - CoursesPerformanceResponse : { top: CoursePerformance[], bottom: CoursePerformance[] }

4. Types Alertes Élèves :
   - StudentAlert interface :
     - studentId, firstName, lastName, className: string
     - averageScore: number
     - alertLevel: 'critical' | 'warning' | 'good'
     - lastActivity: Date | null
     - weakCourse?: string

5. Options UI (export const) :
   - PERIOD_OPTIONS: { value: DashboardPeriod, label: string }[]
   - ALERT_LEVEL_OPTIONS: { value: AlertLevel, label: string }[]
```

---

### 9.2 Hook useDashboardFilters

#### Contexte
Le hook gère l'état des filtres avec cascade (changer matière reset cours), le comptage des filtres actifs, et la construction de la query string pour les APIs.

#### Description
Créer `src/hooks/useDashboardFilters.ts` avec gestion des filtres et query string.

#### Prompt
```
Crée src/hooks/useDashboardFilters.ts :

1. 'use client'

2. Imports : useState, useCallback, useMemo, types depuis dashboard-filters

3. Export types auxiliaires :
   - FilterOption : { id: string, name: string }
   - CourseFilterOption extends FilterOption : + subjectId: string

4. Hook useDashboardFilters(initialFilters?: Partial<DashboardFilters>) :

5. État : filters avec useState initialisé depuis DEFAULT_DASHBOARD_FILTERS + initialFilters

6. updateFilter<K>(key: K, value) :
   - setFilters avec spread
   - Cascade : si key === 'subjectId' → reset courseId et chapterId à null
   - Cascade : si key === 'courseId' → reset chapterId à null

7. resetFilters() : remet DEFAULT_DASHBOARD_FILTERS

8. activeFiltersCount (useMemo) :
   - Compter : classId, subjectId, courseId, chapterId si non null
   - period !== 'month' compte +1
   - alertLevel !== 'all' compte +1
   - studentSearch non vide compte +1

9. buildQueryString (useCallback) :
   - URLSearchParams()
   - Ajouter chaque filtre non null
   - Retourner params.toString()

10. Return : { filters, setFilters, updateFilter, resetFilters, activeFiltersCount, buildQueryString }
```

---

### 9.3 API /api/teacher/stats

#### Contexte
Cette API simple retourne les compteurs de base (classes, cours, messages non lus) pour les stats cards du header du dashboard.

#### Description
Créer `src/app/api/teacher/stats/route.ts`.

#### Prompt
```
Crée src/app/api/teacher/stats/route.ts :

1. Imports : NextResponse, auth, prisma

2. GET handler :
   - Vérifier session + role TEACHER (sinon 401/403)
   - Récupérer TeacherProfile avec include :
     - Class: { select: { id: true } }
     - Course: { select: { id: true } }

3. Si pas de TeacherProfile → 404

4. Compter messages non lus :
   - Pour l'instant retourner 0 (à implémenter si besoin)

5. Retourner JSON :
   - classesCount: teacherProfile.Class.length
   - coursesCount: teacherProfile.Course.length
   - unreadMessages: 0
```

---

### 9.4 Composant TeacherStatsCard

#### Contexte
Une card cliquable avec icône, valeur et titre. Utilisée pour les stats rapides (classes, cours, messages).

#### Description
Créer `src/components/features/teacher/TeacherStatsCard.tsx`.

#### Prompt
```
Crée src/components/features/teacher/TeacherStatsCard.tsx :

1. Pas de 'use client' (Server Component)

2. Imports :
   - Link depuis next/link
   - Card, CardContent depuis @/components/ui/card
   - LucideIcon depuis lucide-react
   - cn depuis @/lib/utils

3. Props interface TeacherStatsCardProps :
   - title: string
   - value: number
   - icon: LucideIcon
   - href?: string
   - iconColor?: string (défaut: 'text-primary')
   - className?: string

4. Render :
   - Card avec transition-shadow
   - Si href : hover:shadow-md cursor-pointer
   - CardContent flex items-center gap-4 p-6
   - Div pour icône : rounded-lg bg-muted p-3 + iconColor
   - Icon h-6 w-6
   - Div info : value (text-2xl font-bold) + title (text-sm text-muted-foreground)

5. Si href fourni, wrapper avec <Link href={href}>
```

---

### 9.5 Composant KPICard

#### Contexte
Une card KPI avec bordure colorée selon le status (good/warning/critical), affichant valeur, unité et éventuellement tendance.

#### Description
Créer `src/components/features/dashboard/KPICard.tsx`.

#### Prompt
```
Crée src/components/features/dashboard/KPICard.tsx :

1. Imports : Card, CardContent, LucideIcon, cn, TrendDirection

2. Props interface KPICardProps :
   - title: string
   - value: number
   - unit?: string (défaut: '%')
   - trend?: TrendDirection
   - trendValue?: number
   - icon?: LucideIcon
   - status?: 'good' | 'warning' | 'critical' | 'neutral' (défaut: 'neutral')
   - inverseTrend?: boolean (pour alertes où down = bon)

3. Mapping statusColors :
   - good: 'border-l-green-500'
   - warning: 'border-l-orange-500'
   - critical: 'border-l-red-500'
   - neutral: 'border-l-blue-500'

4. Render Card avec cn('border-l-4', statusColors[status]) :
   - CardContent pt-4
   - Flex justify-between
   - Gauche : title (text-sm text-muted-foreground) + value (text-2xl font-bold) + unit
   - Si trend et trendValue : afficher flèche + valeur colorée
   - Droite : icône dans bg-muted rounded-md si fournie
```

---

### 9.6 Composant KPIGrid

#### Contexte
Grille de 4 KPIs : Moyenne Générale, Taux de Réussite, Progression, Alertes Actives. Affiche Skeleton si loading.

#### Description
Créer `src/components/features/dashboard/KPIGrid.tsx`.

#### Prompt
```
Crée src/components/features/dashboard/KPIGrid.tsx :

1. 'use client'

2. Imports :
   - Target, CheckCircle, TrendingUp, AlertTriangle depuis lucide-react
   - KPICard
   - Skeleton depuis @/components/ui/skeleton
   - DashboardKPIs type

3. Props : kpis: DashboardKPIs | null, isLoading?: boolean

4. Fonctions helpers :
   - getScoreStatus(score) : >= 70 → 'good', >= 50 → 'warning', sinon 'critical'
   - getAlertStatus(count) : === 0 → 'good', <= 3 → 'warning', sinon 'critical'

5. Si isLoading : grille de 4 Skeleton h-[100px]

6. Si !kpis : message "Aucune donnée disponible"

7. Grille md:grid-cols-2 lg:grid-cols-4 :
   - Moyenne Générale (Target) → kpis.averageScore
   - Taux de Réussite (CheckCircle) → kpis.successRate
   - Progression (TrendingUp) → kpis.progressionRate
   - Alertes Actives (AlertTriangle) → kpis.activeAlerts (inverseTrend=true)
```

---

### 9.7 Composant DashboardFilterBar

#### Contexte
Barre de filtres avec 4 Select (Classe, Matière, Cours, Période) et un bouton Reset. Les cours sont filtrés par matière sélectionnée.

#### Description
Créer `src/components/features/dashboard/DashboardFilterBar.tsx`.

#### Prompt
```
Crée src/components/features/dashboard/DashboardFilterBar.tsx :

1. 'use client'

2. Imports :
   - useMemo
   - Select, SelectContent, SelectItem, SelectTrigger, SelectValue
   - Button, Badge
   - RotateCcw, Filter depuis lucide-react
   - Types DashboardFilters, DashboardPeriod, PERIOD_OPTIONS
   - Types FilterOption, CourseFilterOption

3. Props interface DashboardFilterBarProps :
   - filters: DashboardFilters
   - onFilterChange: <K>(key: K, value) => void
   - onReset: () => void
   - activeFiltersCount: number
   - classes, subjects: FilterOption[]
   - courses: CourseFilterOption[]

4. filteredCourses (useMemo) :
   - Si filters.subjectId null → tous les courses
   - Sinon filtrer par subjectId

5. Render flex flex-wrap gap-3 p-4 bg-muted/50 rounded-lg border :
   - Label "Filtres" avec icône + Badge si activeFiltersCount > 0
   - Select Classe (value 'all' pour toutes)
   - Select Matière
   - Select Cours (utilise filteredCourses)
   - Select Période (utilise PERIOD_OPTIONS)
   - Bouton Reset si activeFiltersCount > 0
```

---

### 9.8 Composant CoursesPerformancePanel

#### Contexte
Panel affichant les cours "Top" (bien compris) et "Bottom" (à améliorer) avec score et nombre d'élèves.

#### Description
Créer `src/components/features/dashboard/CoursesPerformancePanel.tsx`.

#### Prompt
```
Crée src/components/features/dashboard/CoursesPerformancePanel.tsx :

1. 'use client'

2. Imports : Card components, Badge, Skeleton, TrendingUp, TrendingDown, Users
   - CoursePerformance type, cn

3. Props : top: CoursePerformance[], bottom: CoursePerformance[], isLoading?: boolean

4. Sous-composant CourseItem({ course, variant: 'top' | 'bottom' }) :
   - Flex items-center justify-between py-2 border-b
   - Icône TrendingUp (green) si top, TrendingDown (orange) si bottom
   - courseTitle (font-medium truncate)
   - weakPoint si présent (text-xs text-muted-foreground)
   - Droite : icône Users + studentCount + Badge avec score coloré

5. Si isLoading : Card avec Skeleton

6. Render Card :
   - CardHeader : "📈 Performance des Cours"
   - Si !hasData : message "Aucune donnée"
   - Section Top : titre "✅ Mieux compris" + map CourseItem variant="top"
   - Section Bottom : titre "⚠️ À améliorer" + map CourseItem variant="bottom"
```

---

### 9.9 Composant StudentsAlertsPanel

#### Contexte
Panel listant les élèves à surveiller avec avatar, initiales, score, niveau d'alerte et bouton vers leur fiche.

#### Description
Créer `src/components/features/dashboard/StudentsAlertsPanel.tsx`.

#### Prompt
```
Crée src/components/features/dashboard/StudentsAlertsPanel.tsx :

1. 'use client'

2. Imports : Card components, Badge, Button, Skeleton, Avatar, AvatarFallback
   - ExternalLink depuis lucide-react
   - StudentAlert type, cn

3. Props : alerts: StudentAlert[], isLoading?: boolean, onStudentClick?: (studentId) => void

4. Sous-composant StudentAlertItem({ alert, onStudentClick }) :
   - Initials = firstName[0] + lastName[0]
   - Avatar avec AvatarFallback (initials)
   - Emoji selon alertLevel (🔴 critical, 🟠 warning, 🟢 good)
   - Nom complet + className
   - Ligne info : "Moy: X%" + "Faible: {weakCourse}" si présent
   - Badge score avec couleur selon alertLevel
   - Bouton ExternalLink si onStudentClick

5. Si isLoading : Skeleton

6. Si alerts vide : message "Aucune alerte"

7. Card avec titre "🚨 Élèves à Surveiller" et liste StudentAlertItem
```

---

### 9.10 Composant ControlCenterDashboard

#### Contexte
Le composant orchestrateur qui utilise SWR pour charger les KPIs, performances et alertes via les APIs. Il gère le mounted state pour éviter les erreurs d'hydratation Radix UI.

#### Description
Créer `src/components/features/dashboard/ControlCenterDashboard.tsx`.

#### Prompt
```
Crée src/components/features/dashboard/ControlCenterDashboard.tsx :

1. 'use client'

2. Imports :
   - useCallback, useState, useEffect
   - useSWR
   - useRouter depuis next/navigation
   - Tous les composants : DashboardFilterBar, KPIGrid, CoursesPerformancePanel, StudentsAlertsPanel
   - useDashboardFilters hook + types
   - Types DashboardKPIs, CoursesPerformanceResponse, StudentAlert
   - Loader2 depuis lucide-react

3. Props interface :
   - classes: FilterOption[]
   - subjects: FilterOption[]
   - courses: CourseFilterOption[]

4. Fetcher SWR : (url) => fetch(url).then(res => res.json())

5. State mounted (useState false) + useEffect → setMounted(true)
   - Guard pour hydratation Radix

6. Utiliser useDashboardFilters() pour filters, updateFilter, resetFilters, etc.

7. queryString = buildQueryString()
   - apiBase = '/api/teacher/dashboard'

8. SWR calls :
   - kpisResponse = useSWR(`${apiBase}/kpis?${queryString}`, fetcher, { refreshInterval: 60000 })
   - coursesResponse = useSWR(`${apiBase}/courses-performance?${queryString}`, fetcher)
   - alertsResponse = useSWR(`${apiBase}/students-alerts?${queryString}&limit=8`, fetcher)

9. handleStudentClick(studentId) → router.push(`/teacher/students/${studentId}`)

10. Si !mounted : Loader2 spinner

11. Render :
    - DashboardFilterBar avec tous les props
    - KPIGrid avec kpisResponse.data
    - Grille lg:grid-cols-2 :
      - CoursesPerformancePanel
      - StudentsAlertsPanel avec onStudentClick
```

---

### 9.11 Page Teacher Dashboard

#### Contexte
La page Server Component charge les données initiales (TeacherProfile avec classes, cours, matières) et les passe au Centre de Pilotage client-side.

#### Description
Créer `src/app/(dashboard)/teacher/page.tsx`.

#### Prompt
```
Crée src/app/(dashboard)/teacher/page.tsx :

1. Pas de 'use client' (Server Component)

2. Imports :
   - Card, CardContent depuis @/components/ui/card
   - GraduationCap, BookOpen, Mail depuis lucide-react
   - auth, prisma
   - redirect depuis next/navigation
   - TeacherStatsCard
   - ControlCenterDashboard

3. Fonction async getTeacherData(userId) :
   - prisma.teacherProfile.findUnique where userId
   - Include :
     - Class: { select: { id, name } }
     - Course: { select: { id, title, subjectId }, where: { isFolder: false } }
     - Subject: { select: { id, name } }
     - User: { select: { firstName } }
   - Si pas de profile → return null
   - Retourner objet avec :
     - firstName
     - classesCount, coursesCount, unreadMessages: 0
     - classes, subjects, courses (mappés pour ControlCenter)

4. Page async TeacherDashboardPage() :
   - const session = await auth()
   - Si pas session ou pas TEACHER → redirect('/login')
   - const data = await getTeacherData(session.user.id)
   - Si pas data → message "Profil professeur non trouvé"

5. Render :
   - Card welcome gradient-to-r from-green-500 to-teal-600 text-white
   - "Bonjour, {firstName} 👋" + "Bienvenue sur votre espace professeur"
   - Grille 3 colonnes avec TeacherStatsCard :
     - "Mes classes" (GraduationCap, blue, href /teacher/classes)
     - "Mes cours" (BookOpen, green, href /teacher/courses)
     - "Messages" (Mail, purple, href /teacher/messages)
   - Section "📊 Centre de Pilotage"
   - ControlCenterDashboard avec classes, subjects, courses
```

---

## Checklist de validation

- [ ] Types dashboard-filters.ts créé avec tous les types
- [ ] Hook useDashboardFilters gère cascade et query string
- [ ] API /api/teacher/stats retourne compteurs
- [ ] TeacherStatsCard cliquable avec icône colorée
- [ ] KPICard avec bordure colorée selon status
- [ ] KPIGrid affiche 4 KPIs avec Skeleton loading
- [ ] DashboardFilterBar filtre cours par matière
- [ ] CoursesPerformancePanel affiche Top/Flop
- [ ] StudentsAlertsPanel avec avatars et navigation
- [ ] ControlCenterDashboard utilise SWR avec refresh 60s
- [ ] Page Server Component avec welcome card gradient
- [ ] Centre de Pilotage reçoit données initiales

---

## Liens

- [Phase précédente : 08-ADMIN-CLASSES-SUBJECTS.md](08-ADMIN-CLASSES-SUBJECTS.md)
- [Phase suivante : 10-TEACHER-CLASSES.md](10-TEACHER-CLASSES.md)
