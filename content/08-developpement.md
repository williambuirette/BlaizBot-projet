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
| 001 | *À documenter pendant le dev* | | | |
| 002 | | | | |
| ... | | | | |

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
Phase 2 — Layout             : ⬜ À venir
Phase 3 — Vertical Slice     : ⬜ À venir
Phase 4 — Database           : ⬜ À venir
Phase 5 — Auth               : ⬜ À venir
Phase 6 — Admin              : ⬜ À venir
Phase 7 — Teacher            : ⬜ À venir
Phase 8 — Student            : ⬜ À venir
Phase 9 — IA                 : ⬜ À venir
Phase 10 — Démo              : ⬜ À venir
```

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
| Slice 1 | 4j | *À remplir* | |
| Slice 2 | 6j | *À remplir* | |
| Slice 3 | 6j | *À remplir* | |
| Slice 4 | 4j | *À remplir* | |
| Slice 5 | 3j | *À remplir* | |

### 8.7.2 Lignes de code

| Catégorie | Lignes | % IA généré | % modifié |
| :--- | :--- | :--- | :--- |
| Composants React | *À mesurer* | | |
| API Routes | | | |
| Prisma schema | | | |
| Styles (Tailwind) | | | |
| **Total** | | | |

### 8.7.3 Commits par jour

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
