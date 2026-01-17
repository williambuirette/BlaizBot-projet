# Roadmap de Navigation - BlaizBot V1

> **Cartographie complète de la navigation dans l'application**

---

## � Arborescence Visuelle

```
blaizbot-wireframe/pages/
│
├── auth/                       # 🔐 Authentification
│   ├── accueil.md              # Page d'accueil (/) - Redirection
│   ├── login.md                # Connexion (/login)
│   └── unauthorized.md         # Accès refusé (/unauthorized)
│
├── admin/
│   ├── 00-dashboard.md         # Dashboard administrateur
│   │
│   ├── header-menu/            # Modales globales (header)
│   │   ├── mon-profil.md       # 👤 Profil (2 onglets)
│   │   ├── parametres.md       # ⚙️  Paramètres
│   │   └── config-ia.md        # 🤖 Configuration IA (admin only)
│   │
│   ├── users/                  # 👥 Gestion utilisateurs
│   │   ├── liste.md            # Liste + tableau
│   │   ├── create.md           # Modale : Créer
│   │   └── edit.md             # Modale : Modifier
│   │
│   ├── classes/                # 🏫 Gestion classes
│   │   ├── liste.md            # Liste + tableau
│   │   ├── create.md           # Modale : Créer
│   │   └── edit.md             # Modale : Modifier
│   │
│   └── subjects/               # 📚 Gestion matières
│       ├── liste.md            # Liste + tableau + couleurs
│       ├── create.md           # Modale : Créer
│       └── edit.md             # Modale : Modifier
│
├── student/                    # 🎓 Espace Élève
│   ├── dashboard.md            # Dashboard élève
│   │
│   ├── header-menu/            # Modales globales (header)
│   │   ├── mon-profil.md       # 👤 Profil (2 onglets)
│   │   └── parametres.md       # ⚙️ Paramètres
│   │
│   ├── courses/                # 📚 Mes cours
│   │   ├── liste.md            # Liste cours (KPIs + tableau)
│   │   └── detail/             # Détail d'un cours
│   │       ├── [id].md         # 2 onglets : Informations + Cours
│   │       │                   # 
│   │       │                   # ┌─ Onglet "Cours" contient 2 sections :
│   │       │                   # │
│   │       ├── cards/          # ├─ Section 1️⃣ : 📚 Contenu du cours (cartes prof)
│   │       │   │               # │   ⚠️ MODE VUE 👁️ (lecture seule)
│   │       │   ├── note/       # │   ├─ 📝 Carte Note
│   │       │   │   └── [cardId].md  # │   │   └─ Consultation note prof
│   │       │   ├── lesson/     # │   ├─ 📄 Carte Leçon
│   │       │   │   └── [cardId].md  # │   │   └─ Contenu leçon + ressources
│   │       │   ├── video/      # │   ├─ ▶️ Carte Vidéo
│   │       │   │   └── [cardId].md  # │   │   └─ Lecteur vidéo + transcription
│   │       │   ├── exercise/   # │   ├─ ✏️ Carte Exercice
│   │       │   │   └── [cardId].md  # │   │   └─ Énoncé + soumission réponse
│   │       │   └── quiz/       # │   └─ ❓ Carte Quiz
│   │       │       └── [cardId].md  # │       └─ Questions + validation réponses
│   │       │                   # │
│   │       └── supplements/    # └─ Section 2️⃣ : 🎒 Mes suppléments (créés par élève)
│   │           (voir revisions/[supplementId]/cards/ ci-dessous) ◄──┐
│   │                                                                │
│   ├── revisions/              # 📝 Mes révisions                  │
│   │   │                       #                                    │
│   │   │   ┌─────────────────────────────────────────────────────┐  │
│   │   │   │ 📄 liste.md = Page principale                       │  │
│   │   │   │                                                     │  │
│   │   │   │ ┌─────────────┐  ┌─────────────┐                    │  │
│   │   │   │ │ 📦 Carte    │  │ 📦 Carte    │   [+ Nouveau]      │  │
│   │   │   │ │ supplément  │  │ supplément  │        ↓           │  │
│   │   │   │ │   (⋮ menu)  │  │   (⋮ menu)  │   create.md        │  │
│   │   │   │ │      ↓      │  │      ↓      │                    │  │
│   │   │   │ │ liste/      │  │  [Clic]     │                    │  │
│   │   │   │ │ liaison-    │  │     ↓       │                    │  │
│   │   │   │ │ cours.md    │  │ detail/     │                    │  │
│   │   │   │ └─────────────┘  │  [id].md    │                    │  │
│   │   │   │                  └─────────────┘                    │  │
│   │   │   └─────────────────────────────────────────────────────┘  │
│   │   │                                                            │
│   │   ├── liste.md            # Page : KPIs + Filtres + Grille cartes
│   │   ├── liste/              # 📁 Composants de la page liste
│   │   │   ├── supplement-card.md  # 📦 Composant : Carte de supplément
│   │   │   └── liaison-cours.md    # 🔗 Modale : Lier à un cours (via ⋮)
│   │   ├── create.md           # ➕ Page : Créer un supplément    │
│   │   └── detail/             # Détail d'un supplément (clic carte)
│   │       ├── [id].md         # Vue structure (chapitres → cartes) │
│   │       └── cards/          # Cartes du supplément (5 types) ◄───┘
│   │           │               # ⚠️ MODE ÉDITION ✏️ (création/modification)
│   │           │               # ⚠️ Affiché dans 2 endroits :
│   │           │               #    • revisions/detail/[id].md (page dédiée)
│   │           │               #    • courses/detail/[id].md section 2️⃣ (si lié à cours)
│   │           │
│   │           ├── note/       # 📝 Carte Note
│   │           │   └── [cardId].md  # Note personnelle rich text
│   │           ├── lesson/     # 📄 Carte Leçon (supplément élève)
│   │           │   └── [cardId].md  # Contenu leçon créé par l'élève
│   │           ├── video/      # ▶️ Carte Vidéo (supplément élève)
│   │           │   └── [cardId].md  # Vidéo enregistrée/uploadée
│   │           ├── exercise/   # ✏️ Carte Exercice (supplément élève)
│   │           │   └── [cardId].md  # Exercice créé par l'élève
│   │           └── quiz/       # ❓ Carte Quiz (supplément élève)
│   │               └── [cardId].md  # Quiz personnalisé
│   │
│   ├── agenda/                 # 📅 Mon Agenda
│   │   ├── page.md             # Vue Calendrier + Vue Liste (KPIs, filtres, assignations)
│   │   └── create-objectif.md  # Modale : Nouvel objectif personnel
│   │
│   ├── ai/                     # 🤖 Assistant IA (Blaiz'bot Studio)
│   │   ├── page.md             # Chat IA : Liste conversations + Zone chat
│   │   └── create-conversation.md  # Modale : Nouvelle conversation
│   │
│   └── messages/               # 💬 Messages
│       ├── page.md             # Messagerie : Liste conversations + Chat
│       └── create-conversation.md  # Modale : Nouvelle conversation
│
└── teacher/                    # 👨‍🏫 Espace Professeur
    ├── dashboard.md            # Dashboard professeur
    │
    ├── header-menu/            # Modales globales (header)
    │   ├── mon-profil.md       # 👤 Profil (2 onglets)
    │   └── parametres.md       # ⚙️  Paramètres
    │
    ├── classes/                # 🏫 Mes classes
    │   ├── liste.md            # Liste des classes assignées
    │   └── detail/             # Détail d'une classe
    │       └── [id].md         # Vue classe + élèves + activité IA
    │
    ├── students/               # 👥 Mes élèves
    │   ├── liste.md            # Liste des élèves (9 élèves, grille/liste)
    │   └── detail/             # Profil d'un élève
    │       └── [id].md         # Vue profil + stats + 3 onglets
    │
    ├── courses/                # 📚 Mes cours
    │   ├── liste.md            # Liste des cours (contenus pédagogiques)
    │   ├── new.md              # Création cours (2 onglets : Infos + Contenu IA)
    │   └── detail/             # Détail d'un cours
    │       ├── [id].md         # 2 onglets : Infos + Structure (chapitres → cartes)
    │       └── cards/          # Édition des cartes (5 types)
    │           ├── note/       # 📝 Carte Note
    │           │   └── [cardId].md  # Éditeur rich text pour notes
    │           ├── lesson/     # 📄 Carte Leçon
    │           │   └── [cardId].md  # Éditeur rich text + ressources
    │           ├── video/      # ▶️ Carte Vidéo
    │           │   └── [cardId].md  # YouTube/Vimeo/Upload + transcription
    │           ├── exercise/   # ✏️ Carte Exercice
    │           │   └── [cardId].md  # Questions ouvertes + correction Auto/Manuel
    │           └── quiz/       # ❓ Carte Quiz
    │               └── [cardId].md  # QCM/Vrai-Faux/Réponse courte + paramètres
    │
    ├── agendas-assignations/   # 📅 Agendas et Assignations
    │   ├── liste.md            # Gestion des devoirs et calendrier (2 onglets)
    │   └── create.md           # Modale : Nouvelle assignation (7 étapes)
    │
    └── messages/               # 💬 Messages
        └── page.md             # Messagerie professeur
```

---

## 📐 Logique d'Arborescence

### Modes d'Affichage des Cartes (Élève)

| Interface | Mode | Icône | Description |
|-----------|------|-------|-------------|
| **Mes Cours** (`/student/courses`) | 👁️ VUE | Lecture seule | Cartes créées par le prof → consultation uniquement |
| **Mes Révisions** (`/student/revisions`) | ✏️ ÉDITION | Création/Modification | Cartes créées par l'élève → contrôle total |

> **Règle d'or** : L'élève ne peut JAMAIS modifier les cartes du professeur. Il peut uniquement créer ses propres cartes dans "Mes Révisions".

### Convention de Nommage des Fichiers

**Pour les pages avec modales** :
```
dossier/
├── liste.md    → Page principale (liste/tableau)
├── create.md   → Modale de création
└── edit.md     → Modale d'édition
```

**Principes** :
- ✅ Fichiers séparés pour chaque modale
- ✅ `liste.md` = page uniquement (pas de contenu des modales)
- ✅ `create.md` et `edit.md` = documentation dédiée
- ✅ Liens croisés dans la section Navigation

---

## Structure

### Authentification (`auth/`)
- [auth/accueil.md](auth/accueil.md) - Page d'accueil (`/`) - Redirection vers login
- [auth/login.md](auth/login.md) - Connexion (`/login`) - Formulaire + DEV buttons
- [auth/unauthorized.md](auth/unauthorized.md) - Accès refusé (`/unauthorized`)

---

### Espace Admin (`/admin`)

#### Dashboard
- [admin/00-dashboard.md](admin/00-dashboard.md) - Dashboard administrateur

#### Header Menu (Modales globales)
- [admin/header-menu/mon-profil.md](admin/header-menu/mon-profil.md) - Profil utilisateur (onglets : Informations + Sécurité)
- [admin/header-menu/parametres.md](admin/header-menu/parametres.md) - Paramètres (Notifications, Préférences, Assistant IA)
- [admin/header-menu/config-ia.md](admin/header-menu/config-ia.md) - Configuration IA (Clé API Gemini, admin only)

#### Gestion des Utilisateurs
- [admin/users/liste.md](admin/users/liste.md) - Liste des utilisateurs (tableau, recherche, filtres)
- [admin/users/create.md](admin/users/create.md) - Modale : Créer un utilisateur
- [admin/users/edit.md](admin/users/edit.md) - Modale : Modifier un utilisateur

#### Gestion des Classes
- [admin/classes/liste.md](admin/classes/liste.md) - Liste des classes
- [admin/classes/create.md](admin/classes/create.md) - Modale : Créer une classe
- [admin/classes/edit.md](admin/classes/edit.md) - Modale : Modifier une classe

#### Gestion des Matières
- [admin/subjects/liste.md](admin/subjects/liste.md) - Liste des matières (avec couleurs)
- [admin/subjects/create.md](admin/subjects/create.md) - Modale : Créer une matière
- [admin/subjects/edit.md](admin/subjects/edit.md) - Modale : Modifier une matière

---

### Espace Élève (`/student`)

#### Dashboard
- [student/dashboard.md](student/dashboard.md) - Dashboard élève (Bienvenue + KPIs + Accès rapide)

#### Header Menu (Modales globales)
- [student/header-menu/mon-profil.md](student/header-menu/mon-profil.md) - Profil utilisateur (onglets : Informations + Sécurité)
- [student/header-menu/parametres.md](student/header-menu/parametres.md) - Paramètres (Notifications, Préférences, Assistant IA en lecture seule)

#### Mes Cours
- [student/courses/liste.md](student/courses/liste.md) - Liste des cours (KPIs + filtres + tableau)
- [student/courses/detail/[id].md](student/courses/detail/[id].md) - Détail cours (2 onglets : Informations + Cours)
- **Cartes pédagogiques (5 types)** :
  - [student/courses/detail/cards/note/[cardId].md](student/courses/detail/cards/note/[cardId].md) - 📝 Carte Note (consultation note prof)
  - [student/courses/detail/cards/lesson/[cardId].md](student/courses/detail/cards/lesson/[cardId].md) - 📄 Carte Leçon (contenu + ressources)
  - [student/courses/detail/cards/video/[cardId].md](student/courses/detail/cards/video/[cardId].md) - ▶️ Carte Vidéo (lecteur + transcription)
  - [student/courses/detail/cards/exercise/[cardId].md](student/courses/detail/cards/exercise/[cardId].md) - ✏️ Carte Exercice (énoncé + soumission)
  - [student/courses/detail/cards/quiz/[cardId].md](student/courses/detail/cards/quiz/[cardId].md) - ❓ Carte Quiz (questions + validation)

#### Mes Révisions
- [student/revisions/liste.md](student/revisions/liste.md) - **Page principale** : KPIs + Filtres (Tous, Liés, Perso) + Grille de cartes
  - **Composants de la page** (dossier `liste/`) :
    - [student/revisions/liste/supplement-card.md](student/revisions/liste/supplement-card.md) - 📦 Composant : Carte de supplément (affichée dans la grille)
    - [student/revisions/liste/liaison-cours.md](student/revisions/liste/liaison-cours.md) - 🔗 Modale : Lier à un cours (via menu ⋮ ou "+ Lier à un cours")
  - **Actions depuis la page** :
    - [+ Nouveau] → [student/revisions/create.md](student/revisions/create.md) - ➕ Page : Créer un supplément
    - [Clic sur carte] → [student/revisions/detail/[id].md](student/revisions/detail/[id].md) - 📂 Détail supplément
- **Cartes suppléments (5 types)** - MODE ÉDITION ✏️ :
  - [student/revisions/detail/cards/note/[cardId].md](student/revisions/detail/cards/note/[cardId].md) - 📝 Carte Note (note personnelle rich text)
  - [student/revisions/detail/cards/lesson/[cardId].md](student/revisions/detail/cards/lesson/[cardId].md) - 📄 Carte Leçon (contenu créé par l'élève)
  - [student/revisions/detail/cards/video/[cardId].md](student/revisions/detail/cards/video/[cardId].md) - ▶️ Carte Vidéo (vidéo enregistrée/uploadée)
  - [student/revisions/detail/cards/exercise/[cardId].md](student/revisions/detail/cards/exercise/[cardId].md) - ✏️ Carte Exercice (exercice créé par l'élève)
  - [student/revisions/detail/cards/quiz/[cardId].md](student/revisions/detail/cards/quiz/[cardId].md) - ❓ Carte Quiz (quiz personnalisé)

#### Agenda
- [student/agenda/page.md](student/agenda/page.md) - **Page Agenda** : Vue Calendrier + Vue Liste
  - 4 KPIs : Total, En retard, Aujourd'hui, À venir
  - Filtres : Source, Matières, Cours, Statuts, Période
  - 2 sources : Prof (assignations) / Perso (objectifs)
  - [student/agenda/create-objectif.md](student/agenda/create-objectif.md) - Modale : Nouvel objectif personnel

#### Assistant IA (Blaiz'bot Studio)
- [student/ai/page.md](student/ai/page.md) - **Page Assistant IA** : Liste conversations + Zone chat
  - 2 colonnes : Conversations (gauche) + Chat (droite)
  - États : Vide (bienvenue) / Actif (fil de messages)
  - Filtres par période + type
  - [student/ai/create-conversation.md](student/ai/create-conversation.md) - Modale : Nouvelle conversation (Libre ou Liée à un cours)

#### Messages
- [student/messages/page.md](student/messages/page.md) - **Page Messages** : Liste conversations + Zone chat
  - 2 colonnes : Conversations (gauche) + Chat (droite)
  - Filtres : Année scolaire, dates, matière, cours, recherche
  - Groupes : Conversations privées, de cours
  - [student/messages/create-conversation.md](student/messages/create-conversation.md) - Modale : Nouvelle conversation (3 types : Professeur, Élève, Groupe)

---

### Espace Professeur (`/teacher`)

#### Dashboard
- [teacher/dashboard.md](teacher/dashboard.md) - Dashboard professeur (Centre de Pilotage)

#### Header Menu (Modales globales)
- [teacher/header-menu/mon-profil.md](teacher/header-menu/mon-profil.md) - Profil professeur (onglets : Informations + Sécurité)
- [teacher/header-menu/parametres.md](teacher/header-menu/parametres.md) - Paramètres (Notifications, Préférences, Assistant IA)

#### Mes Classes
- [teacher/classes/liste.md](teacher/classes/liste.md) - Mes classes (2 classes assignées, statistiques, filtres)
- [teacher/classes/detail/[id].md](teacher/classes/detail/[id].md) - Détail classe (élèves, Score IA, Cockpit Pédagogique)

#### Mes Élèves
- [teacher/students/liste.md](teacher/students/liste.md) - Mes élèves (9 élèves, statistiques, filtres, vue grille/liste)
- [teacher/students/detail/[id].md](teacher/students/detail/[id].md) - Profil élève (4 stats, 3 onglets : Scores, Assignations, Activités IA)

#### Mes Cours
- [teacher/courses/liste.md](teacher/courses/liste.md) - Mes cours (contenus pédagogiques, performances)
- [teacher/courses/new.md](teacher/courses/new.md) - Nouveau cours (2 onglets : Informations + Contenu & Fichiers avec Assistant IA)
- [teacher/courses/detail/[id].md](teacher/courses/detail/[id].md) - Détail cours (2 onglets : Informations + Structure arborescente avec chapitres → cartes [Note/Leçon/Vidéo/Exercice/Quiz])
- **Cartes pédagogiques (5 types)** :
  - [teacher/courses/detail/cards/note/[cardId].md](teacher/courses/detail/cards/note/[cardId].md) - 📝 Carte Note (éditeur rich text pour notes)
  - [teacher/courses/detail/cards/lesson/[cardId].md](teacher/courses/detail/cards/lesson/[cardId].md) - 📄 Carte Leçon (éditeur rich text + ressources)
  - [teacher/courses/detail/cards/video/[cardId].md](teacher/courses/detail/cards/video/[cardId].md) - ▶️ Carte Vidéo (YouTube/Vimeo/Upload + transcription auto)
  - [teacher/courses/detail/cards/exercise/[cardId].md](teacher/courses/detail/cards/exercise/[cardId].md) - ✏️ Carte Exercice (questions ouvertes + correction IA/Manuelle)
  - [teacher/courses/detail/cards/quiz/[cardId].md](teacher/courses/detail/cards/quiz/[cardId].md) - ❓ Carte Quiz (QCM/Vrai-Faux/Réponse courte + scoring automatique)

#### Agendas et Assignations
- [teacher/agendas-assignations/liste.md](teacher/agendas-assignations/liste.md) - Calendrier interactif (2 onglets : Calendrier + Liste) + filtres + stats
- [teacher/agendas-assignations/create.md](teacher/agendas-assignations/create.md) - Modale : Nouvelle assignation (workflow 7 étapes)

#### Messages
- [teacher/messages/page.md](teacher/messages/page.md) - Messagerie temps réel (2 colonnes : Conversations + Messages)
- [teacher/messages/create.md](teacher/messages/create.md) - Modale : Nouvelle conversation (3 types : Un élève, Plusieurs élèves, Classe entière)

---

## 🗺️ Flux de Navigation

### Connexion
```
00-accueil.md → 01-login.md → [Dashboard selon rôle]
                           ↓
                    02-unauthorized.md (si accès refusé)
```

### Admin - Gestion Utilisateurs
```
admin/00-dashboard.md
  ↓
admin/users/liste.md
  ├→ [+ Ajouter] → admin/users/create.md
  └→ [...] → Éditer → admin/users/edit.md
```

### Admin - Gestion Classes
```
admin/00-dashboard.md
  ↓
admin/classes/liste.md
  ├→ [+ Ajouter] → admin/classes/create.md
  └→ [...] → Modifier → admin/classes/edit.md
```

### Admin - Gestion Matières
```
admin/00-dashboard.md
  ↓
admin/subjects/liste.md
  ├→ [+ Ajouter] → admin/subjects/create.md
  └→ [...] → Modifier → admin/subjects/edit.md
```

---

## 📊 Statistiques de Documentation

| Section | Fichiers | Status |
|---------|----------|--------|
| **Pages publiques** | 3 | ✅ Complétées |
| **Admin - Dashboard** | 1 | ✅ Complété |
| **Admin - Header Menu** | 3 | ✅ Complété |
| **Admin - Utilisateurs** | 3 | ✅ Complété |
| **Admin - Classes** | 3 | ✅ Complété |
| **Admin - Matières** | 3 | ✅ Complété |
| **Élève - Révisions** | 9 | ✅ Complété |
| **Élève - Agenda** | 2 | ✅ Complété |
| **Élève - Assistant IA** | 2 | ✅ Complété |
| **Élève - Messages** | 2 | ✅ Complété |
| **Professeur - Dashboard** | 1 | ✅ Complété |
| **Professeur - Header Menu** | 2 | ✅ Complété |
| **Professeur - Classes** | 2 | ✅ Complété |
| **Professeur - Élèves** | 2 | ✅ Complété |
| **Professeur - Cours** | 7 | ✅ Complété |
| **Professeur - Agendas** | 1 | ✅ Complété |
| **Professeur - Messages** | - | ⏳ À faire |

**Total** : 47 fichiers documentés

---

*Dernière mise à jour : 16 janvier 2026*

