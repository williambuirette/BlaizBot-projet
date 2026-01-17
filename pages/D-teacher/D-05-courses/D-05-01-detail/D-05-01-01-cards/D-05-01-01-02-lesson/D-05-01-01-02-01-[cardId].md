# Carte Leçon - Introduction

> **Chemin de navigation** : Login → Dashboard Teacher → Mes cours → La photosynthèse → Chapitre → **Carte Leçon**  
> **Route** : `/teacher/courses/[courseId]/cards/lesson/[cardId]`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/courses/[courseId]/cards/lesson/[cardId]/page.tsx`

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

5. Onglet "Cours" → Chapitre → Clic sur carte Leçon 📄
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Carte Leçon

### En-tête de la carte (modal plein écran)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ ≡ 📄 test leçon                      Leçon  Vrai  🖊  🗑  ...   👁 Aperçu   │
└──────────────────────────────────────────────────────────────────────────────┘
```

### Onglet : Contenu

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres IA                                    │
│ ───────                                                                       │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ ↶ ↷  B  I  U  S  A  H₁ H₂ H₃  ≡ ≣  "" <> -  ≡ ≡ ≡  🔗 📷                ││
│ ├───────────────────────────────────────────────────────────────────────────┤│
│ │                                                                           ││
│ │                                                                           ││
│ │                         [Zone d'édition vide]                             ││
│ │                                                                           ││
│ │                                                                           ││
│ │                                                                           ││
│ │                                                                           ││
│ │ ~0 min de lecture                                                         ││
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
│ Contenu    Génération IA    Paramètres IA                                    │
│            ─────────────                                                      │
│                                                                               │
│ 🔮 Générer avec l'IA                                                          │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Décrivez le contenu que vous souhaitez générer... Ex: Une introduction   ││
│ │ à la photosynthèse pour des élèves de 3ème.                               ││
│ │                                                                           ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                      🔮 Générer du contenu                                ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ Le contenu généré sera ajouté à la suite du contenu existant.                │
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

### Onglet : Paramètres IA

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Contenu    Génération IA    Paramètres IA                                    │
│                             ──────────────                                    │
│                                                                               │
│ Instructions pour l'IA (optionnel)                                            │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Donnez du contexte à l'IA pour cette section... Ex: Cette leçon porte   ││
│ │ sur les fractions. L'IA doit utiliser des exemples concrets (pizza,      ││
│ │ gâteau).                                                                  ││
│ │                                                                           ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ Ces instructions seront utilisées par l'assistant IA quand l'élève consulte cette section.│
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
| `Button` | `@/components/ui/button` | Bouton Enregistrer |
| `Input` | `@/components/ui/input` | Titre de la carte |
| `Textarea` | `@/components/ui/textarea` | Description courte |
| `RichTextEditor` | `@/components/ui/rich-text-editor` | Éditeur WYSIWYG |
| `FileUpload` | `@/components/ui/file-upload` | Zone drag & drop |

---

## 📊 Structure de la Page

### En-tête (Titre de la carte)

| Élément | Description |
|---------|-------------|
| **≡ Icône** | Handle de drag (si accessible) |
| **📄 Icône type** | Icône Leçon |
| **Titre** | Nom de la carte (ex: "test leçon") |
| **Badge Leçon** | Badge bleu indiquant le type |
| **Badge Vrai** | Badge de statut (état de validation ?) |
| **🖊 Modifier** | Icône modifier |
| **🗑 Supprimer** | Icône supprimer |
| **... Menu** | Menu d'actions supplémentaires |
| **👁 Aperçu** | Prévisualiser la carte (vue élève) |

### Onglets (3)

| Onglet | Contenu |
|--------|---------|
| **Contenu** | Éditeur rich text principal + Base de connaissance |
| **Génération IA** | Génération automatique de contenu via IA + Base de connaissance |
| **Paramètres IA** | Instructions pour l'assistant IA élève + Base de connaissance |

---

## 📝 Onglet 1 : Contenu

### Éditeur Rich Text

#### Barre d'outils

| Icône | Fonction |
|-------|----------|
| ↶ ↷ | Annuler / Refaire |
| **B I U S** | Gras, Italique, Souligné, Barré |
| **A** | Couleur texte |
| **H₁ H₂ H₃** | Titres (niveaux 1-3) |
| **≡ ≣** | Listes (puces, numérotées) |
| **"" <> -** | Citation, Code inline, Séparateur |
| **≡ ≡ ≡** | Alignement (gauche, centre, droite) |
| **🔗 📷** | Insérer lien, Insérer image |

#### Zone d'édition
- Grande zone de texte libre avec formatage rich text
- Indicateur : "~X min de lecture" (calcul automatique basé sur ~200 mots/minute)

### Base de connaissance

| Élément | Description |
|---------|-------------|
| **Titre** | "📄 Base de connaissance" |
| **Compteur** | "X fichier(s)" |
| **Zone Upload** | Drag & drop ou clic "Parcourir" |
| **Formats acceptés** | "PDF, images, documents..." |
| **État vide** | "Aucun fichier ajouté" |
| **Limites** | Max 10 MB par fichier, max 10 fichiers |

#### Fonctionnement
- **Upload** : Glisser-déposer ou clic sur "Parcourir"
- **Utilité** : Fichiers de référence pour l'assistant IA (contexte automatique)
- **Formats** : PDF, DOCX, TXT, images (JPG, PNG)

---

## 🔮 Onglet 2 : Génération IA

### Section : Générer avec l'IA

- **Textarea** : "Décrivez le contenu que vous souhaitez générer... Ex: Une introduction à la photosynthèse pour des élèves de 3ème."
  - Multiligne
  - Placeholder avec exemple concret

- **Bouton** : 🔮 Générer du contenu
  - Lance la génération par IA
  - Utilise les fichiers de la Base de connaissance comme contexte
  - Insère le contenu généré dans l'onglet Contenu (éditable après)

- **Note informative** :
  - "Le contenu généré sera ajouté à la suite du contenu existant."
  - Texte gris, plus petit

### Base de connaissance

- (Identique à l'onglet Contenu)
- **Contexte IA** : Les fichiers sont analysés et utilisés pour générer du contenu pertinent

---

## ⚙️ Onglet 3 : Paramètres IA

### Section : Instructions pour l'IA (optionnel)

- **Textarea** : "Donnez du contexte à l'IA pour cette section... Ex: Cette leçon porte sur les fractions. L'IA doit utiliser des exemples concrets (pizza, gâteau)."
  - Multiligne
  - Permet de personnaliser le comportement de l'assistant IA élève

- **Note explicative** :
  - "Ces instructions seront utilisées par l'assistant IA quand l'élève consulte cette section."
  - Texte gris, plus petit

### Base de connaissance

- (Identique aux autres onglets)
- **Contexte IA élève** : Fichiers utilisés par l'assistant pour répondre aux questions des élèves

---

### Boutons d'action (bas de page, communs à tous les onglets)

| Bouton | Position | Fonction |
|--------|----------|----------|
| **× Annuler** | Gauche | Fermer sans enregistrer (confirmation si modifications) |
| **💾 Enregistrer** | Droite | Sauvegarder les modifications de tous les onglets |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Détails de la carte | - |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Mettre à jour la carte | `{ title, description, content, resources }` |
| `POST` | `/api/upload` | Upload ressources | FormData |
| `DELETE` | `/api/teacher/courses/[courseId]/cards/[cardId]/resources/[resourceId]` | Supprimer ressource | - |

---

## 💾 Types & Interfaces

```typescript
interface LessonCard {
  id: string;
  chapterId: string;
  courseId: string;
  type: "LESSON";
  title: string;
  description?: string;
  content: string;              // HTML de l'éditeur
  resources: CardResource[];
  order: number;
  createdAt: Date;
  updatedAt: Date;
}

interface CardResource {
  id: string;
  name: string;
  type: string;                 // MIME type
  url: string;
  size: number;                 // Bytes
  uploadedAt: Date;
}
```

---

## ⚙️ Comportements

### Modal Plein Écran
- La carte s'ouvre en **modal plein écran** (pas une nouvelle page)
- Fermeture : Bouton × Annuler ou ESC
- Confirmation si modifications non sauvegardées

### Navigation entre onglets

- Clic sur un onglet → Change le contenu affiché
- Les données saisies dans un onglet sont conservées lors du changement d'onglet
- Indicateur visuel : soulignement de l'onglet actif

### ONGLET 1 : Contenu

#### Éditeur Rich Text
- **Debounce** : 300ms sur la saisie
- **Copier/Coller** : Nettoyage automatique du HTML externe
- **Shortcuts** : 
  - Ctrl+B : Gras
  - Ctrl+I : Italique
  - Ctrl+U : Souligné
  - Ctrl+K : Insérer lien
- **Images** : Upload inline ou URL
- **Calcul temps de lecture** : ~200 mots/minute
- **Auto-save** : Toutes les 30 secondes (brouillon local)

#### Base de connaissance

| Action | Comportement |
|--------|--------------|
| **Drag & Drop** | Upload automatique des fichiers |
| **Clic "Parcourir"** | Ouvre file picker |
| **Validation** | Vérification format et taille (max 10 MB) |
| **Upload succès** | Fichier ajouté dans la liste, compteur mis à jour |
| **Upload erreur** | Toast d'erreur (format invalide ou taille dépassée) |
| **Suppression** | Clic sur × dans la liste des fichiers |

### ONGLET 2 : Génération IA

#### Génération automatique

1. **Saisir la description** :
   - Exemple : "Une introduction à la photosynthèse pour des élèves de 3ème"
   - Peut inclure niveau, thème, longueur souhaitée

2. **Clic sur "🔮 Générer du contenu"** :
   - Appel API à l'IA (OpenAI, Claude, Gemini)
   - Affiche un loader pendant la génération
   - Utilise les fichiers de la Base de connaissance comme contexte
   - Une fois terminé → Contenu inséré dans l'onglet Contenu (éditable)

3. **Note** : Le contenu est ajouté à la suite du contenu existant (pas de remplacement)

### ONGLET 3 : Paramètres IA

#### Configuration de l'assistant IA élève

- **Instructions pour l'IA (optionnel)** :
  - Textarea libre pour définir le comportement de l'assistant IA
  - Exemple : "Cette leçon porte sur les fractions. L'IA doit utiliser des exemples concrets (pizza, gâteau)."
  - Ces instructions sont utilisées quand l'élève consulte cette section et demande de l'aide

- **Contexte automatique** : Les fichiers de la Base de connaissance sont utilisés par l'assistant IA

### Sauvegarde

- **💾 Enregistrer** :
  - Sauvegarde toutes les données des 3 onglets (contenu, instructions IA, base de connaissance)
  - Indicateur visuel : "Sauvegardé" ou "Non sauvegardé"
  - Auto-save toutes les 30 secondes

- **× Annuler** :
  - Ferme le modal sans sauvegarder
  - Si modifications → Demande confirmation

### Boutons d'action

| Bouton | Comportement |
|--------|--------------|
| **× Annuler** | Ferme la modal. Si modifications → confirmation "Quitter sans enregistrer ?" |
| **💾 Enregistrer** | Sauvegarde le contenu de tous les onglets + ferme la modal → retour à [../../[id].md](../../[id].md) |

### Aperçu (👁)
- Clic sur **👁 Aperçu** : Ouvre prévisualisation en vue élève
- Affiche le contenu tel qu'il sera vu par les élèves
- Bouton "Retour à l'édition"

### Validation
- **Contenu** : Pas obligatoire (peut être vide)
- **Enregistrement** : Toujours possible (même sans contenu)

---

## 🔗 Navigation

### Ouverture de la carte

- Depuis la **page de détail du cours** (`teacher/courses/detail/[id].md`) :
  - Clic sur une carte Leçon dans un chapitre → Ouvre le modal plein écran

### Fermeture du modal

- **× Annuler** : Ferme sans sauvegarder (demande confirmation si modif)
- **Échap** (clavier) : Même comportement que × Annuler
- **Après sauvegarde** :
  - Modal reste ouvert
  - Notification toast : "Leçon enregistrée avec succès"

### Navigation entre onglets

- Clic sur **Contenu**, **Génération IA** ou **Paramètres IA** → Change l'affichage du contenu
- Les données saisies sont conservées entre les onglets

### Aperçu

- Clic sur **👁 Aperçu** → Ouvre prévisualisation en vue élève
- Bouton "Retour à l'édition" pour revenir au mode édition

---

## 📝 Notes

- **Type de carte** : Leçon (1er type de carte)
- **Interface** : Modal plein écran (pas une page séparée)
- **Onglets** : 3 onglets (Contenu, Génération IA, Paramètres IA)
- **Base de connaissance** : Section commune à tous les onglets (synchronisée)
- **Éditeur** : Rich text WYSIWYG avec 18 outils de formatage
- **Génération IA** : Possibilité de générer automatiquement du contenu via l'onglet Génération IA
- **Assistant IA élève** : Les instructions définies dans l'onglet Paramètres IA sont utilisées pour aider l'élève
- **Badges** :
  - **Leçon** (bleu) : Type de carte
  - **Vrai** (statut) : État de validation/publication
- **Temps de lecture** : Calcul automatique (~200 mots/minute)
- **Objectif pédagogique** : Transmission de connaissances théoriques

---

## 🚧 Détails Supplémentaires

### Exemples de données

> **Leçon complète** :
> - Titre : "test leçon"
> - Type : Leçon (📄)
> - Badges : "Leçon" (bleu), "Vrai" (statut)
> - Contenu : Rich text avec titres, listes, images
> - Temps de lecture : ~5 min
> - Base de connaissance : 3 fichiers (schéma.pdf, notes.txt, photo.jpg)
> - Instructions IA : "Cette leçon porte sur les fractions. L'IA doit utiliser des exemples concrets."

> **Modal plein écran** :
> - Ouvre par-dessus la page [../../[id].md](../../[id].md)
> - Occupe toute la fenêtre
> - Navigation entre onglets (Contenu, Génération IA, Paramètres IA)
> - Fermeture : × Annuler ou ESC

> **Temps de lecture** :
> - Calculé automatiquement : ~200 mots/minute
> - Affiché en bas de l'éditeur : "~X min de lecture"
> - Mis à jour en temps réel pendant la saisie

> **Base de connaissance** :
> - **Objectif** : Fournir du contexte à l'IA (onglet Génération IA)
> - **Exemples de fichiers** : PDF de cours, schémas, notes de référence
> - **Analyse IA** : L'IA extrait le texte et génère du contenu basé sur ces documents
> - **Formats supportés** : PDF, DOCX, TXT, JPG, PNG
> - **Stockage** : Vercel Blob ou AWS S3

> **Génération IA (onglet 2)** :
> - Utilise les fichiers de la Base de connaissance
> - Génère du contenu de leçon automatiquement
> - Insertion dans l'éditeur (onglet Contenu)
> - Éditable après génération

> **Paramètres IA (onglet 3)** :
> - Configuration spécifique pour cette carte
> - Niveau de complexité, style, longueur
> - Override des paramètres globaux du cours

> **Badge "Vrai"** :
> - Probablement un statut de validation
> - Peut indiquer : Publié, Validé, Actif, etc.
> - À confirmer avec le contexte métier

> **Performance** :
> - Auto-save local (localStorage) toutes les 30 secondes
> - Lazy loading des fichiers de la Base de connaissance
> - Skeleton loaders pendant le chargement initial
> - Optimistic UI pour l'upload de fichiers

> **Limites** :
> - Contenu : max 50 000 caractères (HTML)
> - Base de connaissance : max 10 fichiers, 10 MB chacun
> - Images inline : max 5 MB
> - Total taille carte : max 100 MB

---

**Navigation** :
- ← [Retour au cours](../../[id].md)

*Date : 13 décembre 2025*
