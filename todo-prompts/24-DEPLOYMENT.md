# Phase 24 — Déploiement

> Déploiement sur Vercel avec Neon PostgreSQL et Vercel Blob

---

## Vue d'ensemble

| Plateforme | Service | Usage |
|------------|---------|-------|
| **Vercel** | Hosting + Build | Next.js App Router (SSR/ISR) |
| **Neon** | PostgreSQL | Base de données serverless |
| **Vercel Blob** | Stockage fichiers | Images, audio, documents uploadés |
| **Google AI Studio** | Gemini API | Génération de contenu IA |
| **Anthropic** | Claude API | Correction exercices (optionnel) |

**URL de production** : `https://blaizbot.vercel.app` (ou domaine personnalisé)

---

## Tâche 24.1 — Configuration Neon PostgreSQL

### Contexte
Neon est une base PostgreSQL serverless avec un free tier généreux (0.5 GB storage, 191h compute/mois). Compatible Prisma, auto-scaling, backups automatiques.

### Description
Créer une base de données Neon et obtenir les URLs de connexion.

### Prompt
```
Configure la base de données Neon PostgreSQL.

ÉTAPES :

1. CRÉER UN COMPTE NEON
   - Aller sur https://neon.tech
   - Sign up avec GitHub (recommandé)
   - Free Tier : 0.5 GB storage, 191h compute/mois

2. CRÉER UN PROJET
   - New Project
   - Nom : "blaizbot-prod" (ou votre choix)
   - Région : Europe (Frankfurt) pour latence France
   - PostgreSQL version : 16 (dernière stable)

3. RÉCUPÉRER LES VARIABLES D'ENVIRONNEMENT
   Dashboard Neon → Connection Details → Connection string

   Vous obtiendrez 2 URLs :

   A) URL POOLÉE (pour les requêtes) :
   postgres://user:password@ep-xxx-yyy.eu-central-1.aws.neon.tech/dbname?sslmode=require

   B) URL DIRECTE (pour les migrations Prisma) :
   postgres://user:password@ep-xxx-yyy.eu-central-1.aws.neon.tech/dbname?sslmode=require&connect_timeout=10

4. COPIER DANS .env.local (local) :

DATABASE_URL="postgres://user:password@ep-xxx-yyy.eu-central-1.aws.neon.tech/dbname?sslmode=require"
DIRECT_URL="postgres://user:password@ep-xxx-yyy.eu-central-1.aws.neon.tech/dbname?sslmode=require&connect_timeout=10"

5. TESTER LA CONNEXION (local) :

npx prisma db push
npx prisma db seed

NOTES :
- Neon utilise connection pooling par défaut (PgBouncer)
- DIRECT_URL nécessaire pour migrations Prisma (schema changes)
- DATABASE_URL utilisée pour requêtes runtime (SELECT, INSERT, UPDATE)
- Free tier : pause automatique après 5 min inactivité (réveil instant)

ALTERNATIVE : Vercel Postgres
Si vous préférez tout chez Vercel :
- Dashboard Vercel → Storage → Create Database → Postgres
- Plus cher mais intégration native
- Variables d'env auto-injectées
```

---

## Tâche 24.2 — Variables d'environnement (.env.example)

### Contexte
Le fichier .env.example documente toutes les variables nécessaires pour déployer l'application.

### Description
Créer le fichier .env.example avec toutes les clés requises.

### Prompt
```
Crée le fichier .env.example de référence.

FICHIER : .env.example

# =====================================================
# BlaizBot V1 - Variables d'Environnement
# =====================================================
# Copier ce fichier vers .env.local et remplir les valeurs
# JAMAIS commiter .env.local !
# =====================================================

# -----------------------------------------------------
# BASE DE DONNÉES (Neon PostgreSQL)
# -----------------------------------------------------
# Dashboard Neon → Connection Details → Connection string

# URL de connexion poolée (pour les requêtes runtime)
DATABASE_URL="postgres://user:password@ep-xxx.eu-central-1.aws.neon.tech/dbname?sslmode=require"

# URL directe (pour les migrations Prisma)
DIRECT_URL="postgres://user:password@ep-xxx.eu-central-1.aws.neon.tech/dbname?sslmode=require&connect_timeout=10"

# -----------------------------------------------------
# AUTHENTIFICATION (NextAuth.js v5)
# -----------------------------------------------------
# Secret pour signer les JWT (générer avec: openssl rand -base64 32)
AUTH_SECRET="your-secret-key-minimum-32-characters-long"

# URL de base de l'application
NEXTAUTH_URL="http://localhost:3000"  # Prod: https://blaizbot.vercel.app

# -----------------------------------------------------
# INTELLIGENCE ARTIFICIELLE
# -----------------------------------------------------
# Google Gemini (Principal) - https://aistudio.google.com/apikey
GEMINI_API_KEY="AIza..."

# Anthropic Claude (Correction exercices) - https://console.anthropic.com
ANTHROPIC_API_KEY="sk-ant-..."

# OpenAI (Legacy/Optionnel) - https://platform.openai.com/api-keys
# OPENAI_API_KEY="sk-..."

# Modèle par défaut
AI_MODEL="gemini-2.0-flash-exp"

# -----------------------------------------------------
# STOCKAGE FICHIERS (Vercel Blob)
# -----------------------------------------------------
# Token pour upload de fichiers (images, audio, documents)
# Dashboard Vercel → Storage → Blob → Create Store → Copy token
BLOB_READ_WRITE_TOKEN="vercel_blob_rw_..."

# -----------------------------------------------------
# OPTIONNEL : MONITORING & ANALYTICS
# -----------------------------------------------------
# Sentry (erreurs)
# SENTRY_DSN="https://xxx@yyy.ingest.sentry.io/zzz"

# Vercel Analytics (performances)
# VERCEL_ANALYTICS_ID="auto"

FICHIER : .gitignore

# Environnement
.env
.env.local
.env*.local

NOTES :
- .env.example commité (sans valeurs sensibles)
- .env.local ignoré par git (valeurs réelles)
- Vercel injecte automatiquement les variables d'env en production
- AUTH_SECRET doit être différent en prod et dev (sécurité)
```

---

## Tâche 24.3 — Configuration Vercel (vercel.json)

### Contexte
Vercel nécessite une configuration pour optimiser les builds Next.js, gérer les timeouts et les routes.

### Description
Créer le fichier vercel.json (optionnel mais recommandé).

### Prompt
```
Configure Vercel pour Next.js 15 et Prisma.

FICHIER : vercel.json

{
  "version": 2,
  "buildCommand": "npm run build",
  "framework": "nextjs",
  "installCommand": "npm install",
  "devCommand": "npm run dev",
  "regions": ["fra1"],
  "functions": {
    "app/api/**/*.ts": {
      "maxDuration": 60
    }
  },
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/"
    }
  ],
  "env": {
    "NODE_ENV": "production"
  }
}

EXPLICATIONS :

1. buildCommand :
   "npm run build" exécute :
   - prisma generate (génère Prisma Client)
   - prisma db push (applique schema sans migrations)
   - next build (compile Next.js)

2. regions : ["fra1"]
   - Frankfurt (proche France)
   - Alternatives : "cdg1" (Paris), "ams1" (Amsterdam)

3. functions.maxDuration : 60
   - Timeout API routes : 60s (nécessaire pour génération IA longue)
   - Free tier : 10s max → upgrade Pro ($20/mois)

4. rewrites :
   - SPA fallback (toutes les routes → index)

ALTERNATIVE : Sans vercel.json
Vercel détecte automatiquement Next.js et utilise les valeurs par défaut.
Fichier optionnel sauf si vous avez besoin de :
- Timeout personnalisé
- Région spécifique
- Redirections complexes

FICHIER : package.json (scripts)

{
  "scripts": {
    "dev": "next dev",
    "build": "prisma generate && prisma db push --skip-generate && next build",
    "postinstall": "prisma generate",
    "start": "next start",
    "lint": "eslint"
  }
}

NOTES :
- build : inclut prisma generate + db push (applique schema)
- postinstall : génère Prisma Client après npm install
- db push : évite les migrations (plus simple pour MVP)
- Production : utiliser migrations Prisma (prisma migrate deploy)
```

---

## Tâche 24.4 — Déploiement initial sur Vercel

### Contexte
Vercel permet de déployer en 1 clic depuis GitHub avec auto-deploy sur chaque push.

### Description
Connecter le repo GitHub à Vercel et déployer la première version.

### Prompt
```
Déploie BlaizBot sur Vercel depuis GitHub.

ÉTAPES :

1. PRÉPARER LE REPO GITHUB
   
   git init
   git add .
   git commit -m "feat: initial commit BlaizBot V1"
   git branch -M main
   git remote add origin https://github.com/username/blaizbot-v1.git
   git push -u origin main

2. CONNECTER VERCEL

   A) Via Dashboard Vercel :
      - https://vercel.com/new
      - Import Git Repository → Sélectionner GitHub
      - Autoriser Vercel à accéder au repo
      - Sélectionner blaizbot-v1

   B) Via CLI (alternative) :
      npm i -g vercel
      vercel login
      vercel --prod

3. CONFIGURER LE PROJET VERCEL

   - Framework Preset : Next.js
   - Root Directory : ./
   - Build Command : npm run build
   - Output Directory : .next (auto-détecté)
   - Install Command : npm install

4. AJOUTER LES VARIABLES D'ENVIRONNEMENT

   Dashboard Vercel → Settings → Environment Variables

   Ajouter UNE PAR UNE (copier depuis .env.local) :

   ✅ DATABASE_URL              = postgres://...
   ✅ DIRECT_URL                = postgres://...
   ✅ AUTH_SECRET               = (générer nouveau : openssl rand -base64 32)
   ✅ NEXTAUTH_URL              = https://blaizbot.vercel.app
   ✅ GEMINI_API_KEY            = AIza...
   ✅ ANTHROPIC_API_KEY         = sk-ant-...
   ✅ BLOB_READ_WRITE_TOKEN     = vercel_blob_rw_...

   IMPORTANT :
   - Environment : Production, Preview, Development (cocher les 3)
   - AUTH_SECRET doit être DIFFÉRENT de votre .env.local (sécurité)
   - NEXTAUTH_URL doit pointer vers l'URL de prod

5. DÉPLOYER

   - Click "Deploy" dans Vercel Dashboard
   - Ou push sur main → auto-deploy

   Vercel va :
   1. Clone le repo
   2. npm install
   3. prisma generate
   4. prisma db push (applique schema Neon)
   5. next build
   6. Deploy sur CDN

   Durée : 2-5 minutes

6. VÉRIFIER LE DÉPLOIEMENT

   - URL de prod : https://blaizbot.vercel.app
   - Logs : Dashboard Vercel → Deployments → Dernière build → Logs
   - Erreurs : Check "Build Logs" et "Function Logs"

7. SEED LA BASE DE DONNÉES (PREMIÈRE FOIS)

   Option A : Depuis local (recommandé) :
   
   # Pointer .env.local vers Neon prod
   npx prisma db seed

   Option B : Via Vercel CLI :
   
   vercel env pull .env.production
   npx prisma db seed

   Cela créera :
   - 1 admin (admin@blaizbot.fr / admin123)
   - 2 profs
   - 5 élèves
   - 3 classes
   - 5 matières
   - 10 cours démo

NOTES :
- Auto-deploy : chaque push sur main = nouveau déploiement
- Preview : chaque PR = URL preview unique
- Rollback : Dashboard → Deployments → Previous → Promote to Production
- Logs temps réel : vercel logs --follow
```

---

## Tâche 24.5 — Configuration Vercel Blob (stockage fichiers)

### Contexte
Vercel Blob permet de stocker des fichiers uploadés (images de profil, pièces jointes messages, fichiers cours).

### Description
Créer un Blob Store et configurer l'upload.

### Prompt
```
Configure Vercel Blob pour le stockage de fichiers.

ÉTAPES :

1. CRÉER UN BLOB STORE

   Dashboard Vercel → Storage → Create Database → Blob

   - Nom : "blaizbot-files"
   - Région : fra1 (Frankfurt)
   - Free tier : 1 GB/mois

2. OBTENIR LE TOKEN

   Dashboard → Blob Store → Settings → Access Token

   Copier : BLOB_READ_WRITE_TOKEN="vercel_blob_rw_..."

3. AJOUTER LA VARIABLE D'ENVIRONNEMENT

   Dashboard Vercel → Settings → Environment Variables

   BLOB_READ_WRITE_TOKEN = vercel_blob_rw_...
   (Production + Preview + Development)

4. UTILISATION DANS LE CODE

   FICHIER : src/lib/upload.ts (déjà implémenté)

   import { put } from '@vercel/blob';

   export async function uploadFile(file: File) {
     const blob = await put(file.name, file, {
       access: 'public',
       token: process.env.BLOB_READ_WRITE_TOKEN,
     });
     return blob.url; // https://xxx.public.blob.vercel-storage.com/file.jpg
   }

5. TESTER L'UPLOAD

   - Aller sur l'app déployée
   - Upload image de profil (Admin → Users → Edit)
   - Upload fichier cours (Teacher → Courses → Create)
   - Vérifier : Dashboard Vercel → Blob → Files

LIMITES FREE TIER :
- 1 GB stockage
- 100 GB bandwidth/mois
- Pas de limite requêtes

ALTERNATIVE : Cloudinary, AWS S3, UploadThing
Si vous dépassez les limites ou voulez plus de contrôle :
- Cloudinary : CDN + transformations images
- AWS S3 : Stockage illimité (pay-as-you-go)
- UploadThing : Upload simple avec widgets UI

NOTES :
- Blob URLs publiques (pas d'authentification)
- Pour fichiers privés : utiliser signed URLs (put + token)
- Suppression automatique : delete from '@vercel/blob'
```

---

## Tâche 24.6 — Monitoring et Logs (production)

### Contexte
En production, il faut monitorer les erreurs, performances et logs pour diagnostiquer les problèmes.

### Description
Configurer le monitoring avec Vercel Analytics et logs.

### Prompt
```
Configure le monitoring de production.

1. VERCEL ANALYTICS (GRATUIT)

   Dashboard Vercel → Analytics → Enable

   Métriques disponibles :
   - Pageviews
   - Top pages
   - Top referrers
   - Real User Monitoring (Web Vitals)
   - Geographic distribution

   FICHIER : src/app/layout.tsx

   import { Analytics } from '@vercel/analytics/react';

   export default function RootLayout({ children }) {
     return (
       <html>
         <body>
           {children}
           <Analytics />
         </body>
       </html>
     );
   }

   npm install @vercel/analytics

2. VERCEL LOGS (TEMPS RÉEL)

   Via CLI :
   
   vercel logs --follow
   vercel logs <deployment-url>
   
   Via Dashboard :
   - Deployments → Latest → Function Logs
   - Filtrer par : Error, Warning, Info

   CONSOLE.LOG EN PRODUCTION :
   - Éviter console.log (performances)
   - Utiliser console.error pour erreurs critiques
   - Structured logging : { level, message, context }

3. SENTRY (ERREURS - OPTIONNEL)

   https://sentry.io → Create Project → Next.js

   npm install @sentry/nextjs
   npx @sentry/wizard@latest -i nextjs

   Cela créera :
   - sentry.client.config.ts
   - sentry.server.config.ts
   - instrumentation.ts

   Variable d'env :
   SENTRY_DSN="https://xxx@yyy.ingest.sentry.io/zzz"

   Sentry capturera :
   - Erreurs runtime
   - Unhandled promise rejections
   - API errors
   - Source maps pour stack traces

4. HEALTH CHECK ENDPOINT

   FICHIER : src/app/api/health/route.ts

   import { NextResponse } from 'next/server';
   import { prisma } from '@/lib/prisma';

   export async function GET() {
     try {
       // Test connexion DB
       await prisma.$queryRaw`SELECT 1`;
       
       return NextResponse.json({
         status: 'ok',
         timestamp: new Date().toISOString(),
         uptime: process.uptime(),
       });
     } catch (error) {
       return NextResponse.json(
         { status: 'error', error: error.message },
         { status: 500 }
       );
     }
   }

   Usage : curl https://blaizbot.vercel.app/api/health

5. ALERTES (OPTIONNEL)

   Dashboard Vercel → Integrations → Slack/Discord

   Configurer notifications pour :
   - Deploy failed
   - High error rate
   - Performance degradation

MÉTRIQUES CLÉS À SURVEILLER :
- Temps de réponse API (<200ms idéal)
- Taux d'erreur (<0.1%)
- Web Vitals (LCP, FID, CLS)
- Utilisation base de données (Neon dashboard)
- Bandwidth Blob Storage

NOTES :
- Free tier Vercel : logs 7 jours (upgrade Pro = 30 jours)
- Sentry free tier : 5k events/mois
- Prisma Pulse (optionnel) : real-time DB events
```

---

## Tâche 24.7 — Domaine personnalisé (optionnel)

### Contexte
Par défaut, l'app est sur `blaizbot.vercel.app`. Vous pouvez ajouter un domaine personnalisé.

### Description
Configurer un domaine custom type `blaizbot.com`.

### Prompt
```
Configure un domaine personnalisé sur Vercel.

PRÉREQUIS :
- Posséder un domaine (ex: blaizbot.com)
- Registrar : OVH, Namecheap, Cloudflare, etc.

ÉTAPES :

1. AJOUTER LE DOMAINE DANS VERCEL

   Dashboard Vercel → Settings → Domains → Add

   Entrer : blaizbot.com
   
   Vercel propose :
   - blaizbot.com (apex)
   - www.blaizbot.com (recommandé)

2. CONFIGURER DNS CHEZ LE REGISTRAR

   Option A : CNAME (recommandé) :
   
   Type: CNAME
   Name: www
   Value: cname.vercel-dns.com
   TTL: Auto

   Type: A (pour apex)
   Name: @
   Value: 76.76.21.21
   TTL: Auto

   Option B : Nameservers (Vercel DNS) :
   
   Changer les nameservers chez le registrar :
   ns1.vercel-dns.com
   ns2.vercel-dns.com

3. VÉRIFIER LA CONFIGURATION

   Dashboard Vercel → Domains → Valid Configuration ✓
   
   Propagation DNS : 5 min à 48h (généralement <1h)

   Test :
   nslookup blaizbot.com
   curl https://blaizbot.com/api/health

4. HTTPS AUTOMATIQUE

   Vercel génère automatiquement un certificat SSL (Let's Encrypt)
   - Gratuit
   - Auto-renew
   - Wildcard support (*.blaizbot.com)

5. METTRE À JOUR NEXTAUTH_URL

   Dashboard Vercel → Settings → Environment Variables

   NEXTAUTH_URL = https://blaizbot.com

   Redéployer pour appliquer.

6. REDIRECTIONS (OPTIONNEL)

   FICHIER : next.config.ts

   const nextConfig = {
     async redirects() {
       return [
         {
           source: '/:path*',
           has: [{ type: 'host', value: 'www.blaizbot.com' }],
           destination: 'https://blaizbot.com/:path*',
           permanent: true,
         },
       ];
     },
   };

   Cela redirige www → apex (ou inversement selon préférence)

ALTERNATIVES :
- Sous-domaine : app.blaizbot.com (CNAME vers Vercel)
- Multi-domaines : blaizbot.fr + blaizbot.com
- Cloudflare Proxy : Protection DDoS + analytics

NOTES :
- Free tier Vercel : domaines illimités
- SSL gratuit (Let's Encrypt)
- Vercel DNS inclus (pas besoin registrar DNS)
```

---

## Résumé Phase 24

| Tâche | Service | Action |
|-------|---------|--------|
| 24.1 | Neon PostgreSQL | Créer BDD serverless + URLs |
| 24.2 | .env.example | Documenter variables d'env |
| 24.3 | vercel.json | Config build + timeout API |
| 24.4 | Vercel Deploy | Push GitHub → Auto-deploy |
| 24.5 | Vercel Blob | Stockage fichiers 1GB |
| 24.6 | Monitoring | Logs + Analytics + Health check |
| 24.7 | Domaine custom | DNS + SSL automatique |

**Total : 7 tâches**

**Checklist pré-déploiement** :
- ✅ Variables d'env documentées (.env.example)
- ✅ .gitignore (secrets exclus)
- ✅ Package.json (scripts build/postinstall)
- ✅ Prisma schema (DATABASE_URL + DIRECT_URL)
- ✅ Tests locaux (npm run build)
- ✅ Seed data (admin + démo)

**Post-déploiement** :
- ✅ Test login admin (admin@blaizbot.fr / admin123)
- ✅ Créer premier cours
- ✅ Test chat IA
- ✅ Upload fichier (Blob)
- ✅ Vérifier logs (pas d'erreurs)

**URLs de référence** :
- Production : `https://blaizbot.vercel.app`
- Neon Dashboard : `https://console.neon.tech`
- Vercel Dashboard : `https://vercel.com/dashboard`
- Google AI Studio : `https://aistudio.google.com`
