# Introduction générale

---

## Contexte et enjeux

L'intelligence artificielle transforme en profondeur de nombreux secteurs professionnels. Le développement logiciel vit une mutation particulièrement significative. GPT-4 d'OpenAI, Claude d'Anthropic, Gemini de Google DeepMind : ces modèles de langage avancés (LLM) ont ouvert des possibilités inédites. Générer du code à partir d'instructions en langage naturel. Proposer des corrections automatiques. Assister les développeurs dans leurs choix d'architecture. Détecter des erreurs avant même l'exécution.

En février 2025, le terme **vibe coding** s'est diffusé dans la communauté des développeurs, notamment suite à un message d'Andrej Karpathy sur la plateforme X. Cette approche décrit une nouvelle manière de programmer où le développeur "suit son instinct" et collabore étroitement avec une IA pour accélérer la production de code. Le vibe coding ne consiste pas à "coder sans réfléchir", mais à déléguer stratégiquement certaines tâches répétitives à l'IA tout en conservant le contrôle sur les décisions importantes. Le développeur devient un "pilote" qui guide l'IA avec des consignes précises, teste les propositions et corrige les erreurs.

Cette évolution soulève des questions fondamentales : comment garantir la qualité du code produit ? Quel niveau d'expertise reste nécessaire ? Quelles compétences nouvelles (comme le prompt engineering) deviennent essentielles ? Où l'intervention humaine demeure-t-elle indispensable ? J'ai voulu explorer ces questions à travers une expérimentation concrète et documentée.

---

## Problématique

La question centrale que j'explore dans ce travail :

> **Dans quelle mesure le vibe coding permet-il de développer une application web complète et fonctionnelle, et quelles sont les opportunités et les limites de cette approche en termes de rapidité, de qualité et d'accessibilité ?**

Pour y répondre concrètement, j'ai réalisé un projet de bout en bout : **BlaizBot**, une application web éducative full-stack intégrant une intelligence artificielle. BlaizBot est conçue pour aider les enseignants à faire réviser leurs élèves en s'appuyant sur un assistant pédagogique intelligent. L'application comprend trois interfaces (Administrateur, Professeur, Élève) et intègre un chatbot IA capable de guider les élèves dans leurs révisions.

Mon objectif n'est pas seulement de produire une application fonctionnelle. Je veux surtout **documenter méthodiquement la démarche** : de la conception initiale (brainstorming, wireframe) jusqu'au déploiement du prototype, en passant par chaque étape de développement assisté par IA. Cette documentation permet d'évaluer concrètement l'efficacité du vibe coding, d'identifier ses forces (rapidité, automatisation) et ses faiblesses (hallucinations, dette technique potentielle).

---

## Objectifs du travail

J'ai fixé cinq objectifs complémentaires à ce travail :

### 1. Comprendre et expérimenter le vibe coding
Tester cette méthodologie émergente sur un projet réel. Identifier ses avantages concrets (gain de temps, automatisation des tâches répétitives) et ses limites (nécessité de validation humaine, risques d'erreurs). J'ai utilisé plusieurs modèles d'IA : ChatGPT pour la planification, Claude pour le code, Gemini pour le chatbot. Avec des agents spécialisés.

### 2. Développer une application fonctionnelle
Créer BlaizBot, un MVP (Minimum Viable Product) démontrable comprenant :
- Une authentification multi-rôles avec gestion des permissions (NextAuth v5)
- Une base de données complète (46 modèles Prisma sur PostgreSQL)
- Trois interfaces distinctes (Admin, Professeur, Élève)
- Un assistant IA pédagogique intégré (Gemini 2.0 Flash)
- Un déploiement automatisé (Vercel)

La stack technique retenue est moderne : Next.js 16.1.1, React 19.2.3, TypeScript 5.x (strict), Tailwind CSS v4, Prisma 6.19.

### 3. Documenter rigoureusement la démarche
Chaque phase est expliquée de manière structurée et traçable :
- Les échanges avec l'IA (prompts, réponses, itérations)
- Les décisions architecturales et techniques
- Les erreurs rencontrées et les corrections apportées
- Les commits Git et l'historique de développement
- Les captures d'écran illustrant la progression

Cette documentation constitue la preuve concrète de la méthode. Elle permet d'évaluer l'efficacité réelle du vibe coding.

### 4. Analyser les résultats de manière critique
J'évalue objectivement :
- Le gain de temps réel par rapport à un développement traditionnel
- La qualité du code généré (lisibilité, maintenabilité, performance)
- Le nombre d'itérations nécessaires par fonctionnalité
- Les types d'erreurs produites par l'IA (hallucinations, incohérences)
- Le rôle essentiel de l'intervention humaine (validation, tests, architecture)

### 5. Proposer une réflexion prospective
Anticiper l'évolution du métier de développeur à l'horizon 2030 :
- Transformation des compétences requises (de "codeur" à "architecte-superviseur")
- Impact sur l'éducation et la formation en informatique
- Enjeux éthiques (propriété intellectuelle, dépendance technologique)
- Vision du développement logiciel assisté par IA en 2030

---

## Structure de l'exposé

Cet exposé s'organise en **cinq parties thématiques** regroupant **huit chapitres**, suivies d'annexes techniques.

### PREMIÈRE PARTIE : CADRE THÉORIQUE

**Chapitre 1 — Le Vibe Coding : une nouvelle approche du développement**

Ce chapitre pose les fondements théoriques du vibe coding. Je retrace son origine (message d'Andrej Karpathy, février 2025), j'explique le fonctionnement des LLM (GPT, Claude, Gemini) et je décris la boucle itérative caractéristique : Intention → Génération par l'IA → Test → Correction → Amélioration. J'analyse ensuite les avantages (automatisation, rapidité, accessibilité) et les limites (hallucinations, nécessité de validation) en précisant le rôle central de l'humain comme "pilote" et juge final.

### DEUXIÈME PARTIE : PRÉSENTATION DU PROJET

**Chapitre 2 — Blaiz'Bot : contexte du projet**

Ce chapitre présente BlaizBot en détail : une application éducative web avec trois interfaces (Admin, Professeur, Élève), un assistant IA pédagogique, et des fonctionnalités de gestion de cours, d'exercices et de suivi de progression. Il expose les motivations du projet (tester le vibe coding en conditions réelles, répondre à un besoin pédagogique concret) et définit précisément le périmètre du MVP avec ses limites assumées (pas de plateforme LMS complète, pas d'interface Parent dans la V1).

### TROISIÈME PARTIE : MÉTHODOLOGIE ET CONCEPTION

**Chapitre 3 — Pré-projet : de l'idée au wireframe**

Ce chapitre détaille la phase de préparation méthodologique avant le premier commit de code :
- Brainstorming et cadrage du MVP avec ChatGPT
- Organisation du projet (prompt système, fils de discussion thématiques)
- Choix des outils (VS Code, GitHub, Vercel, Word)
- Mise en place du pipeline de travail (idée → code → test → commit → déploiement)
- Définition des règles de qualité (Prettier, ESLint, .env pour les secrets)
- Création d'une TODO v0 (liste initiale des tâches)
- Mise en place d'agents IA spécialisés (Orchestrateur, PM, Standards, etc.)
- Rédaction du wireframe Markdown v1 (maquette textuelle complète)
- Extraction d'un inventaire UI automatisé par l'IA
- Rédaction du prompt de kickoff pour le wireframe codé

**Chapitre 4 — Wireframe codé et verrouillage du plan**

Ce chapitre décrit la création du prototype interactif :
- Exécution du kickoff wireframe (HTML/CSS/JS avec données mockées)
- Mise en place du design system et de la structure UI commune
- Développement des parcours Élève, Professeur et Admin
- Création de composants réutilisables et de données simulées
- Itérations successives pour corriger les problèmes d'UX
- Comparaison wireframe Markdown vs wireframe codé
- Ajustement du plan de développement avec l'IA (passage à un découpage par phases)
- Refonte du backlog TODO v1 (structuré par phases : Setup, Admin, Prof, Élève, IA)
- Création de gabarits de prompts par type de tâche
- Rédaction du prompt de kickoff pour le développement de l'application réelle

### QUATRIÈME PARTIE : RÉALISATION TECHNIQUE

**Chapitre 5 — Développement de l'application (implémentation du MVP)**

Ce chapitre constitue le cœur technique de l'exposé. Il documente l'implémentation complète du MVP :
- Initialisation du dépôt Next.js 16.1.1 avec TypeScript strict et Tailwind v4
- Traduction du wireframe en routes Next.js (App Router, layouts partagés)
- Intégration des composants UI shadcn/ui
- Conception du modèle de données (46 modèles Prisma) et connexion PostgreSQL
- Mise en place de l'authentification NextAuth v5 avec RBAC (contrôle d'accès par rôles)
- Développement itératif par phases (une tâche → prompt → code → test → commit)
- Implémentation de l'espace Administrateur (gestion utilisateurs, classes, matières)
- Implémentation de l'espace Professeur (création de cours, assignations, suivi KPI)
- Implémentation de l'espace Élève (consultation, révisions, agenda, progression)
- Intégration du chat IA (Gemini 2.0 Flash) avec prompt stack et règles pédagogiques
- Gestion des KPI avec séparation des vues et confidentialité (conversations IA privées)
- Stabilisation de la démo et tests de bout en bout
- Bilan MVP (fonctionnalités finies, partielles, repoussées)

**Chapitre 6 — Fonctionnement de l'application**

Ce chapitre présente l'application finale en fonctionnement :
- Architecture technique globale (diagrammes)
- Parcours utilisateur détaillés pour chaque rôle
- Fonctionnement de l'assistant IA (RAG, contexte, streaming)
- Flux de données entre les modules
- Scénario de démonstration complet (du compte admin au quiz élève)

### CINQUIÈME PARTIE : ANALYSE ET PERSPECTIVES

**Chapitre 7 — Prospective : l'avenir du vibe coding**

Ce chapitre propose une analyse prospective :
- État actuel du vibe coding (outils disponibles, adoption, limites)
- Impact sur le métier de développeur (transformation des compétences)
- Évolution des compétences requises (prompt engineering, architecture)
- Implications pour l'éducation et la formation
- Enjeux éthiques et sociétaux (propriété intellectuelle, dépendance, environnement)
- Limites et risques (hallucinations, dette technique, perte de maîtrise)
- Vision prospective : le développement logiciel en 2030

**Chapitre 8 — Conclusion générale**

Le chapitre final propose une synthèse :
- Récapitulatif des travaux réalisés et objectifs atteints
- Apports personnels et compétences acquises (techniques, méthodologiques, transversales)
- Limites du projet et difficultés rencontrées (honnêteté académique)
- Perspectives d'amélioration de BlaizBot (court, moyen et long terme)
- Réflexion finale sur le vibe coding et son avenir

### ÉLÉMENTS COMPLÉMENTAIRES

**Annexes** : Captures d'écran, extraits de code commentés, schéma BDD complet (46 modèles), exemples de prompts, historique Git, fiches des agents IA, wireframe Markdown original.

**Glossaire** : 70+ termes techniques définis (API, LLM, MVP, Next.js, Prisma, RAG, vibe coding, etc.)

**Bibliographie** : Sources académiques, documentation technique, articles de blog, outils utilisés.

---

**Pages estimées** : 3-4 pages  
**Temps de lecture** : 6-8 minutes

---

**Pages estimées** : 3 pages  
**Temps de lecture** : 5 minutes
