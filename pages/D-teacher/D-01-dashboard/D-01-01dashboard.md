# Dashboard Professeur

> **Chemin de navigation** : Login (Professeur) → **Dashboard**  
> **Route** : `/teacher`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── VOUS ÊTES ICI (Dashboard Professeur)

3. Navigation disponible
   ├── Mes classes
   ├── Mes élèves
   ├── Mes cours
   ├── Agendas et Assignations
   └── Messages
```

---

## 📸 Aperçu Visuel - Dashboard Professeur

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ Bonjour, Marc 👋                                          │ │
│ 🏫 Mes     │  │ Bienvenue sur votre espace professeur                    │ │
│   classes  │  └───────────────────────────────────────────────────────────┘ │
│            │                                                                 │
│ 👥 Mes     │  ┌──────────┐  ┌──────────┐  ┌──────────┐                     │
│   élèves   │  │ 🎓 2     │  │ 📚 1     │  │ ✉️ 0     │                     │
│            │  │ Mes      │  │ Mes      │  │ Messages │                     │
│ 📚 Mes     │  │ classes  │  │ cours    │  │          │                     │
│   cours    │  └──────────┘  └──────────┘  └──────────┘                     │
│            │                                                                 │
│ 📅 Agendas │  📊 Centre de Pilotage                                         │
│   et       │  ⚙️ Filtres  [Toutes les classe ▼] [Toutes les matière ▼]    │
│   Assigna. │            [Tous les cours ▼] [Ce mois ▼]                     │
│            │                                                                 │
│ 💬 Messag. │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐         │
│            │  │ Moyenne  │ │ Taux de  │ │ Progress │ │ Alertes  │         │
│            │  │ Générale │ │ Réussite │ │ -ion     │ │ Actives  │         │
│            │  │ 0 %      │ │ 0 %      │ │ 100 %    │ │ 0        │         │
│            │  └──────────┘ └──────────┘ └──────────┘ └──────────┘         │
│            │                                                                 │
│            │  📈 Performance des Cours                                      │
│            │  Aucune donnée de performance disponible                       │
│            │                                                                 │
│            │  👥 Élèves à Surveiller                              0         │
│            │  ┌─────────────────────────────────────────────────────────┐  │
│            │  │ LM  Louis MERCIER    11H-A      Moy: 0%          [↗]   │  │
│            │  │ LV  Louise VAUCHER   11H-A           0%          [↗]   │  │
│            │  └─────────────────────────────────────────────────────────┘  │
│            │                                                                 │
└────────────┴─────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DashboardShell` | `@/components/layout/DashboardShell` | Layout avec sidebar |
| `Header` | `@/components/layout/Header` | Barre supérieure |
| `Sidebar` | `@/components/layout/Sidebar` | Navigation professeur |
| `Card` | `@/components/ui/card` | Cartes de statistiques |
| `Select` | `@/components/ui/select` | Filtres déroulants |
| `Badge` | `@/components/ui/badge` | Badges de statut |
| `Avatar` | `@/components/ui/avatar` | Avatars élèves |

---

## 📊 Structure du Dashboard

### Bannière de Bienvenue
- Fond vert dégradé
- Message personnalisé avec prénom du professeur
- Emoji 👋

### Cartes de Statistiques (3)

| Carte | Icône | Description | Lien |
|-------|-------|-------------|------|
| **Mes classes** | 🎓 | Nombre de classes assignées | → [Mes classes](classes/liste.md) |
| **Mes cours** | 📚 | Nombre de cours créés | → [Mes cours](courses/liste.md) |
| **Messages** | ✉️ | Messages non lus | → [Messages](messages/page.md) |

### Centre de Pilotage

#### Filtres (4 dropdowns)

| Filtre | Options | Défaut |
|--------|---------|--------|
| **Classes** | Liste des classes du prof | "Toutes les classe" |
| **Matières** | Liste des matières enseignées | "Toutes les matière" |
| **Cours** | Liste des cours | "Tous les cours" |
| **Période** | Ce mois, Ce trimestre, Cette année | "Ce mois" |

#### Indicateurs (4)

| Indicateur | Couleur | Description | Calcul |
|------------|---------|-------------|--------|
| **Moyenne Générale** | Rouge | Moyenne de toutes les notes | Somme notes / Nombre élèves |
| **Taux de Réussite** | Rouge | % d'élèves au-dessus de 60% | (Élèves ≥60%) / Total élèves |
| **Progression** | Vert | % de progression globale | Comparaison période précédente |
| **Alertes Actives** | Jaune | Nombre d'alertes (élèves en difficulté) | Élèves avec moyenne < 40% |

### Performance des Cours
- Graphique vide si aucune donnée
- Message : "Aucune donnée de performance disponible"
- Affiche normalement : graphique en courbes par cours

### Élèves à Surveiller

| Élément | Description |
|---------|-------------|
| **Badge compteur** | Nombre d'élèves en difficulté (rouge si > 0) |
| **Liste** | Élèves avec moyenne < 40% ou non actifs |
| **Avatar** | Initiales de l'élève |
| **Nom** | Nom complet de l'élève |
| **Classe** | Code de la classe |
| **Moyenne** | Pourcentage (rouge si < 40%) |
| **Action** | Bouton [↗] → Profil de l'élève |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| `GET` | `/api/teacher/dashboard` | Statistiques du dashboard |
| `GET` | `/api/teacher/stats` | Stats filtrées (classes, matières, période) |
| `GET` | `/api/teacher/students/at-risk` | Liste des élèves en difficulté |
| `GET` | `/api/teacher/courses/performance` | Données de performance des cours |

---

## 💾 Types & Interfaces

```typescript
interface TeacherDashboardData {
  stats: {
    classCount: number;
    courseCount: number;
    unreadMessages: number;
  };
  
  pilotageData: {
    averageGrade: number;         // 0-100
    successRate: number;          // 0-100
    progression: number;          // 0-100
    activeAlerts: number;
  };
  
  atRiskStudents: {
    id: string;
    firstName: string;
    lastName: string;
    classCode: string;
    average: number;
  }[];
  
  coursePerformance?: {
    courseName: string;
    data: { date: string; average: number }[];
  }[];
}

interface DashboardFilters {
  classId?: string;
  subjectId?: string;
  courseId?: string;
  period: 'month' | 'trimester' | 'year';
}
```

---

## 🎯 Comportements

### Filtres du Centre de Pilotage
- Changement de filtre → Recharge les indicateurs
- Filtres cumulatifs (classe + matière + cours)
- Sauvegarde des filtres dans localStorage

### Cartes de Statistiques
- Cliquables → Redirection vers la page correspondante
- Hover : effet de survol

### Élèves à Surveiller
- Tri par moyenne croissante (plus faible en premier)
- Limite : 10 élèves max
- Bouton [↗] → Ouvre le profil de l'élève

### Performance des Cours
- Graphique en courbes si données disponibles
- 1 courbe par cours
- Axe X : Dates
- Axe Y : Moyenne (0-100)

---

## 🔗 Navigation

| Élément | Destination |
|---------|-------------|
| Carte "Mes classes" | [classes/liste.md](classes/liste.md) |
| Carte "Mes cours" | [courses/liste.md](courses/liste.md) |
| Carte "Messages" | [messages/page.md](messages/page.md) |
| Sidebar "Mes classes" | [classes/liste.md](classes/liste.md) |
| Sidebar "Mes élèves" | [students/liste.md](students/liste.md) |
| Sidebar "Mes cours" | [courses/liste.md](courses/liste.md) |
| Sidebar "Agendas et Assignations" | [agendas-assignations/liste.md](agendas-assignations/liste.md) |
| Sidebar "Messages" | [messages/page.md](messages/page.md) |
| Bouton [↗] élève | [students/profile.md](students/profile.md?id=...) |

---

## 📝 Notes

> **Exemple de données** :
> - Professeur : Marc DUPONT
> - Classes : 2 (dont 11H-A visible)
> - Cours : 1
> - Élèves à surveiller : Louis MERCIER, Louise VAUCHER (11H-A, moyenne 0%)

> **État initial** :
> - Si nouveau professeur : toutes les stats à 0
> - Message "Aucune donnée de performance disponible"
> - Centre de Pilotage vide

> **Filtres** :
> - Les filtres persistent dans localStorage
> - Rechargement de page : filtres restaurés

> **Performance** :
> - Cache des statistiques (5 minutes)
> - Rechargement automatique toutes les 5 minutes
> - Skeleton loaders pendant le chargement

---

*Date : 13 décembre 2025*

