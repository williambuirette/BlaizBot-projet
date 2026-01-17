# Nouveau cours

> **Chemin de navigation** : Login → Dashboard Teacher → Mes cours → **+ Nouveau cours**  
> **Route** : `/teacher/courses/new`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/courses/new/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes cours
   └── teacher/courses/liste.md

4. Clic sur bouton "+ Nouveau cours"
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Nouveau cours

### Onglet : Informations

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  ←  Nouveau cours                    📄 Brouillon   [Publier] │
│            │     Créez un nouveau cours pour vos élèves                      │
│ 🏫 Mes     │                                                                 │
│   classes  │  ℹ️  Informations        📎 Contenu & Fichiers                  │
│            │  ───────────────                                                │
│ 👥 Mes     │                                                                 │
│   élèves   │  Informations générales                                         │
│            │  Ces informations seront visibles sur la page du cours         │
│ 📚 Mes     │                                                                 │
│   cours    │  Titre du cours *                        Matière *              │
│            │  Ex: Introduction à la                   Sélectionner ▼         │
│ 📅 Agendas │  photosynthèse                                                  │
│   et       │                                                                 │
│   Assigna. │  Description                                                    │
│            │  Décrivez brièvement le cours...                               │
│ 💬 Messag. │                                                                 │
│            │  Objectifs pédagogiques                                         │
│            │  Un objectif par ligne...                                       │
│            │                                                                 │
│            │  Entrez un objectif par ligne                                   │
│            │                                                                 │
│            │  Nom du premier chapitre *                                      │
│            │  Introduction                                                   │
│            │                                                                 │
│            │  Ce chapitre contiendra le contenu initial du cours            │
│            │                                                                 │
│            │  Difficulté                 Durée (minutes)        Tags        │
│            │  Intermédiaire ▼            Ex: 45                 biologie,   │
│            │                                                    photosynthèse│
│            │                                                                 │
└────────────┴─────────────────────────────────────────────────────────────────┘
```

### Onglet : Contenu & Fichiers

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │  ←  Nouveau cours                    📄 Brouillon   [Publier] │
│            │     Créez un nouveau cours pour vos élèves                      │
│            │                                                                 │
│            │  ℹ️  Informations        📎 Contenu & Fichiers                  │
│            │                          ──────────────────                     │
│            │                                                                 │
│            │  🤖 Assistant IA                                                │
│            │  Générez automatiquement le contenu de votre cours             │
│            │                                                                 │
│            │  Instructions pour l'IA (ex: focus sur les exemples            │
│            │  pratiques, niveau lycée...)                                    │
│            │                                                                 │
│            │  [🔮 Générer avec IA]                                           │
│            │                                                                 │
│            │  ─────────────────────────────────────────────────────────────  │
│            │                                                                 │
│            │  Contenu du cours                                               │
│            │  Ce contenu deviendra la première carte de votre chapitre      │
│            │                                                                 │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ ↶ ↷  B  I  U  S  A  H₁ H₂ H₃  ≡ ≣  "" ↔ -  ⊕ ⊖  🔗 📷   │ │
│            │  │                                                           │ │
│            │  │                                                           │ │
│            │  │                                                           │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │                                                                 │
│            │  Fichiers et ressources                                         │
│            │  Ces fichiers seront attachés à la première carte du cours     │
│            │                                                                 │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │                        ⬆                                  │ │
│            │  │   Glissez-déposez des fichiers ou cliquez pour            │ │
│            │  │   sélectionner                                            │ │
│            │  │   PDF, images, Word, Excel, PowerPoint, ZIP • Max 10 MB   │ │
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
| `Button` | `@/components/ui/button` | Boutons Publier, Brouillon, Générer |
| `Tabs` | `@/components/ui/tabs` | Onglets (Informations, Contenu) |
| `Input` | `@/components/ui/input` | Champs texte (titre, durée, tags) |
| `Textarea` | `@/components/ui/textarea` | Description, objectifs |
| `Select` | `@/components/ui/select` | Dropdowns (matière, difficulté) |
| `RichTextEditor` | `@/components/ui/rich-text-editor` | Éditeur WYSIWYG |
| `FileUpload` | `@/components/ui/file-upload` | Zone drag & drop |
| `Alert` | `@/components/ui/alert` | Messages d'aide (info bleue) |
| `Badge` | `@/components/ui/badge` | Badge "Brouillon" |

---

## 📊 Structure de la Page

### En-tête

| Élément | Description |
|---------|-------------|
| **← Bouton** | Retour à la liste des cours |
| **Titre** | "Nouveau cours" |
| **Sous-titre** | "Créez un nouveau cours pour vos élèves" |
| **Badge Brouillon** | Indique l'état (📄 Brouillon) |
| **Bouton Publier** | Valide et publie le cours |

### Onglets (2)

| Onglet | Contenu |
|--------|---------|
| **ℹ️ Informations** | Métadonnées du cours (titre, matière, etc.) |
| **📎 Contenu & Fichiers** | Assistant IA + éditeur + uploads |

---

## ℹ️ Onglet : Informations

### Section : Informations générales

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| **Titre du cours** | Input | ✅ | Nom du cours (ex: "Introduction à la photosynthèse") |
| **Matière** | Select | ✅ | Choix parmi les matières existantes |
| **Description** | Textarea | ❌ | Description courte du cours |
| **Objectifs pédagogiques** | Textarea | ❌ | Un objectif par ligne |
| **Nom du premier chapitre** | Input | ✅ | Nom du chapitre initial (ex: "Introduction") |
| **Difficulté** | Select | ❌ | Débutant, Intermédiaire, Avancé |
| **Durée (minutes)** | Input number | ❌ | Durée estimée (ex: 45) |
| **Tags** | Input tags | ❌ | Mots-clés séparés par virgules |

### Valeurs par défaut

| Champ | Valeur par défaut |
|-------|-------------------|
| Nom du premier chapitre | "Introduction" |
| Difficulté | "Intermédiaire" |
| Durée | Vide |
| Tags | Vide |

### Messages d'aide

| Champ | Message |
|-------|---------|
| Informations générales | "Ces informations seront visibles sur la page du cours" |
| Nom du premier chapitre | "Ce chapitre contiendra le contenu initial du cours" |

---

## 📎 Onglet : Contenu & Fichiers

### Section : Assistant IA

| Élément | Description |
|---------|-------------|
| **Titre** | 🤖 Assistant IA |
| **Sous-titre** | "Générez automatiquement le contenu de votre cours" |
| **Textarea** | Instructions pour l'IA (prompt personnalisé) |
| **Placeholder** | "Instructions pour l'IA (ex: focus sur les exemples pratiques, niveau lycée...)" |
| **Bouton** | 🔮 Générer avec IA |

#### Comportement Assistant IA
- Utilisateur saisit des instructions
- Clic sur "Générer avec IA"
- Appel API vers service IA (Gemini/GPT)
- Contenu généré inséré dans l'éditeur
- Loader pendant la génération (5-15 secondes)

### Section : Contenu du cours

| Élément | Description |
|---------|-------------|
| **Titre** | Contenu du cours |
| **Aide** | "Ce contenu deviendra la première carte de votre chapitre" |
| **Éditeur** | WYSIWYG riche (TipTap ou similaire) |

#### Barre d'outils Éditeur

| Icône | Fonction |
|-------|----------|
| ↶ ↷ | Annuler / Refaire |
| **B I U S** | Gras, Italique, Souligné, Barré |
| **A** | Couleur texte |
| **H₁ H₂ H₃** | Titres (niveaux 1-3) |
| **≡ ≣** | Listes (puces, numérotées) |
| **"" ↔ -** | Citation, Indentation, Séparateur |
| **⊕ ⊖** | Tableau (ajouter/retirer) |
| **🔗 📷** | Lien, Image |

### Section : Fichiers et ressources

| Élément | Description |
|---------|-------------|
| **Titre** | Fichiers et ressources |
| **Aide** | "Ces fichiers seront attachés à la première carte du cours" |
| **Zone Upload** | Drag & drop ou clic pour sélectionner |
| **Formats acceptés** | PDF, images, Word, Excel, PowerPoint, ZIP |
| **Taille max** | 10 MB par fichier |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `POST` | `/api/teacher/courses` | Créer le cours | `{ title, subjectId, description, objectives, firstChapter, difficulty, duration, tags, content, files }` |
| `POST` | `/api/teacher/courses/generate` | Générer contenu avec IA | `{ prompt, subject, level }` |
| `POST` | `/api/upload` | Upload fichiers | FormData avec fichiers |
| `GET` | `/api/subjects` | Liste des matières | - |

---

## 💾 Types & Interfaces

```typescript
interface CreateCourseForm {
  // Onglet Informations
  title: string;                  // Obligatoire
  subjectId: string;              // Obligatoire
  description?: string;
  objectives?: string[];          // Tableau (1 ligne = 1 objectif)
  firstChapterName: string;       // Obligatoire (défaut: "Introduction")
  difficulty?: "BEGINNER" | "INTERMEDIATE" | "ADVANCED";
  duration?: number;              // En minutes
  tags?: string[];
  
  // Onglet Contenu
  content?: string;               // HTML de l'éditeur
  files?: File[];                 // Fichiers uploadés
}

interface AiGenerateRequest {
  prompt: string;
  subject: string;
  level: "BEGINNER" | "INTERMEDIATE" | "ADVANCED";
}

interface AiGenerateResponse {
  content: string;                // HTML généré
  generationTime: number;         // Temps en ms
}
```

---

## 🎯 Comportements

### Navigation entre Onglets
- Clic sur onglet : Change de vue
- Données persistées entre onglets (form state)
- URL synchronisée : `?tab=informations` ou `?tab=contenu`

### Validation Formulaire

| Condition | Message d'erreur |
|-----------|------------------|
| Titre vide | "Le titre est obligatoire" |
| Matière non sélectionnée | "Veuillez sélectionner une matière" |
| Nom chapitre vide | "Le nom du premier chapitre est obligatoire" |

### Bouton Publier

| État | Comportement |
|------|--------------|
| **Formulaire invalide** | Bouton désactivé + tooltip "Complétez les champs obligatoires" |
| **Formulaire valide** | Bouton actif + clic → création cours |
| **En cours** | Loader + désactivé |
| **Succès** | Toast "Cours créé !" + redirection vers détail |
| **Erreur** | Toast d'erreur + reste sur la page |

### Assistant IA

| Action | Comportement |
|--------|--------------|
| **Clic Générer** | Appel API + loader |
| **Succès** | Contenu inséré dans éditeur + toast "Contenu généré" |
| **Erreur** | Toast d'erreur + retry possible |
| **Édition manuelle** | Contenu IA éditable comme du texte normal |

### Upload Fichiers

| Action | Comportement |
|--------|--------------|
| **Drag & Drop** | Upload automatique |
| **Clic zone** | Ouvre file picker |
| **Fichier valide** | Ajout dans liste + preview |
| **Fichier invalide** | Toast d'erreur (format ou taille) |
| **Suppression** | Clic sur × dans la liste |

### Brouillon

| Condition | Comportement |
|-----------|--------------|
| **Auto-save** | Sauvegarde toutes les 30 secondes |
| **Badge** | "📄 Brouillon" visible tant que non publié |
| **Restauration** | Récupération au rechargement |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton **←** | [liste.md](liste.md) |
| Bouton Publier (succès) | [detail/[id].md](detail/[id].md) |
| ← Sidebar Mes cours | [liste.md](liste.md) |

---

## 📝 Notes

> **Workflow de création** :
> 1. Remplir onglet "Informations" (titre, matière, premier chapitre)
> 2. Optionnel : Utiliser l'Assistant IA pour générer du contenu
> 3. Compléter/éditer dans l'éditeur riche
> 4. Optionnel : Uploader des fichiers
> 5. Cliquer sur "Publier"
> 6. Redirection vers le cours créé

> **Assistant IA** :
> - Utilise l'API Gemini ou GPT-4
> - Génère du contenu basé sur : titre, matière, difficulté, instructions custom
> - Génération : 5-15 secondes selon la complexité
> - Contenu généré : HTML formaté inséré dans l'éditeur
> - Éditable librement après génération

> **Premier chapitre** :
> - Créé automatiquement avec le cours
> - Contient le contenu de l'éditeur + fichiers uploadés
> - Nom personnalisable (défaut: "Introduction")
> - Devient la première "carte" du cours

> **Fichiers** :
> - Max 10 MB par fichier
> - Formats : PDF, JPG, PNG, GIF, DOCX, XLSX, PPTX, ZIP
> - Stockage : Vercel Blob ou AWS S3
> - Attachés au premier chapitre

> **Objectifs pédagogiques** :
> - Format : 1 ligne = 1 objectif
> - Affichés comme liste à puces sur la page du cours
> - Non obligatoires

> **Tags** :
> - Séparés par virgules
> - Convertis en badges
> - Utilisés pour la recherche et le filtrage

> **Auto-save** :
> - Sauvegarde locale (localStorage) toutes les 30 secondes
> - Badge "Brouillon" visible
> - Récupération automatique si rechargement
> - Nettoyage après publication

> **Performance** :
> - Debounce sur les champs (300ms)
> - Upload asynchrone (pas de blocage UI)
> - Génération IA en background avec loader

---

**Navigation** :
- ← [Liste des cours](liste.md)
- → [Détail cours](detail/[id].md) *(après publication)*

*Date : 13 décembre 2025*

