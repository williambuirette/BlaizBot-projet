# BlaizBot-projet 📚

> **Exposé académique sur le Vibecoding**  
> Documentation vivante générée en parallèle du développement

## 🎯 Objectif

Ce repo contient l'**exposé final** sur le paradigme du Vibecoding, illustré par le cas d'étude BlaizBot - une plateforme éducative avec IA intégrée.

---

## 🧠 Bonnes pratiques Vibe Coding

Le Vibe Coding repose sur une méthodologie structurée. Voici les pratiques clés documentées dans cet exposé :

### 📋 PRD (Product Requirements Document)

Avant de coder, définir clairement le **QUOI** :

| Élément | Description |
| :--- | :--- |
| **Problème** | Quel problème résout-on ? |
| **Utilisateurs** | Qui sont les personas ? |
| **User Stories** | "En tant que X, je veux Y pour Z" |
| **Critères d'acceptation** | Comment valider que c'est fait ? |
| **Contraintes** | Délais, budget, technologies imposées |

> 💡 L'IA génère mieux du code quand elle comprend le contexte métier.

### 🎯 MVP (Minimum Viable Product)

Définir le **périmètre minimal** fonctionnel :

```
MVP BlaizBot :
✅ Authentification (3 rôles)
✅ Dashboard élève (chat IA, révisions)
✅ Dashboard professeur (gestion cours)
✅ Dashboard admin (utilisateurs)
❌ Notifications push (V2)
❌ Mode hors-ligne (V2)
❌ Analytics avancés (V2)
```

> ⚠️ Sans MVP clair, l'IA propose trop de features → scope creep.

### 📊 MoSCoW (Priorisation)

| Priorité | Signification | Exemple BlaizBot |
| :--- | :--- | :--- |
| **Must** | Indispensable | Authentification, Chat IA |
| **Should** | Important | Calendrier, Flashcards |
| **Could** | Bonus | Thèmes personnalisés |
| **Won't** | Hors scope V1 | Mobile native |

### 🔄 Cycle itératif

```
1. Intention    → Décrire ce qu'on veut (langage naturel)
2. Génération   → L'IA propose du code
3. Validation   → Test visuel/fonctionnel
4. Correction   → Ajustements si nécessaire
5. Commit       → Versioning avec message clair
6. Document     → Mettre à jour l'exposé
```

### 📝 Prompt Engineering

| ❌ Mauvais prompt | ✅ Bon prompt |
| :--- | :--- |
| "Fais-moi un chat" | "Crée un composant ChatMessage.tsx avec TypeScript, props: message, sender, timestamp. Style Tailwind, dark mode." |
| "Corrige le bug" | "Le formulaire ne valide pas l'email. Fichier: LoginForm.tsx ligne 42. Erreur: regex invalide." |

### 🎛️ Context Engineering

Le **Context Engineering** est l'art de fournir le bon contexte à l'IA pour obtenir des réponses pertinentes. C'est la compétence clé du Vibe Coder.

#### Les 4 niveaux de contexte

| Niveau | Source | Exemple BlaizBot |
| :--- | :--- | :--- |
| **System** | Instructions permanentes | `copilot-instructions.md`, agents IA |
| **Project** | Fichiers du workspace | Architecture, schéma Prisma, API docs |
| **Conversation** | Historique du fil | Messages précédents dans le chat |
| **Prompt** | Requête immédiate | "Crée le composant X..." |

#### Stratégies de context engineering

```
📁 Fichiers de contexte dans BlaizBot :
├── .github/copilot-instructions.md   → Règles globales
├── .github/agents/*.md               → 8 agents spécialisés
├── docs/04-MODELE_DONNEES.md         → Schéma Prisma (référence)
├── docs/05-API_ENDPOINTS.md          → Routes API (référence)
└── blaizbot-wireframe/               → Maquettes (référence visuelle)
```

> 💡 **Règle d'or** : Plus le contexte est précis, moins l'IA hallucine.

#### Window context vs Long-term memory

| Type | Description | Outil |
| :--- | :--- | :--- |
| **Window** | Contexte limité à la conversation (~128k tokens) | ChatGPT, Copilot Chat |
| **Long-term** | Mémoire persistante entre sessions | Projets ChatGPT, fichiers `.md` |

### 🔍 RAG (Retrieval-Augmented Generation)

Le **RAG** permet à l'IA de chercher dans une base de connaissances avant de répondre, réduisant les hallucinations.

#### Principe du RAG

```
┌─────────────────────────────────────────────────────────┐
│  1. QUESTION                                            │
│     "Comment fonctionne l'auth dans BlaizBot ?"         │
└────────────────────┬────────────────────────────────────┘
                     ▼
┌─────────────────────────────────────────────────────────┐
│  2. RETRIEVAL (Recherche)                               │
│     → Recherche dans docs/, code source, schéma Prisma  │
│     → Trouve: auth.ts, User model, middleware           │
└────────────────────┬────────────────────────────────────┘
                     ▼
┌─────────────────────────────────────────────────────────┐
│  3. AUGMENTATION (Enrichissement)                       │
│     → Injecte les extraits pertinents dans le prompt    │
└────────────────────┬────────────────────────────────────┘
                     ▼
┌─────────────────────────────────────────────────────────┐
│  4. GENERATION (Réponse)                                │
│     → L'IA répond avec le contexte réel du projet       │
└─────────────────────────────────────────────────────────┘
```

#### RAG dans BlaizBot

| Composant | Rôle | Technologie |
| :--- | :--- | :--- |
| **Base de connaissances** | Cours, documents PDF | Supabase + pgvector |
| **Embeddings** | Vectorisation du texte | OpenAI text-embedding-3 |
| **Retrieval** | Recherche sémantique | Similarity search |
| **Generation** | Réponse augmentée | GPT-4 |

#### Cas d'usage dans l'app

```typescript
// Exemple simplifié de RAG pour le chat élève
async function askWithRAG(question: string, courseId: string) {
  // 1. Retrieval - chercher dans les cours
  const relevantChunks = await searchCourseContent(question, courseId);
  
  // 2. Augmentation - construire le prompt
  const augmentedPrompt = `
    Contexte du cours:
    ${relevantChunks.map(c => c.content).join('\n')}
    
    Question de l'élève: ${question}
  `;
  
  // 3. Generation - réponse IA
  return await generateResponse(augmentedPrompt);
}
```

> 🎓 **Dans BlaizBot** : L'élève pose une question → L'IA cherche dans ses cours → Répond avec le contexte réel.

---

## 📁 Structure

```
BlaizBot-projet/
├── content/                    # Chapitres de l'exposé (Markdown)
│   ├── 00-cadre-travail.md
│   ├── 01-idee-problematique.md
│   ├── 02-organisation-chatgpt.md   ← Documenté ✅
│   ├── 03-choix-outils.md
│   ├── 04-specifications-prd.md
│   ├── 05-wireframe-ux.md           ← Terminé ✅
│   ├── 06-architecture.md           ← Terminé ✅
│   ├── 07-prompts-agents.md         ← Terminé ✅
│   ├── 08-developpement.md          ← En cours 🔄
│   ├── 09-demo-stabilisation.md
│   ├── 10-analyse-resultats.md
│   ├── 11-limites-risques.md
│   ├── 12-conclusion.md
│   └── annexes/
│       ├── A-glossaire.md
│       ├── B-code-samples.md
│       ├── C-screenshots.md
│       └── D-references.md
├── assets/                     # Images et captures
│   └── screenshots/
│       └── 02-organisation/    # Captures ChatGPT ✅
├── progress.json               # Tracker de progression
├── JOURNAL.md                  # Journal de bord centralisé
└── README.md
```

## � Progression

| # | Chapitre | Statut |
| :--- | :--- | :--- |
| 00 | Cadre du travail | 📝 Draft |
| 01 | Idée & Problématique | 📝 Draft |
| 02 | Organisation ChatGPT | ✅ Done |
| 03 | Choix des outils | 📝 Draft |
| 04 | Spécifications PRD | 🔴 À remplir |
| 05 | Wireframe & UX | ✅ Done |
| 06 | Architecture | ✅ Done |
| 07 | Prompts & Agents | ✅ Done |
| 08 | Développement | 🔄 En cours |
| 09 | Démo & Stabilisation | 🔴 À faire |
| 10 | Analyse des résultats | 🔴 À faire |
| 11 | Limites & Risques | 🔴 À faire |
| 12 | Conclusion | 🔴 À faire |

## 📎 Repos liés

| Repo | Rôle | Lien |
| :--- | :--- | :--- |
| **blaizbot-wireframe** | Maquettes UI (HTML/CSS/JS) | [GitHub](https://github.com/williambuirette/blaizbot-wireframe) |
| **BlaizBot-V1** | Application production | [GitHub](https://github.com/williambuirette/BlaizBot-V1) |
| **Vibe-Coding** | Méthodologie & templates | Local |

## 📚 Ressources Vibe Coding

- [Andrej Karpathy - "Vibe Coding"](https://twitter.com/karpathy/status/1886192184808149383) - Tweet originel
- [Simon Willison - AI-assisted coding](https://simonwillison.net/) - Bonnes pratiques
- [Cursor Documentation](https://cursor.sh/docs) - IDE IA-first

---

**Auteur** : William Buirette  
**Dernière mise à jour** : 22 décembre 2025
