# Carte Quiz - Quiz de compréhension

> **Chemin de navigation** : Login → Dashboard Teacher → Mes cours → La photosynthèse → Chapitre → **Carte Quiz**  
> **Route** : `/teacher/courses/[courseId]/cards/quiz/[cardId]`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/courses/[courseId]/cards/quiz/[cardId]/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes cours
   └── teacher/courses/liste.md

4. Clic sur cours "La photosynthèse"
   └── teacher/courses/detail/[id].md

5. Onglet "Cours" → Chapitre → Clic sur carte Quiz ❓
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Carte Quiz

### En-tête de la carte (modal plein écran)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ ≡ 📝 Carte quiz                         Quiz  Vide  🖊  🗑  ...   👁 Aperçu  │
└──────────────────────────────────────────────────────────────────────────────┘
```

### Onglet : Génération IA (screenshot fourni)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres                                       │
│            ─────────────                                                      │
│                                                                               │
│ 🔮 Générer avec l'IA                                                          │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Décrivez les questions que vous souhaitez générer... Ex: 5 questions     ││
│ │ sur la photosynthèse niveau 3ème                                          ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                      🔮 Générer des questions                             ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│                     Aucune question pour le moment.                           │
│              Ajoutez des questions manuellement ou générez-les avec l'IA.     │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                        + Ajouter une question                             ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ─────────────────────────────────────────────────────────────────────────── │
│                                                                               │
│ Instructions pour l'IA (optionnel)                                            │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Donnez du contexte à l'IA pour ce quiz...                                ││
│ │                                                                           ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ Ces instructions seront utilisées par l'assistant IA pour aider l'élève      │
│                                                                               │
│ ─────────────────────────────────────────────────────────────────────────── │
│                                                                               │
│ 📄 Base de connaissance                                        0 fichier     │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                                  ⬆                                        ││
│ │                     Glissez vos fichiers ici ou                           ││
│ │                              Parcourir                                    ││
│ │                     PDF, images, documents...                             ││
│ │                                                                           ││
│ │                      Aucun fichier ajouté                                 ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│                                                                               │
│ ×  Annuler                                                    💾 Enregistrer │
└──────────────────────────────────────────────────────────────────────────────┘
```

### Onglet : Contenu (à documenter)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres                                       │
│ ───────                                                                       │
│                                                                               │
│ [Questions QCM avec options, types, réorganisation...]                        │
│                                                                               │
│ 📄 Base de connaissance                                        0 fichier     │
│                                                                               │
│ [Même zone drag & drop]                                                       │
│                                                                               │
│ ×  Annuler                                                    💾 Enregistrer │
└──────────────────────────────────────────────────────────────────────────────┘
```

### Onglet : Paramètres (à documenter)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres                                       │
│                             ──────────                                        │
│                                                                               │
│ Paramètres du quiz                                                            │
│ ☐ Mélanger les questions                                                      │
│ ☐ Mélanger les réponses                                                       │
│ ☑ Afficher le score immédiatement                                             │
│                                                                               │
│ Temps limite (minutes)                                                        │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ 15                                                                        ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ Total des points : 0                                                          │
│ Nombre de questions : 0                                                       │
│                                                                               │
│ 📄 Base de connaissance                                        0 fichier     │
│                                                                               │
│ [Même zone drag & drop]                                                       │
│                                                                               │
│ ×  Annuler                                                    💾 Enregistrer │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DashboardShell` | `@/components/layout/DashboardShell` | Layout avec sidebar |
| `Header` | `@/components/layout/Header` | Barre supérieure |
| `Sidebar` | `@/components/layout/Sidebar` | Navigation professeur |
| `Button` | `@/components/ui/button` | Boutons Enregistrer, Ajouter |
| `Input` | `@/components/ui/input` | Titre, points, temps limite |
| `Textarea` | `@/components/ui/textarea` | Description, énoncés |
| `Checkbox` | `@/components/ui/checkbox` | Paramètres quiz |
| `RadioGroup` | `@/components/ui/radio-group` | Type de question, options réponses |
| `Accordion` | `@/components/ui/accordion` | Questions pliables |
| `Sortable` | `@/components/ui/sortable` | Drag & drop questions/options |

---

---

## 🏗 Structure de la Page

### En-tête (modal plein écran)

- **Icône** : ≡ (menu hamburger)
- **Badge Type** : 📝 Carte quiz
- **Badges Status** : Quiz (orange) + Vide (gris)
- **Actions** :
  - 🖊 Éditer
  - 🗑 Supprimer
  - ... Plus d'options
  - 👁 Aperçu

### Navigation par onglets (3 onglets)

1. **Contenu** (onglet actif par défaut)
2. **Génération IA**
3. **Paramètres**

---

### ONGLET 1 : Contenu (À DOCUMENTER)

#### Section : Liste des questions

- **En-tête** : "Liste des questions (X questions)"
- **Bouton** : + Ajouter question
- **Accordion de questions** avec drag & drop

#### Types de Questions

| Type | Description | Options |
|------|-------------|---------|
| **QCM (choix unique)** | Une seule bonne réponse | 2-6 options |
| **QCM (choix multiples)** | Plusieurs bonnes réponses | 2-10 options |
| **Réponse courte** | Texte libre court (1-2 lignes) | Mots-clés acceptés |
| **Vrai/Faux** | Question binaire | 2 options fixes |

#### Champs Question

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| **Type** | RadioGroup | ✅ | Type de question |
| **Énoncé** | Textarea | ✅ | Question posée |
| **Options de réponse** | Liste dynamique | ✅* | Options pour QCM (*si QCM/Vrai-Faux) |
| **Réponse(s) correcte(s)** | Checkbox/Radio | ✅* | Marquage de la/les bonne(s) réponse(s) |
| **Mots-clés acceptés** | Input tags | ✅* | Pour Réponse courte (*si Réponse courte) |
| **Explication** | Textarea | ❌ | Feedback après réponse |
| **Points** | Input number | ✅ | Valeur de la question |

#### Section : Base de connaissance

- **En-tête** : 📄 Base de connaissance | Compteur : `0 fichier`
- **Zone de drag & drop** :
  - Icône ⬆ (upload)
  - Texte : "Glissez vos fichiers ici ou **Parcourir**"
  - Formats acceptés : "PDF, images, documents..."
  - État vide : "Aucun fichier ajouté"
  - Limites : max 10 MB, max 10 fichiers

---

### ONGLET 2 : Génération IA

#### Section : 🔮 Générer avec l'IA

- **Textarea** : "Décrivez les questions que vous souhaitez générer... Ex: 5 questions sur la photosynthèse niveau 3ème"
  - Multiligne
  - Placeholder avec exemple concret

- **Bouton** : 🔮 Générer des questions
  - Lance la génération par IA
  - Ajoute automatiquement les questions dans l'onglet Contenu

#### État vide

- **Message centré** :
  - "Aucune question pour le moment."
  - "Ajoutez des questions manuellement ou générez-les avec l'IA."

#### Bouton d'action

- **+ Ajouter une question** (bouton avec bordure, fond blanc)
  - Ouvre un formulaire pour créer une question

#### Séparateur visuel (`hr`)

#### Section : Instructions pour l'IA (optionnel)

- **Textarea** : "Donnez du contexte à l'IA pour ce quiz..."
  - Multiligne
  - Permet d'affiner le comportement de l'assistant IA

- **Note explicative** :
  - "Ces instructions seront utilisées par l'assistant IA pour aider l'élève"
  - Texte gris, plus petit

#### Section : Base de connaissance

- (Identique à l'onglet Contenu)

---

### ONGLET 3 : Paramètres

#### Section : Paramètres du quiz

- **Mélanger les questions** : Checkbox
  - Ordre aléatoire des questions pour chaque élève

- **Mélanger les réponses** : Checkbox
  - Ordre aléatoire des options (pour QCM)

- **Afficher le score immédiatement** : Checkbox (coché par défaut)
  - Score visible dès la soumission

- **Temps limite (minutes)** :
  - Input number (optionnel)
  - Placeholder : "15" ou "Illimité"

- **Statistiques en temps réel** :
  - **Total des points : 0** (calculé automatiquement)
  - **Nombre de questions : 0** (compte les questions ajoutées)

#### Section : Base de connaissance

- (Identique aux autres onglets)

---

### Pied de page (commun à tous les onglets)

- **× Annuler** (bouton gauche, texte noir)
- **💾 Enregistrer** (bouton droit, fond gris foncé)

---

### (Détails Options de Réponse - À DOCUMENTER)

| Élément | Description |
|---------|-------------|
| **Radio/Checkbox** | Radio si choix unique, Checkbox si choix multiples |
| **Texte option** | Input pour le texte de l'option |
| **Marquer correcte** | Toggle pour définir comme bonne réponse |
| **× Supprimer** | Retirer l'option |
| **Drag handle** | Réordonner les options |
| **+ Ajouter option** | Ajouter une nouvelle option |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Détails de la carte | - |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Mettre à jour la carte | `{ title, description, settings, questions }` |
| `POST` | `/api/teacher/courses/[courseId]/cards/[cardId]/questions` | Ajouter question | `{ type, text, options, correctAnswers, explanation, points }` |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]/questions/[questionId]` | Modifier question | `{ type, text, options, correctAnswers, explanation, points }` |
| `DELETE` | `/api/teacher/courses/[courseId]/cards/[cardId]/questions/[questionId]` | Supprimer question | - |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]/reorder` | Réordonner questions | `{ questions: [{id, order}] }` |

---

## 💾 Types & Interfaces

```typescript
interface QuizCard {
  id: string;
  chapterId: string;
  courseId: string;
  type: "QUIZ";
  title: string;
  description?: string;
  settings: {
    shuffleQuestions: boolean;
    shuffleAnswers: boolean;
    showScoreImmediately: boolean;
    timeLimit?: number;         // Minutes (null = illimité)
  };
  questions: QuizQuestion[];
  totalPoints: number;
  order: number;
  createdAt: Date;
  updatedAt: Date;
}

interface QuizQuestion {
  id: string;
  cardId: string;
  type: "SINGLE_CHOICE" | "MULTIPLE_CHOICE" | "SHORT_ANSWER" | "TRUE_FALSE";
  text: string;                 // Énoncé
  options?: QuizOption[];       // Pour QCM/Vrai-Faux
  acceptedKeywords?: string[];  // Pour Réponse courte
  correctAnswers: string[];     // IDs des options ou mots-clés
  explanation?: string;
  points: number;
  order: number;
  createdAt: Date;
  updatedAt: Date;
}

interface QuizOption {
  id: string;
  questionId: string;
  text: string;
  isCorrect: boolean;
  order: number;
}

interface StudentQuizAttempt {
  id: string;
  studentId: string;
  cardId: string;
  answers: {
    questionId: string;
    selectedOptions?: string[];  // Pour QCM
    textAnswer?: string;         // Pour Réponse courte
  }[];
  score: number;
  totalPoints: number;
  startedAt: Date;
  submittedAt?: Date;
  timeSpent: number;            // Secondes
}
```

---

## ⚙️ Comportements

### Modal plein écran

- La carte s'ouvre en **modal** superposée à la page de détail du cours
- Clic sur **× Annuler** ou **Échap** → Ferme le modal (demande confirmation si modifications non sauvegardées)

### Navigation entre onglets

- Clic sur un onglet → Change le contenu affiché
- Les données saisies dans un onglet sont conservées lors du changement d'onglet
- Indicateur visuel : soulignement de l'onglet actif

### ONGLET CONTENU (À DOCUMENTER)

#### Gestion des questions

1. **Ajouter une question** :
   - Clic sur "+ Ajouter une question" → Ouvre un formulaire modal ou accordion
   - Nouvelle question vide avec type par défaut (QCM choix unique)
   - 2 options par défaut (vides)

2. **Changer type de question** :
   - Sélection du type dans RadioGroup
   - Adaptation automatique des champs :
     - **QCM** : Affiche options avec radio/checkbox
     - **Réponse courte** : Affiche champ mots-clés
     - **Vrai/Faux** : 2 options fixes (Vrai/Faux)

#### Gestion Options (QCM)

| Action | Comportement |
|--------|--------------|
| **Ajouter option** | Nouvelle option vide ajoutée |
| **Supprimer option** | Retrait (min 2 options obligatoires) |
| **Marquer correcte** | Radio (choix unique) ou Checkbox (choix multiples) |
| **Réordonner** | Drag & drop |

#### Base de connaissance

- **Drag & drop** : Glisser des fichiers depuis l'explorateur → Upload automatique
- **Parcourir** : Clic → Ouvre sélecteur de fichiers
- Formats acceptés : PDF, images (PNG, JPG), documents (DOCX, TXT)
- **Limite** : 10 MB par fichier, max 10 fichiers
- Compteur en temps réel : "X fichier(s)"

### ONGLET GÉNÉRATION IA

#### Génération automatique

1. **Saisir la description** :
   - Exemple : "5 questions sur la photosynthèse niveau 3ème"
   - Peut inclure niveau, nombre, thème, type de questions (QCM, Vrai/Faux, etc.)

2. **Clic sur "🔮 Générer des questions"** :
   - Appel API à l'IA (OpenAI, Claude, Gemini)
   - Affiche un loader pendant la génération
   - Une fois terminé → Questions ajoutées automatiquement dans l'onglet Contenu

3. **+ Ajouter une question** :
   - Permet d'ajouter manuellement sans utiliser l'IA
   - Même comportement que dans l'onglet Contenu

4. **Instructions pour l'IA (optionnel)** :
   - Contexte supplémentaire pour personnaliser l'assistant IA élève
   - Ces instructions sont utilisées quand l'élève demande de l'aide pendant le quiz

### ONGLET PARAMÈTRES

#### Configuration du quiz

- **Mélanger les questions** : Checkbox
  - Active/désactive l'ordre aléatoire des questions

- **Mélanger les réponses** : Checkbox
  - Active/désactive l'ordre aléatoire des options (QCM uniquement)

- **Afficher le score immédiatement** : Checkbox (coché par défaut)
  - Si coché → Score affiché dès la soumission
  - Si décoché → Score visible après correction manuelle

- **Temps limite** : Input number (optionnel)
  - Si défini → Timer affiché côté élève
  - Si vide → Pas de limite de temps

- **Total des points** : Calculé automatiquement (somme des points des questions)
- **Nombre de questions** : Compte les questions ajoutées dans l'onglet Contenu

### Sauvegarde

- **💾 Enregistrer** :
  - Sauvegarde toutes les données des 3 onglets + Base de connaissance
  - Indicateur visuel : "Sauvegardé" ou "Non sauvegardé"
  - Auto-save toutes les 30 secondes

- **× Annuler** :
  - Ferme le modal sans sauvegarder
  - Si modifications → Demande confirmation

---

## 🔗 Navigation

### Ouverture de la carte

- Depuis la **page de détail du cours** (`teacher/courses/detail/[id].md`) :
  - Clic sur une carte Quiz dans un chapitre → Ouvre le modal plein écran

### Fermeture du modal

- **× Annuler** : Ferme sans sauvegarder (demande confirmation si modif)
- **Échap** (clavier) : Même comportement que × Annuler
- **Après sauvegarde** :
  - Modal reste ouvert
  - Notification toast : "Quiz enregistré avec succès"

### Navigation entre onglets

- Clic sur **Contenu**, **Génération IA** ou **Paramètres** → Change l'affichage du contenu
- Les données saisies sont conservées entre les onglets

---

## 📝 Notes

- **Type de carte** : Quiz (3ème type de carte après Leçon, Vidéo, Exercice)
- **Interface** : Modal plein écran (pas une page séparée)
- **Onglets** : 3 onglets (Contenu, Génération IA, Paramètres)
- **Base de connaissance** : Section commune à tous les onglets (synchronisée)
- **Types de questions** : QCM choix unique, QCM choix multiples, Réponse courte, Vrai/Faux
- **Génération IA** : Possibilité de générer automatiquement des questions via l'onglet Génération IA
- **Assistant IA élève** : Les instructions définies dans l'onglet Génération IA sont utilisées pour aider l'élève pendant le quiz
- **Badges** :
  - **Quiz** (orange) : Type de carte
  - **Vide** (gris) : État vide (aucune question ajoutée)
  - Badge devient **Publié** ou **Brouillon** selon l'état de publication
- **Paramètres** : Mélange questions/réponses, score immédiat, temps limite
- **Objectif pédagogique** : Évaluation formative avec feedback instantané

---

## 🚧 À DOCUMENTER

### Gestion Questions (Détails)
- Nouvelle question vide avec type par défaut (QCM choix unique)
- Accordion automatiquement ouvert
- 2 options par défaut (vides)

#### Changer Type Question
- Sélection du type dans RadioGroup
- Adaptation automatique des champs :
  - **QCM** : Affiche options avec radio/checkbox
  - **Réponse courte** : Affiche champ mots-clés
  - **Vrai/Faux** : 2 options fixes (Vrai/Faux)

#### Gestion Options (QCM)

| Action | Comportement |
|--------|--------------|
| **Ajouter option** | Nouvelle option vide ajoutée |
| **Supprimer option** | Retrait (min 2 options obligatoires) |
| **Marquer correcte** | Radio (choix unique) ou Checkbox (choix multiples) |
| **Réordonner** | Drag & drop |

### Correction Automatique

#### QCM (Choix Unique)
- Comparaison option sélectionnée vs option marquée correcte
- Points attribués : 100% si correct, 0% sinon

#### QCM (Choix Multiples)
- Comparaison ensemble options sélectionnées vs ensemble options correctes
- Points : Proportionnel au nombre de bonnes réponses
  - Toutes correctes : 100%
  - Partiel : Points proportionnels
  - Mauvaises réponses : Pénalité

#### Réponse Courte
- Comparaison avec mots-clés acceptés
- Matching : Exact, insensible à la casse, fuzzy (Levenshtein)
- Points : 100% si match, 0% sinon

#### Vrai/Faux
- Comparaison directe
- Points : 100% si correct, 0% sinon

### Validation

| Champ | Validation |
|-------|------------|
| Titre | 3-100 caractères |
| Énoncé | Minimum 10 caractères |
| Options QCM | Minimum 2, maximum 10 |
| Au moins 1 option correcte | Obligatoire pour QCM |
| Mots-clés | Minimum 1 pour Réponse courte |
| Points | 1-100 par question |
| Total questions | Minimum 1 |

### Exemples de Données

> **Quiz QCM** :
> - Titre : "Quiz de compréhension"
> - 4 questions :
>   - Q1 (QCM unique) : "Rôle de la chlorophylle ?" → 5 pts
>   - Q2 (QCM multiple) : "Étapes de la photosynthèse ?" → 10 pts
>   - Q3 (Vrai/Faux) : "Le CO₂ est un produit ?" → 5 pts
>   - Q4 (Réponse courte) : "Nom du processus ?" → 5 pts
> - Total : 25 points
> - Paramètres : Mélanger questions ✓, Score immédiat ✓, 15 min

> **Performance** :
> - Correction automatique : instantanée (< 100ms)
> - Génération IA : 10-30 secondes pour 5 questions
> - Auto-save toutes les 30 secondes
> - Skeleton loaders pendant chargement

> **Limites** :
> - Max 50 questions par quiz
> - Max 10 options par question QCM
> - Énoncé : max 1000 caractères
> - Explication : max 500 caractères
> - Temps limite : max 240 minutes (4h)

---

**Navigation** :
- ← [Retour au cours](../../[id].md)

*Date : 13 décembre 2025*

#### Gestion Options (QCM)

| Action | Comportement |
|--------|--------------|
| **Ajouter option** | Nouvelle option vide ajoutée |
| **Supprimer option** | Retrait (min 2 options obligatoires) |
| **Marquer correcte** | Radio (choix unique) ou Checkbox (choix multiples) |
| **Réordonner** | Drag & drop |

### Correction Automatique

#### QCM (Choix Unique)

```
Score = (réponse sélectionnée === réponse correcte) ? points : 0
```

#### QCM (Choix Multiples)

```
Bonnes réponses cochées : +1 point partiel
Mauvaises réponses cochées : -1 point partiel
Score final = (points partiels / nombre réponses correctes) × points max
Minimum : 0
```

#### Réponse Courte

```
Normalisation : minuscules, trim, accents retirés
Match si réponse élève contient un des mots-clés acceptés
Score = match ? points : 0
```

#### Vrai/Faux

```
Score = (réponse === réponse correcte) ? points : 0
```

### Paramètres Quiz

| Paramètre | Impact Élève |
|-----------|--------------|
| **Mélanger questions** | Ordre aléatoire différent pour chaque élève |
| **Mélanger réponses** | Ordre options aléatoire (garde cohérence QCM multiples) |
| **Afficher score** | Score visible immédiatement après soumission |
| **Temps limite** | Chronomètre dégressif + auto-soumission à 0 |

### Validation

| Champ | Validation |
|-------|------------|
| Titre | 3-100 caractères |
| Énoncé | Minimum 5 caractères |
| Options QCM | Min 2, max 10 |
| Réponse correcte | Au moins 1 marquée |
| Points | 1-100 |
| Temps limite | 0 (illimité) ou 1-180 minutes |

### Calcul Total Points
- Automatique : somme de tous les points
- Affiché en temps réel
- Format : "Total : X points"

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton ← | [../../[id].md](../../[id].md) |
| Enregistrer (succès) | [../../[id].md](../../[id].md) |

---

## 📝 Notes

> **Exemple de données** :
> - Titre : "Quiz de compréhension"
> - Description : "Évaluez votre compréhension de la photosynthèse"
> - Paramètres : Mélanger réponses ✓, Afficher score ✓, Temps limite 15 min
> - Questions : 4
>   - Q1 : "Rôle de la chlorophylle ?" (QCM unique, 5 pts)
>   - Q2 : "Étapes de la photosynthèse ?" (QCM multiples, 5 pts)
>   - Q3 : "La photosynthèse produit du CO₂" (Vrai/Faux, 5 pts)
>   - Q4 : "Où se passe la photosynthèse ?" (Réponse courte, 5 pts)
> - Total : 20 points

> **QCM vs Exercice** :
> - **Quiz** : Correction automatique immédiate, idéal pour évaluation rapide
> - **Exercice** : Réponses ouvertes longues, correction IA ou manuelle

> **Mélange questions/réponses** :
> - Réduit la triche lors de quiz synchrones
> - Seed aléatoire par élève (reproductible)
> - Ordre sauvegardé pour la correction

> **Temps limite** :
> - Chronomètre visible en haut de page élève
> - Alerte à 5 min, 2 min, 1 min restantes
> - Auto-soumission à 0:00 (même si incomplet)
> - Temps démarré au premier clic sur le quiz

> **Explications** :
> - Affichées après soumission (si activé)
> - Différentes selon bonne/mauvaise réponse
> - Peut inclure des liens vers leçons

> **Scoring partiel (QCM multiples)** :
> - Encourage à réfléchir (pas de "tout ou rien")
> - Pénalise les réponses au hasard
> - Formule garantit score ≥ 0

> **Réponse courte** :
> - Normalisation automatique (casse, accents)
> - Mots-clés multiples (ex: "chloroplaste, chloroplastes")
> - Peut combiner avec correction IA pour plus de précision

> **Performance** :
> - Auto-save toutes les 30 secondes
> - Drag & drop fluide
> - Preview mode pour tester le quiz (vue élève)

> **Limites** :
> - Max 100 questions par quiz
> - Max 10 options par question QCM
> - Énoncé : max 500 caractères
> - Explication : max 1000 caractères
> - Temps limite : max 180 minutes (3h)

---

**Navigation** :
- ← [Retour au cours](../../[id].md)

*Date : 13 décembre 2025*
