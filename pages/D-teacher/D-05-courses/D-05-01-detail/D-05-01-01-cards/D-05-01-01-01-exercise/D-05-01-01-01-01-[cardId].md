# Carte Exercice - Exercices pratiques

> **Chemin de navigation** : Login → Dashboard Teacher → Mes cours → La photosynthèse → Chapitre → **Carte Exercice**  
> **Route** : `/teacher/courses/[courseId]/cards/exercise/[cardId]`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/courses/[courseId]/cards/exercise/[cardId]/page.tsx`

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

5. Onglet "Cours" → Chapitre → Clic sur carte Exercice ✏️
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Carte Exercice

### En-tête de la carte (modal plein écran)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ ≡ ✏️ test exercice                 Exercice  Vide  🖊  🗑  ...   👁 Aperçu   │
└──────────────────────────────────────────────────────────────────────────────┘
```

### Onglet : Contenu

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres                                       │
│ ───────                                                                       │
│                                                                               │
│ Instructions générales                                                        │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Consignes pour l'exercice...                                              ││
│ │                                                                           ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│                     Aucune question pour le moment.                           │
│              Ajoutez des questions ou générez-les avec l'IA.                  │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                        + Ajouter une question                             ││
│ └───────────────────────────────────────────────────────────────────────────┘│
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

### Onglet : Génération IA

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres                                       │
│            ─────────────                                                      │
│                                                                               │
│ 🔮 Générer avec l'IA                                                          │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Décrivez les exercices que vous souhaitez générer... Ex: 5 exercices     ││
│ │ sur les équations du second degré                                         ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                      🔮 Générer des exercices                             ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ─────────────────────────────────────────────────────────────────────────── │
│                                                                               │
│ Instructions pour l'IA (optionnel)                                            │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Donnez du contexte à l'IA pour cet exercice...                           ││
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

### Onglet : Paramètres

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres                                       │
│                             ──────────                                        │
│                                                                               │
│ Paramètres de l'exercice                                                      │
│                                                                               │
│ Temps limite (minutes)                                                        │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Optionnel                                                                 ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ Total des points : 0                                                          │
│ Nombre de questions : 0                                                       │
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

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DashboardShell` | `@/components/layout/DashboardShell` | Layout avec sidebar |
| `Header` | `@/components/layout/Header` | Barre supérieure |
| `Sidebar` | `@/components/layout/Sidebar` | Navigation professeur |
| `Button` | `@/components/ui/button` | Boutons Enregistrer, Ajouter |
| `Input` | `@/components/ui/input` | Titre, points |
| `Textarea` | `@/components/ui/textarea` | Description, énoncés |
| `Accordion` | `@/components/ui/accordion` | Questions pliables |
| `RadioGroup` | `@/components/ui/radio-group` | Type de correction |
| `Sortable` | `@/components/ui/sortable` | Drag & drop questions |

---

## 🏗 Structure de la Page

### En-tête (modal plein écran)

- **Icône** : ≡ (menu hamburger)
- **Badge Type** : ✏️ test exercice
- **Badges Status** : Exercice (vert) + Vide (gris)
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

### ONGLET 1 : Contenu

#### Section : Instructions générales

- **Textarea** : "Consignes pour l'exercice..."
  - Multiligne
  - Permet de définir le contexte général de l'exercice

#### État vide (si aucune question)

- **Message centré** :
  - "Aucune question pour le moment."
  - "Ajoutez des questions ou générez-les avec l'IA."

#### Bouton d'action

- **+ Ajouter une question** (bouton avec bordure, fond blanc)
  - Ouvre un formulaire pour créer une question

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

- **Textarea** : "Décrivez les exercices que vous souhaitez générer... Ex: 5 exercices sur les équations du second degré"
  - Multiligne
  - Placeholder avec exemple concret

- **Bouton** : 🔮 Générer des exercices
  - Lance la génération par IA
  - Ajoute automatiquement les questions dans l'onglet Contenu

#### Séparateur visuel (`hr`)

#### Section : Instructions pour l'IA (optionnel)

- **Textarea** : "Donnez du contexte à l'IA pour cet exercice..."
  - Multiligne
  - Permet d'affiner le comportement de l'assistant IA

- **Note explicative** :
  - "Ces instructions seront utilisées par l'assistant IA pour aider l'élève"
  - Texte gris, plus petit

#### Section : Base de connaissance

- (Identique à l'onglet Contenu)

---

### ONGLET 3 : Paramètres

#### Section : Paramètres de l'exercice

- **Temps limite (minutes)** :
  - Input number (optionnel)
  - Placeholder : "Optionnel"

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

### (Détails questions - À DOCUMENTER ULTÉRIEUREMENT)

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| **Énoncé de la question** | Textarea | ✅ | Question posée à l'élève |
| **Réponse attendue** | Textarea | ✅ | Réponse de référence pour correction |
| **Indice** | Textarea | ❌ | Aide optionnelle (révélée sur demande) |
| **Points** | Input number | ✅ | Valeur de la question (ex: 10 pts) |
| **Type de correction** | RadioGroup | ✅ | Auto (IA) ou Manuel (professeur) |

### Types de Correction

| Type | Description | Fonctionnement |
|------|-------------|----------------|
| **Auto** | Correction automatique par IA | L'IA compare la réponse élève avec la réponse attendue + notation automatique |
| **Manuel** | Correction par le professeur | Le professeur lit et note chaque réponse manuellement |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Détails de la carte | - |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Mettre à jour la carte | `{ title, description, questions }` |
| `POST` | `/api/teacher/courses/[courseId]/cards/[cardId]/questions` | Ajouter question | `{ text, answer, hint, points, correctionType }` |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]/questions/[questionId]` | Modifier question | `{ text, answer, hint, points, correctionType }` |
| `DELETE` | `/api/teacher/courses/[courseId]/cards/[cardId]/questions/[questionId]` | Supprimer question | - |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]/reorder` | Réordonner questions | `{ questions: [{id, order}] }` |

---

## 💾 Types & Interfaces

```typescript
interface ExerciseCard {
  id: string;
  chapterId: string;
  courseId: string;
  type: "EXERCISE";
  title: string;
  description?: string;
  questions: ExerciseQuestion[];
  totalPoints: number;           // Somme des points
  order: number;
  createdAt: Date;
  updatedAt: Date;
}

interface ExerciseQuestion {
  id: string;
  cardId: string;
  text: string;                  // Énoncé
  answer: string;                // Réponse attendue
  hint?: string;                 // Indice optionnel
  points: number;
  correctionType: "AUTO" | "MANUAL";
  order: number;
  createdAt: Date;
  updatedAt: Date;
}

interface StudentExerciseAnswer {
  id: string;
  studentId: string;
  questionId: string;
  answer: string;
  score?: number;                // Note attribuée (0-points)
  correctedAt?: Date;
  correctorId?: string;          // ID professeur (si manuel)
  aiScore?: number;              // Score IA (si auto)
  feedback?: string;             // Commentaire correction
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

### ONGLET CONTENU

#### Gestion des questions

1. **Ajouter une question** :
   - Clic sur "+ Ajouter une question" → Ouvre un formulaire modal ou accordion
   - Focus automatique sur le champ "Énoncé"

2. **État vide** :
   - Si aucune question → Affiche message encourageant à ajouter ou générer

3. **Instructions générales** :
   - Textarea libre pour le contexte de l'exercice
   - Sauvegarde automatique ou manuelle

#### Base de connaissance

- **Drag & drop** : Glisser des fichiers depuis l'explorateur → Upload automatique
- **Parcourir** : Clic → Ouvre sélecteur de fichiers
- Formats acceptés : PDF, images (PNG, JPG), documents (DOCX, TXT)
- **Limite** : 10 MB par fichier, max 10 fichiers
- Compteur en temps réel : "X fichier(s)"

### ONGLET GÉNÉRATION IA

#### Génération automatique

1. **Saisir la description** :
   - Exemple : "5 exercices sur les équations du second degré"
   - Peut inclure niveau, nombre, thème

2. **Clic sur "🔮 Générer des exercices"** :
   - Appel API à l'IA (OpenAI, Claude, Gemini)
   - Affiche un loader pendant la génération
   - Une fois terminé → Questions ajoutées automatiquement dans l'onglet Contenu

3. **Instructions pour l'IA (optionnel)** :
   - Contexte supplémentaire pour personnaliser l'assistant IA élève
   - Ces instructions sont utilisées quand l'élève demande de l'aide

### ONGLET PARAMÈTRES

#### Configuration de l'exercice

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
  - Clic sur une carte Exercice dans un chapitre → Ouvre le modal plein écran

### Fermeture du modal

- **× Annuler** : Ferme sans sauvegarder (demande confirmation si modif)
- **Échap** (clavier) : Même comportement que × Annuler
- **Après sauvegarde** :
  - Modal reste ouvert
  - Notification toast : "Exercice enregistré avec succès"

### Navigation entre onglets

- Clic sur **Contenu**, **Génération IA** ou **Paramètres** → Change l'affichage du contenu
- Les données saisies sont conservées entre les onglets

---

## 📝 Notes

- **Type de carte** : Exercice (4ème type de carte après Leçon, Vidéo, Quiz)
- **Interface** : Modal plein écran (pas une page séparée)
- **Onglets** : 3 onglets (Contenu, Génération IA, Paramètres)
- **Base de connaissance** : Section commune à tous les onglets (synchronisée)
- **Granularité** : Peut contenir plusieurs questions, chaque question a son propre scoring
- **Correction** :
  - **Auto** : Basée sur pattern matching ou keywords (regex, exact match, fuzzy)
  - **Manuel** : Le professeur corrige manuellement les réponses ouvertes
- **Génération IA** : Possibilité de générer automatiquement des exercices via l'onglet Génération IA
- **Assistant IA élève** : Les instructions définies dans l'onglet Génération IA sont utilisées pour aider l'élève pendant l'exercice
- **Badges** :
  - **Exercice** (vert) : Type de carte
  - **Vide** (gris) : État vide (aucune question ajoutée)
  - Badge devient **Publié** ou **Brouillon** selon l'état de publication
- **Objectif pédagogique** : Évaluation formative ou sommative

---

## 🚧 À DOCUMENTER

### Gestion détaillée des questions
- Clic sur **+ Ajouter question**
- Nouvelle question vide ajoutée en bas
- Accordion automatiquement ouvert
- Focus sur champ "Énoncé"

#### Modifier Question
- Clic sur 🖊 ou directement dans les champs
- Édition inline
- Auto-save après 2 secondes d'inactivité

#### Supprimer Question
- Clic sur 🗑
- Confirmation : "Supprimer cette question ?"
- Suppression + recalcul total points

#### Réordonner Questions
- Drag handle ≡
- Drag & drop pour changer l'ordre
- Numérotation automatique mise à jour
- Sauvegarde immédiate

### Calcul Total Points
- Automatique : somme de tous les points des questions
- Affiché en temps réel sous la liste
- Format : "Total : X points"

### Correction Automatique (IA)

| Processus | Description |
|-----------|-------------|
| **1. Soumission** | Élève soumet sa réponse |
| **2. API Call** | Appel API IA avec énoncé + réponse attendue + réponse élève |
| **3. Analyse** | IA compare et évalue (similarité sémantique) |
| **4. Notation** | Score de 0 à points max attribué |
| **5. Feedback** | Commentaire généré (points forts/faibles) |

#### Prompt IA (Correction Auto)
```
Énoncé : {question.text}
Réponse attendue : {question.answer}
Réponse de l'élève : {studentAnswer}
Points maximum : {question.points}

Évaluez la réponse de l'élève et attribuez une note de 0 à {points}.
Fournissez un feedback constructif.
```

### Correction Manuelle

| Processus | Description |
|-----------|-------------|
| **1. Soumission** | Élève soumet sa réponse → statut "En attente" |
| **2. Liste** | Professeur voit les réponses à corriger |
| **3. Correction** | Professeur lit, attribue note et feedback |
| **4. Validation** | Statut "Corrigé" + notification élève |

### Validation

| Champ | Validation |
|-------|------------|
| Titre | 3-100 caractères |
| Énoncé | Minimum 10 caractères |
| Réponse attendue | Minimum 5 caractères |
| Points | 1-100 |
| Total questions | Minimum 1 |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton ← | [../../[id].md](../../[id].md) |
| Enregistrer (succès) | [../../[id].md](../../[id].md) |

---

## 📝 Notes

> **Exemple de données** :
> - Titre : "Exercices pratiques"
> - Description : "Testez vos connaissances sur la photosynthèse"
> - Questions : 3
>   - Q1 : "Expliquez le rôle de la chlorophylle" (10 pts, Auto)
>   - Q2 : "Quelles sont les étapes de la photosynthèse ?" (10 pts, Manuel)
>   - Q3 : "Dessinez un schéma du chloroplaste" (10 pts, Manuel)
> - Total : 30 points

> **Correction automatique** :
> - Utilisée pour questions ouvertes courtes
> - Basée sur GPT-4 ou Gemini
> - Analyse sémantique (pas juste mots-clés)
> - Coût : ~$0.002 par correction
> - Précision : 85-90% vs humain

> **Correction manuelle** :
> - Recommandée pour :
>   - Questions longues (> 200 mots)
>   - Schémas/dessins
>   - Réponses créatives/personnelles
> - Professeur peut override correction IA

> **Indices** :
> - Révélés sur demande (bouton "Voir l'indice")
> - Peuvent réduire les points (option : -10% si indice utilisé)
> - Affichés dans une infobulle ou modal

> **Réordonnancement** :
> - Important pour progression pédagogique
> - Facile → Moyen → Difficile
> - Drag & drop fluide avec visual feedback

> **Performance** :
> - Auto-save toutes les 30 secondes
> - Optimistic UI pour drag & drop
> - Skeleton loaders pendant chargement
> - Correction IA : 2-5 secondes par réponse

> **Limites** :
> - Max 50 questions par exercice
> - Énoncé : max 1000 caractères
> - Réponse attendue : max 5000 caractères
> - Indice : max 500 caractères

---

**Navigation** :
- ← [Retour au cours](../../[id].md)

*Date : 13 décembre 2025*
