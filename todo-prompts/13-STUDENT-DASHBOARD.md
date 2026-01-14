# Phase 13 — Student : Dashboard

> Dashboard élève avec KPIs de progression, score moyen, heures passées, et accès rapide aux principales fonctionnalités.

---

## Vue d'ensemble

Cette phase implémente le dashboard élève avec :
- **Server Component** pour le chargement des données (pas d'API séparée)
- **Welcome Card** gradient avec prénom et classe
- **Stats Grid** avec 4 KPIs cliquables (cours, progression, score, heures)
- **Quick Access** vers messagerie, agenda, cours, assistant IA
- **Badge non-lus** sur la messagerie

---

## Tâche 13.1 — StudentStatsCard

### Contexte
Chaque KPI est affiché dans une carte réutilisable avec icône, valeur, titre, et lien optionnel. Le composant supporte les couleurs personnalisées et l'effet hover.

### Description
Créer StudentStatsCard.tsx : carte de statistique cliquable avec icône colorée.

### Prompt
```
Crée src/components/features/student/StudentStatsCard.tsx :

'use client'

PROPS :
title: string
value: string | number
icon: LucideIcon
href?: string  // Lien optionnel
iconColor?: string = 'text-blue-500'
iconBg?: string = 'bg-blue-50'
className?: string

LOGIQUE :
- Construire le contenu de la carte
- Si href → wrapper dans <Link>
- Sinon → retourner la carte seule

UI Card :
- Classes conditionnelles :
  - 'transition-all duration-200 h-full'
  - Si href : 'hover:shadow-md hover:scale-[1.02] cursor-pointer'
  
CardContent p-4 h-full flex items-center :
- Flex items-center gap-3 :
  - Div icône : p-2 rounded-lg {iconBg} shrink-0
    - Icon : h-5 w-5 {iconColor}
  - Div min-w-0 :
    - <p> text-2xl font-bold : {value}
    - <p> text-sm text-muted-foreground : {title}

Exporter le composant.
```

---

## Tâche 13.2 — StudentStatsGrid

### Contexte
La grille affiche 4 KPIs dans une grid responsive (2 colonnes mobile, 4 desktop). Chaque carte a son icône et couleur spécifiques, et certaines sont cliquables.

### Description
Créer StudentStatsGrid.tsx : grille des 4 stats avec calcul du pourcentage de progression.

### Prompt
```
Crée src/components/features/student/StudentStatsGrid.tsx :

'use client'

Import : BookOpen, Target, Trophy, Clock de lucide-react
Import : StudentStatsCard

PROPS :
stats: {
  coursesCompleted: number
  totalCourses: number
  averageScore: number
  hoursSpent: number
}

COMPUTED :
progressPercent = totalCourses > 0 
  ? Math.round((coursesCompleted / totalCourses) * 100) 
  : 0

UI :
<div className="grid grid-cols-2 md:grid-cols-4 gap-4">

4 StudentStatsCard :

1. Cours terminés :
   - title: "Cours terminés"
   - value: `${coursesCompleted}/${totalCourses}`
   - icon: BookOpen
   - href: "/student/courses"
   - iconColor: "text-blue-500", iconBg: "bg-blue-50"

2. Progression :
   - title: "Progression"
   - value: `${progressPercent}%`
   - icon: Target
   - href: "/student/courses"
   - iconColor: "text-green-500", iconBg: "bg-green-50"

3. Score moyen :
   - title: "Score moyen"
   - value: `${averageScore}%`
   - icon: Trophy
   - href: "/student/revisions"
   - iconColor: "text-amber-500", iconBg: "bg-amber-50"

4. Heures passées :
   - title: "Heures passées"
   - value: `${hoursSpent}h`
   - icon: Clock
   - iconColor: "text-purple-500", iconBg: "bg-purple-50"
   - (pas de href - informatif uniquement)

</div>
```

---

## Tâche 13.3 — QuickAccessCard

### Contexte
La carte d'accès rapide affiche 4 liens vers les principales fonctionnalités : messagerie (avec badge non-lus), agenda, cours, assistant IA. Chaque lien a une icône colorée avec effet hover.

### Description
Créer QuickAccessCard.tsx dans components/dashboard/ : carte avec grille de liens rapides.

### Prompt
```
Crée src/components/dashboard/QuickAccessCard.tsx :

PROPS :
unreadMessages?: number = 0

CONSTANTE quickLinks :
[
  { title: 'Messagerie', href: '/student/messages', icon: MessageSquare, color: 'text-blue-500', bg: 'bg-blue-50', badge: unreadMessages > 0 ? unreadMessages : null },
  { title: 'Agenda', href: '/student/agenda', icon: Calendar, color: 'text-green-500', bg: 'bg-green-50' },
  { title: 'Mes Cours', href: '/student/courses', icon: BookOpen, color: 'text-purple-500', bg: 'bg-purple-50' },
  { title: 'Assistant IA', href: '/student/ai', icon: Bot, color: 'text-amber-500', bg: 'bg-amber-50' }
]

UI Card :
CardHeader :
- CardTitle : "Accès rapide"

CardContent :
<div className="grid grid-cols-2 md:grid-cols-4 gap-4">

Pour chaque link :
<Link href={link.href} className="group relative flex flex-col items-center gap-2 p-4 rounded-lg border hover:border-primary transition-colors">
  - Div icône : p-3 rounded-lg {bg} group-hover:scale-110 transition-transform
    - link.icon : h-6 w-6 {color}
  - <span> text-sm font-medium text-center : {title}
  - Si badge :
    <Badge variant="destructive" className="absolute -top-1 -right-1 h-5 w-5 flex items-center justify-center p-0 text-xs">
      {badge}
    </Badge>
</Link>

</div>
```

---

## Tâche 13.4 — Fonction getStudentDashboardData

### Contexte
La fonction charge les données du dashboard directement via Prisma (Server Component pattern). Elle récupère le profil élève, les progressions, les scores, et les messages non-lus.

### Description
Implémenter getStudentDashboardData() dans le fichier page.tsx (fonction locale au module).

### Prompt
```
Dans src/app/(dashboard)/student/page.tsx, créer la fonction :

async function getStudentDashboardData(userId: string) {

1. Récupérer le profil élève :
studentProfile = prisma.studentProfile.findUnique({
  where: { userId }
  include: {
    User: { select: { firstName: true } }
    Class: { select: { id: true, name: true } }
  }
})
Si !studentProfile → return null

2. Récupérer les progressions :
progressions = prisma.studentProgress.findMany({
  where: { studentId: userId }
  select: { status: true, score: true, timeSpent: true }
})

3. Récupérer les scores (moyenne continue) :
scores = prisma.studentScore.findMany({
  where: { studentId: userId }
  select: { continuousScore: true }
})

4. Compter les messages non lus :
unreadMessages = prisma.messageReadStatus.count({
  where: { userId, readAt: null }
})

5. Calculer les stats :
totalCourses = progressions.length
completedCourses = progressions.filter(p => p.status === 'COMPLETED').length
avgScore = scores.length > 0 
  ? Math.round(scores.reduce((sum, s) => sum + s.continuousScore, 0) / scores.length)
  : 0
totalHours = Math.round(progressions.reduce((sum, p) => sum + (p.timeSpent || 0), 0) / 60)

6. Retourner :
{
  firstName: studentProfile.User.firstName,
  className: studentProfile.Class?.name || 'Non assigné',
  stats: {
    coursesCompleted: completedCourses,
    totalCourses: totalCourses || 1,  // Éviter division par 0
    averageScore: avgScore,
    hoursSpent: totalHours
  },
  unreadMessages
}

}
```

---

## Tâche 13.5 — Page student dashboard (Server Component)

### Contexte
La page dashboard est un Server Component qui charge les données via la fonction locale, vérifie l'authentification, et affiche les composants client.

### Description
Créer page.tsx avec auth, getStudentDashboardData, et rendu des composants.

### Prompt
```
Crée src/app/(dashboard)/student/page.tsx :

IMPORTS :
- Card, CardContent de @/components/ui/card
- auth de @/lib/auth
- prisma de @/lib/prisma
- redirect de next/navigation
- StudentStatsGrid de @/components/features/student/StudentStatsGrid
- QuickAccessCard de @/components/dashboard/QuickAccessCard

// Fonction getStudentDashboardData() définie plus haut dans le fichier

export default async function StudentDashboardPage() {

1. Auth check :
const session = await auth()
if (!session?.user?.id || session.user.role !== 'STUDENT') {
  redirect('/login')
}

2. Charger les données :
const data = await getStudentDashboardData(session.user.id)

3. Si pas de profil :
if (!data) {
  return (
    <div className="p-6">
      <p className="text-muted-foreground">Profil élève non trouvé.</p>
    </div>
  )
}

4. UI :
return (
  <div className="space-y-6">
  
    {/* Welcome Card */}
    <Card className="bg-gradient-to-r from-blue-500 to-indigo-600 text-white">
      <CardContent className="pt-6">
        <h1 className="text-2xl font-bold">Bonjour, {data.firstName} 👋</h1>
        <p className="opacity-90">Prêt à apprendre quelque chose de nouveau ?</p>
        {data.className !== 'Non assigné' && (
          <p className="text-sm opacity-75 mt-1">Classe : {data.className}</p>
        )}
      </CardContent>
    </Card>

    {/* Stats Cards avec liens */}
    <StudentStatsGrid stats={data.stats} />

    {/* Quick Access */}
    <QuickAccessCard unreadMessages={data.unreadMessages} />
    
  </div>
)

}
```

---

## Résumé Phase 13

| Fichier | Rôle |
|---------|------|
| `student/StudentStatsCard.tsx` | Carte KPI réutilisable avec lien optionnel |
| `student/StudentStatsGrid.tsx` | Grille des 4 KPIs (cours, progression, score, heures) |
| `dashboard/QuickAccessCard.tsx` | Liens rapides avec badge non-lus |
| `student/page.tsx` | Server Component avec getStudentDashboardData |

### Pattern Server Component
- Pas d'API `/api/student/dashboard` nécessaire
- Les données sont chargées directement via Prisma dans le Server Component
- Les composants client reçoivent les données en props

### KPIs affichés
| KPI | Source | Lien |
|-----|--------|------|
| Cours terminés | StudentProgress.status = 'COMPLETED' | /student/courses |
| Progression | coursesCompleted / totalCourses * 100 | /student/courses |
| Score moyen | Moyenne StudentScore.continuousScore | /student/revisions |
| Heures passées | Somme StudentProgress.timeSpent / 60 | - |

---

*Phase 13 terminée — Le dashboard élève affiche les KPIs de progression et l'accès rapide aux fonctionnalités.*
