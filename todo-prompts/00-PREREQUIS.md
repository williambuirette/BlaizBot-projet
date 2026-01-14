# Phase 00 — Prérequis

> Stack technique, outils et environnement de développement à préparer AVANT de coder

---

## 0.0 — Prompt de lancement du projet

### Contexte
Avant de commencer à coder, il faut donner à l'IA (GitHub Copilot, Claude, ChatGPT) une vision claire du projet. Ce prompt initial définit le périmètre, les rôles utilisateurs, les fonctionnalités attendues et les contraintes techniques.

### Description
Ce prompt doit être donné à l'IA au tout début de chaque nouvelle session de développement. Il permet à l'IA de comprendre :
- Le type d'application à créer
- Les utilisateurs cibles et leurs rôles
- Les fonctionnalités principales par rôle
- La stack technique choisie
- Les contraintes et conventions

### Prompt
```
Je veux créer une application éducative appelée "BlaizBot".

## Description
Application web full-stack permettant la gestion d'une école avec 3 types d'utilisateurs :
- Élèves : consulter cours, agenda, messagerie, réviser avec flashcards, chat IA
- Professeurs : créer cours, assigner devoirs, messagerie, génération IA de contenu
- Administrateurs : gérer utilisateurs, classes, matières, niveaux, paramètres

## Fonctionnalités principales

### Élève
- Dashboard avec statistiques personnelles (cours terminés, progression, score moyen)
- Agenda/Calendrier des assignations avec filtres
- Mes Cours : accès aux cours assignés par chapitre/section
- Révisions : système de flashcards pour mémorisation
- Messages : conversations privées et groupes avec profs/camarades
- Assistant IA : chat avec Gemini pour aide pédagogique, génération quiz/exercices

### Professeur
- Dashboard avec KPIs classes et alertes élèves
- Mes Cours : création cours avec chapitres, sections (Lesson, Quiz, Exercise, Note, Video)
- Assignations : assigner cours/sections aux élèves ou classes
- Classes : vue des élèves par classe
- Messages : communication avec élèves et groupes
- Génération IA : création automatique de contenu pédagogique

### Administrateur
- Utilisateurs : CRUD complet avec attribution rôles, classes (élève), matières (prof)
- Classes : gestion des groupes avec niveaux personnalisables
- Matières : catalogue des matières avec couleurs/icônes
- Paramètres : configuration globale et clés API IA

## Stack technique
- Frontend : Next.js 15 (App Router), React 19, TypeScript, Tailwind CSS
- UI : shadcn/ui, Radix UI, Lucide Icons
- Backend : Next.js API Routes
- BDD : PostgreSQL (Neon serverless) + Prisma ORM 6.x
- Auth : NextAuth v5 (credentials provider)
- IA : Google Gemini 2.0 Flash
- Hébergement : Vercel
- Storage : Vercel Blob (fichiers uploadés)

## Conventions obligatoires
- TypeScript strict, pas de `any`
- Fichiers < 350 lignes (découper si nécessaire)
- Commits conventionnels : feat:, fix:, docs:, refactor:, chore:
- API responses : { success: boolean, data?: T, error?: string }
- 1 composant = 1 fichier, props typées
- Secrets dans .env.local, jamais en dur

## Structure des dossiers
src/
├── app/
│   ├── (auth)/           # Pages publiques (login)
│   ├── (dashboard)/      # Pages protégées
│   │   ├── student/      # Interface élève (6 pages)
│   │   ├── teacher/      # Interface professeur (5 pages)
│   │   └── admin/        # Interface administrateur (4 pages)
│   └── api/              # API Routes REST
│       ├── admin/        # CRUD users, classes, subjects, levels
│       ├── teacher/      # courses, assignments, messages
│       ├── student/      # dashboard, agenda, revisions
│       └── ai/           # chat, generate-*
├── components/
│   ├── ui/               # Composants shadcn/ui
│   ├── layout/           # Sidebar, Header
│   └── features/         # Composants métier par domaine
├── lib/                  # prisma.ts, auth.ts, utils
├── hooks/                # Hooks React personnalisés
└── types/                # Types TypeScript partagés

Confirme que tu as compris le projet et demande-moi par quelle phase commencer.
```

---

## 0.1 — Stack technique cible

### 0.1.1 — Frontend (Next.js, React, TypeScript, Tailwind)

#### Contexte
Le frontend constitue le cœur de l'interface utilisateur. Next.js 15 avec App Router offre le meilleur compromis entre performance et facilité de développement pour une application full-stack.

#### Description
| Technologie | Version | Rôle |
|:------------|:--------|:-----|
| Next.js | 15.x | Framework React full-stack avec App Router |
| React | 19.x | Bibliothèque UI composants |
| TypeScript | 5.x | Typage statique, meilleure DX |
| Tailwind CSS | 3.4.x | Styles utilitaires, responsive |

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Lire et comprendre le tableau ci-dessus.
Ces technologies seront installées dans la Phase 01.
```

---

### 0.1.2 — UI (shadcn/ui, Radix UI, Lucide Icons)

#### Contexte
Les composants UI doivent être accessibles, personnalisables et cohérents. shadcn/ui est la référence actuelle car il génère le code directement dans le projet (pas de dépendance externe).

#### Description
| Technologie | Rôle |
|:------------|:-----|
| shadcn/ui | Composants copiés dans le projet, personnalisables |
| Radix UI | Primitives headless (accessibilité WCAG) |
| Lucide Icons | Icônes SVG légères et cohérentes |

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Lire et comprendre le tableau ci-dessus.
shadcn/ui sera installé dans la Phase 02.
```

---

### 0.1.3 — Backend (API Routes, Prisma ORM)

#### Contexte
Next.js permet de créer des API REST directement dans le projet. Prisma est l'ORM TypeScript le plus populaire, offrant une excellente intégration avec le typage.

#### Description
| Technologie | Version | Rôle |
|:------------|:--------|:-----|
| Next.js API Routes | - | Endpoints REST dans `src/app/api/` |
| Prisma ORM | 6.x | Requêtes BDD typées, migrations |

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Lire et comprendre le tableau ci-dessus.
Prisma sera installé dans la Phase 04.
```

---

### 0.1.4 — Base de données (PostgreSQL Neon)

#### Contexte
PostgreSQL est la base relationnelle la plus robuste. Neon offre une version serverless avec un tier gratuit généreux, idéale pour le développement et les petits projets.

#### Description
| Technologie | Rôle |
|:------------|:-----|
| PostgreSQL 16 | Base de données relationnelle |
| Neon | PostgreSQL serverless (0.5 GB gratuit) |

**URLs à configurer** :
- `DATABASE_URL` : Connection pooling (pour Prisma Client)
- `DIRECT_URL` : Connection directe (pour migrations)

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Créer un compte Neon (voir tâche 0.4.3).
Les URLs seront configurées après création de la database.
```

---

### 0.1.5 — Authentification (NextAuth v5)

#### Contexte
NextAuth v5 (Auth.js) est le standard pour l'authentification Next.js. Il supporte de nombreux providers et s'intègre parfaitement avec Prisma.

#### Description
| Technologie | Version | Rôle |
|:------------|:--------|:-----|
| NextAuth.js | 5.x (beta) | Authentification, sessions, middleware |
| Credentials Provider | - | Login email/password |

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Lire et comprendre le tableau ci-dessus.
NextAuth sera configuré dans la Phase 05.
```

---

### 0.1.6 — IA (Google Gemini 2.0 Flash)

#### Contexte
Gemini 2.0 Flash offre un excellent rapport qualité/prix pour la génération de contenu pédagogique. Il est multimodal (texte + images) et dispose d'un tier gratuit généreux.

#### Description
| Technologie | Rôle |
|:------------|:-----|
| Google Gemini 2.0 Flash | LLM pour chat et génération |
| @google/generative-ai | SDK officiel Node.js |

**Tier gratuit** : 60 requêtes/minute, 1500 requêtes/jour

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Créer un compte Google AI Studio (voir tâche 0.4.4).
L'intégration Gemini sera faite dans la Phase 18.
```

---

### 0.1.7 — Hébergement (Vercel)

#### Contexte
Vercel est la plateforme native pour Next.js. Le déploiement est automatique à chaque push sur GitHub.

#### Description
| Fonctionnalité | Détail |
|:---------------|:-------|
| Auto-deploy | Push GitHub → Build → Deploy |
| Preview | PR → URL de preview automatique |
| Edge Functions | API Routes optimisées |
| Analytics | Métriques de performance |

**Tier Hobby** : Gratuit, suffisant pour le développement.

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Créer un compte Vercel (voir tâche 0.4.2).
Le déploiement sera configuré dans la Phase 24.
```

---

### 0.1.8 — Stockage fichiers (Vercel Blob)

#### Contexte
Vercel Blob permet de stocker les fichiers uploadés (PDFs, images) sans gérer un serveur S3.

#### Description
| Fonctionnalité | Détail |
|:---------------|:-------|
| Upload | API simple `put()` |
| CDN | Fichiers servis via CDN global |
| Limite | 1 GB gratuit (Hobby) |

#### Prompt
```
Pas de prompt IA pour cette tâche.
Action manuelle : Activer Blob dans Vercel Dashboard → Storage.
L'intégration sera faite lors de l'upload de fichiers (Phase 10).
```

---

## 0.2 — Installation des outils locaux

### 0.2.1 — Node.js 20+ LTS

#### Contexte
Node.js est requis pour exécuter Next.js et npm. La version LTS (Long Term Support) garantit la stabilité.

#### Description
| Info | Valeur |
|:-----|:-------|
| Version minimale | 20.x LTS |
| Installation | [nodejs.org](https://nodejs.org) |
| Vérification | `node -v` et `npm -v` |

#### Prompt
```
Vérifie que Node.js est correctement installé en exécutant :

node -v
npm -v

Résultat attendu :
- node : v20.x.x ou supérieur
- npm : v10.x.x ou supérieur

Si non installé, télécharger depuis https://nodejs.org (version LTS).
```

---

### 0.2.2 — Git

#### Contexte
Git est indispensable pour le versioning et le déploiement sur Vercel via GitHub.

#### Description
| Info | Valeur |
|:-----|:-------|
| Version minimale | 2.40+ |
| Installation | [git-scm.com](https://git-scm.com) |
| Vérification | `git --version` |

**Note Windows** : Installer avec l'option "Git Bash".

#### Prompt
```
Vérifie que Git est correctement installé en exécutant :

git --version

Résultat attendu : git version 2.40.x ou supérieur

Si non installé, télécharger depuis https://git-scm.com
Windows : cocher "Git Bash" et "Git from command line".
```

---

### 0.2.3 — VS Code

#### Contexte
VS Code est l'éditeur recommandé pour sa richesse en extensions et son intégration avec GitHub Copilot.

#### Description
| Info | Valeur |
|:-----|:-------|
| Version | Latest |
| Installation | [code.visualstudio.com](https://code.visualstudio.com) |

#### Prompt
```
Vérifie que VS Code est installé en l'ouvrant.

Si non installé, télécharger depuis https://code.visualstudio.com

Après installation, ouvrir VS Code et vérifier qu'il démarre sans erreur.
Optional : activer "code" dans le PATH pour ouvrir depuis le terminal.
```

---

### 0.2.4 — Terminal (PowerShell ou bash)

#### Contexte
Un terminal est nécessaire pour exécuter les commandes npm, git et prisma.

#### Description
| OS | Terminal recommandé |
|:---|:--------------------|
| Windows | PowerShell 7+ ou Git Bash |
| macOS | Terminal.app ou iTerm2 |
| Linux | Terminal par défaut |

#### Prompt
```
Ouvre un terminal et vérifie que tu peux exécuter :

node -v
git --version
npm -v

Si les 3 commandes fonctionnent, le terminal est prêt.

Windows : PowerShell 7+ recommandé (winget install Microsoft.PowerShell)
Alternative : utiliser le terminal intégré de VS Code (Ctrl+`).
```

---

## 0.3 — Extensions VS Code

### 0.3.1 — Extensions essentielles

#### Contexte
Ces extensions sont obligatoires pour une bonne DX (Developer Experience) avec la stack choisie.

#### Description
| Extension | ID | Rôle |
|:----------|:---|:-----|
| ESLint | `dbaeumer.vscode-eslint` | Linting JS/TS |
| Prettier | `esbenp.prettier-vscode` | Formatage auto |
| Tailwind CSS IntelliSense | `bradlc.vscode-tailwindcss` | Autocomplétion classes |

**Installation** : `Ctrl+Shift+X` → Rechercher l'ID → Install

#### Prompt
```
Installe les extensions VS Code essentielles :

1. Ouvrir VS Code
2. Ctrl+Shift+X (panneau Extensions)
3. Rechercher et installer chaque extension par son ID :
   - dbaeumer.vscode-eslint
   - esbenp.prettier-vscode
   - bradlc.vscode-tailwindcss

4. Redémarrer VS Code après installation

Vérification : les extensions apparaissent dans la liste "Installed".
```

---

### 0.3.2 — Extensions Prisma

#### Contexte
L'extension Prisma offre le syntax highlighting et l'autocomplétion pour les fichiers `.prisma`.

#### Description
| Extension | ID | Rôle |
|:----------|:---|:-----|
| Prisma | `Prisma.prisma` | Syntax highlighting schema.prisma |

#### Prompt
```
Installe l'extension Prisma :

1. Ouvrir VS Code
2. Ctrl+Shift+X
3. Rechercher "Prisma.prisma"
4. Cliquer "Install"

Vérification : ouvrir un fichier .prisma → syntax highlighting actif.
```

---

### 0.3.3 — Extensions optionnelles

#### Contexte
Ces extensions améliorent la productivité mais ne sont pas obligatoires.

#### Description
| Extension | ID | Rôle |
|:----------|:---|:-----|
| GitLens | `eamodio.gitlens` | Historique Git avancé |
| Error Lens | `usernamehw.errorlens` | Erreurs inline |
| Auto Rename Tag | `formulahendry.auto-rename-tag` | Renommage balises |
| GitHub Copilot | `GitHub.copilot` | Assistant IA |

#### Prompt
```
Extensions optionnelles (recommandées mais pas obligatoires) :

1. Ouvrir VS Code → Ctrl+Shift+X
2. Installer selon tes besoins :
   - eamodio.gitlens (historique Git)
   - usernamehw.errorlens (erreurs inline)
   - GitHub.copilot (si abonnement actif)

Ces extensions améliorent la productivité mais le projet
fonctionne sans elles.
```

---

## 0.4 — Comptes et services cloud

### 0.4.1 — Compte GitHub

#### Contexte
GitHub héberge le code source et permet le déploiement automatique sur Vercel.

#### Description
| Info | Valeur |
|:-----|:-------|
| URL | [github.com](https://github.com) |
| Tier | Free (illimité repos publics/privés) |
| Requis pour | Vercel, collaboration |

#### Prompt
```
Créer un compte GitHub (si pas déjà fait) :

1. Aller sur https://github.com
2. Cliquer "Sign up"
3. Suivre les étapes (email, password, username)
4. Vérifier l'email

Après création :
- Configurer Git localement :
  git config --global user.name "Ton Nom"
  git config --global user.email "ton@email.com"
```

---

### 0.4.2 — Compte Vercel

#### Contexte
Vercel héberge l'application et gère le déploiement automatique.

#### Description
| Info | Valeur |
|:-----|:-------|
| URL | [vercel.com](https://vercel.com) |
| Tier | Hobby (gratuit) |
| Lier avec | GitHub (OAuth) |

**Étapes** :
1. Créer compte avec GitHub
2. Autoriser l'accès aux repos
3. Importer le projet BlaizBot-V1

#### Prompt
```
Créer un compte Vercel :

1. Aller sur https://vercel.com
2. Cliquer "Sign Up"
3. Choisir "Continue with GitHub"
4. Autoriser Vercel à accéder à tes repos

Ne pas importer de projet pour l'instant.
L'import sera fait dans la Phase 24 (déploiement).

Vérification : tu peux accéder au dashboard Vercel.
```

---

### 0.4.3 — Compte Neon

#### Contexte
Neon fournit la base de données PostgreSQL serverless.

#### Description
| Info | Valeur |
|:-----|:-------|
| URL | [neon.tech](https://neon.tech) |
| Tier | Free (0.5 GB) |
| Région | Choisir la plus proche (eu-central-1 pour Europe) |

**Étapes** :
1. Créer compte
2. Créer un projet "blaizbot"
3. Créer une database "blaizbot_db"
4. Copier les URLs (pooling + direct)

#### Prompt
```
Créer un compte et une database Neon :

1. Aller sur https://neon.tech
2. Cliquer "Sign Up" (avec GitHub ou email)
3. Créer un nouveau projet :
   - Name: "blaizbot"
   - Region: "Europe (Frankfurt)" ou la plus proche
4. Une database "neondb" est créée automatiquement
5. Aller dans "Connection Details"
6. Copier les 2 URLs :
   - Connection string (pooled) → DATABASE_URL
   - Connection string (direct) → DIRECT_URL

Garder ces URLs pour le fichier .env.local.
```

---

### 0.4.4 — Compte Google AI Studio

#### Contexte
Google AI Studio fournit les clés API pour Gemini.

#### Description
| Info | Valeur |
|:-----|:-------|
| URL | [aistudio.google.com](https://aistudio.google.com) |
| Tier | Free (60 req/min) |
| Modèle | gemini-2.0-flash |

**Étapes** :
1. Se connecter avec compte Google
2. Aller dans "Get API Key"
3. Créer une clé API
4. Copier dans `.env.local`

#### Prompt
```
Obtenir une clé API Gemini :

1. Aller sur https://aistudio.google.com
2. Se connecter avec un compte Google
3. Cliquer "Get API Key" dans le menu
4. Cliquer "Create API Key"
5. Choisir "Create API key in new project"
6. Copier la clé (commence par "AIza...")

Garder cette clé pour le fichier .env.local.
Ne JAMAIS commiter cette clé dans Git !
```

---

## 0.5 — Préparation du workspace

### 0.5.1 — Créer le dossier projet

#### Contexte
Créer le dossier racine qui contiendra tout le code.

#### Description
```bash
mkdir BlaizBot-V1
cd BlaizBot-V1
```

#### Prompt
```
Crée le dossier du projet :

# Windows (PowerShell)
mkdir BlaizBot-V1
cd BlaizBot-V1

# macOS/Linux
mkdir BlaizBot-V1 && cd BlaizBot-V1

Vérification : pwd ou Get-Location affiche le chemin du dossier.
```

---

### 0.5.2 — Initialiser le dépôt Git

#### Contexte
Initialiser Git et créer le premier commit.

#### Description
```bash
git init
git branch -M main
```

#### Prompt
```
Initialise Git dans le dossier projet :

git init
git branch -M main

Vérification :
- Un dossier .git est créé
- git status affiche "On branch main"

Note : le premier commit sera fait après création des fichiers.
```

---

### 0.5.3 — Créer le fichier .env.example

#### Contexte
Le fichier `.env.example` documente les variables d'environnement requises sans exposer les vraies valeurs.

#### Description
```env
# Database (Neon)
DATABASE_URL="postgresql://user:password@host/database?sslmode=require"
DIRECT_URL="postgresql://user:password@host/database?sslmode=require"

# Auth
AUTH_SECRET="générer avec: openssl rand -base64 32"
AUTH_URL="http://localhost:3000"

# AI
GEMINI_API_KEY="clé depuis Google AI Studio"

# Storage (optionnel)
BLOB_READ_WRITE_TOKEN="token Vercel Blob"
```

#### Prompt
```
Crée le fichier .env.example avec le contenu suivant :

# Database (Neon)
DATABASE_URL="postgresql://user:password@host/database?sslmode=require"
DIRECT_URL="postgresql://user:password@host/database?sslmode=require"

# Auth
AUTH_SECRET="générer avec: openssl rand -base64 32"
NEXTAUTH_URL="http://localhost:3000"

# AI
GEMINI_API_KEY="AIza..."

# Storage (optionnel)
BLOB_READ_WRITE_TOKEN="vercel_blob_rw_..."

Ensuite, copier vers .env.local et remplir avec les vraies valeurs :
cp .env.example .env.local
```

---

### 0.5.4 — Créer le fichier .gitignore

#### Contexte
Le fichier `.gitignore` empêche les fichiers sensibles et générés d'être commités.

#### Description
```gitignore
# Dependencies
node_modules/

# Next.js
.next/
out/

# Environment
.env
.env.local
.env.*.local

# IDE
.vscode/
.idea/

# Logs
*.log
npm-debug.log*

# OS
.DS_Store
Thumbs.db

# Prisma
prisma/*.db
```

#### Prompt
```
Crée le fichier .gitignore avec le contenu ci-dessus.

Ce fichier empêche de commiter :
- node_modules/ (dépendances, régénérées par npm install)
- .next/ (build Next.js)
- .env et .env.local (secrets !)
- Fichiers IDE et OS

Vérification :
Après création, git status ne doit PAS montrer .env.local
si tu l'as créé.

Premier commit :
git add .gitignore .env.example
git commit -m "chore: initial setup"
```

---

## ✅ Checklist Phase 00

- [ ] Comprendre la stack technique
- [ ] Node.js 20+ installé
- [ ] Git installé
- [ ] VS Code installé avec extensions
- [ ] Compte GitHub créé
- [ ] Compte Vercel créé et lié à GitHub
- [ ] Compte Neon créé avec database
- [ ] Clé API Gemini obtenue
- [ ] Dossier projet créé
- [ ] Git initialisé
- [ ] .env.example créé
- [ ] .gitignore créé

---

*Phase suivante : [01-INIT-NEXTJS.md](01-INIT-NEXTJS.md)*
