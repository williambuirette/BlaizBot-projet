# [Cours] - Détail

> **Chemin de navigation** : Login → Dashboard Student → Mes cours → **[Nom du cours]**  
> **Route** : `/student/courses/[id]`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/courses/[id]/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Sidebar → Mes cours
   └── student/courses/page.md

4. Clic sur "Voir" (ligne du tableau)
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Page Détail Cours

> **Note** : Page avec 2 onglets

### En-tête (commun aux 2 onglets)

```
┌─────────────────────────────────────────────────────────────────┐
│  ←  [Titre du cours]                              [Matière]     │
│     Par [Nom Professeur]                                        │
│                                                                 │
│  Ma progression                                        XX%      │
│  ████████████████████████████████████                          │
│  X / Y chapitres terminés                Z sections au total  │
├─────────────────────────────────────────────────────────────────┤
│  📋 Informations          📚 Cours                              │
│  ────────────                                                   │
```

> **⚡ Fonctionnalités** :
> - Bouton retour (←) vers la liste des cours
> - Badge matière coloré (dynamique selon la matière)
> - Barre de progression visà-vis calculée en temps réel (cartes complétées / total)
> - Onglets avec synchronisation URL (`?tab=informations` ou `?tab=cours`)

---

### Onglet 1 : 📋 Informations

```
┌─────────────────────────────────────────────────────────────────┐
│  📋 Informations générales                                      │
│  Détails du cours                                               │
│                                                                 │
│  Titre                                                          │
│  [Titre du cours]                                               │
│                                                                 │
│  Description                                                    │
│  [Description du cours]                                         │
│                                                                 │
│  Matière                                                        │
│  [Nom de la matière]                                            │
│                                                                 │
│  👨‍🏫 Professeur : [Nom Professeur]                             │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  📊 Statistiques                                                │
│  Vue d'ensemble du contenu                                      │
│                                                                 │
│      X             Y             Z             W                │
│   Chapitres     Terminés       Leçons       Exercices          │
│                                                                 │
│  Progression globale                               XX%          │
│  ██████████████████████████                                  │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  📅 Échéances                                                   │
│  Deadline du professeur et votre objectif personnel             │
│                                                                 │
│  📚 Échéance professeur                 ✏️ Modifier ma deadline │
│  🕐 Deadline : [Date]                                           │
│  [Titre assignation]                                            │
│                                                                 │
│  📝 Mon objectif personnel                                      │
│  [Date personnelle] OU "Définir ma deadline" (si vide)          │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  📄 Ressources du cours                                         │
│  Documents et fichiers fournis par le professeur               │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  📄 [Nom fichier 1].pdf                     Télécharger   │  │
│  │  🖼️ [Nom fichier 2].jpg                     Télécharger   │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                 │
│  État vide : "📁 Aucune ressource disponible"                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Onglet 2 : 📚 Cours

```
┌─────────────────────────────────────────────────────────────────┐
│  📚 Contenu du cours                              Terminé  ▲    │
│  Parcourez les chapitres et réalisez les exercices pour         │
│  progresser                                                     │
│                                                                 │
│  ✅  1   Introduction                           4 sections      │
│       ┌─────────────────────────────────────────────────────┐  │
│       │  📄 [Titre carte 1]                      Leçon    →  │  │
│       │  🎬 [Titre carte 2]                      Vidéo    →  │  │
│       │  📄 [Titre carte 3]                      Leçon    →  │  │
│       │  ✏️ [Titre carte 4]                   Exercice  →  │  │
│       │  📝 [Titre carte 5]                      Quiz     →  │  │
│       │  🎬 [Titre carte 6]                      Vidéo    →  │  │
│       └─────────────────────────────────────────────────────┘  │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│  🎒 Mes suppléments                                  + Créer    │
│  Vos notes et ressources personnelles liées à ce cours          │
│                                                                 │
│  📚 1. [Titre supplément 1]                   Z cartes   ▲    │
│       ┌─────────────────────────────────────────────────────────┐  │
│       │  Modifier ce supplément ─                           │  │
│       │  📄 [Titre carte supplément 1]         Note     →  │  │
│       │  🎬 [Titre carte supplément 2]         Vidéo    →  │  │
│       │  📝 [Titre carte supplément 3]         Quiz     →  │  │
│       │  📝 [Titre carte 5]                      Quiz     →  │  │
│       │  🎬 [Titre carte 6]                      Vidéo    →  │  │
│       └─────────────────────────────────────────────────────────┘  │
│                                                                 │
│  État vide : "Aucun supplément créé pour ce cours"           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Card` | `@/components/ui/card` | Cards sections (Informations, Stats, Échéances) |
| `Tabs` | `@/components/ui/tabs` | Onglets Informations / Cours |
| `Progress` | `@/components/ui/progress` | Barre progression (header + stats) |
| `Badge` | `@/components/ui/badge` | Badge matière (SVT), types cartes |
| `Accordion` | `@/components/ui/accordion` | Chapitres + Suppléments expandables |
| `Button` | `@/components/ui/button` | Boutons navigation, Créer, Modifier |
| `Alert` | `@/components/ui/alert` | État vide (ressources, objectif perso) |
| `Separator` | `@/components/ui/separator` | Séparation entre sections |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/courses/[id]` | Détail du cours complet | - |
| `GET` | `/api/student/courses/[id]/progress` | Progression détaillée | - |
| `PATCH` | `/api/student/courses/[id]/deadline` | Définir objectif personnel | `{ personalDeadline: Date }` |
| `GET` | `/api/student/courses/[id]/supplements` | Suppléments de l'élève | - |

---

## 💾 Types & Interfaces

```typescript
interface StudentCourseDetail {
  id: string;
  title: string;
  description?: string;
  subjectName: string;
  subjectColor: string;
  teacherName: string;
  
  // Progression
  progressPercentage: number; // 0-100
  chaptersCompleted: number;
  chaptersTotal: number;
  lessonsTotal: number;
  exercisesTotal: number;
  
  // Échéances
  professorDeadline?: {
    date: Date;
    assignmentTitle: string;
  };
  personalDeadline?: Date;
  
  // Contenu
  chapters: Chapter[];
  resources: Resource[];
  supplements: Supplement[];
}

interface Chapter {
  id: string;
  title: string;
  order: number;
  status: 'NOT_STARTED' | 'IN_PROGRESS' | 'COMPLETED';
  cards: Card[];
}

interface Card {
  id: string;
  title: string;
  type: 'LESSON' | 'VIDEO' | 'EXERCISE' | 'QUIZ';
  status: 'NOT_STARTED' | 'IN_PROGRESS' | 'COMPLETED';
  order: number;
}

interface Supplement {
  id: string;
  title: string;
  cardCount: number;
  cards: SupplementCard[];
  createdAt: Date;
}

interface SupplementCard {
  id: string;
  title: string;
  type: 'NOTE' | 'VIDEO' | 'FLASHCARD' | 'QUIZ';
}

interface Resource {
  id: string;
  name: string;
  type: string;
  url: string;
  size: number;
}
```

---

## 📋 Structure de la Page

### Header (commun)

| Élément | Description |
|---------|-------------|
| **← Bouton** | Retour à la liste des cours |
| **Titre** | Nom du cours (ex: "La photosynthèse") |
| **Badge matière** | SVT (avec couleur) |
| **Professeur** | "Par Marc DUPONT" |
| **Barre progression** | Progression globale (ex: 100%) |
| **Détails** | "X / Y chapitres terminés" + "Z terminés sur total" |

### Onglet 1 : 📋 Informations

#### Section : Informations générales
- **Titre** : Nom du cours
- **Description** : Texte descriptif
- **Matière** : Nom de la matière
- **Professeur** : Nom complet avec emoji 👨‍🏫

#### Section : 📊 Statistiques
- **4 KPIs** (cards) :
  - Chapitres (nombre total)
  - Terminés (chapitres complétés)
  - Leçons (nombre total)
  - Exercices (nombre total)
- **Barre progression globale** : 0-100%

#### Section : 📅 Échéances
- **Échéance professeur** :
  - Icône 📚
  - Date deadline
  - Titre assignation
- **Mon objectif personnel** :
  - Icône 📝
  - Bouton "Définir ma deadline" (si vide)
  - Affichage date (si défini)
- **Bouton** : ✏️ Modifier ma deadline

#### Section : 📄 Ressources du cours
- **Liste fichiers** (si disponibles)
- **État vide** : "Aucune ressource disponible pour ce cours."

---

### Onglet 2 : 📚 Cours

#### Section : 📚 Contenu du cours

**Chapitres** (Accordion) :
- Icône statut : ✅ (complet), ⏱️ (en cours), ⚪ (non commencé)
- Numéro + Titre
- Badge : "X sections"
- État : Expand/Collapse

**Cartes par chapitre** :
| Icône | Type | Badge | Action |
|-------|------|-------|--------|
| 📄 | Leçon | "Leçon" | → |
| 🎬 | Vidéo | "Vidéo" | → |
| ✏️ | Exercice | "Exercice" | → |
| 📝 | Quiz | "Quiz" | → |

#### Section : 🎒 Mes suppléments

**Header** :
- Titre : "Mes suppléments"
- Description : "Vos notes et ressources personnelles liées à ce cours"
- Bouton : "+ Créer" (ouvre modale création supplément)

**Suppléments** (Accordion) :
- Icône 📚
- Numéro + Titre
- Badge : "X cartes"
- Lien : "Modifier ce supplément ─"
- Cartes du supplément (même format que cours)

**État vide** :
- Message : "Aucun supplément créé pour ce cours"
- Bouton : "+ Créer mon premier supplément"

---

## 🔄 Comportements

### Navigation Onglets
- Clic onglet → Change de vue
- URL synchronisée : `?tab=informations` ou `?tab=cours`
- Défaut : Onglet "Cours"

### Progression
- Mise à jour temps réel
- Calcul automatique : (cartes complétées / total) × 100
- Barre progress colorée :
  - 0-30% : Rouge
  - 31-70% : Orange
  - 71-100% : Vert

### Chapitres
- Clic sur header → Expand/Collapse
- État persisté (localStorage)
- Indicateur visuel (▲ ouvert, ▼ fermé)

### Cartes
- Clic sur carte → Redirection vers `/student/courses/[id]/cards/[cardId]`
- Badge coloré selon type

### Échéances

#### Définir objectif personnel
1. Clic "Définir ma deadline"
2. Modale DatePicker
3. Validation → PATCH API
4. Affichage date + bouton "Modifier"

### Suppléments

#### Créer supplément
1. Clic "+ Créer"
2. Redirection `/student/revisions?courseId=[id]`
3. Création supplément lié au cours
4. Retour automatique à cette page

#### Modifier supplément
1. Clic "Modifier ce supplément"
2. Redirection `/student/revisions/[supplementId]`

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Cliquer ←** | Retour `/student/courses` |
| **Cliquer onglet** | Change de vue (Informations ↔ Cours) |
| **Cliquer carte** | Ouvre `/student/courses/[id]/cards/[cardId]` |
| **Expand chapitre** | Affiche les cartes |
| **Définir deadline** | Modale DatePicker → Sauvegarde |
| **Créer supplément** | Redirection `/student/revisions?courseId=[id]` |
| **Modifier supplément** | Redirection `/student/revisions/[supplementId]` |

---

## 🎯 Calculs

### Progression globale
```typescript
const totalCards = chapters.flatMap(c => c.cards).length;
const completedCards = chapters.flatMap(c => c.cards).filter(card => card.status === 'COMPLETED').length;
const progressPercentage = (completedCards / totalCards) * 100;
```

### Chapitres terminés
```typescript
const completedChapters = chapters.filter(c => 
  c.cards.every(card => card.status === 'COMPLETED')
).length;
```

### Statut chapitre
```typescript
const chapterStatus = (chapter: Chapter) => {
  const total = chapter.cards.length;
  const completed = chapter.cards.filter(c => c.status === 'COMPLETED').length;
  
  if (completed === 0) return 'NOT_STARTED';
  if (completed === total) return 'COMPLETED';
  return 'IN_PROGRESS';
};
```

---

## 📊 Récapitulatif Technique

**Type de page** : Détail cours avec progression  
**Layout** : Header + 2 onglets (Informations / Cours)  
**Données** : API `/api/student/courses/[id]`  
**Refresh** : Au chargement + après action (deadline, carte)  
**État local** : Chapitres expand/collapse (localStorage)  

**Performance** :
- Cache données cours 5 minutes
- Lazy load cartes par chapitre
- Infinite scroll si > 50 cartes

---

**Navigation** :
- ← [Liste des cours](../liste.md)
- → [Carte Leçon](cards/lesson/[cardId].md), [Vidéo](cards/video/[cardId].md), [Exercice](cards/exercise/[cardId].md), [Quiz](cards/quiz/[cardId].md) *(après clic sur carte)*
- → [Révisions](../../../revisions/liste.md) *(créer/modifier supplément)*

---

*Fichier créé le 16 janvier 2026*
