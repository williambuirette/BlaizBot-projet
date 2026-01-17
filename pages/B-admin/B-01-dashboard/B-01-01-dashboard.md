# Dashboard Admin

> **Route** : `/admin`  
> **Rôle(s)** : ADMIN  
> **Fichier source** : `src/app/(dashboard)/admin/page.tsx`

---

## 📸 Aperçu Visuel

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  🤖 BlaizBot │ Dashboard                    [🔍 Rechercher...]  🔔  [AS] ▼ │
├──────────────┼──────────────────────────────────────────────────────────────┤
│              │                                                              │
│  🏠 Dashboard│  ┌─────────────────────────────────────────────────────────┐ │
│  (actif/bleu)│  │  Administration 🛡️                                      │ │
│              │  │  Vue d'ensemble de la plateforme                        │ │
│  👥 Utilisat.│  │  (gradient violet → bleu, texte blanc, coins arrondis)  │ │
│              │  └─────────────────────────────────────────────────────────┘ │
│  🎓 Classes  │                                                              │
│              │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐        │
│  📚 Matières │  │  👥          │ │  🎓          │ │  📖          │        │
│              │  │  41          │ │  8           │ │  7           │        │
│              │  │  Utilisateurs│ │  Classes     │ │  Matières    │        │
│  ──────────  │  │  (icône bleu)│ │  (icône vert)│ │  (icône violt)        │
│  BlaizBot v1 │  └──────────────┘ └──────────────┘ └──────────────┘        │
│              │                                                              │
│              │  ┌──────────────┐                                            │
│              │  │  📄          │                                            │
│              │  │  1           │                                            │
│              │  │  Cours       │                                            │
│              │  │  (icône orange)                                           │
│              │  └──────────────┘                                            │
│              │                                                              │
└──────────────┴──────────────────────────────────────────────────────────────┘
```

### Menu Utilisateur (Dropdown)

```
┌─────────────────────────────────────┐
│  [AS] Admin SYSTÈME           ▼    │
├─────────────────────────────────────┤
│  Admin SYSTÈME                      │
│  admin@blaizbot.edu                 │
│  ─────────────────────────────────  │
│  👤 Mon profil                      │
│  ⚙️  Paramètres                     │
│  🤖 Configuration IA                │
│  ─────────────────────────────────  │
│  🚪 Déconnexion (texte rouge)       │
└─────────────────────────────────────┘
```

### Légende des éléments

| Zone | Description |
|------|-------------|
| Sidebar | Fond sombre (slate-900), navigation fixe |
| Header | Blanc avec barre de recherche centrale |
| Bannière | Gradient violet → bleu avec emoji bouclier |
| Stats Cards | 4 cartes cliquables avec icônes colorées |
| Avatar | Initiales "AS" dans cercle, dropdown au clic |

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DashboardShell` | `@/components/layout/DashboardShell` | Layout principal |
| `Sidebar` | `@/components/layout/Sidebar` | Navigation latérale |
| `Header` | `@/components/layout/Header` | Barre supérieure |
| `Card` | `@/components/ui/card` | Cartes statistiques |
| `Input` | `@/components/ui/input` | Barre de recherche |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu utilisateur |
| `Avatar` | `@/components/ui/avatar` | Avatar avec initiales |
| `AvatarFallback` | `@/components/ui/avatar` | Affichage initiales |

---

## 📦 Dépendances

### Packages NPM
```json
{
  "next": "15.x",
  "react": "19.x",
  "@prisma/client": "latest",
  "next-auth": "4.x",
  "lucide-react": "latest"
}
```

### Composants shadcn/ui
- [x] `Card` (CardContent)
- [x] `Input`
- [x] `DropdownMenu` (DropdownMenuTrigger, DropdownMenuContent, etc.)
- [x] `Avatar` (AvatarFallback)

### Icônes lucide-react
- [x] `Home` (Dashboard)
- [x] `Users` (Utilisateurs + carte stat)
- [x] `School` (Classes + carte stat)
- [x] `BookMarked` (Matières + carte stat)
- [x] `BookOpen` (Cours + carte stat)
- [x] `Search` (Recherche)
- [x] `User` (Mon profil)
- [x] `Settings` (Paramètres)
- [x] `Bot` (Configuration IA)
- [x] `LogOut` (Déconnexion)

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| - | Server Component | Données chargées côté serveur via Prisma |

### Requêtes Prisma (estimation)
```typescript
// Compter les utilisateurs
prisma.user.count()

// Compter les classes
prisma.class.count()

// Compter les matières
prisma.subject.count()

// Compter les cours
prisma.course.count()
```

---

## 💾 Types & Interfaces

### Données du dashboard
```typescript
interface AdminDashboardData {
  stats: {
    totalUsers: number;
    totalClasses: number;
    totalSubjects: number;
    totalCourses: number;
  };
}
```

### Navigation Sidebar (Admin)
```typescript
const adminNavItems = [
  { label: 'Dashboard', href: '/admin', icon: Home },
  { label: 'Utilisateurs', href: '/admin/users', icon: Users },
  { label: 'Classes', href: '/admin/classes', icon: School },
  { label: 'Matières', href: '/admin/subjects', icon: BookMarked },
];
```

---

## 🔐 Authentification & Autorisations

| Aspect | Détail |
|--------|--------|
| **Session** | `auth()` côté serveur |
| **Rôle requis** | `ADMIN` uniquement |
| **Middleware** | Vérifie le rôle dans `middleware.ts` |
| **Redirection** | `/unauthorized` si non-admin |

### Menu utilisateur - Options admin
- **Mon profil** : Modale `ProfileModal`
- **Paramètres** : Modale `SettingsModal`
- **Configuration IA** : Modale `AISettingsModal` (ADMIN uniquement)
- **Déconnexion** : `signOut({ callbackUrl: '/login' })`

---

## 🎨 États de l'Interface

### État normal
Affichage complet avec 4 statistiques.

### État de chargement
```
┌─────────────────────────────────────────┐
│  ⏳ Chargement des statistiques...      │
└─────────────────────────────────────────┘
```

---

## 📱 Responsive Design

| Breakpoint | Comportement |
|------------|--------------|
| `mobile` < 1024px | Sidebar masquée, bouton menu burger dans header |
| `desktop` ≥ 1024px | Sidebar fixe visible (lg:ml-64) |

### Classes Tailwind clés
```css
/* Sidebar */
.w-64 .h-screen .bg-slate-900 .fixed .left-0 .top-0

/* Bannière gradient */
.bg-gradient-to-r .from-purple-500 .to-blue-600 .text-white

/* Cartes stats */
.grid .gap-4 .md:grid-cols-2 .lg:grid-cols-4
```

---

## 📋 Checklist de Recréation

### Structure
- [x] Route Next.js (`app/(dashboard)/admin/page.tsx`)
- [x] Server Component async
- [x] Layout parent `(dashboard)` appliqué

### UI
- [x] Sidebar avec navigation admin (4 items)
- [x] Header avec recherche + notifications + avatar
- [x] Bannière gradient violet → bleu
- [x] 4 cartes statistiques cliquables
- [x] Menu dropdown utilisateur

### Fonctionnalités
- [x] Chargement données Prisma (counts)
- [x] Navigation vers gestion (users, classes, subjects)
- [x] Menu profil avec options admin
- [x] Configuration IA (admin only)
- [x] Déconnexion

### Qualité
- [x] Responsive (sidebar toggle mobile)
- [x] Accessibilité (labels, aria)
- [ ] Tests unitaires

---

## 🔗 Navigation

| Direction | Page | Route |
|-----------|------|-------|
| → Utilisateurs | Gestion users | `/admin/users` |
| → Classes | Gestion classes | `/admin/classes` |
| → Matières | Gestion matières | `/admin/subjects` |

---

## 📝 Notes de Développement

> **Rôle ADMIN** : Seul rôle avec accès à la configuration IA globale.

> **Statistiques** : Les counts Prisma sont simples mais pourraient être optimisés avec une vue SQL si le volume augmente.

> **Menu dropdown** : Le composant Header gère l'affichage conditionnel de "Configuration IA" selon le rôle.

> **Emoji bouclier** : Représente le rôle admin/sécurité de la plateforme.

---

*Date : 13 décembre 2025*

