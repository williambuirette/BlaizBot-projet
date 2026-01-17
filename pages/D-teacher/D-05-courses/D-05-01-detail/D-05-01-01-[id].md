# Détail Cours - La photosynthèse

> **Chemin de navigation** : Login → Dashboard Teacher → Mes cours → **La photosynthèse**  
> **Route** : `/teacher/courses/95beaeaa-e294-4ce0-a067-fa2436c10c497` (dynamique : `/teacher/courses/[id]`)  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/courses/[id]/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes cours
   └── teacher/courses/liste.md

4. Clic sur ligne cours (SVT - La photosynthèse)
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Détail Cours

### Onglet : Informations

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  ←  La photosynthèse  [Publié]              🔧 Dépublier       │
│            │     SVT                                                         │
│ 🏫 Mes     │                                                                 │
│   classes  │  ℹ️  Informations        📚 Cours                                │
│            │  ───────────────                                                │
│ 👥 Mes     │                                                                 │
│   élèves   │  ℹ️  Aucune évaluation IA disponible pour ce cours              │
│            │                                                                 │
│ 📚 Mes     │  ┌──────────────────────┐ ┌─────────────────────────────────┐  │
│   cours    │  │ Informations         │ │ Statistiques                    │  │
│            │  │ générales            │ │ Vue d'ensemble du contenu       │  │
│ 📅 Agendas │  │                      │ │                                 │  │
│   et       │  │ Titre                │ │      1                          │  │
│   Assigna. │  │ La photosynthèse     │ │   Chapitres                     │  │
│            │  │                      │ │                                 │  │
│ 💬 Messag. │  │ Description          │ │      0                          │  │
│            │  │ Introduction à la    │ │   Ressources                    │  │
│            │  │ photosynthèse        │ │                                 │  │
│            │  │                      │ │      4                          │  │
│            │  │ Matière              │ │   Assignations                  │  │
│            │  │ SVT                  │ └─────────────────────────────────┘  │
│            │  │                      │                                      │
│            │  │ Difficulté           │                                      │
│            │  │ Intermédiaire        │                                      │
│            │  │                      │                                      │
│            │  │ Durée                │                                      │
│            │  │ Non définie          │                                      │
│            │  │                      │                                      │
│            │  │ Statut               │                                      │
│            │  │ [Publié]             │                                      │
│            │  └──────────────────────┘                                      │
│            │                                                                 │
│            │  Objectifs pédagogiques                                         │
│            │  • apprendre                                                    │
│            │                                                                 │
│            │  📎 Ressources du cours                                         │
│            │  Documents, vidéos et fichiers disponibles pour vos élèves     │
│            │                                                                 │
│            │  ┌───────────────────────────────────────────────┐  [+ Ajouter]│
│            │  │ ⬆ Aucune ressource pour le moment.           │             │
│            │  │   Glissez pour ajouter des documents,         │             │
│            │  │   vidéos, audio...                            │             │
│            │  └───────────────────────────────────────────────┘             │
│            │                                                                 │
└────────────┴─────────────────────────────────────────────────────────────────┘
```

### Onglet : Cours

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │  ←  La photosynthèse  [Publié]              🔧 Dépublier       │
│            │     SVT                                                         │
│            │                                                                 │
│            │  ℹ️  Informations        📚 Cours                                │
│            │                          ─────                                  │
│            │                                                                 │
│            │  📖 Structure du cours                     [+ Ajouter un chapitre]│
│            │                                                                 │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ ≡  📘 Introduction                      2 sections  🖊 🗑   │ │
│            │  ├───────────────────────────────────────────────────────────┤ │
│            │  │    📄 Introduction                                        │ │
│            │  │       Leçon    2 Contenus        🖊  ✏️  🗑  ⋮            │ │
│            │  ├───────────────────────────────────────────────────────────┤ │
│            │  │    ▶️ Vidéo photosynthèse                                 │ │
│            │  │       Vidéo    2 Contenus        🖊  ✏️  🗑  ⋮            │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │                                                                 │
│            │  + Ajouter une section                                          │
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
| `Button` | `@/components/ui/button` | Boutons Dépublier, Ajouter |
| `Tabs` | `@/components/ui/tabs` | Onglets (Informations, Cours) |
| `Card` | `@/components/ui/card` | Cartes infos/stats |
| `Badge` | `@/components/ui/badge` | Badges statut (Publié, Leçon, Vidéo) |
| `Alert` | `@/components/ui/alert` | Info IA indisponible |
| `FileUpload` | `@/components/ui/file-upload` | Zone drag & drop ressources |
| `Accordion` | `@/components/ui/accordion` | Chapitres pliables |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions (⋮) |

---

## 📊 Structure de la Page

### En-tête

| Élément | Description |
|---------|-------------|
| **← Bouton** | Retour à la liste des cours |
| **Titre** | Nom du cours (ex: "La photosynthèse") |
| **Sous-titre** | Matière (ex: "SVT") |
| **Badge Statut** | [Publié] ou [Brouillon] |
| **🔧 Dépublier** | Repasser en brouillon |

### Onglets (2)

| Onglet | Contenu |
|--------|---------|
| **ℹ️ Informations** | Métadonnées + statistiques + ressources |
| **📚 Cours** | Structure arborescente (chapitres + cartes) |

---

## ℹ️ Onglet : Informations

### Bannière Évaluation IA

| Condition | Affichage |
|-----------|-----------|
| Aucune évaluation IA | ℹ️ "Aucune évaluation IA disponible pour ce cours" (bleu) |
| Évaluations disponibles | Masqué |

### Section : Informations générales

| Champ | Description | Exemple |
|-------|-------------|---------|
| **Titre** | Nom du cours | "La photosynthèse" |
| **Description** | Description courte | "Introduction à la photosynthèse" |
| **Matière** | Matière du cours | "SVT" |
| **Difficulté** | Niveau | "Intermédiaire" |
| **Durée** | Durée estimée | "Non définie" ou "45 minutes" |
| **Statut** | Badge statut | [Publié] ou [Brouillon] |

### Section : Statistiques

| Statistique | Description |
|-------------|-------------|
| **Chapitres** | Nombre de chapitres dans le cours |
| **Ressources** | Nombre de fichiers attachés |
| **Assignations** | Nombre d'assignations utilisant ce cours |

### Section : Objectifs pédagogiques

- Liste à puces des objectifs
- Format : 1 ligne = 1 objectif
- Exemple : "• apprendre"

### Section : Ressources du cours

| Élément | Description |
|---------|-------------|
| **Titre** | "📎 Ressources du cours" |
| **Sous-titre** | "Documents, vidéos et fichiers disponibles pour vos élèves" |
| **Zone Upload** | Drag & drop ou clic |
| **État vide** | "⬆ Aucune ressource pour le moment. Glissez pour ajouter..." |
| **Bouton** | "+ Ajouter" |

---

## 📚 Onglet : Cours (Structure Arborescente)

### Titre Section

- **📖 Structure du cours**
- Bouton : **+ Ajouter un chapitre**

### Arborescence

```
Cours (ex: La photosynthèse)
├── 📘 Chapitre 1 (ex: Introduction)
│   ├── 📄 Carte 1 (type: Leçon)
│   ├── ▶️ Carte 2 (type: Vidéo)
│   ├── ✏️ Carte 3 (type: Exercice)
│   └── ❓ Carte 4 (type: Quiz)
├── 📘 Chapitre 2
│   └── ...
└── + Ajouter une section
```

### Chapitre (Accordion)

| Élément | Description |
|---------|-------------|
| **≡ Icône** | Handle de drag (réordonnancement) |
| **📘 Icône** | Icône chapitre |
| **Nom** | Nom du chapitre (ex: "Introduction") |
| **Compteur** | "X sections" |
| **Actions** | 🖊 Modifier, 🗑 Supprimer |
| **Expand/Collapse** | Clic pour ouvrir/fermer |

### Carte (dans un chapitre)

| Élément | Description |
|---------|-------------|
| **Icône** | Selon le type (📄 Leçon, ▶️ Vidéo, ✏️ Exercice, ❓ Quiz) |
| **Nom** | Titre de la carte (ex: "Introduction", "Vidéo photosynthèse") |
| **Badge Type** | "Leçon", "Vidéo", "Exercice", "Quiz" |
| **Compteur** | "X Contenus" |
| **Actions** | 🖊 Voir/Modifier, ✏️ Éditer, 🗑 Supprimer, ⋮ Menu |

### Types de Cartes

| Type | Icône | Badge | Description |
|------|-------|-------|-------------|
| **Leçon** | 📄 | Leçon | Contenu pédagogique texte/rich media |
| **Vidéo** | ▶️ | Vidéo | Vidéo embarquée (YouTube, Vimeo, upload) |
| **Exercice** | ✏️ | Exercice | Exercices pratiques avec correction |
| **Quiz** | ❓ | Quiz | Questions à choix multiples/réponses courtes |

### Actions

| Action | Bouton | Comportement |
|--------|--------|--------------|
| **Ajouter chapitre** | + Ajouter un chapitre | Modal : Nom du chapitre → Création |
| **Ajouter section** | + Ajouter une section | Modal : Type (Leçon, Vidéo, Exercice, Quiz) + Nom |
| **Modifier chapitre** | 🖊 | Modal : Éditer le nom |
| **Supprimer chapitre** | 🗑 | Confirmation → Suppression (+ toutes ses cartes) |
| **Réordonner** | ≡ (drag) | Drag & drop pour changer l'ordre |
| **Voir/Modifier carte** | 🖊 | Navigation vers détail carte (selon type) |
| **Éditer carte** | ✏️ | Modal : Éditer nom/paramètres |
| **Supprimer carte** | 🗑 | Confirmation → Suppression |
| **Menu carte** | ⋮ | Dupliquer, Déplacer, Archiver |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/teacher/courses/[id]` | Détails du cours | - |
| `GET` | `/api/teacher/courses/[id]/structure` | Structure (chapitres + cartes) | - |
| `PATCH` | `/api/teacher/courses/[id]/status` | Publier/Dépublier | `{ status: "PUBLISHED" \| "DRAFT" }` |
| `POST` | `/api/teacher/courses/[id]/chapters` | Créer chapitre | `{ name, order }` |
| `PATCH` | `/api/teacher/courses/[id]/chapters/[chapterId]` | Modifier chapitre | `{ name }` |
| `DELETE` | `/api/teacher/courses/[id]/chapters/[chapterId]` | Supprimer chapitre | - |
| `POST` | `/api/teacher/courses/[id]/chapters/[chapterId]/cards` | Créer carte | `{ type, title, content }` |
| `PATCH` | `/api/teacher/courses/[id]/cards/[cardId]` | Modifier carte | `{ title, content }` |
| `DELETE` | `/api/teacher/courses/[id]/cards/[cardId]` | Supprimer carte | - |
| `POST` | `/api/teacher/courses/[id]/resources` | Ajouter ressource | FormData |
| `PATCH` | `/api/teacher/courses/[id]/reorder` | Réordonner éléments | `{ chapters: [{id, order}] }` |

---

## 💾 Types & Interfaces

```typescript
interface CourseDetail {
  id: string;
  title: string;
  description?: string;
  subject: {
    id: string;
    name: string;
    color: string;
  };
  difficulty?: "BEGINNER" | "INTERMEDIATE" | "ADVANCED";
  duration?: number;              // Minutes
  status: "DRAFT" | "PUBLISHED";
  objectives?: string[];
  stats: {
    chapterCount: number;
    resourceCount: number;
    assignmentCount: number;
  };
  hasAiEvaluation: boolean;
  createdAt: Date;
  updatedAt: Date;
}

interface CourseChapter {
  id: string;
  courseId: string;
  name: string;
  order: number;
  cards: CourseCard[];
}

interface CourseCard {
  id: string;
  chapterId: string;
  type: "LESSON" | "VIDEO" | "EXERCISE" | "QUIZ";
  title: string;
  content?: string;              // Pour Leçon (HTML)
  videoUrl?: string;             // Pour Vidéo
  exerciseData?: ExerciseData;   // Pour Exercice
  quizData?: QuizData;           // Pour Quiz
  contentCount: number;          // Nb d'éléments dans la carte
  order: number;
  createdAt: Date;
}

interface ExerciseData {
  questions: {
    id: string;
    text: string;
    answer: string;
    hint?: string;
  }[];
}

interface QuizData {
  questions: {
    id: string;
    text: string;
    type: "MCQ" | "SHORT_ANSWER";
    options?: string[];          // Pour MCQ
    correctAnswer: string;
    explanation?: string;
  }[];
}

interface CourseResource {
  id: string;
  courseId: string;
  name: string;
  type: string;                  // MIME type
  url: string;
  size: number;                  // Bytes
  uploadedAt: Date;
}
```

---

## 🎯 Comportements

### Onglet Informations

#### Dépublier
- Bouton **🔧 Dépublier** : Repasse le cours en brouillon
- Confirmation : "Êtes-vous sûr ? Le cours ne sera plus accessible aux élèves"
- Succès : Badge passe de [Publié] à [Brouillon]

#### Ressources
- **Drag & Drop** : Upload direct de fichiers
- **Clic zone** : File picker
- **Ajout** : Fichier ajouté dans la liste
- **Suppression** : Icône × sur chaque ressource

### Onglet Cours (Structure)

#### Chapitres
- **Accordion** : Clic pour expand/collapse
- **Drag & Drop** : Réordonner avec handle ≡
- **Ajouter** : Modal "Nom du chapitre" → Création
- **Modifier** : Modal "Nouveau nom" → Mise à jour
- **Supprimer** : Confirmation + suppression cascade (cartes incluses)

#### Cartes
- **Types visuels** : Icône + badge selon le type
- **Ajouter** : 
  1. Clic "+ Ajouter une section"
  2. Modal : Sélection type (Leçon/Vidéo/Exercice/Quiz)
  3. Nom de la carte
  4. Création → Redirection vers éditeur spécifique
- **Modifier** : Navigation vers page d'édition selon le type
- **Supprimer** : Confirmation → Suppression
- **Menu (⋮)** :
  - Dupliquer : Copie la carte
  - Déplacer : Changer de chapitre
  - Archiver : Masquer (pas supprimer)

#### Réordonnancement
- **Chapitres** : Drag handle ≡ → Réordonnancement visuel + sauvegarde API
- **Cartes** : Drag & drop dans un chapitre → Mise à jour ordre

### États Vides

| Condition | Affichage |
|-----------|-----------|
| Aucun chapitre | "Créez votre premier chapitre pour structurer le cours" |
| Chapitre sans carte | "Ajoutez une section (Leçon, Vidéo, Exercice, Quiz)" |
| Aucune ressource | "⬆ Aucune ressource pour le moment..." |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton **←** | [../liste.md](../liste.md) |
| Modifier cours (général) | [edit.md](edit.md) |
| Modifier carte Leçon | cards/lesson/[cardId].md *(à documenter)* |
| Modifier carte Vidéo | cards/video/[cardId].md *(à documenter)* |
| Modifier carte Exercice | cards/exercise/[cardId].md *(à documenter)* |
| Modifier carte Quiz | cards/quiz/[cardId].md *(à documenter)* |
| ← Sidebar Mes cours | [../liste.md](../liste.md) |

---

## 📝 Notes

> **Exemple de données (La photosynthèse)** :
> - Titre : "La photosynthèse"
> - Matière : SVT
> - Difficulté : Intermédiaire
> - Durée : Non définie
> - Statut : Publié
> - Objectifs : "• apprendre"
> - Statistiques : 1 chapitre, 0 ressources, 4 assignations
> - Structure :
>   - Chapitre "Introduction" (2 sections)
>     - Carte "Introduction" (type: Leçon, 2 Contenus)
>     - Carte "Vidéo photosynthèse" (type: Vidéo, 2 Contenus)

> **Structure hiérarchique** :
> - **Cours** : Conteneur principal
> - **Chapitres** : Sections thématiques (ex: Introduction, Développement, Conclusion)
> - **Cartes** : Contenus pédagogiques typés (Leçon, Vidéo, Exercice, Quiz)
> - **Contenus** : Éléments dans une carte (texte, images, vidéos, questions)

> **Types de cartes détaillés** :
> - **Leçon (📄)** : Texte riche avec images, tableaux, médias embarqués
> - **Vidéo (▶️)** : Vidéo YouTube/Vimeo ou uploadée, avec transcription optionnelle
> - **Exercice (✏️)** : Questions ouvertes avec correction automatique ou manuelle
> - **Quiz (❓)** : QCM ou réponses courtes avec score automatique

> **Permissions** :
> - Professeur peut CRUD ses propres cours
> - Dépublication : retrait immédiat de l'accès élèves
> - Suppression chapitre : cascade sur toutes les cartes
> - Suppression cours : soft delete (archivage)

> **Performance** :
> - Lazy loading des chapitres (accordions)
> - Cache structure (5 minutes)
> - Optimistic UI pour drag & drop
> - Skeleton loaders pendant chargement

> **Statut Publié vs Brouillon** :
> - **Publié** : Accessible aux élèves, visible dans assignations
> - **Brouillon** : Visible uniquement par le professeur, éditable sans impact
> - Changement de statut : confirmation requise

> **Contenus dans cartes** :
> - Compteur "X Contenus" indique le nombre d'éléments dans la carte
> - Exemple : Carte Leçon avec 2 paragraphes + 1 image = "3 Contenus"

---

**Navigation** :
- ← [Liste des cours](../liste.md)
- → [Éditer cours](edit.md)
- → [Cartes (détail selon type)](cards/) *(à documenter)*

*Date : 13 décembre 2025*
