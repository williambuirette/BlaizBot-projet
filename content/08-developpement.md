# 8. Développement en Itérations

> Ce chapitre documente la phase de développement : plan d'itération, cycle de travail et gestion des bugs.

---

## 8.1 Plan d'itération

### 8.1.1 Découpage en slices

Le développement suit une approche par **slices verticales** (fonctionnalité complète de bout en bout) plutôt que par couches horizontales.

```
┌─────────────────────────────────────────────────────────────┐
│                    SLICE 1 : Auth + Base                    │
│  Login → Session → Redirection rôle → Dashboard vide       │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 2 : Élève MVP                      │
│  Dashboard → Chat IA → Progression → Cours                 │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 3 : Professeur MVP                 │
│  Dashboard → Classes → Suivi → Création cours              │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 4 : Admin MVP                      │
│  Dashboard → Users CRUD → Stats                            │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 5 : Polish                         │
│  UX améliorations → Bugs → Performance                     │
└─────────────────────────────────────────────────────────────┘
```

### 8.1.2 Planning prévisionnel

| Slice | Durée estimée | Dates |
| :--- | :--- | :--- |
| Slice 1 : Auth + Base | 3-4 jours | ... |
| Slice 2 : Élève MVP | 5-6 jours | ... |
| Slice 3 : Professeur MVP | 5-6 jours | ... |
| Slice 4 : Admin MVP | 3-4 jours | ... |
| Slice 5 : Polish | 2-3 jours | ... |
| **Total** | **18-23 jours** | ... |

## 8.2 Cycle de développement Vibe Coding

### 8.2.1 Le cycle standard

```
┌─────────────────────────────────────────────────────────────┐
│                     CYCLE VIBE CODING                       │
│                                                             │
│   ┌─────────┐                                               │
│   │ 1.INTENT│  "Je veux créer le composant LoginForm"      │
│   └────┬────┘                                               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────┐  Contexte + contraintes + références          │
│   │2.PROMPT │  "Crée LoginForm avec email/password..."     │
│   └────┬────┘                                               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────┐  L'IA génère le code                          │
│   │ 3.GEN   │  → LoginForm.tsx (80 lignes)                 │
│   └────┬────┘                                               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────┐  Vérification visuelle + fonctionnelle        │
│   │ 4.TEST  │  → npm run dev → tester login                │
│   └────┬────┘                                               │
│        │                                                    │
│   ┌────┴────┐                                               │
│   │  OK ?   │                                               │
│   └────┬────┘                                               │
│    Non │  Oui                                               │
│        │   │                                                │
│   ┌────┴───┐│  ┌─────────┐                                  │
│   │5.CORREC││──│6.COMMIT │  git commit -m "feat: LoginForm"│
│   └────────┘   └─────────┘                                  │
│        │                                                    │
│        └──────────▶ Retour au cycle                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 8.2.2 Exemple concret : Création du chat IA

**1. Intention**
```
Je veux créer l'interface de chat avec Blaiz'bot pour les élèves.
```

**2. Prompt**
```
Crée un composant ChatInterface pour le dashboard élève.
Spécifications :
- Zone de messages scrollable
- Input avec bouton envoi
- Affichage messages user (droite) et bot (gauche)
- Indicateur "typing" pendant la réponse
- Intégration avec /api/student/chat (streaming)

Utilise Tailwind CSS et les composants shadcn/ui.
Référence design : blaizbot-wireframe/student.html section chat
```

**3. Génération**
```typescript
// src/components/features/ChatInterface.tsx
'use client';

import { useState, useRef, useEffect } from 'react';
import { useChat } from 'ai/react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { ScrollArea } from '@/components/ui/scroll-area';

export function ChatInterface() {
  const { messages, input, handleInputChange, handleSubmit, isLoading } = useChat({
    api: '/api/student/chat',
  });
  
  const scrollRef = useRef<HTMLDivElement>(null);
  
  useEffect(() => {
    scrollRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);
  
  return (
    <div className="flex flex-col h-[600px] border rounded-lg">
      <div className="p-4 border-b bg-primary text-white">
        <h3 className="font-semibold">🤖 Blaiz'bot</h3>
      </div>
      
      <ScrollArea className="flex-1 p-4">
        {messages.map((m) => (
          <div
            key={m.id}
            className={`mb-4 ${m.role === 'user' ? 'text-right' : 'text-left'}`}
          >
            <span className={`inline-block p-3 rounded-lg ${
              m.role === 'user' 
                ? 'bg-primary text-white' 
                : 'bg-muted'
            }`}>
              {m.content}
            </span>
          </div>
        ))}
        {isLoading && (
          <div className="text-muted-foreground">Blaiz'bot réfléchit...</div>
        )}
        <div ref={scrollRef} />
      </ScrollArea>
      
      <form onSubmit={handleSubmit} className="p-4 border-t flex gap-2">
        <Input
          value={input}
          onChange={handleInputChange}
          placeholder="Pose ta question..."
          disabled={isLoading}
        />
        <Button type="submit" disabled={isLoading}>
          Envoyer
        </Button>
      </form>
    </div>
  );
}
```

**4. Test**
- ✅ Interface s'affiche correctement
- ✅ Messages apparaissent des deux côtés
- ⚠️ Bug : scroll ne fonctionne pas au premier message

**5. Correction**
```
Le scroll ne fonctionne pas au chargement initial.
Ajoute un useEffect qui scroll au mount du composant.
```

**6. Commit**
```bash
git add src/components/features/ChatInterface.tsx
git commit -m "feat(student): add ChatInterface component with streaming"
```

## 8.3 Gestion des bugs

### 8.3.1 Template de rapport de bug

```markdown
## Bug #XXX : [Titre court]

**Contexte** : Où le bug a été découvert
**Étapes de reproduction** :
1. ...
2. ...

**Comportement attendu** : ...
**Comportement actuel** : ...

**Capture/Erreur** : [screenshot ou message d'erreur]

**Cause identifiée** : ...
**Solution appliquée** : ...

**Commit fix** : [hash]
```

### 8.3.2 Log des bugs rencontrés

| # | Bug | Cause | Solution | Status |
| :--- | :--- | :--- | :--- | :--- |
| 001 | Zod `.errors` undefined | API Zod v3 utilise `.issues` pas `.errors` | Remplacer par `.issues` dans toutes les API routes | ✅ Fixé |
| 002 | UserRow.name inexistant | Prisma schema utilise firstName/lastName | Refactorer types, hook, composants (7 fichiers) | ✅ Fixé |
| 003 | Class.year inexistant | Champ non prévu dans schéma Prisma | Utiliser studentCount via _count.students | ✅ Fixé |
| 004 | Subject.color inexistant | Champ non prévu dans schéma Prisma | Mapping couleur côté client par nom | ✅ Fixé |

### 8.3.3 Patterns de bugs fréquents

| Pattern | Symptôme | Solution type |
| :--- | :--- | :--- |
| Hydration mismatch | Console warning SSR | `'use client'` ou `suppressHydrationWarning` |
| Type error Prisma | TS error sur relations | `include: { relation: true }` |
| Auth redirect loop | Boucle infinie login | Vérifier middleware matcher |
| API 500 | Erreur serveur | Logs + try/catch |

## 8.4 Organisation modulaire du TODO

### 8.4.1 Problème du fichier monolithique

Le TODO initial (926 lignes) posait plusieurs problèmes :

| Problème | Impact |
| :--- | :--- |
| Taille excessive | Dépassait la règle 350 lignes |
| Surcharge contexte IA | L'IA lisait tout au lieu de la phase active |
| Navigation difficile | Scroll constant pour trouver l'info |
| Pas d'instructions contextuelles | Règles générales vs spécifiques |

### 8.4.2 Solution : dossier modulaire

```
todo/
├── INDEX.md              # 🎯 Point d'entrée (navigation + progression)
├── RULES.md              # ⚠️ Contraintes obligatoires (350 lignes, secrets)
├── STRUCTURE.md          # 🗂️ Arborescence cible du projet
│
├── phase-01-init.md      # 🚀 Initialisation (~290 lignes)
├── phase-01-init-suite.md
├── phase-01-init-fin.md
├── phase-01-fichiers.md  # Code templates Phase 1
│
├── phase-02-layout.md    # 🎨 Layout & Navigation (~280 lignes)
├── phase-02-layout-suite.md
├── phase-02-code.md      # Code templates Phase 2
│
├── ...                   # (même pattern phases 3-10)
└── phase-10-demo.md      # 🎬 Stabilisation (~320 lignes)
```

**Total** : 40 fichiers, ~10 600 lignes d'instructions contextuelles

### 8.4.3 Workflow de l'IA avec le nouveau système

```
┌─────────────────────────────────────────────────────────────┐
│                  WORKFLOW TODO MODULAIRE                    │
│                                                             │
│   1. OUVRIR INDEX.md                                        │
│      └─▶ Phase active = phase-01-init.md                   │
│                                                             │
│   2. LIRE RULES.md                                          │
│      └─▶ Contraintes : 350 lignes, secrets, types...       │
│                                                             │
│   3. LIRE STRUCTURE.md                                      │
│      └─▶ Où créer chaque fichier                           │
│                                                             │
│   4. OUVRIR phase-XX.md                                     │
│      └─▶ Instructions contextuelles + tâches détaillées    │
│                                                             │
│   5. EXÉCUTER tâche par tâche                               │
│      └─▶ Validation à chaque étape                         │
│                                                             │
│   6. METTRE À JOUR INDEX.md                                 │
│      └─▶ Progression globale                               │
└─────────────────────────────────────────────────────────────┘
```

### 8.4.4 Avantages mesurés

| Avant | Après | Gain |
| :--- | :--- | :--- |
| 1 fichier 926 lignes | 40 fichiers < 350 lignes | Respect règle 350 |
| Contexte complet chargé | Contexte ciblé par phase | -80% tokens |
| Instructions génériques | Instructions contextuelles | Moins d'erreurs |
| Navigation par scroll | Navigation par fichiers | Plus rapide |

### 8.4.5 Enrichissement des TODO (Phase 2)

Après la restructuration, nous avons **enrichi** chaque fichier TODO avec :

1. **Section "Instructions IA"** en tête de fichier
2. **Objectif / Comment / Par quel moyen** pour chaque étape
3. **Tableaux de tâches** avec critères de validation
4. **Blocs 💡 INSTRUCTION** avec code prêt à copier
5. **Références** vers les fichiers -code.md

### 8.4.6 Automatisation des mises à jour exposé

Chaque phase contient maintenant un **EXPOSÉ CHECKPOINT** qui déclenche automatiquement :

1. Mise à jour de `progress.json` (heures, statuts)
2. Ajout du résumé de phase dans ce chapitre
3. Capture d'écran requise
4. Commit dans BlaizBot-projet

**Mapping phases → heures estimées** :

| Phase | Nom | Heures | Chapitre |
|:------|:----|:-------|:---------|
| 1 | Initialisation | 2h | 08 |
| 2 | Layout | 3h | 08 |
| 3 | Vertical Slice | 3h | 08 |
| 4 | Database | 4h | 08 |
| 5 | Auth | 5h | 08 |
| 6 | Admin | 7h | 08 |
| 7 | Teacher | 7h | 08 |
| 8 | Student | 7h | 08 |
| 9 | IA | 9h | 08 |
| 10 | Démo | 5h | 09, 10 |
| **Total** | | **52h** | |

### 8.4.7 Optimisation du workflow (23.12.2025)

Pour améliorer le suivi et éviter les oublis de documentation, nous avons ajouté :

**1. Tableau de progression enrichi** (INDEX.md)

| Phase | Statut | Tests | Refactor | Exposé |
|:------|:-------|:------|:---------|:-------|
| 1 | 🔴 | ⬜ | ⬜ | ⬜ |

→ Visibilité immédiate des 3 checkpoints par phase.

**2. Conventions de nommage captures** (RULES.md)

```
assets/screenshots/
├── phase-01-hello.png       # Obligatoire
├── phase-05-auth-redirect.gif  # Animation
└── phase-10-demo.mp4        # Vidéo longue
```

**3. Script expose-status.ps1**

```powershell
.\scripts\expose-status.ps1
# Affiche : métriques, chapitres, captures manquantes, actions requises
```

Ce script permet de vérifier en un coup d'œil l'état de la documentation.

---

## 8.5 Journal des phases (AUTOMATIQUE)

> Cette section est mise à jour automatiquement après chaque EXPOSÉ CHECKPOINT.

<!-- DÉBUT JOURNAL PHASES -->

### ✅ Phase 1 — Initialisation (23.12.2025)

**Objectif** : Créer le squelette Next.js 15 avec toutes les fondations techniques.

**Stack installée** :
| Technologie | Version | Notes |
|:------------|:--------|:------|
| Next.js | 16.1.1 | App Router, Turbopack par défaut |
| React | 19.2.3 | Dernière version stable |
| TypeScript | 5.x | Strict + noUncheckedIndexedAccess |
| Tailwind CSS | 4.0 | Nouvelle syntaxe @import |
| shadcn/ui | new-york-v4 | 6 composants de base |
| ESLint | 9.x | Flat config + Prettier |

**Composants shadcn/ui installés** :
- button, input, card, avatar, dropdown-menu, sonner

**Structure créée** :
```
src/
├── app/             # Next.js App Router
├── components/
│   ├── ui/          # 6 composants shadcn
│   ├── layout/      # Headers, Sidebars
│   └── features/    # Composants métier
├── lib/             # Prisma, auth, utils
├── hooks/           # Custom hooks
├── types/           # Types partagés (Role, User, ApiResponse)
└── constants/       # Config app (ROUTES, APP_CONFIG)
```

**Validations** :
- ✅ `npm run lint` — 0 erreur
- ✅ `npm run build` — Build réussi
- ✅ `npx tsc --noEmit` — Types valides
- ✅ `npm run dev` — Serveur fonctionnel localhost:3000

**Temps estimé** : 2h | **Temps réel** : ~1.5h

**Capture** : `assets/screenshots/phase-01-hello.png` *(à créer)*

---

### ⏳ Phases en attente

```
Phase 2 — Layout             : ✅ Complété (23.12.2025)
Phase 3 — Vertical Slice     : ✅ Complété (23.12.2025)
Phase 4 — Database           : ✅ Complété (23.12.2025)
Phase 5 — Auth               : ✅ Complété (23.12.2025)
Phase 6 — Admin              : ✅ Complété (28.12.2025)
Phase 7 — Teacher            : ⬜ À venir
Phase 8 — Student            : ⬜ À venir
Phase 9 — IA                 : ⬜ À venir
Phase 10 — Démo              : ⬜ À venir
```

---

### ✅ Phase 5 — Authentification & RBAC (23.12.2025)

**Objectif** : Implémenter l'authentification avec NextAuth v5 et le contrôle d'accès basé sur les rôles (RBAC).

#### 5.1 Stack d'authentification

| Technologie | Version | Usage |
|:------------|:--------|:------|
| NextAuth.js | v5 (beta) | Framework d'auth Next.js |
| bcryptjs | 3.x | Hash des mots de passe |
| JWT | - | Session strategy (stateless) |

#### 5.2 Complexité rencontrée : Next.js 16 + NextAuth v5

**Problème initial** : Le pattern `export { auth as middleware }` documenté dans NextAuth ne fonctionne plus avec Next.js 16.

```typescript
// ❌ ERREUR : "must export a middleware function"
import { auth } from '@/lib/auth';
export default auth((req) => { ... });
```

**Solution** : Utiliser `getToken` de `next-auth/jwt` au lieu du wrapper `auth()` :

```typescript
// ✅ FONCTIONNE avec Next.js 16
import { getToken } from 'next-auth/jwt';

export async function middleware(req: NextRequest) {
  const token = await getToken({ req, secret: process.env.AUTH_SECRET });
  // ...
}
```

**Leçon apprise** : Les versions beta (NextAuth v5) peuvent avoir des incompatibilités avec les dernières versions de Next.js.

#### 5.3 Architecture RBAC

```
┌─────────────────────────────────────────────────────────────┐
│                     MIDDLEWARE RBAC                         │
│                                                             │
│  /login, /api/auth/*  →  Public (pass through)             │
│                                                             │
│  Pas de token ?       →  Redirect /login                   │
│                                                             │
│  /admin/*  + role≠ADMIN    →  Redirect /unauthorized       │
│  /teacher/* + role≠TEACHER →  Redirect /unauthorized       │
│  /student/* + role≠STUDENT →  Redirect /unauthorized       │
│                                                             │
│  Token valide + route OK   →  NextResponse.next()          │
└─────────────────────────────────────────────────────────────┘
```

#### 5.4 Fichiers créés Phase 5

| Fichier | Lignes | Description |
|:--------|:-------|:------------|
| `src/lib/auth.ts` | 55 | Config NextAuth (Credentials, JWT) |
| `src/middleware.ts` | 57 | RBAC + protection routes |
| `src/types/next-auth.d.ts` | 20 | Augmentation types Session |
| `src/app/api/auth/[...nextauth]/route.ts` | 3 | Route handler NextAuth |
| `src/app/unauthorized/page.tsx` | 45 | Page accès refusé |
| `src/components/providers/SessionProvider.tsx` | 12 | Wrapper client session |

**Fichiers modifiés** :
| Fichier | Modification |
|:--------|:-------------|
| `src/components/auth/LoginForm.tsx` | `signIn` NextAuth au lieu de localStorage |
| `src/components/layout/Header.tsx` | Bouton logout avec `signOut` |
| `src/app/(dashboard)/layout.tsx` | Server Component avec `auth()` |
| `src/app/layout.tsx` | Wrapper SessionProvider |

#### 5.5 Tests de sécurité validés

| Test | Résultat |
|:-----|:---------|
| Sans login → `/student` | ✅ Redirect `/login` |
| Login élève → `/student` | ✅ Accès autorisé |
| Élève → `/admin` | ✅ Redirect `/unauthorized` |
| Admin → `/admin` | ✅ Accès autorisé |
| Logout | ✅ Session détruite, redirect `/login` |

#### 5.6 Validations

- ✅ `npm run lint` — 0 erreur
- ✅ `npm run build` — Build réussi (routes dynamiques)
- ✅ Tous les tests RBAC passent
- ✅ Aucun secret hardcodé (`AUTH_SECRET` dans .env)

**Temps estimé** : 5h | **Temps réel** : ~4h (problèmes middleware Next.js 16)

**Capture** : `assets/screenshots/phase-05-login.png` *(à créer)*

---

### ✅ Phase 6 — Interface Admin (28.12.2025)

**Objectif** : Implémenter le dashboard admin complet avec CRUD utilisateurs, classes et matières.

#### 6.1 Stack utilisée

| Technologie | Usage |
|:------------|:------|
| shadcn/ui | Table, Dialog, Select, DropdownMenu |
| React Hook Form (pattern) | Gestion état formulaires |
| Zod | Validation côté serveur |
| bcryptjs | Hash mots de passe création utilisateurs |

#### 6.2 Complexité rencontrée : Alignement Types/Prisma

**Problème critique** : Les types TypeScript ne correspondaient pas au schéma Prisma.

| Type Initial (incorrect) | Schéma Prisma (réel) |
|:-------------------------|:---------------------|
| `UserRow.name` | `firstName` + `lastName` |
| `ClassRow.year` | N'existe pas |
| `SubjectRow.color` | N'existe pas |

**Solution** : Audit complet du schéma Prisma avant de coder les types.

```typescript
// ❌ AVANT (type inventé)
export type UserRow = { name: string | null; ... }

// ✅ APRÈS (aligné Prisma)
export type UserRow = { firstName: string; lastName: string; ... }
```

**Leçon apprise** : Toujours consulter `prisma/schema.prisma` comme source de vérité pour les types.

#### 6.3 Bug Zod : `.issues` vs `.errors`

**Problème** : Utilisation de `error.errors` qui n'existe pas dans Zod.

```typescript
// ❌ ERREUR : Property 'errors' does not exist
catch (e) { if (e instanceof z.ZodError) { console.log(e.errors) } }

// ✅ CORRECT : Utiliser .issues
catch (e) { if (e instanceof z.ZodError) { console.log(e.issues) } }
```

#### 6.4 Architecture CRUD

```
┌─────────────────────────────────────────────────────────────┐
│                  FLUX CRUD ADMIN                            │
│                                                             │
│  Page (/admin/users)                                        │
│    │                                                        │
│    ├─► Hook (useUserForm)  →  État local formulaire        │
│    │                                                        │
│    ├─► Modal (UserFormModal)  →  UI création/édition       │
│    │                                                        │
│    └─► Table (UsersTable)  →  Affichage + actions          │
│          │                                                  │
│          └─► API (/api/admin/users)  →  Prisma CRUD        │
└─────────────────────────────────────────────────────────────┘
```

#### 6.5 Fichiers créés Phase 6

| Fichier | Lignes | Description |
|:--------|:-------|:------------|
| `src/app/(dashboard)/admin/page.tsx` | 85 | Dashboard stats + cards |
| `src/app/(dashboard)/admin/users/page.tsx` | 95 | Page CRUD utilisateurs |
| `src/app/(dashboard)/admin/classes/page.tsx` | 80 | Page CRUD classes |
| `src/app/(dashboard)/admin/subjects/page.tsx` | 75 | Page CRUD matières |
| `src/app/api/admin/users/route.ts` | 85 | GET/POST users |
| `src/app/api/admin/users/[id]/route.ts` | 80 | GET/PUT/DELETE user |
| `src/app/api/admin/classes/route.ts` | 70 | GET/POST classes |
| `src/app/api/admin/classes/[id]/route.ts` | 65 | GET/PUT/DELETE class |
| `src/app/api/admin/subjects/route.ts` | 60 | GET/POST subjects |
| `src/app/api/admin/subjects/[id]/route.ts` | 55 | GET/PUT/DELETE subject |
| `src/components/features/admin/UsersTable.tsx` | 120 | Table utilisateurs |
| `src/components/features/admin/UserFormModal.tsx` | 150 | Modal CRUD user |
| `src/components/features/admin/ClassesTable.tsx` | 100 | Table classes |
| `src/components/features/admin/ClassFormModal.tsx` | 120 | Modal CRUD class |
| `src/components/features/admin/SubjectsTable.tsx` | 90 | Table matières |
| `src/components/features/admin/SubjectFormModal.tsx` | 100 | Modal CRUD subject |
| `src/hooks/admin/useUserForm.ts` | 55 | Hook formulaire user |
| `src/hooks/admin/useClassForm.ts` | 50 | Hook formulaire class |
| `src/hooks/admin/useSubjectForm.ts` | 45 | Hook formulaire subject |
| `src/types/admin.ts` | 35 | Types partagés admin |
| `src/lib/validations/admin.ts` | 45 | Schémas Zod admin |

#### 6.6 Validations

- ✅ `npm run lint` — 0 erreur
- ✅ `npm run build` — Build réussi
- ✅ CRUD Users fonctionnel (create, read, update, delete)
- ✅ CRUD Classes fonctionnel
- ✅ CRUD Subjects fonctionnel
- ✅ Hash bcrypt sur mots de passe
- ✅ Validation Zod sur toutes les routes

**Temps estimé** : 8h | **Temps réel** : ~10h (bugs types + debug Zod)

**Captures** : 
- `assets/screenshots/02-organisation/admin-dashboard.png` ✅
- `assets/screenshots/02-organisation/admin-users.png` ✅
- `assets/screenshots/02-organisation/admin-classes.png` ✅
- `assets/screenshots/02-organisation/admin-subjects.png` ✅

---

### ✅ Phase 7 — Interface Professeur (29.12.2025)

**Objectif** : Créer l'espace de travail du professeur (Dashboard, Gestion des cours, Suivi élèves, IA).

#### 7.1 Fonctionnalités clés

- **Dashboard** : Vue d'ensemble (KPIs, prochains cours).
- **Gestion des Cours** : CRUD complet, éditeur riche (TipTap), chapitres.
- **Suivi Élèves** : Liste par classe, fiche détail élève (contacts, progression).
- **Assistant IA (Gemini)** : "Cockpit Pédagogique" pour analyser la progression et générer des quiz.

#### 7.2 Focus Technique : Intégration Gemini 1.5 Pro

Pour l'analyse pédagogique, nous avons intégré Google Gemini 1.5 Pro.

```typescript
// src/lib/ai/gemini.ts
export class GeminiService {
  // ...
  async analyzeClassProgress(resources, progressData) {
    // Analyse multimodale des ressources + stats élèves
    // Retourne : Forces, Faiblesses, Actions recommandées
  }
}
```

#### 7.3 Composants UI majeurs

| Composant | Rôle |
|:----------|:-----|
| `GeminiInsightCard` | Affiche l'analyse IA dans le détail de la classe |
| `CourseForm` | Formulaire complexe (Tabs) pour créer un cours |
| `RichEditor` | Éditeur WYSIWYG basé sur TipTap |
| `ClassStudentsList` | Table des élèves avec actions |

**Validations** :
- ✅ `npm run lint` — 0 erreur
- ✅ `npm run build` — Build réussi
- ✅ Intégration IA fonctionnelle (API Routes + Service)

**Temps estimé** : 7h | **Temps réel** : ~9h

**Captures** : `assets/screenshots/phase-07-teacher.png` *(à créer)*

---

### ✅ Phase 4 — Database & Vercel (23.12.2025)

**Objectif** : Connecter une base de données PostgreSQL (Neon) via Vercel et configurer Prisma ORM.

#### 4.1 Complexité rencontrée : Prisma 7 vs Prisma 6

**Problème initial** : L'installation par défaut (`npm install prisma`) installe Prisma 7 qui a **cassé la rétrocompatibilité**.

| Prisma 6 | Prisma 7 (breaking changes) |
|:---------|:----------------------------|
| `url` dans schema.prisma | `url` dans `prisma.config.ts` |
| Import `@prisma/client` | Import depuis `./generated/prisma/client` |
| Provider `prisma-client-js` | Provider `prisma-client` |
| Charge `.env` automatiquement | Nécessite `import 'dotenv/config'` |

**Solution** : Downgrade vers Prisma 6 (stable)
```bash
npm uninstall prisma @prisma/client
npm install prisma@6 @prisma/client@6
```

**Leçon apprise** : Toujours vérifier les breaking changes des versions majeures avant installation.

#### 4.2 Configuration Neon via Vercel Marketplace

**Changement Vercel 2025** : Vercel Postgres n'est plus natif, il utilise maintenant des **providers du Marketplace** (Neon, Supabase, PlanetScale...).

**Étapes manuelles effectuées** :
1. Vercel Dashboard → Storage → Browse Marketplace
2. Sélection **Neon** (PostgreSQL serverless, Free tier)
3. Création base : `blaizbot-db` (région US-East-1)
4. Récupération credentials (pooled + direct URLs)

**URLs de connexion** :
| Type | Usage | Format |
|:-----|:------|:-------|
| `DATABASE_URL` | Requêtes (pooled) | `...@ep-xxx-pooler.c-3...` |
| `DIRECT_URL` | Migrations Prisma | `...@ep-xxx.c-3...` |

⚠️ **Pooled** = connexions partagées (performance)
⚠️ **Direct** = connexion unique (obligatoire pour `prisma migrate`)

#### 4.3 Schéma Prisma final

**22 modèles créés** :

| Catégorie | Modèles |
|:----------|:--------|
| Auth & Users | `User`, `TeacherProfile`, `StudentProfile` |
| Organisation | `Subject`, `Class` |
| Contenu | `Course`, `CourseFile`, `Exercise` |
| Attribution | `Assignment`, `Grade`, `Progression` |
| Lab | `LabProject`, `LabSource` |
| Knowledge | `KnowledgeBase` |
| Messagerie | `Conversation`, `Message` |
| Calendrier | `CalendarEvent` |
| IA | `AISettings`, `AIChat` |

**9 enums** : `Role`, `AssignmentTargetType`, `AssignmentStatus`, `LabSourceType`, `KnowledgeOwnerType`, `ConversationType`, `AIProvider`, `AIRestrictionLevel`

#### 4.4 Connexion VS Code ↔ Vercel

**Problème** : Vercel CLI était connecté au mauvais compte (celui d'un client).

**Solution** :
```bash
npx vercel logout                    # Déconnexion
npx vercel login                     # Reconnexion (ouvre navigateur)
npx vercel link                      # Liaison au projet
npx vercel env pull .env.local       # Sync des variables
```

**Résultat** : VS Code peut maintenant interagir directement avec Vercel :
- `npx vercel` → Deploy preview
- `npx vercel --prod` → Deploy production
- `npx vercel env pull` → Synchroniser variables
- `npx vercel logs` → Voir logs

#### 4.5 Seed de données

**Script `prisma/seed.ts`** crée :
- 6 matières (Maths, Français, Histoire-Géo, SVT, Physique, Anglais)
- 3 classes (3ème A, 3ème B, 4ème A)
- 6 utilisateurs (1 admin, 2 profs, 3 élèves)
- 2 cours (Les Fractions, La Révolution Française)

**Comptes de test** :
| Rôle | Email | Mot de passe |
|:-----|:------|:-------------|
| Admin | `admin@blaizbot.edu` | `admin123` |
| Prof | `m.dupont@blaizbot.edu` | `prof123` |
| Élève | `lucas.martin@blaizbot.edu` | `eleve123` |

#### 4.6 Fichiers créés Phase 4

| Fichier | Lignes | Description |
|:--------|:-------|:------------|
| `prisma/schema.prisma` | 350 | Schéma complet 22 modèles |
| `prisma/seed.ts` | 210 | Script de données initiales |
| `prisma/migrations/` | ~1500 | SQL généré automatiquement |
| `src/lib/prisma.ts` | 18 | Client singleton Next.js |
| `.env.local` / `.env` | 20 | Variables Vercel/Neon |

#### 4.7 Validations

- ✅ `npx prisma validate` — Schéma valide
- ✅ `npx prisma migrate dev --name init` — Migration appliquée
- ✅ `npm run db:seed` — 6 matières, 3 classes, 6 users, 2 cours
- ✅ `npm run build` — Build Next.js réussi
- ✅ `npx vercel ls` — Déploiement Ready

**Temps estimé** : 4h | **Temps réel** : ~3h (malgré les problèmes Prisma 7)

**Capture** : `assets/screenshots/phase-04-prisma-studio.png` *(à créer)*

---

### ✅ Phase 2 — Layout & Navigation (23.12.2025)

**Objectif** : Créer la structure de navigation complète avec Sidebar, Header et toutes les pages vides.

**Composants créés** :
| Fichier | Lignes | Rôle |
|:--------|:-------|:-----|
| `Sidebar.tsx` | 98 | Navigation par rôle (ADMIN/TEACHER/STUDENT) |
| `Header.tsx` | 62 | Recherche + Avatar + Dropdown |
| `(dashboard)/layout.tsx` | 36 | Wrapper dashboard avec role dynamique |

**Pages créées** (12 fichiers, ~10 lignes chacun) :
- **Admin** : `/admin`, `/admin/users`, `/admin/classes`, `/admin/subjects`
- **Teacher** : `/teacher`, `/teacher/courses`, `/teacher/classes`, `/teacher/messages`
- **Student** : `/student`, `/student/courses`, `/student/ai`, `/student/messages`

**Patterns établis** :
- Navigation basée sur `Role` (majuscules : ADMIN | TEACHER | STUDENT)
- `navItemsByRole: Record<Role, NavItem[]>` pour le mapping
- Layout avec `ml-64` pour compenser la Sidebar fixe
- Role dynamique basé sur la route (`getRoleFromPathname`)
- Pages vides = Server Components (pas de 'use client')

**Validations** :
- ✅ `npm run lint` — 0 erreur
- ✅ `npm run build` — 16 pages générées
- ✅ Navigation fonctionnelle sur `/student`, `/teacher`, `/admin`
- ✅ Sidebar change selon la route

**Audit post-validation** :
| Problème détecté | Correction |
|:-----------------|:-----------|
| Role hardcodé STUDENT | → Dynamique via `usePathname()` |
| URLs sidebar ≠ pages | → Alignement des hrefs |
| SidebarItem.tsx inutilisé | → Supprimé (YAGNI) |

**Itérations** : 2 (1 création + 1 audit/fix)

**Temps estimé** : 3h | **Temps réel** : ~1h

**Capture** : `assets/screenshots/phase-02-dashboard.png` *(à créer)*

<!-- FIN JOURNAL PHASES -->

---

**Exemple d'enrichissement** :

```markdown
## 📋 Étape 4.2 — Configurer Prisma

### 🎯 Objectif
Installer et configurer Prisma, l'ORM TypeScript qui génère
des types automatiquement.

### 📝 Comment
1. Installer les packages npm
2. Initialiser Prisma
3. Configurer le provider PostgreSQL
4. Créer le singleton client

### 🔧 Par quel moyen
- `npm install prisma @prisma/client`
- `npx prisma init`

### Tâche 4.2.1 — Installer Prisma

| Critère | Attendu |
| :--- | :--- |
| Commande | `npm install prisma @prisma/client` |
| Package.json | Packages présents |

💡 **INSTRUCTION pour l'IA** :
```
1. EXÉCUTER: npm install prisma @prisma/client
2. VÉRIFIER: package.json contient les deux
```
```

**Métriques de l'enrichissement** :

| Métrique | Valeur |
| :--- | :--- |
| Fichiers modifiés | 40 |
| Lignes ajoutées | +10 614 |
| Lignes supprimées | -371 |
| Commit | `4c2e26d` |

## 8.5 Prompts Optimisés par Phase

### 8.5.1 Objectif

En parallèle des TODO enrichis, nous avons créé une **bibliothèque de prompts pré-optimisés** :

```
BlaizBot-V1/prompts/
├── phase-01-init.md       # 350 lignes
├── phase-02-layout.md     # 170 lignes
├── phase-03-slice.md      # 150 lignes
├── phase-04-database.md   # 160 lignes
├── phase-05-auth.md       # 200 lignes
├── phase-06-admin.md      # 180 lignes
├── phase-07-teacher.md    # 170 lignes
├── phase-08-student.md    # 160 lignes
├── phase-09-ia.md         # 200 lignes
└── phase-10-demo.md       # 220 lignes
```

**Total** : 10 fichiers, ~1 860 lignes de prompts

### 8.5.2 Workflow de préparation

```
┌─────────────────────────────────────────────────────────────┐
│   AVANT DÉVELOPPEMENT : PRÉPARATION DES PROMPTS              │
└─────────────────────────────────────────────────────────────┘
         │
         ▼
┌───────────────────────┐
│ 1. LIRE todo/phase-XX │  ← Comprendre les tâches
└───────────────────────┘
         │
         ▼
┌───────────────────────┐
│ 2. EXTRAIRE les étapes │  ← Identifier chaque action
└───────────────────────┘
         │
         ▼
┌───────────────────────┐
│ 3. RÉDIGER le prompt   │  ← Précis, copy-paste ready
└───────────────────────┘
         │
         ▼
┌───────────────────────┐
│ 4. AJOUTER validation │  ← Checklist de fin de phase
└───────────────────────┘
         │
         ▼
┌───────────────────────┐
│ 5. INCLURE journal    │  ← Section rétro-prompt vide
└───────────────────────┘
```

### 8.5.3 Exemple de prompt optimisé

**Phase 4 - Installer Prisma** :

```markdown
npm install prisma @prisma/client
npx prisma init
```

vs

**Prompt enrichi** :

```markdown
Exécuter les commandes :

npm install prisma @prisma/client
npx prisma init

Cela crée :
- prisma/schema.prisma
- .env (ignorer, on utilise .env.local)

VÉRIFIER : dossier prisma/ existe avec schema.prisma
```

**Différence** : Le prompt enrichi anticipe les questions et donne le critère de succès.

### 8.5.4 Métriques de la préparation

| Métrique | Valeur |
| :--- | :--- |
| Fichiers prompts créés | 10 |
| Lignes ajoutées | +1 862 |
| Lignes supprimées | -485 |
| Commit | `ce93754` |

### 8.5.5 Bénéfice attendu

| Sans préparation | Avec préparation |
| :--- | :--- |
| "Fais-moi une sidebar" | Prompt 50 lignes avec specs |
| 5-10 itérations | 1-3 itérations (objectif) |
| Résultats variables | Résultats prévisibles |

> "Investir 2h en préparation pour gagner 10h en exécution."

## 8.7 Métriques de développement

### 8.7.1 Suivi du temps

| Slice | Estimé | Réel | Écart |
| :--- | :--- | :--- | :--- |
| Phase 1 Init | 2j | 2h | Rapide grâce aux prompts |
| Phase 2 Layout | 3j | 3h | + audit et corrections |
| Phase 3 Mock | 3j | 1h | Données + dashboards |
| Phase 4 | 4j | *À remplir* | |
| Phase 5+ | ... | *À remplir* | |

### 8.7.2 Lignes de code

| Catégorie | Lignes | % IA généré | % modifié |
| :--- | :--- | :--- | :--- |
| Composants React | ~500 | 95% | 5% |
| API Routes | 0 | - | - |
| Prisma schema | 0 | - | - |
| Types/Constants | ~450 | 100% | 0% |
| Mock Data | ~70 | 100% | 0% |
| **Total Phase 1-3** | ~1020 | 98% | 2% |

### 8.7.3 Journal Phase 3 (23.12.2025)

**Objectif** : Vertical Slice - Démontrer l'UI avec données mock (sans BDD)

| Tâche | Fichiers créés | Itérations | Observations |
| :--- | :--- | :--- | :--- |
| 3.1 Login | `(auth)/login/page.tsx`, `LoginForm.tsx` | 1 | shadcn Label nécessaire |
| 3.2 Student | `mockData.ts`, 4 composants dashboard | 2 | TypeScript strict: `split()[0]` |
| 3.3 Teacher | Extension mockData + page | 1 | Pattern firstName réutilisé |
| 3.4 Admin | Extension mockData + page | 1 | Stats plateforme |

**Bug corrigé** : Hydration mismatch Header.tsx
- Cause : Radix UI génère IDs dynamiques différents SSR/client
- Solution : `useSyncExternalStore` (useState+useEffect interdit par ESLint)

**Routes fonctionnelles** :
- `/login` → 3 boutons connexion rapide (Élève, Professeur, Admin)
- `/student` → Dashboard avec WelcomeCard, StatsCards, RecentCourses
- `/teacher` → Dashboard avec stats et liste classes
- `/admin` → Dashboard avec métriques plateforme

### 8.7.4 Commits par jour

*Graphique à générer en fin de projet*

## 8.8 Preuves

### 8.8.1 Captures requises

- [ ] `08-dev/cycle-exemple.png` - Exemple de cycle complet
- [ ] `08-dev/terminal-dev.png` - Commandes typiques
- [ ] `08-dev/bug-fix-exemple.png` - Correction de bug
- [ ] `08-dev/commit-history.png` - Historique Git
- [ ] `08-dev/todo-structure.png` - Structure dossier todo/

### 8.8.2 Template journal de bord (par itération)

```
Date/heure : [...]
Slice : X - [Nom]
Objectif : [...]
Prompt utilisé : [...]
Résultat : [✅/⚠️/❌] [description]
Problème rencontré : [...]
Décision / justification : [...]
Temps passé : [...]
Commit(s) : [hash1, hash2, ...]
Preuves : [capture/lien]
```

---

**Mots-clés** : itérations, slices, cycle Vibe Coding, bugs, métriques, TODO modulaire
**Statut** : 🔄 En cours (documentation au fil de l'eau)
