# Mes Cours

> **Chemin de navigation** : Login → Dashboard Teacher → Sidebar → **Mes cours**  
> **Route** : `/teacher/courses`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/courses/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes cours
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Mes Cours

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  Mes Cours                                   [+ Nouveau cours] │
│            │  Gérez et créez vos contenus pédagogiques.                     │
│ 🏫 Mes     │                                                                 │
│   classes  │  📊 Vue d'ensemble                                              │
│            │  ┌──────────────┐ ┌──────────────┐ ┌─────────────────────────┐ │
│ 👥 Mes     │  │ 📚 1         │ │ 👥 0         │ │ 📈 N/A                  │ │
│   élèves   │  │ Total        │ │ Élèves       │ │ Performance             │ │
│            │  │ Cours        │ │ Actifs       │ │ Moyenne                 │ │
│ 📚 Mes     │  │ 0 avec       │ │ Année        │ │ Élèves (60%) • IA (40%) │ │
│   cours    │  │ données      │ │ scolaire     │ └─────────────────────────┘ │
│   (actif)  │  └──────────────┘ │ en cours     │                             │
│            │                    └──────────────┘                             │
│ 📅 Agendas │                                                                 │
│   et       │  ┌───────────────────────────────────────────────────────────┐ │
│   Assigna. │  │ Matière     Thème                  📊 Performance  Actions│ │
│            │  ├───────────────────────────────────────────────────────────┤ │
│ 💬 Messag. │  │ SVT      La photosynthèse             N/A           ...   │ │
│            │  └───────────────────────────────────────────────────────────┘ │
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
| `Button` | `@/components/ui/button` | Bouton "+ Nouveau cours" |
| `Card` | `@/components/ui/card` | Cartes statistiques |
| `Table` | `@/components/ui/table` | Tableau des cours |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions (•••) |

---

## 📊 Structure de la Page

### En-tête
- Titre : "Mes Cours"
- Sous-titre : "Gérez et créez vos contenus pédagogiques."
- Bouton : **+ Nouveau cours** (action création)

### Statistiques (3 cartes)

| Carte | Icône | Contenu | Description |
|-------|-------|---------|-------------|
| **Total Cours** | 📚 | 1 + "0 avec données" | Nombre total de cours créés + nb avec notes/activité |
| **Élèves Actifs** | 👥 | 0 + "Année scolaire en cours" | Nombre d'élèves actifs sur les cours |
| **Performance Moyenne** | 📈 | N/A + "Élèves (60%) • IA (40%)" | Performance moyenne pondérée (60% notes élèves, 40% score IA) |

### Tableau des Cours

| Colonne | Description |
|---------|-------------|
| **Matière** | Nom de la matière (ex: SVT, Mathématiques, Français) |
| **Thème** | Titre du cours/chapitre (ex: "La photosynthèse") |
| **📊 Performance** | Score moyen du cours ou "N/A" |
| **Actions** | Menu ••• (Voir, Modifier, Supprimer) |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/teacher/courses` | Liste des cours du professeur | `?search=...&subject=...` |
| `GET` | `/api/teacher/courses/stats` | Statistiques globales | - |
| `POST` | `/api/teacher/courses` | Créer un nouveau cours | `{ title, subject, content }` |
| `DELETE` | `/api/teacher/courses/[id]` | Supprimer un cours | - |

---

## 💾 Types & Interfaces

```typescript
interface TeacherCourse {
  id: string;
  subject: {
    id: string;
    name: string;          // "SVT", "Mathématiques"
    color: string;
  };
  title: string;           // "La photosynthèse"
  hasData: boolean;        // true si notes ou activité IA
  performance?: number;    // 0-100 ou null
  activeStudents: number;  // Nb élèves actifs sur ce cours
  createdAt: Date;
  updatedAt: Date;
}

interface CoursesStats {
  totalCourses: number;
  coursesWithData: number;      // Cours avec notes/activité
  activeStudents: number;       // Total élèves actifs
  averagePerformance?: number;  // Performance moyenne (60% élèves + 40% IA)
  studentWeight: number;        // 60%
  aiWeight: number;             // 40%
}
```

---

## 🎯 Comportements

### Création de Cours
- Bouton **+ Nouveau cours** : Ouvre modal ou page de création
- Formulaire : Matière (select), Titre, Description, Contenu
- Validation : Titre obligatoire, matière obligatoire
- Création → Ajout dans le tableau

### Statistiques
- **Total Cours** : Compte tous les cours créés
- **0 avec données** : Nb de cours ayant des notes ou activité IA
- **Élèves Actifs** : Nb d'élèves ayant interagi avec au moins 1 cours
- **Performance Moyenne** : Calculée avec pondération 60% notes + 40% IA

### Tableau
- **Tri** : Clic sur en-têtes de colonnes
- **Recherche** : Filtre par nom de cours ou matière (à ajouter)
- **Hover** : Effet de survol sur lignes
- **Performance** : 
  - "N/A" si aucune donnée
  - Pourcentage si données disponibles
  - Couleur conditionnelle (vert ≥60%, jaune 40-60%, rouge <40%)

### Menu Actions (•••)

| Action | Comportement |
|--------|--------------|
| **Voir** | Navigation vers détail du cours |
| **Modifier** | Ouvre modal/page d'édition |
| **Supprimer** | Dialogue de confirmation + suppression |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton "+ Nouveau cours" | new.md ou modal création |
| Clic sur ligne (Voir) | detail/[id].md |
| Menu "Modifier" | edit/[id].md ou modal |
| ← Sidebar Dashboard | ../dashboard.md |

---

## 📝 Notes

> **Exemple de données (Marc DUPONT)** :
> - Total Cours : 1
> - Cours avec données : 0
> - Élèves Actifs : 0 (année scolaire en cours)
> - Performance Moyenne : N/A (aucune donnée)
> - Cours visible : SVT - "La photosynthèse" (Performance N/A)

> **États possibles** :
> - **Aucun cours** : Tableau vide avec message "Créez votre premier cours"
> - **Cours sans données** : Performance "N/A"
> - **Cours avec données** : Performance affichée en %

> **Pondération Performance** :
> - 60% : Moyenne des notes élèves (contrôle continu + exams)
> - 40% : Score IA moyen (interactions, compréhension)
> - Formule : `(studentAvg * 0.6) + (aiAvg * 0.4)`

> **Cours "avec données"** :
> - Au moins 1 note d'élève OU 1 session IA enregistrée
> - Indicateur visible dans la carte "Total Cours"

> **Performance** :
> - Cache des statistiques (5 minutes)
> - Mise à jour en temps réel lors de la création/suppression
> - Skeleton loaders pendant le chargement

> **Permissions** :
> - Professeur voit uniquement SES cours
> - Ne peut pas voir les cours d'autres professeurs
> - Admin peut voir tous les cours (route différente)

---

**Navigation** :
- ← [Dashboard Teacher](../dashboard.md)
- → [Nouveau cours](new.md) *(à documenter)*
- → [Détail cours](detail/[id].md) *(à documenter)*

*Date : 13 décembre 2025*

