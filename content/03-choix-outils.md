# 3. Choix des Outils & Environnement

> Ce chapitre documente les décisions techniques : outils de conception, de développement et d'assistance IA, avec justification de chaque choix.

---

## 3.1 Outils de conception

### 3.1.1 Wireframing

| Outil | Usage | Justification |
| :--- | :--- | :--- |
| **HTML/CSS/JS** | Wireframe haute-fidélité | Feedback instantané, pas de courbe d'apprentissage |
| Live Server | Auto-refresh | Vibe Coding (instant gratification) |
| VS Code | Éditeur | Extensions IA intégrées |

**Rétro-prompt** :
```
Quel outil me conseilles-tu pour créer un wireframe interactif
qui servira de spécification pour une application Next.js ?
Je veux voir le résultat immédiatement sans build step.
```

**Alternative écartée** : Figma
- ✅ Avantages : Design précis, collaboration
- ❌ Inconvénients : Pas interactif, export vers code complexe

### 3.1.2 Diagrammes

| Outil | Usage |
| :--- | :--- |
| Mermaid | Diagrammes dans Markdown |
| Draw.io | Schémas complexes exportés en PNG |
| ASCII Art | Diagrammes simples dans le code |

## 3.2 Outils de développement

### 3.2.1 Stack Frontend

| Technologie | Version | Justification Vibe Coding |
| :--- | :--- | :--- |
| **Next.js** | 15.x | App Router moderne, SSR natif, excellent DX |
| **TypeScript** | 5.x | Typage fort, autocomplétion IA améliorée |
| **Tailwind CSS** | 3.x | Utility-first, IA génère facilement |
| **shadcn/ui** | latest | Composants accessibles, personnalisables |

**Rétro-prompt** :
```
Pour une application éducative full-stack avec IA,
quelle stack frontend me recommandes-tu ?
Critères : moderne, bien documentée, compatible avec l'assistance IA.
```

### 3.2.2 Stack Backend

| Technologie | Version | Justification |
| :--- | :--- | :--- |
| **Next.js API Routes** | 15.x | Full-stack en un seul projet |
| **Prisma** | 5.x | ORM type-safe, migrations auto |
| **PostgreSQL** | 15.x | Robuste, relationnel, gratuit |
| **Vercel Postgres** | - | Hébergement gratuit, auth intégrée |

### 3.2.3 Authentification

| Technologie | Usage |
| :--- | :--- |
| **NextAuth.js v5** | Auth multi-providers |
| Credentials | Login email/password |
| Sessions JWT | Stateless, scalable |

### 3.2.4 Intégration IA

| Technologie | Usage |
| :--- | :--- |
| **Vercel AI SDK** | Streaming, hooks React |
| **OpenAI GPT-4** | Chatbot éducatif |
| LangChain (futur) | RAG sur documents cours |

## 3.3 Outils IA (assistants/agents)

### 3.3.1 Modèles utilisés

| Modèle | Usage | Justification |
| :--- | :--- | :--- |
| **GPT-4 (ChatGPT)** | Brainstorming, architecture | Raisonnement complexe |
| **Claude (Copilot)** | Génération code, refactoring | Contexte long, précision |
| **GitHub Copilot** | Autocomplétion | Intégré VS Code |

### 3.3.2 Répartition des tâches

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│    ChatGPT      │     │     Claude      │     │    Copilot      │
│  (Stratégie)    │     │  (Exécution)    │     │  (Tactique)     │
├─────────────────┤     ├─────────────────┤     ├─────────────────┤
│ • Architecture  │     │ • Code complet  │     │ • Autocomplétion│
│ • Décisions     │     │ • Refactoring   │     │ • Snippets      │
│ • PRD           │     │ • Debug         │     │ • Tests         │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

### 3.3.3 Limites et règles d'usage

| Règle | Raison |
| :--- | :--- |
| Toujours relire le code généré | Éviter les erreurs/hallucinations |
| Pas de secrets dans les prompts | Sécurité |
| Versionner les prompts importants | Traçabilité |
| Tester avant commit | Validation fonctionnelle |

## 3.4 Environnement de développement

### 3.4.1 VS Code Configuration

**Extensions installées** :

| Extension | Usage |
| :--- | :--- |
| GitHub Copilot | Autocomplétion IA |
| Copilot Chat | Conversations contextuelles |
| Tailwind CSS IntelliSense | Autocomplétion classes |
| Prisma | Syntax highlighting schema |
| ESLint | Linting JavaScript/TypeScript |
| Prettier | Formatage automatique |
| GitLens | Historique Git visuel |

**Settings clés** :
```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "typescript.preferences.importModuleSpecifier": "relative",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```

### 3.4.2 Profils VS Code

Utilisation des profils de `Vibe-Coding/` :

| Profil | Usage |
| :--- | :--- |
| `Core.code-profile` | Base commune |
| `Web-React.code-profile` | Développement Next.js |

## 3.5 Tableau récapitulatif

| Catégorie | Outil | Justification |
| :--- | :--- | :--- |
| **IDE** | VS Code | Extensions IA, gratuit |
| **Frontend** | Next.js 15 + Tailwind | Moderne, DX excellent |
| **Backend** | API Routes + Prisma | Full-stack simplifié |
| **BDD** | Vercel Postgres (Neon) | Gratuit, robuste |
| **Auth** | NextAuth.js v5 | Standard industrie |
| **IA App** | Vercel AI SDK + OpenAI | Streaming, React hooks |
| **IA Dev** | ChatGPT + Claude + Copilot | Complémentaires |
| **Versionning** | Git + GitHub | Standard |

## 3.6 Preuves

### 3.6.1 Captures requises

- [ ] `03-outils/vscode-extensions.png` - Extensions installées
- [ ] `03-outils/chatgpt-vs-claude.png` - Comparaison modèles
- [ ] `03-outils/stack-diagram.png` - Schéma de la stack

### 3.6.2 Journal de bord

```
Date/heure : [À compléter]
Étape : 3 - Choix des outils
Objectif : Définir la stack technique complète
Prompt utilisé : "Quelle stack pour une app éducative full-stack..."
Résultat : Stack Next.js + Prisma + Vercel Postgres retenue
Décision : 3 modèles IA complémentaires (GPT-4, Claude, Copilot)
Justification : Équilibre modernité / documentation / coût
```

---

**Mots-clés** : stack technique, Next.js, Prisma, outils IA, VS Code
**Statut** : ✅ Réalisé (documentation existante dans BlaizBot-V1/docs/)
