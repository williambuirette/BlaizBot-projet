# Mes Cours

> **Chemin de navigation** : Login → Dashboard Student → Sidebar → **Mes cours**  
> **Route** : `/student/courses`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/courses/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Sidebar → Mes cours
   └── VOUS ÊTES ICI

5. Clic sur "Voir" (ligne du tableau)
   └── student/courses/detail/[id].md
```

---

## 📸 Aperçu Visuel

```
┌─────────────────────────────────────────────────────────────────────────┐
│ [Sidebar]  │  Mes Cours                           🔍 Rechercher...  🔔 👤│
├────────────┼───────────────────────────────────────────────────────────┤
│            │                                                           │
│ Dashboard  │  Mes Cours                                                │
│ Mes cours● │  Accédez à vos cours et suivez votre progression.        │
│ Mes révis. │                                                           │
│ Agenda     │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐   │
│ Assistant  │  │ 📚 1     │ │ ✅ 1     │ │ ⏱️  0     │ │ 📈 100%  │   │
│ IA         │  │ Mes Cours│ │ Terminés │ │ En Cours │ │ Progress.│   │
│ Messages   │  │ cours    │ │ cours    │ │ cours en │ │ moyenne  │   │
│            │  │ disponib.│ │ complétés│ │ progress │ │ globale  │   │
│            │  └──────────┘ └──────────┘ └──────────┘ └──────────┘   │
│            │                                                           │
│            │  Filtres:                                                │
│            │  Professeur: [Tous les profs ▼] Matière: [Toutes ▼]     │
│            │  Thématique: [Toutes ▼]         Statut: [Tous statuts ▼]│
│            │                                                           │
│            │  ┌─────────────────────────────────────────────────────┐│
│            │  │ Matière │ Thème        │ Professeur │ 📖 │ ✏️ │ % │ S │ Action │
│            │  ├─────────────────────────────────────────────────────┤│
│            │  │ SVT     │ La photo-    │ Marc       │1/1 │ 1 │100│Terminé│[👁️ Voir]│
│            │  │         │ synthèse     │ DUPONT     │    │   │   │       │      │
│            │  └─────────────────────────────────────────────────────┘│
│            │                                                           │
└────────────┴───────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Card` | `@/components/ui/card` | Cards KPIs |
| `Select` | `@/components/ui/select` | Filtres dropdowns |
| `Table` | `@/components/ui/table` | Tableau des cours |
| `Badge` | `@/components/ui/badge` | Badge statut |
| `Button` | `@/components/ui/button` | Bouton "Voir" |
| `Progress` | `@/components/ui/progress` | Barre progression |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/courses` | Récupérer les cours de l'élève | Query: filters |
| `GET` | `/api/student/courses/stats` | Statistiques globales (KPIs) | - |

---

## 💾 Types & Interfaces

```typescript
interface StudentCourseListItem {
  id: string;
  subjectName: string; // Ex: "SVT"
  subjectColor: string;
  title: string; // Ex: "La photosynthèse"
  teacherName: string; // Ex: "Marc DUPONT"
  chaptersCompleted: number;
  chaptersTotal: number;
  exercisesCount: number;
  progressPercentage: number; // 0-100
  status: 'NOT_STARTED' | 'IN_PROGRESS' | 'COMPLETED';
  courseId: string;
}

interface StudentCoursesStats {
  totalCourses: number;
  completedCourses: number;
  inProgressCourses: number;
  averageProgress: number; // 0-100
}

interface CoursesFilters {
  teacherId?: string;
  subjectId?: string;
  thematicId?: string;
  status?: 'NOT_STARTED' | 'IN_PROGRESS' | 'COMPLETED' | 'ALL';
}
```

---

## 📋 Structure de la Page

### KPIs (4 cards)

#### 1. 📚 Mes Cours
- **Icône** : 📚 (bleu)
- **Valeur** : `X` (nombre total)
- **Label** : "cours disponibles"

#### 2. ✅ Terminés
- **Icône** : ✅ (vert)
- **Valeur** : `X` (nombre complétés)
- **Label** : "cours complétés"

#### 3. ⏱️ En Cours
- **Icône** : ⏱️ (orange)
- **Valeur** : `X` (nombre en progression)
- **Label** : "cours en progression"

#### 4. 📈 Progression
- **Icône** : 📈 (violet)
- **Valeur** : `X%` (moyenne globale)
- **Label** : "moyenne globale"

### Filtres

4 dropdowns en ligne :
- **Professeur** : Liste des profs assignés (défaut: "Tous les profs")
- **Matière** : Liste des matières (défaut: "Toutes")
- **Thématique** : Liste des thématiques (défaut: "Toutes")
- **Statut** : Non commencé / En cours / Terminé / Tous (défaut: "Tous les statuts")

### Tableau des Cours

| Colonne | Type | Description |
|---------|------|-------------|
| **Matière** | Texte | Nom matière (ex: "SVT") |
| **Thème** | Texte | Titre du cours (ex: "La photosynthèse") |
| **Professeur** | Texte | Nom complet (ex: "Marc DUPONT") |
| **📖 Chapitres** | Badge | `X/Y` (complétés/total) |
| **✏️ Exercices** | Badge | Nombre exercices disponibles |
| **Progression** | Progress Bar | Barre + pourcentage (0-100%) |
| **Statut** | Badge | "Terminé" (vert) / "En cours" (orange) / "Non commencé" (gris) |
| **Action** | Button | 👁️ Voir → Redirection vers `/student/courses/[id]` |

---

## 🔄 Comportements

### Affichage initial
- Charge stats + liste cours depuis API
- Filtres par défaut : "Tous"
- Tri par défaut : Ordre alphabétique matière

### Filtrage
- Changement filtre → Recharge tableau
- Filtres cumulatifs (ET logique)
- Résultat vide → Message "Aucun cours trouvé"

### Clic "Voir"
- Redirection vers `/student/courses/[courseId]`
- Ouvre la page détail du cours avec onglets

### Progression
- Barre progress colorée selon statut :
  - 0% : Gris
  - 1-99% : Orange
  - 100% : Vert

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Changement filtre** | Recharge tableau avec critères |
| **Cliquer "Voir"** | Redirection `/student/courses/[id]` |
| **Recherche (header)** | Recherche globale (tous types) |

---

## 🎯 Calculs des KPIs

### Total Cours
```typescript
const totalCourses = courses.length;
```

### Terminés
```typescript
const completedCourses = courses.filter(c => c.status === 'COMPLETED').length;
```

### En Cours
```typescript
const inProgressCourses = courses.filter(c => c.status === 'IN_PROGRESS').length;
```

### Progression Moyenne
```typescript
const averageProgress = 
  courses.reduce((sum, c) => sum + c.progressPercentage, 0) / courses.length;
// Affichage : `${Math.round(averageProgress)}%`
```

---

## 📊 Récapitulatif Technique

**Type de page** : Liste avec filtres + KPIs  
**Layout** : KPIs (4 cards) + Filtres (4 selects) + Tableau  
**Données** : Temps réel depuis API `/api/student/courses`  
**Refresh** : Au chargement + après filtrage  
**Navigation** : Clic "Voir" → Détail cours `/student/courses/[id]`  

**Performance** :
- Cache stats pendant 1 minute
- Pagination si > 20 cours
- Lazy load tableau

---

**Navigation** :
- ← [Dashboard](../dashboard.md)
- → [Détail cours]([id]/cours.md) (après clic "Voir")

---

*Fichier créé le 13 décembre 2025*
