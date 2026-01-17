# Mes Classes

> **Chemin de navigation** : Login → Dashboard Teacher → Sidebar → **Mes classes**  
> **Route** : `/teacher/classes`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/classes/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes classes
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Mes Classes

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  Mes Classes                                                    │
│            │  2 classes assignées                                            │
│ 🏫 Mes     │                                                                 │
│   classes  │  ☑ Tout   ☐ Aucun   ⟲ Inverser                                 │
│   (actif)  │                                                                 │
│            │  📊 Statistiques (2 classes - 9 élèves)                         │
│ 👥 Mes     │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────┐ │
│   élèves   │  │ 🟢 0     │ │ 🟡 0     │ │ 🔴 0     │ │ ———      │ │ ———  │ │
│            │  │ En       │ │ À        │ │ En       │ │ Moyenne  │ │ Moy  │ │
│ 📚 Mes     │  │ réussite │ │ surveill │ │ diffic.  │ │          │ │ IA   │ │
│   cours    │  └──────────┘ └──────────┘ └──────────┘ └──────────┘ └──────┘ │
│            │                                                                 │
│ 📅 Agendas │  🔍 Filtres                          🏫 2 classes / 2 total  ▲ │
│   et       │                                                                 │
│   Assigna. │  🔍 Rechercher une classe...                                    │
│            │                                                                 │
│ 💬 Messag. │  Matières                                       Classe          │
│            │  + Ajouter                                      Toutes les      │
│            │                                                 classes ▼       │
│            │                                                                 │
│            │  ┌────────────────────────────┐ ┌────────────────────────────┐ │
│            │  │ ☐ 🎓 11H-A                │ │ ☐ 🎓 1A                    │ │
│            │  │                            │ │                            │ │
│            │  │ 👥 3 élèves                │ │ 👥 6 élèves                │ │
│            │  │                            │ │                            │ │
│            │  │ Moyenne           —        │ │ Moyenne           —        │ │
│            │  │ 📊 Score IA       —        │ │ 📊 Score IA       —        │ │
│            │  │                            │ │                            │ │
│            │  │ 📚 Mathématiques           │ │ 📚 Mathématiques           │ │
│            │  │    Français                │ │    Français                │ │
│            │  │    SVT                     │ │    SVT                     │ │
│            │  │                            │ │                            │ │
│            │  │ [Voir la classe]           │ │ [Voir la classe]           │ │
│            │  └────────────────────────────┘ └────────────────────────────┘ │
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
| `Card` | `@/components/ui/card` | Cartes de classes |
| `Badge` | `@/components/ui/badge` | Badges de matières |
| `Checkbox` | `@/components/ui/checkbox` | Cases à cocher |
| `Select` | `@/components/ui/select` | Dropdown filtre classe |
| `Button` | `@/components/ui/button` | Bouton "Voir la classe" |
| `Input` | `@/components/ui/input` | Recherche |

---

## 📊 Structure de la Page

### En-tête
- Titre : "Mes Classes"
- Sous-titre : "X classes assignées"

### Sélection Multiple

| Bouton | Action |
|--------|--------|
| ☑ **Tout** | Sélectionner toutes les classes |
| ☐ **Aucun** | Désélectionner toutes |
| ⟲ **Inverser** | Inverser la sélection |

### Statistiques Globales (5 cartes)

| Indicateur | Couleur | Description | Calcul |
|------------|---------|-------------|--------|
| **En réussite** | 🟢 Vert | Élèves avec moyenne ≥ 60% | Compte élèves ≥ 60% |
| **À surveiller** | 🟡 Jaune | Élèves entre 40% et 60% | Compte élèves 40-60% |
| **En difficulté** | 🔴 Rouge | Élèves < 40% | Compte élèves < 40% |
| **Moyenne** | Barre bleue | Moyenne globale | Moyenne de toutes les classes |
| **Moy IA** | Barre violette | Score IA moyen | Moyenne des scores IA |

### Filtres

| Filtre | Type | Description |
|--------|------|-------------|
| **Recherche** | Input | Rechercher par nom de classe |
| **Matières** | Multi-select | Filtrer par matière (+ Ajouter) |
| **Classe** | Select | "Toutes les classes" ou classe spécifique |

### Compteur
- Badge : "🏫 X classes / Y total" (avec collapse ▲)

### Grille de Classes

Chaque carte affiche :

| Élément | Description |
|---------|-------------|
| ☐ Checkbox | Sélection de la classe |
| 🎓 Icône | Icône de classe |
| **Nom** | Code de la classe (ex: "11H-A") |
| 👥 Élèves | Nombre d'élèves dans la classe |
| **Moyenne** | Moyenne de la classe (— si aucune note) |
| 📊 Score IA | Score d'interaction IA (— si aucune donnée) |
| 📚 Matières | Liste des matières enseignées (badges) |
| **Bouton** | "Voir la classe" → Détail |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/teacher/classes` | Liste des classes du professeur | `?search=...&subjects=...` |
| `GET` | `/api/teacher/classes/stats` | Statistiques globales | - |

---

## 💾 Types & Interfaces

```typescript
interface TeacherClass {
  id: string;
  code: string;              // "11H-A", "1A"
  studentCount: number;
  average?: number;          // 0-100 ou null
  aiScore?: number;          // 0-100 ou null
  subjects: {
    id: string;
    name: string;
    color: string;
  }[];
}

interface ClassesStats {
  totalClasses: number;
  totalStudents: number;
  successCount: number;      // Élèves ≥ 60%
  warningCount: number;      // Élèves 40-60%
  strugglingCount: number;   // Élèves < 40%
  averageGrade: number;      // Moyenne globale
  averageAiScore: number;    // Score IA global
}

interface ClassesFilters {
  search?: string;
  subjectIds?: string[];
  classId?: string;
}
```

---

## 🎯 Comportements

### Sélection Multiple
- Cases à cocher sur chaque carte
- Actions de sélection : Tout / Aucun / Inverser
- Sélection visible sur les cartes

### Filtres
- **Recherche** : Filtre en temps réel (debounce 300ms)
- **Matières** : Multi-select avec "+ Ajouter"
- **Classe** : Dropdown pour filtrer par classe spécifique
- Compteur mis à jour selon les filtres

### Statistiques
- Calcul en temps réel basé sur toutes les classes
- Mise à jour lors du changement de filtres
- Barres de progression pour Moyenne et Moy IA

### Cartes de Classes
- Hover : Effet de survol
- Clic sur carte : Ouvre le détail (sauf checkbox)
- Bouton "Voir la classe" : Navigation vers détail

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton "Voir la classe" | [detail/[id].md](detail/[id].md) |
| Clic sur carte | [detail/[id].md](detail/[id].md) |
| ← Sidebar Dashboard | [../dashboard.md](../dashboard.md) |
| Sidebar Mes élèves | [../students/liste.md](../students/liste.md) |

---

## 📝 Notes

> **Exemple de données** :
> - Professeur : Marc DUPONT
> - Classes : 2 (11H-A avec 3 élèves, 1A avec 6 élèves)
> - Total : 9 élèves
> - Matières communes : Mathématiques, Français, SVT

> **État initial** :
> - Si aucune note : affiche "—"
> - Statistiques à 0 si pas de données
> - Moyenne et Score IA : barres vides

> **Filtres** :
> - Persistance dans localStorage
> - Restauration au rechargement

> **Performance** :
> - Pagination côté serveur si > 20 classes
> - Cache des statistiques (5 minutes)
> - Skeleton loaders pendant le chargement

---

**Navigation** :
- ← [Dashboard Teacher](../dashboard.md)
- → [Détail d'une classe](detail/[id].md)

*Date : 13 décembre 2025*

