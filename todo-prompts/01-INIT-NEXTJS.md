# Phase 01 — Initialisation Next.js

> Création du projet Next.js 15 avec TypeScript, Tailwind CSS et configuration initiale

---

## 1.1 — Création du projet Next.js

### 1.1.1 — Exécuter create-next-app

#### Contexte
La commande `create-next-app` génère un projet Next.js pré-configuré avec TypeScript, Tailwind CSS et ESLint. On utilise les options recommandées pour 2025.

#### Description
| Option | Valeur | Raison |
|:-------|:-------|:-------|
| TypeScript | Yes | Typage statique obligatoire |
| ESLint | Yes | Qualité de code |
| Tailwind CSS | Yes | Styles utilitaires |
| `src/` directory | Yes | Séparation claire code/config |
| App Router | Yes | Standard Next.js 15 |
| Turbopack | Yes | Build plus rapide en dev |
| Import alias | @/* | Imports propres |

#### Prompt
```
Crée un nouveau projet Next.js avec la commande suivante :

npx create-next-app@latest blaizbot-v1

Répondre aux questions :
✔ Would you like to use TypeScript? → Yes
✔ Would you like to use ESLint? → Yes
✔ Would you like to use Tailwind CSS? → Yes
✔ Would you like your code inside a `src/` directory? → Yes
✔ Would you like to use App Router? (recommended) → Yes
✔ Would you like to use Turbopack for `next dev`? → Yes
✔ Would you like to customize the import alias (@/* by default)? → No

Après création :
cd blaizbot-v1
npm run dev

Vérification : http://localhost:3000 affiche la page Next.js par défaut.
```

---

### 1.1.2 — Vérifier la structure générée

#### Contexte
Après `create-next-app`, vérifier que tous les fichiers essentiels sont présents.

#### Description
```
blaizbot-v1/
├── src/
│   └── app/
│       ├── layout.tsx      # Layout racine
│       ├── page.tsx        # Page d'accueil
│       ├── globals.css     # Styles globaux
│       └── favicon.ico     # Icône
├── public/                 # Fichiers statiques
├── package.json            # Dépendances
├── tsconfig.json           # Config TypeScript
├── next.config.ts          # Config Next.js
├── tailwind.config.ts      # Config Tailwind (si présent)
├── postcss.config.mjs      # Config PostCSS
└── .eslintrc.json          # Config ESLint
```

#### Prompt
```
Vérifie que la structure du projet est correcte :

# Windows (PowerShell)
Get-ChildItem -Recurse -Depth 2 | Select-Object FullName

# macOS/Linux
find . -maxdepth 3 -type f | head -20

Fichiers essentiels à vérifier :
- src/app/layout.tsx ✓
- src/app/page.tsx ✓
- package.json ✓
- tsconfig.json ✓
- next.config.ts ✓

Si un fichier manque, relancer create-next-app.
```

---

## 1.2 — Configuration TypeScript strict

### 1.2.1 — Activer le mode strict

#### Contexte
Le mode strict de TypeScript détecte plus d'erreurs à la compilation. C'est essentiel pour un projet maintenable.

#### Description
Ajouter ces options dans `tsconfig.json` :
```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true
  }
}
```

#### Prompt
```
Modifie tsconfig.json pour activer le mode strict complet.

Ouvre tsconfig.json et vérifie/ajoute ces options dans compilerOptions :

{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{ "name": "next" }],
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}

Vérification : npm run build ne doit pas échouer.
```

---

## 1.3 — Configuration Next.js

### 1.3.1 — Créer next.config.ts

#### Contexte
La configuration Next.js permet d'activer des fonctionnalités expérimentales et de définir des limites.

#### Description
Le fichier `next.config.ts` configure :
- Server Actions avec limite de taille pour les uploads
- Options expérimentales si nécessaire

#### Prompt
```
Vérifie ou crée le fichier next.config.ts avec ce contenu :

import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  experimental: {
    serverActions: {
      bodySizeLimit: '100mb',
    },
  },
};

export default nextConfig;

Note : bodySizeLimit augmenté pour permettre l'upload de fichiers volumineux.
La valeur par défaut est 1mb.
```

---

## 1.4 — Structure des dossiers

### 1.4.1 — Créer les dossiers de base

#### Contexte
Créer la structure de dossiers qui accueillera le code. Cette structure suit les conventions Next.js App Router.

#### Description
```
src/
├── app/
│   ├── (auth)/           # Routes publiques (login)
│   ├── (dashboard)/      # Routes protégées
│   └── api/              # API Routes
├── components/
│   ├── ui/               # shadcn/ui (créé automatiquement)
│   ├── layout/           # Sidebar, Header
│   └── features/         # Composants métier
├── lib/                  # Utilitaires
├── hooks/                # Hooks React
└── types/                # Types TypeScript
```

#### Prompt
```
Crée la structure de dossiers du projet :

# Windows (PowerShell)
New-Item -ItemType Directory -Force -Path @(
  "src/app/(auth)",
  "src/app/(dashboard)/student",
  "src/app/(dashboard)/teacher",
  "src/app/(dashboard)/admin",
  "src/app/api",
  "src/components/ui",
  "src/components/layout",
  "src/components/features",
  "src/lib",
  "src/hooks",
  "src/types"
)

# macOS/Linux
mkdir -p src/app/{(auth),(dashboard)/student,(dashboard)/teacher,(dashboard)/admin,api}
mkdir -p src/components/{ui,layout,features}
mkdir -p src/{lib,hooks,types}

Vérification : les dossiers apparaissent dans l'explorateur VS Code.
```

---

### 1.4.2 — Créer les fichiers types de base

#### Contexte
Créer un fichier de types centralisé pour les types partagés dans l'application.

#### Description
Le fichier `src/types/index.ts` contiendra les types de base comme les rôles utilisateur.

#### Prompt
```
Crée le fichier src/types/index.ts avec les types de base :

// src/types/index.ts

// Rôles utilisateur
export type Role = 'ADMIN' | 'TEACHER' | 'STUDENT';

// Réponse API standard
export interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: string;
}

// Pagination
export interface PaginationParams {
  page?: number;
  limit?: number;
}

export interface PaginatedResponse<T> {
  items: T[];
  total: number;
  page: number;
  limit: number;
  totalPages: number;
}

Ce fichier sera enrichi au fur et à mesure du développement.
```

---

### 1.4.3 — Créer le fichier utils

#### Contexte
Le fichier utils contient les fonctions utilitaires partagées, notamment `cn()` pour fusionner les classes CSS.

#### Description
La fonction `cn()` combine `clsx` et `tailwind-merge` pour gérer les classes Tailwind sans conflit.

#### Prompt
```
Crée le fichier src/lib/utils.ts :

import { type ClassValue, clsx } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

Installe les dépendances si pas déjà fait :
npm install clsx tailwind-merge

Ce fichier est requis par shadcn/ui.
```

---

## 1.5 — Configuration Tailwind CSS

### 1.5.1 — Vérifier globals.css

#### Contexte
Le fichier `globals.css` contient les imports Tailwind et les variables CSS personnalisées.

#### Description
Next.js 15 avec Tailwind v4 utilise une syntaxe différente. Vérifier que les imports sont corrects.

#### Prompt
```
Vérifie que src/app/globals.css contient les imports Tailwind :

# Pour Tailwind v4 (Next.js 15+)
@import "tailwindcss";

# OU pour Tailwind v3
@tailwind base;
@tailwind components;
@tailwind utilities;

Si le fichier est vide ou incorrect, ajoute la ligne appropriée.

Test : les classes Tailwind (bg-blue-500, p-4) doivent fonctionner.
```

---

## 1.6 — Layout racine

### 1.6.1 — Configurer layout.tsx

#### Contexte
Le layout racine définit la structure HTML de base, les polices et les métadonnées de l'application.

#### Description
Le fichier `src/app/layout.tsx` est le point d'entrée de l'application. Il configure :
- La langue (fr)
- Les polices (Geist)
- Les métadonnées SEO
- Le viewport pour le responsive

#### Prompt
```
Modifie src/app/layout.tsx avec la configuration suivante :

import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "BlaizBot - Plateforme Éducative",
  description: "Application éducative avec IA intégrée",
  viewport: {
    width: "device-width",
    initialScale: 1,
    maximumScale: 1,
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="fr">
      <body className={`${geistSans.variable} ${geistMono.variable} antialiased`}>
        {children}
      </body>
    </html>
  );
}

Points importants :
- lang="fr" pour l'accessibilité
- antialiased pour un rendu texte plus net
- viewport pour le responsive mobile
```

---

### 1.6.2 — Créer une page d'accueil simple

#### Contexte
Remplacer la page Next.js par défaut par une page simple qui confirme que le projet fonctionne.

#### Description
Une page d'accueil minimaliste avec le nom du projet.

#### Prompt
```
Modifie src/app/page.tsx avec une page simple :

export default function HomePage() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24">
      <h1 className="text-4xl font-bold">BlaizBot</h1>
      <p className="mt-4 text-muted-foreground">
        Plateforme éducative avec IA
      </p>
    </main>
  );
}

Vérification :
1. npm run dev
2. Ouvrir http://localhost:3000
3. "BlaizBot" doit s'afficher centré
```

---

## 1.7 — Scripts package.json

### 1.7.1 — Ajouter les scripts utiles

#### Contexte
Ajouter des scripts npm pour faciliter le développement.

#### Description
Les scripts standards pour un projet Next.js + Prisma.

#### Prompt
```
Vérifie que package.json contient ces scripts :

{
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "eslint ."
  }
}

Scripts additionnels à ajouter plus tard (Phase 04) :
- "db:push": "prisma db push"
- "db:seed": "prisma db seed"
- "db:studio": "prisma studio"

Pour l'instant, on garde les scripts de base.
```

---

## 1.8 — Premier commit

### 1.8.1 — Commit initial

#### Contexte
Sauvegarder l'état initial du projet avant d'ajouter d'autres dépendances.

#### Description
Créer le premier commit avec la structure de base.

#### Prompt
```
Fais le premier commit du projet :

# Vérifier les fichiers à commiter
git status

# Ajouter tous les fichiers
git add .

# Commit avec message conventionnel
git commit -m "feat: init Next.js 15 project with TypeScript and Tailwind"

# (Optionnel) Lier au repo GitHub
git remote add origin https://github.com/TON_USERNAME/blaizbot-v1.git
git push -u origin main

Vérification : git log montre le commit.
```

---

## ✅ Checklist Phase 01

- [ ] Projet Next.js créé avec create-next-app
- [ ] TypeScript strict activé
- [ ] next.config.ts configuré
- [ ] Structure dossiers créée (app, components, lib, hooks, types)
- [ ] src/types/index.ts créé
- [ ] src/lib/utils.ts créé
- [ ] globals.css vérifié
- [ ] layout.tsx configuré (fr, fonts, metadata)
- [ ] page.tsx simplifié
- [ ] Premier commit effectué
- [ ] `npm run dev` fonctionne

---

*Phase suivante : [02-UI-SHADCN.md](02-UI-SHADCN.md)*
