# 2. Organisation "Projet ChatGPT"

> Ce chapitre documente la mise en place de l'environnement de travail avec l'IA : création du projet, prompt système, et organisation des conversations.

---

## 2.1 Création du projet ChatGPT

### 2.1.1 Pourquoi un projet dédié ?

ChatGPT permet de créer des **projets** qui offrent :

- **Contexte persistant** : L'IA se souvient du projet entre les sessions
- **Documents de référence** : Upload de specs, docs, exemples
- **Prompt système** : Instructions permanentes pour orienter les réponses
- **Historique organisé** : Conversations groupées par sujet

![Création projet ChatGPT](../assets/screenshots/02-organisation/chatgpt-nouveau-projet.png)
*Figure 2.1 : Interface de création d'un projet ChatGPT*

### 2.1.2 Configuration initiale

| Paramètre | Configuration |
| :--- | :--- |
| Nom du projet | BlaizBot Development |
| Modèle | GPT-4 |
| Documents uploadés | 3 fichiers de référence |
| Prompt système | 500+ mots de contexte |

## 2.2 Prompt système

### 2.2.1 Structure du prompt

Le prompt système définit le **comportement par défaut** de l'IA :

```markdown
# Contexte
Tu es un expert en développement d'applications éducatives modernes.
Le projet s'appelle BlaizBot : une plateforme éducative avec IA intégrée.

# Stack technique
- Frontend : Next.js 15, TypeScript, Tailwind CSS, shadcn/ui
- Backend : Next.js API Routes, Prisma, PostgreSQL (Supabase)
- Auth : NextAuth.js v5
- IA : Vercel AI SDK + OpenAI

# Règles de travail
1. Une étape à la fois (pas de code massif)
2. Toujours demander confirmation avant de modifier plusieurs fichiers
3. Commenter le code en français
4. Utiliser les conventions du projet (JSDoc, Conventional Commits)

# Format des réponses
- Commencer par un résumé de l'action
- Montrer le code avec explications
- Terminer par "Next step" avec 1 action suggérée

# Contraintes
- Fichiers < 350 lignes
- Pas de secrets en dur (utiliser .env)
- TypeScript strict (pas de any)
```

*Listing 2.1 : Prompt système du projet ChatGPT*

### 2.2.2 Évolution du prompt

Le prompt a évolué au fil du projet :

| Version | Ajout | Raison |
| :--- | :--- | :--- |
| v1.0 | Contexte de base | Démarrage |
| v1.1 | Règles de travail | Réponses trop longues |
| v1.2 | Format des réponses | Standardisation |
| v1.3 | Stack technique | Cohérence code |

## 2.3 Base de connaissances

### 2.3.1 Documents uploadés

| Document | Contenu | Usage |
| :--- | :--- | :--- |
| `instructions-ia.md` | Règles de génération de code | Qualité du code |
| `architecture.md` | Structure du projet | Cohérence |
| `wireframe-specs.md` | Spécifications UI | Référence visuelle |

### 2.3.2 Mise à jour des documents

Les documents sont mis à jour quand :
- Une décision architecturale est prise
- Un nouveau pattern est adopté
- Une erreur récurrente est identifiée

## 2.4 Structure des fils de conversation

### 2.4.1 Organisation par sujet

```
📁 Projet BlaizBot
├── 💬 Cadrage / PRD
│   └── Définition du projet, specs produit
├── 💬 UX / Wireframe
│   └── Design, maquettes, parcours utilisateur
├── 💬 Dev / Bugs
│   └── Code, debugging, refactoring
├── 💬 Agents & Prompts
│   └── Configuration des agents VS Code
├── 💬 Journal de bord
│   └── Traçabilité, décisions
└── 💬 Prépa démo + rapport
    └── Documentation, exposé
```

### 2.4.2 Règle d'or

> **1 fil = 1 sujet**. Ne pas mélanger wireframe et debugging dans la même conversation.

**Avantages** :
- Contexte clair pour l'IA
- Historique facile à retrouver
- Preuves organisées pour l'exposé

## 2.5 Règles de travail établies

### 2.5.1 Méthode itérative

```
1. Intention claire   → "Je veux créer le composant X"
2. Prompt précis      → Détails, contraintes, références
3. Génération         → L'IA propose du code
4. Validation         → Test visuel/fonctionnel
5. Correction         → Ajustements si nécessaire
6. Commit + note      → Traçabilité
```

### 2.5.2 Anti-patterns identifiés

| ❌ À éviter | ✅ Bonne pratique |
| :--- | :--- |
| "Fais tout le projet" | "Crée le composant LoginForm" |
| Prompts vagues | Prompts avec contexte et contraintes |
| Ignorer les erreurs | Demander explication et correction |
| Copier-coller aveugle | Relire et comprendre le code |

## 2.6 Preuves

### 2.6.1 Captures requises

- [ ] `02-organisation/chatgpt-projet-cree.png` - Projet créé
- [ ] `02-organisation/chatgpt-prompt-systeme.png` - Prompt système
- [ ] `02-organisation/chatgpt-documents.png` - Documents uploadés
- [ ] `02-organisation/chatgpt-fils-organises.png` - Structure des conversations

### 2.6.2 Journal de bord

```
Date/heure : [À compléter]
Étape : 2 - Organisation projet ChatGPT
Objectif : Configurer l'environnement IA de travail
Prompt utilisé : N/A (configuration manuelle)
Résultat : Projet créé avec prompt système + docs
Décision : 6 fils de conversation thématiques
Justification : Clarté du contexte pour l'IA
Preuve : Screenshots du projet ChatGPT
```

---

**Mots-clés** : ChatGPT, projet, prompt système, organisation, fils de conversation
**Statut** : ✅ Réalisé (captures à prendre)
