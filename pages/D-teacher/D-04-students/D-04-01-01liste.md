# Mes Élèves

> **Chemin de navigation** : Login → Dashboard Teacher → Sidebar → **Mes élèves**  
> **Route** : `/teacher/students`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/students/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes élèves
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Mes Élèves

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  Mes Élèves                                                     │
│            │  9 élèves dans vos classes                                      │
│ 🏫 Mes     │                                                                 │
│   classes  │  ☑ Tout   ☐ Aucun   ⟲ Inverser                                 │
│            │                                                                 │
│ 👥 Mes     │  📊 Statistiques (9 élèves)                                     │
│   élèves   │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────┐ │
│   (actif)  │  │ 🟢 0     │ │ 🟡 0     │ │ 🔴 0     │ │ ———      │ │ ———  │ │
│            │  │ En       │ │ À        │ │ En       │ │ Moyenne  │ │ Moy  │ │
│ 📚 Mes     │  │ réussite │ │ surveill │ │ diffic.  │ │          │ │ 🤖 IA│ │
│   cours    │  └──────────┘ └──────────┘ └──────────┘ └──────────┘ └──────┘ │
│            │                                                                 │
│ 📅 Agendas │  🔍 Filtres                         📊 9 élèves / 9 total   ▲  │
│   et       │                                                                 │
│   Assigna. │  Toutes les       Tous les          🔍 Rechercher un élève...  │
│            │  classes ▼        niveaux ▼                                    │
│ 💬 Messag. │                                                           ⊞  ≡ │
│            │  ┌──────────┐ ┌──────────┐ ┌──────────┐                       │
│            │  │ ☐ 👤     │ │ ☐ 👤     │ │ ☐ 👤     │                       │
│            │  │ CURTY    │ │ DUBOIS   │ │ DURAND   │                       │
│            │  │ Baptiste │ │ Julien   │ │ Emma     │                       │
│            │  │ 1A       │ │ 11H-A    │ │ 1A       │                       │
│            │  │          │ │          │ │          │                       │
│            │  │ Continu  │ │ Continu  │ │ Continu  │                       │
│            │  │ 🤖 IA    │ │ 🤖 IA    │ │ 🤖 IA    │                       │
│            │  │ Exam     │ │ Exam     │ │ Exam     │                       │
│            │  │ Final    │ │ Final    │ │ Final    │                       │
│            │  │ (tous —) │ │ (tous —) │ │ (tous —) │                       │
│            │  │          │ │          │ │          │                       │
│            │  │ 💜 Sans  │ │ 💜 Sans  │ │ 💜 Sans  │                       │
│            │  │   notes  │ │   notes  │ │   notes  │                       │
│            │  │       → │ │       → │ │       → │                       │
│            │  └──────────┘ └──────────┘ └──────────┘                       │
│            │                                                                 │
│            │  ┌──────────┐ ┌──────────┐ ┌──────────┐                       │
│            │  │ ☐ MARTIN │ │ ☐ MERCIER│ │ ☐ MORET  │                       │
│            │  │  Lucas   │ │  Louis   │ │  Antoine │                       │
│            │  │  1A      │ │  11H-A   │ │  1A      │ ...                   │
│            │  │ ...      │ │ ...      │ │ ...      │                       │
│            │  └──────────┘ └──────────┘ └──────────┘                       │
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
| `Card` | `@/components/ui/card` | Cartes d'élèves |
| `Badge` | `@/components/ui/badge` | Badges de statut |
| `Checkbox` | `@/components/ui/checkbox` | Cases à cocher |
| `Select` | `@/components/ui/select` | Dropdowns filtres |
| `Button` | `@/components/ui/button` | Toggle vue grille/liste |
| `Input` | `@/components/ui/input` | Recherche |

---

## 📊 Structure de la Page

### En-tête
- Titre : "Mes Élèves"
- Sous-titre : "X élèves dans vos classes"

### Sélection Multiple

| Bouton | Action |
|--------|--------|
| ☑ **Tout** | Sélectionner tous les élèves |
| ☐ **Aucun** | Désélectionner tous |
| ⟲ **Inverser** | Inverser la sélection |

### Statistiques Globales (5 cartes)

| Indicateur | Couleur | Description | Calcul |
|------------|---------|-------------|--------|
| **En réussite** | 🟢 Vert | Élèves avec moyenne ≥ 60% | Compte élèves ≥ 60% |
| **À surveiller** | 🟡 Jaune | Élèves entre 40% et 60% | Compte élèves 40-60% |
| **En difficulté** | 🔴 Rouge | Élèves < 40% | Compte élèves < 40% |
| **Moyenne** | Barre bleue | Moyenne globale | Moyenne de tous les élèves |
| **Moy IA** | Barre violette 🤖 | Score IA moyen | Moyenne des scores IA |

### Filtres

| Filtre | Type | Description |
|--------|------|-------------|
| **Classes** | Select | "Toutes les classes" ou classe spécifique |
| **Niveaux** | Select | "Tous les niveaux" ou niveau spécifique |
| **Recherche** | Input | Rechercher par nom ou prénom |

### Compteur
- Badge : "📊 X élèves / Y total" (avec collapse ▲)

### Toggle Vue
- Bouton **⊞** : Vue grille (actif)
- Bouton **≡** : Vue liste

### Grille d'Élèves

Chaque carte affiche :

| Élément | Description |
|---------|-------------|
| ☐ Checkbox | Sélection de l'élève |
| 👤 Icône | Icône utilisateur |
| **Nom** | NOM Prénom (ex: "DUBOIS Julien") |
| **Classe** | Code classe (ex: "11H-A", "1A") |
| **Badges statut** | 4 badges : Continu, 🤖 IA, Exam, Final |
| **Badge notes** | "💜 Sans notes" si aucune note |
| **Flèche →** | Voir le profil de l'élève |

#### Badges de Statut (4)

| Badge | Description | Valeur |
|-------|-------------|--------|
| **Continu** | Note de contrôle continu | — (si vide) ou note/20 |
| **🤖 IA** | Score d'interaction IA | — (si vide) ou score/100 |
| **Exam** | Note d'examen | — (si vide) ou note/20 |
| **Final** | Note finale | — (si vide) ou note/20 |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/teacher/students` | Liste des élèves | `?search=...&classId=...&level=...` |
| `GET` | `/api/teacher/students/stats` | Statistiques globales | - |

---

## 💾 Types & Interfaces

```typescript
interface TeacherStudent {
  id: string;
  firstName: string;
  lastName: string;
  class: {
    id: string;
    code: string;          // "11H-A", "1A"
    level: string;         // "Niveau 1", "Niveau 11"
  };
  grades: {
    continu?: number;      // 0-20 ou null
    ai?: number;           // 0-100 ou null
    exam?: number;         // 0-20 ou null
    final?: number;        // 0-20 ou null
  };
  hasNotes: boolean;       // true si au moins 1 note
}

interface StudentsStats {
  totalStudents: number;
  successCount: number;      // Élèves ≥ 60%
  warningCount: number;      // Élèves 40-60%
  strugglingCount: number;   // Élèves < 40%
  averageGrade: number;      // Moyenne globale
  averageAiScore: number;    // Score IA global
}

interface StudentsFilters {
  search?: string;
  classId?: string;
  level?: string;
}
```

---

## 🎯 Comportements

### Sélection Multiple
- Cases à cocher sur chaque carte
- Actions de sélection : Tout / Aucun / Inverser
- Sélection visible sur les cartes

### Filtres
- **Classes** : Dropdown pour filtrer par classe (ou "Toutes les classes")
- **Niveaux** : Dropdown pour filtrer par niveau (ou "Tous les niveaux")
- **Recherche** : Filtre en temps réel (debounce 300ms)
- Compteur mis à jour selon les filtres

### Statistiques
- Calcul en temps réel basé sur tous les élèves
- Mise à jour lors du changement de filtres
- Barres de progression pour Moyenne et Moy IA

### Toggle Vue
- **Grille (⊞)** : Cartes 3 colonnes (actif par défaut)
- **Liste (≡)** : Tableau avec colonnes détaillées
- Préférence sauvegardée dans localStorage

### Cartes d'Élèves
- Hover : Effet de survol
- Clic sur carte : Ouvre le profil (sauf checkbox)
- Flèche → : Navigation vers profil
- Badge "Sans notes" : Affiché si `hasNotes === false`

### Badges de Statut
- Affichage : "—" si note/score non renseigné
- Couleurs conditionnelles selon les valeurs :
  - Vert : > 60%
  - Jaune : 40-60%
  - Rouge : < 40%

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Flèche → sur carte | [detail/[id].md](detail/[id].md) |
| Clic sur carte | [detail/[id].md](detail/[id].md) |
| ← Sidebar Dashboard | [../dashboard.md](../dashboard.md) |
| Sidebar Mes classes | [../classes/liste.md](../classes/liste.md) |

---

## 📝 Notes

> **Exemple de données** :
> - Professeur : Marc DUPONT
> - Total : 9 élèves (6 visibles : CURTY, DUBOIS, DURAND, MARTIN, MERCIER, MORET)
> - Classes : 1A (4 élèves), 11H-A (2 élèves)
> - État : Tous "Sans notes" (aucune évaluation)

> **État initial** :
> - Si aucune note : badge "💜 Sans notes"
> - Statistiques à 0 si pas de données
> - Moyenne et Score IA : barres vides
> - Tous les badges de statut affichent "—"

> **Filtres** :
> - Persistance dans localStorage
> - Restauration au rechargement
> - Combinaison classe + niveau + recherche possible

> **Vue Grille vs Liste** :
> - **Grille** : Idéale pour vue d'ensemble visuelle (3 colonnes)
> - **Liste** : Idéale pour tri et comparaison détaillée
> - Toggle sauvegardé dans préférences utilisateur

> **Performance** :
> - Pagination côté serveur si > 50 élèves
> - Virtualisation pour affichage performant
> - Cache des statistiques (5 minutes)
> - Skeleton loaders pendant le chargement

> **Badge "Sans notes"** :
> - Affiché uniquement si TOUTES les notes sont vides
> - Couleur violette (#9333EA)
> - Masqué dès qu'une note est renseignée

---

**Navigation** :
- ← [Dashboard Teacher](../dashboard.md)
- → [Profil élève](detail/[id].md)
- ← [Mes classes](../classes/liste.md)

*Date : 13 décembre 2025*

