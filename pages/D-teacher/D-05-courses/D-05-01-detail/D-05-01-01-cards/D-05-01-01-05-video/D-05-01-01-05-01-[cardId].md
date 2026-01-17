# Carte Vidéo - Vidéo photosynthèse

> **Chemin de navigation** : Login → Dashboard Teacher → Mes cours → La photosynthèse → Chapitre → **Carte Vidéo**  
> **Route** : `/teacher/courses/[courseId]/cards/video/[cardId]`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/courses/[courseId]/cards/video/[cardId]/page.tsx`

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

5. Onglet "Cours" → Chapitre → Clic sur carte Vidéo ▶️
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Carte Vidéo

### En-tête de la carte (modal plein écran)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ ≡ 📝 Carte vidéo                      Vidéo  Vide  🖊  🗑  ...   👁 Aperçu   │
└──────────────────────────────────────────────────────────────────────────────┘
```

### Onglet unique : Contenu (pas d'onglets multiples)

**Note** : Contrairement aux autres cartes, la carte Vidéo n'a qu'un seul onglet avec 2 modes d'ajout (Lien YouTube/Vimeo OU Importer un fichier)

#### Mode 1 : Lien YouTube/Vimeo

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ + Ajouter une vidéo                                                           │
│                                                                               │
│     🔗 Lien YouTube/Vimeo          |          ⬇️ Importer un fichier         │
│    ─────────────────────                                                      │
│                                                                               │
│ URL de la vidéo                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ https://www.youtube.com/watch?v=... ou https://youtu.be/...              ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ Titre (optionnel)                                                             │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Ex: Introduction au chapitre 1                                            ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                        + Ajouter cette vidéo                              ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ─────────────────────────────────────────────────────────────────────────── │
│                                                                               │
│ Description / Notes (optionnel)                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Points clés des vidéos, timestamps importants...                         ││
│ │                                                                           ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ─────────────────────────────────────────────────────────────────────────── │
│                                                                               │
│ 📹 Instructions pour l'IA (optionnel)                                         │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Donnez du contexte à l'IA pour ces vidéos... Ex: Cette présentation     ││
│ │ NotebookLM résume le chapitre sur la photosynthèse.                       ││
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

#### Mode 2 : Importer un fichier

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ + Ajouter une vidéo                                                           │
│                                                                               │
│     🔗 Lien YouTube/Vimeo          |          ⬇️ Importer un fichier         │
│                                             ────────────────────              │
│                                                                               │
│ Titre (optionnel)                                                             │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Ex: Présentation NotebookLM                                               ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ Fichier vidéo                                                                 │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │                                  📄                                        ││
│ │            Glissez une vidéo ici ou cliquez pour sélectionner             ││
│ │             MP4, WebM, OGG, MOV, AVI • Max 100 Mo                          ││
│ │                                                                           ││
│ │                            ⬇️ Choisir un fichier                           ││
│ │                                                                           ││
│ │ ⚠️ Idéal pour les présentations audio/vidéo générées par NotebookLM ou   ││
│ │    d'autres outils IA.                                                    ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ─────────────────────────────────────────────────────────────────────────── │
│                                                                               │
│ Description / Notes (optionnel)                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Points clés des vidéos, timestamps importants...                         ││
│ │                                                                           ││
│ │                                                                           ││
│ └───────────────────────────────────────────────────────────────────────────┘│
│                                                                               │
│ ─────────────────────────────────────────────────────────────────────────── │
│                                                                               │
│ 📹 Instructions pour l'IA (optionnel)                                         │
│                                                                               │
│ ┌───────────────────────────────────────────────────────────────────────────┐│
│ │ Donnez du contexte à l'IA pour ces vidéos... Ex: Cette présentation     ││
│ │ NotebookLM résume le chapitre sur la photosynthèse.                       ││
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
| `Input` | `@/components/ui/input` | Titre, URL vidéo |
| `Textarea` | `@/components/ui/textarea` | Description, notes |
| `RadioGroup` | `@/components/ui/radio-group` | Sélection source (YouTube/Vimeo/Upload) |
| `Checkbox` | `@/components/ui/checkbox` | Activer transcription |
| `VideoPlayer` | `@/components/ui/video-player` | Preview vidéo |
| `FileUpload` | `@/components/ui/file-upload` | Upload vidéo (si Upload fichier) |

---

---

## 🏗 Structure de la Page

### En-tête (modal plein écran)

- **Icône** : ≡ (menu hamburger)
- **Badge Type** : 📝 Carte vidéo
- **Badges Status** : Vidéo (violet) + Vide (gris)
- **Actions** :
  - 🖊 Éditer
  - 🗑 Supprimer
  - ... Plus d'options
  - 👁 Aperçu

### Navigation : Onglet unique (pas de multi-onglets)

**Important** : Contrairement aux autres cartes (Leçon, Exercice, Quiz), la carte Vidéo n'a **qu'un seul onglet** avec 2 modes d'ajout :
1. **🔗 Lien YouTube/Vimeo**
2. **⬇️ Importer un fichier**

---

### Section : + Ajouter une vidéo

#### Toggle 2 modes (exclusifs)

- **🔗 Lien YouTube/Vimeo** (onglet de gauche, actif par défaut)
- **⬇️ Importer un fichier** (onglet de droite)

---

### MODE 1 : Lien YouTube/Vimeo

#### Champs du formulaire

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| **URL de la vidéo** | Input | ✅ | URL YouTube (youtube.com, youtu.be) ou Vimeo |
| **Titre (optionnel)** | Input | ❌ | Ex: "Introduction au chapitre 1" |

#### Bouton d'action

- **+ Ajouter cette vidéo** (bouton pleine largeur, fond gris)
  - Valide l'URL et ajoute la vidéo à la carte

---

### MODE 2 : Importer un fichier

#### Champs du formulaire

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| **Titre (optionnel)** | Input | ❌ | Ex: "Présentation NotebookLM" |
| **Fichier vidéo** | FileUpload | ✅ | Drag & drop ou sélection fichier |

#### Zone de drag & drop

- **Icône** : 📄
- **Texte** :
  - "Glissez une vidéo ici ou cliquez pour sélectionner"
  - "MP4, WebM, OGG, MOV, AVI • Max 100 Mo"
- **Bouton** : ⬇️ Choisir un fichier
- **Avertissement** : ⚠️ "Idéal pour les présentations audio/vidéo générées par NotebookLM ou d'autres outils IA."

---

### Sections communes (présentes dans les 2 modes)

#### Section : Description / Notes (optionnel)

- **Textarea** : "Points clés des vidéos, timestamps importants..."
  - Multiligne
  - Permet d'ajouter des notes pédagogiques

#### Section : 📹 Instructions pour l'IA (optionnel)

- **Textarea** : "Donnez du contexte à l'IA pour ces vidéos... Ex: Cette présentation NotebookLM résume le chapitre sur la photosynthèse."
  - Multiligne
  - Contexte pour l'assistant IA élève

- **Note explicative** :
  - "Ces instructions seront utilisées par l'assistant IA quand l'élève consulte cette section."
  - Texte gris, plus petit

#### Section : 📄 Base de connaissance

- **En-tête** : 📄 Base de connaissance | Compteur : `0 fichier`
- **Zone de drag & drop** :
  - Icône ⬆ (upload)
  - Texte : "Glissez vos fichiers ici ou **Parcourir**"
  - Formats acceptés : "PDF, images, documents..."
  - État vide : "Aucun fichier ajouté"
  - Limites : max 10 MB, max 10 fichiers

---

### Pied de page

- **× Annuler** (bouton gauche, texte noir)
- **💾 Enregistrer** (bouton droit, fond gris foncé)

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Détails de la carte | - |
| `PATCH` | `/api/teacher/courses/[courseId]/cards/[cardId]` | Mettre à jour la carte | `{ title, description, videoSource, videoUrl, enableTranscription, notes }` |
| `POST` | `/api/upload/video` | Upload vidéo | FormData (max 500 MB) |
| `POST` | `/api/ai/transcribe` | Générer transcription | `{ videoUrl }` |

---

## 💾 Types & Interfaces

```typescript
interface VideoCard {
  id: string;
  chapterId: string;
  courseId: string;
  type: "VIDEO";
  title: string;
  description?: string;
  videoSource: "YOUTUBE" | "VIMEO" | "UPLOAD";
  videoUrl?: string;            // Pour YouTube/Vimeo
  videoFile?: {
    url: string;
    filename: string;
    size: number;
    duration: number;           // Secondes
  };
  enableTranscription: boolean;
  transcription?: string;       // Texte généré par IA
  notes?: string;               // Notes pédagogiques
  order: number;
  createdAt: Date;
  updatedAt: Date;
}
```

---

## ⚙️ Comportements

### Modal plein écran

- La carte s'ouvre en **modal** superposée à la page de détail du cours
- Clic sur **× Annuler** ou **Échap** → Ferme le modal (demande confirmation si modifications non sauvegardées)

### Toggle entre 2 modes

- Clic sur **🔗 Lien YouTube/Vimeo** → Affiche formulaire URL + Titre
- Clic sur **⬇️ Importer un fichier** → Affiche formulaire Titre + Upload fichier
- Les 2 modes sont **exclusifs** (pas de sélection multiple)
- Soulignement indique le mode actif

### MODE 1 : Lien YouTube/Vimeo

#### Validation URL

- **YouTube** :
  - Formats acceptés : `https://www.youtube.com/watch?v=...`, `https://youtu.be/...`
  - Validation en temps réel (regex)
  - Erreur si format invalide : "URL YouTube invalide"

- **Vimeo** :
  - Format : `https://vimeo.com/...`
  - Validation en temps réel
  - Erreur si format invalide : "URL Vimeo invalide"

#### Ajout de la vidéo

1. **Saisir URL** dans l'input "URL de la vidéo"
2. **Optionnel** : Saisir un titre personnalisé
3. **Clic sur "+ Ajouter cette vidéo"** :
   - Valide l'URL
   - Si valide → Ajoute la vidéo (preview embedded)
   - Si invalide → Affiche erreur

### MODE 2 : Importer un fichier

#### Upload fichier

- **Drag & drop** :
  - Glisser fichier depuis l'explorateur → Zone devient bleue
  - Relâcher → Démarre l'upload

- **Clic sur "⬇️ Choisir un fichier"** :
  - Ouvre sélecteur de fichiers
  - Filtres : `.mp4`, `.webm`, `.ogg`, `.mov`, `.avi`

- **Limites** :
  - Taille max : 100 Mo
  - Formats acceptés : MP4, WebM, OGG, MOV, AVI
  - Erreur si dépassement : "Fichier trop volumineux (max 100 Mo)"

- **Barre de progression** :
  - Affichée pendant l'upload
  - Pourcentage en temps réel
  - Bouton "× Annuler" pour stopper l'upload

### Sections communes

#### Description / Notes

- Textarea libre pour notes pédagogiques
- Sauvegarde automatique toutes les 30 secondes

#### Instructions pour l'IA

- Contexte pour l'assistant IA élève
- Utilisé quand l'élève consulte la vidéo ou demande de l'aide

#### Base de connaissance

- **Drag & drop** : Glisser des fichiers depuis l'explorateur → Upload automatique
- **Parcourir** : Clic → Ouvre sélecteur de fichiers
- Formats acceptés : PDF, images (PNG, JPG), documents (DOCX, TXT)
- **Limite** : 10 MB par fichier, max 10 fichiers
- Compteur en temps réel : "X fichier(s)"

### Sauvegarde

- **💾 Enregistrer** :
  - Sauvegarde tous les champs (mode actif, URL ou fichier, titre, notes, instructions, base de connaissance)
  - Indicateur visuel : "Sauvegardé" ou "Non sauvegardé"
  - Auto-save toutes les 30 secondes

- **× Annuler** :
  - Ferme le modal sans sauvegarder
  - Si modifications → Demande confirmation

---

## 🔗 Navigation

### Ouverture de la carte

- Depuis la **page de détail du cours** (`teacher/courses/detail/[id].md`) :
  - Clic sur une carte Vidéo dans un chapitre → Ouvre le modal plein écran

### Fermeture du modal

- **× Annuler** : Ferme sans sauvegarder (demande confirmation si modif)
- **Échap** (clavier) : Même comportement que × Annuler
- **Après sauvegarde** :
  - Modal reste ouvert
  - Notification toast : "Vidéo enregistrée avec succès"

---

## 📝 Notes

- **Type de carte** : Vidéo (2ème type de carte après Leçon)
- **Interface** : Modal plein écran (pas une page séparée)
- **Onglets** : **Onglet unique** avec 2 modes (Lien YouTube/Vimeo OU Importer un fichier)
  - **Différence clé** : Pas de multi-onglets (Contenu, Génération IA, Paramètres) comme les autres cartes
- **Base de connaissance** : Section présente pour contexte IA
- **Sources vidéo** : YouTube, Vimeo, ou upload fichier (MP4, WebM, OGG, MOV, AVI)
- **Instructions IA** : Contexte pour l'assistant IA élève quand il consulte la vidéo
- **Badges** :
  - **Vidéo** (violet) : Type de carte
  - **Vide** (gris) : État vide (aucune vidéo ajoutée)
  - Badge devient **Publié** ou **Brouillon** selon l'état de publication
- **Cas d'usage** : Idéal pour vidéos YouTube/Vimeo ou présentations audio NotebookLM
- **Objectif pédagogique** : Support visuel/audio pour expliquer des concepts

---

## 🚧 À DOCUMENTER

### Validation détaillée

| Champ | Validation |
|-------|------------|
| URL YouTube | Regex : `^(https?://)?(www\.)?(youtube\.com|youtu\.be)/.+$` |
| URL Vimeo | Regex : `^https://vimeo\.com/\d+$` |
| Fichier vidéo | Extensions : `.mp4`, `.webm`, `.ogg`, `.mov`, `.avi` |
| Taille fichier | Max 100 Mo (102 400 000 octets) |
| Titre | Max 200 caractères (optionnel) |
| Description/Notes | Max 2000 caractères (optionnel) |
| Instructions IA | Max 1000 caractères (optionnel) |

### Exemples de Données

> **Vidéo YouTube** :
> - URL : `https://www.youtube.com/watch?v=dQw4w9WgXcQ`
> - Titre : "Introduction au chapitre 1"
> - Notes : "Regarder de 0:00 à 5:30 pour la partie théorique"
> - Instructions IA : "Cette vidéo explique les bases de la photosynthèse"

> **Vidéo uploadée** :
> - Fichier : `presentation-notebooklm-photosynthese.mp4` (45 Mo)
> - Titre : "Présentation NotebookLM - Photosynthèse"
> - Notes : "Résumé audio généré par NotebookLM à partir du cours"
> - Instructions IA : "Cette présentation NotebookLM résume le chapitre sur la photosynthèse"

> **Performance** :
> - Upload 100 Mo : ~10-30 secondes (selon connexion)
> - Validation URL : instantanée (< 100ms)
> - Embed YouTube/Vimeo : lazy loading
> - Auto-save toutes les 30 secondes

> **Limites** :
> - 1 vidéo par carte (lien OU fichier, pas les 2)
> - Max 100 Mo pour upload fichier
> - Formats vidéo supportés : MP4, WebM, OGG, MOV, AVI

---

**Navigation** :
- ← [Retour au cours](../../[id].md)

*Date : 13 décembre 2025*

| Source | Comportement |
|--------|--------------|
| **YouTube** | Affiche champ "URL de la vidéo" + validation regex + preview |
| **Vimeo** | Affiche champ "URL de la vidéo" + validation regex + preview |
| **Upload** | Affiche zone drag & drop + upload asynchrone + preview player |

### Validation URL

| Plateforme | Regex | Exemple |
|------------|-------|---------|
| YouTube | `youtube\.com/watch\?v=` ou `youtu\.be/` | `https://www.youtube.com/watch?v=dQw4w9WgXcQ` |
| Vimeo | `vimeo\.com/\d+` | `https://vimeo.com/123456789` |

### Upload Fichier

| Action | Comportement |
|--------|--------------|
| **Drag & Drop** | Upload automatique avec barre de progression |
| **Validation** | Format (MP4, WebM, AVI), taille (max 500 MB) |
| **Traitement** | Conversion en format web-optimisé (H.264) |
| **Succès** | Preview dans player custom + URL générée |
| **Erreur** | Toast d'erreur (format invalide ou taille trop grande) |

### Transcription Automatique

| Action | Comportement |
|--------|--------------|
| **Activation** | Coche "Activer la transcription automatique" |
| **Processus** | Extraction audio + API Whisper (OpenAI) ou Google Speech-to-Text |
| **Durée** | 2-5 minutes selon longueur vidéo |
| **Résultat** | Texte généré affiché sous la vidéo pour les élèves |
| **Édition** | Transcription éditable manuellement |

### Preview Vidéo

| Source | Preview |
|--------|---------|
| **YouTube** | Iframe YouTube embarqué |
| **Vimeo** | Iframe Vimeo embarqué |
| **Upload** | Player HTML5 avec contrôles (play, pause, volume, fullscreen) |

### Auto-save
- Sauvegarde automatique toutes les 30 secondes
- Upload fichier : sauvegarde immédiate après upload réussi

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton ← | [../../[id].md](../../[id].md) |
| Enregistrer (succès) | [../../[id].md](../../[id].md) |

---

## 📝 Notes

> **Exemple de données** :
> - Titre : "Vidéo photosynthèse"
> - Description : "Explication vidéo du processus de photosynthèse"
> - Source : YouTube
> - URL : `https://www.youtube.com/watch?v=example`
> - Transcription : Activée
> - Notes : "Points clés à retenir : Le rôle de la chlorophylle, Les étapes du processus"

> **Sources vidéo** :
> - **YouTube** : Gratuit, pas de stockage, dépendance externe
> - **Vimeo** : Meilleure qualité, contrôle privacy, limites upload
> - **Upload** : Contrôle total, coût stockage/bande passante, max 500 MB

> **Transcription** :
> - Utilisée pour accessibilité (sous-titres)
> - Améliore SEO et recherche
> - Peut être éditée manuellement
> - Coût : ~$0.006/minute (Whisper API)

> **Performance** :
> - Upload asynchrone en background
> - Vidéos converties en résolutions multiples (360p, 720p, 1080p)
> - Adaptive streaming pour meilleure expérience
> - CDN pour delivery rapide

> **Limites** :
> - YouTube/Vimeo : Pas de limite upload
> - Upload fichier : Max 500 MB
> - Formats acceptés : MP4, WebM, AVI, MOV
> - Durée max recommandée : 30 minutes

---

**Navigation** :
- ← [Retour au cours](../../[id].md)

*Date : 13 décembre 2025*
