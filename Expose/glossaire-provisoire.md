# Glossaire — Version provisoire

> Ce fichier compile les termes du glossaire chapitre par chapitre.  
> Une fois tous les chapitres traités, le contenu sera consolidé, dédupliqué et mis en forme dans le glossaire final.

---

## Légende des catégories

| Icône | Catégorie |
|-------|-----------|
| 🔤 | Anglicisme (terme anglais avec équivalent français) |
| 💻 | Terme technique / Concept informatique |
| 🛠️ | Outil / Application / Service |
| 📦 | Dépendance / Bibliothèque / Framework |
| 🤖 | Intelligence artificielle |
| 📐 | Méthodologie / Processus |

---

# Chapitre : 02-avant-propos.md

## Termes extraits

### 🤖 Intelligence artificielle

**Intelligence artificielle (IA)**  
*Anglais : Artificial Intelligence (AI)*  
Branche de l'informatique visant à créer des systèmes capables d'effectuer des tâches qui nécessitent normalement l'intelligence humaine : comprendre le langage naturel, apprendre, raisonner, résoudre des problèmes.

---

### 🔤 Anglicismes

**Vibe coding** *(anglicisme)*  
Littéralement « coder à l'intuition » ou « coder au feeling ». Nouvelle approche de programmation où le développeur décrit ce qu'il veut en langage naturel et laisse l'IA générer le code. Le terme a été popularisé par Andrej Karpathy (ex-directeur IA chez Tesla) en février 2025.  
📎 Aucun équivalent français officiel n'existe encore.

**Prompt** *(anglicisme)*  
*Français : Invite, consigne, requête*  
Instruction ou question donnée à un modèle d'IA pour obtenir une réponse ou une génération. La qualité du prompt influence directement la qualité du résultat.

**Prompt engineering** *(anglicisme)*  
*Français : Ingénierie de prompts, conception d'invites*  
Art et technique de formuler des instructions précises et efficaces pour obtenir les meilleurs résultats d'une IA générative.

**Wireframe** *(anglicisme)*  
*Français : Maquette fil de fer, maquette fonctionnelle*  
Représentation schématique d'une interface utilisateur, montrant la structure et les fonctionnalités sans le design graphique final. Utilisé en phase de conception pour valider l'ergonomie avant le développement.

**MVP (Minimum Viable Product)** *(anglicisme)*  
*Français : Produit minimum viable*  
Version d'un produit avec juste assez de fonctionnalités pour être utilisable par les premiers utilisateurs et permettre de valider les hypothèses de base.

**Brainstorming** *(anglicisme)*  
*Français : Remue-méninges*  
Technique de créativité en groupe visant à produire un maximum d'idées sur un sujet donné, sans jugement initial.

**Markdown** *(nom propre)*  
Langage de balisage léger permettant de formater du texte avec une syntaxe simple (titres, listes, liens, code). Créé par John Gruber en 2004. Très utilisé pour la documentation technique et les fichiers README.  
📎 Documentation : [https://daringfireball.net/projects/markdown/](https://daringfireball.net/projects/markdown/)

**Bug** *(anglicisme)*  
*Français : Bogue (terme officiel au Canada)*  
Erreur ou défaut dans un programme informatique provoquant un comportement inattendu ou incorrect.

**Commit** *(anglicisme)*  
*Français : Validation, enregistrement*  
Dans Git, un commit représente un instantané des modifications du code à un moment donné, accompagné d'un message descriptif. Permet de tracer l'historique des changements.

---

### 🛠️ Outils et applications

**ChatGPT**  
Assistant conversationnel développé par OpenAI, basé sur les modèles GPT (Generative Pre-trained Transformer). Capable de comprendre et générer du texte en langage naturel.  
🏢 Éditeur : OpenAI  
📎 Site : [https://chat.openai.com](https://chat.openai.com)  
📎 Documentation API : [https://platform.openai.com/docs](https://platform.openai.com/docs)

**Claude**  
Assistant IA développé par Anthropic, conçu avec une approche « Constitutional AI » visant à le rendre plus sûr et plus aligné avec les valeurs humaines. Disponible en plusieurs versions (Sonnet, Opus, Haiku).  
🏢 Éditeur : Anthropic  
📎 Site : [https://claude.ai](https://claude.ai)  
📎 Documentation API : [https://docs.anthropic.com](https://docs.anthropic.com)

**Gemini**  
Famille de modèles d'IA multimodaux développés par Google DeepMind. Capable de traiter texte, images, audio et code. Successeur de PaLM et Bard.  
🏢 Éditeur : Google DeepMind  
📎 Site : [https://gemini.google.com](https://gemini.google.com)  
📎 Documentation API : [https://ai.google.dev/docs](https://ai.google.dev/docs)

**Visual Studio Code (VS Code)**  
Éditeur de code source gratuit et open source développé par Microsoft. Extensible via des extensions, il intègre Git, le débogage, la coloration syntaxique et l'autocomplétion.  
🏢 Éditeur : Microsoft  
📎 Site : [https://code.visualstudio.com](https://code.visualstudio.com)  
📎 Documentation : [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)

**GitHub Copilot**  
Assistant de programmation IA intégré aux éditeurs de code (VS Code, JetBrains, etc.). Suggère du code en temps réel basé sur le contexte. Utilise des modèles d'OpenAI et Anthropic.  
🏢 Éditeur : GitHub (Microsoft)  
📎 Site : [https://github.com/features/copilot](https://github.com/features/copilot)  
📎 Documentation : [https://docs.github.com/copilot](https://docs.github.com/copilot)

**Microsoft Word**  
Logiciel de traitement de texte de la suite Microsoft Office. Utilisé pour la mise en forme finale et l'export de documents.  
🏢 Éditeur : Microsoft  
📎 Site : [https://www.microsoft.com/microsoft-365/word](https://www.microsoft.com/microsoft-365/word)

**GitHub**  
Plateforme d'hébergement de code utilisant Git pour le contrôle de version. Permet la collaboration, le suivi des issues, les pull requests et l'intégration continue.  
🏢 Éditeur : GitHub (Microsoft)  
📎 Site : [https://github.com](https://github.com)  
📎 Documentation : [https://docs.github.com](https://docs.github.com)

**Git**  
Système de contrôle de version distribué, créé par Linus Torvalds en 2005. Permet de suivre les modifications du code, de collaborer et de revenir à des versions antérieures.  
📎 Site : [https://git-scm.com](https://git-scm.com)  
📎 Documentation : [https://git-scm.com/doc](https://git-scm.com/doc)

---

### 📦 Technologies et frameworks

**Next.js**  
Framework React pour le développement d'applications web. Offre le rendu côté serveur (SSR), la génération statique (SSG), le routage automatique et l'optimisation des performances.  
🏢 Éditeur : Vercel  
📎 Site : [https://nextjs.org](https://nextjs.org)  
📎 Documentation : [https://nextjs.org/docs](https://nextjs.org/docs)

**React**  
Bibliothèque JavaScript pour construire des interfaces utilisateur. Utilise un système de composants réutilisables et un DOM virtuel pour des performances optimales.  
🏢 Éditeur : Meta (Facebook)  
📎 Site : [https://react.dev](https://react.dev)  
📎 Documentation : [https://react.dev/learn](https://react.dev/learn)

**TypeScript**  
Sur-ensemble de JavaScript ajoutant le typage statique optionnel. Permet de détecter les erreurs à la compilation plutôt qu'à l'exécution.  
🏢 Éditeur : Microsoft  
📎 Site : [https://www.typescriptlang.org](https://www.typescriptlang.org)  
📎 Documentation : [https://www.typescriptlang.org/docs](https://www.typescriptlang.org/docs)

---

### 💻 Termes techniques

**Langage naturel**  
Langue parlée ou écrite par les humains (français, anglais, etc.), par opposition aux langages de programmation. Les modèles d'IA sont entraînés à comprendre et générer du langage naturel.

**Base de données**  
Système organisé de stockage et de gestion de données. Permet de stocker, rechercher et manipuler des informations de manière structurée.

**Interface utilisateur (UI)**  
*Anglais : User Interface*  
Ensemble des éléments visuels et interactifs permettant à un utilisateur d'interagir avec une application (boutons, menus, formulaires, etc.).

**Application web**  
Programme informatique accessible via un navigateur web, sans nécessiter d'installation locale. Fonctionne sur le modèle client-serveur.

**Chatbot**  
*Français : Agent conversationnel*  
Programme informatique simulant une conversation avec un utilisateur, généralement via du texte. Peut être basé sur des règles ou sur l'IA.

**Quiz**  
Questionnaire interactif permettant de tester des connaissances. Dans le contexte éducatif, utilisé pour l'évaluation et la révision.

---

### 📐 Méthodologie

**Travail de maturité**  
En Suisse, travail de recherche et rédaction réalisé par les élèves en fin de gymnase (équivalent du lycée). Permet de démontrer la capacité à mener un projet autonome sur un sujet choisi.

**Versionner / Versionnement**  
Action de sauvegarder différentes versions d'un fichier ou d'un projet au fil du temps, permettant de suivre l'évolution et de revenir à un état antérieur si nécessaire.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 9 |
| 🛠️ Outils/Applications | 9 |
| 📦 Technologies/Frameworks | 3 |
| 💻 Termes techniques | 6 |
| 📐 Méthodologie | 2 |
| **Total** | **29** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 04-introduction-generale.md

## Termes extraits

### 🤖 Intelligence artificielle

**LLM (Large Language Model)** *(anglicisme)*  
*Français : Grand modèle de langage*  
Modèle d'IA entraîné sur d'immenses quantités de texte pour comprendre et générer du langage naturel. Exemples : GPT-4, Claude, Gemini. Ces modèles sont à la base du vibe coding.

**GPT (Generative Pre-trained Transformer)**  
Architecture de réseau de neurones développée par OpenAI. « Generative » car il génère du texte, « Pre-trained » car pré-entraîné sur de vastes corpus, « Transformer » car basé sur l'architecture Transformer (attention mechanism).  
📎 Article fondateur : [Attention Is All You Need (2017)](https://arxiv.org/abs/1706.03762)

**Hallucination (IA)**  
Phénomène où un modèle d'IA génère des informations fausses, inventées ou incohérentes tout en les présentant avec assurance. Problème majeur du vibe coding nécessitant une validation humaine systématique.

**RAG (Retrieval-Augmented Generation)** *(anglicisme)*  
*Français : Génération augmentée par récupération*  
Technique combinant un modèle de langage avec une base de connaissances externe. Le système récupère d'abord des informations pertinentes, puis les utilise pour générer une réponse plus précise et factuelle.

**Streaming (IA)**  
Technique d'affichage progressif des réponses de l'IA, mot par mot ou token par token, plutôt que d'attendre la génération complète. Améliore l'expérience utilisateur en donnant un feedback immédiat.

---

### 🔤 Anglicismes

**Full-stack** *(anglicisme)*  
*Français : Pile complète, développement complet*  
Désigne un développement couvrant à la fois le frontend (interface utilisateur) et le backend (serveur, base de données, API). Un développeur full-stack maîtrise les deux aspects.

**Dette technique** *(calque de l'anglais « technical debt »)*  
Coût futur engendré par des choix de développement rapides ou simplifiés. Comme une dette financière, elle génère des "intérêts" : plus on attend pour la rembourser (refactoriser), plus le coût augmente.

**RBAC (Role-Based Access Control)** *(anglicisme)*  
*Français : Contrôle d'accès basé sur les rôles*  
Système de gestion des permissions où les droits d'accès sont attribués en fonction du rôle de l'utilisateur (Admin, Professeur, Élève) plutôt qu'individuellement.

**App Router** *(anglicisme)*  
Système de routage de Next.js 13+ basé sur le système de fichiers. Les dossiers dans `app/` définissent automatiquement les routes de l'application.

**Layout** *(anglicisme)*  
*Français : Mise en page, gabarit*  
Structure visuelle partagée entre plusieurs pages (en-tête, menu latéral, pied de page). Dans Next.js, fichier `layout.tsx` définissant l'enveloppe commune d'un groupe de pages.

**Frontend** *(anglicisme)*  
*Français : Interface cliente, partie visible*  
Partie d'une application visible et manipulée par l'utilisateur (interface graphique, interactions). S'exécute dans le navigateur.

**Backend** *(anglicisme)*  
*Français : Partie serveur, côté serveur*  
Partie d'une application qui s'exécute sur le serveur : logique métier, accès à la base de données, authentification, API.

**Stack technique** *(anglicisme)*  
*Français : Pile technologique*  
Ensemble des technologies, langages et outils utilisés pour développer une application. Exemple : Next.js + React + TypeScript + Prisma + PostgreSQL.

**Kickoff** *(anglicisme)*  
*Français : Lancement, démarrage*  
Réunion ou document de lancement d'un projet ou d'une phase. Dans le contexte du vibe coding, prompt initial détaillé pour démarrer une nouvelle étape de développement.

**Token** *(anglicisme)*  
Unité de base utilisée par les LLM pour traiter le texte. Un token peut être un mot, une partie de mot ou un caractère. La facturation des API d'IA est souvent basée sur le nombre de tokens.

---

### 🛠️ Outils et applications

**Vercel**  
Plateforme cloud de déploiement et d'hébergement spécialisée pour les applications frontend et Next.js. Offre le déploiement automatique depuis Git, les fonctions serverless et un CDN global.  
🏢 Éditeur : Vercel Inc.  
📎 Site : [https://vercel.com](https://vercel.com)  
📎 Documentation : [https://vercel.com/docs](https://vercel.com/docs)

**Plateforme X (anciennement Twitter)**  
Réseau social de microblogging où Andrej Karpathy a popularisé le terme "vibe coding" en février 2025.  
📎 Site : [https://x.com](https://x.com)

**ESLint**  
Outil d'analyse statique de code JavaScript/TypeScript. Détecte les erreurs, les mauvaises pratiques et applique des règles de style de code.  
📎 Site : [https://eslint.org](https://eslint.org)  
📎 Documentation : [https://eslint.org/docs](https://eslint.org/docs)

**Prettier**  
Formateur de code automatique. Applique un style de formatage cohérent (indentation, guillemets, points-virgules) à travers tout le projet.  
📎 Site : [https://prettier.io](https://prettier.io)  
📎 Documentation : [https://prettier.io/docs](https://prettier.io/docs)

---

### 📦 Technologies et frameworks

**Prisma**  
ORM (Object-Relational Mapping) moderne pour Node.js et TypeScript. Permet de définir le schéma de base de données en code, génère un client typé et gère les migrations.  
🏢 Éditeur : Prisma Data Inc.  
📎 Site : [https://www.prisma.io](https://www.prisma.io)  
📎 Documentation : [https://www.prisma.io/docs](https://www.prisma.io/docs)

**PostgreSQL**  
Système de gestion de base de données relationnelle open source. Réputé pour sa robustesse, sa conformité SQL et ses fonctionnalités avancées (JSON, recherche full-text).  
📎 Site : [https://www.postgresql.org](https://www.postgresql.org)  
📎 Documentation : [https://www.postgresql.org/docs](https://www.postgresql.org/docs)

**Tailwind CSS**  
Framework CSS utilitaire. Au lieu de classes sémantiques (`.btn-primary`), utilise des classes utilitaires (`bg-blue-500 px-4 py-2`). Permet un développement rapide sans quitter le HTML.  
🏢 Éditeur : Tailwind Labs  
📎 Site : [https://tailwindcss.com](https://tailwindcss.com)  
📎 Documentation : [https://tailwindcss.com/docs](https://tailwindcss.com/docs)

**NextAuth.js (Auth.js)**  
Bibliothèque d'authentification pour Next.js. Gère la connexion (OAuth, credentials), les sessions, les JWT et les rôles utilisateurs. Version 5 renommée Auth.js.  
📎 Site : [https://authjs.dev](https://authjs.dev)  
📎 Documentation : [https://authjs.dev/getting-started](https://authjs.dev/getting-started)

**shadcn/ui**  
Collection de composants UI réutilisables pour React, basés sur Radix UI et stylés avec Tailwind CSS. Particularité : les composants sont copiés dans le projet (pas de dépendance npm).  
📎 Site : [https://ui.shadcn.com](https://ui.shadcn.com)  
📎 Documentation : [https://ui.shadcn.com/docs](https://ui.shadcn.com/docs)

**Radix UI**  
Bibliothèque de primitives UI accessibles et non stylées pour React. Fournit les comportements (modales, menus, tooltips) sans imposer de design.  
📎 Site : [https://www.radix-ui.com](https://www.radix-ui.com)  
📎 Documentation : [https://www.radix-ui.com/docs](https://www.radix-ui.com/docs)

---

### 💻 Termes techniques

**API (Application Programming Interface)** *(anglicisme)*  
*Français : Interface de programmation*  
Ensemble de règles et protocoles permettant à des logiciels de communiquer entre eux. Une API web expose des endpoints (URLs) pour effectuer des opérations (créer, lire, modifier, supprimer).

**ORM (Object-Relational Mapping)** *(anglicisme)*  
*Français : Mapping objet-relationnel*  
Technique permettant de manipuler une base de données relationnelle comme des objets dans le code. Exemple : Prisma transforme les tables SQL en classes TypeScript.

**Migration (base de données)**  
Script décrivant une modification du schéma de base de données (ajout de table, modification de colonne). Permet de versionner et reproduire l'évolution de la structure de données.

**Route (web)**  
URL ou chemin d'accès à une ressource ou une page dans une application web. Exemple : `/dashboard/student/courses` est une route vers la page des cours de l'élève.

**Composant (React)**  
Bloc de code réutilisable encapsulant une partie de l'interface utilisateur. Peut recevoir des propriétés (props) et maintenir un état interne. Exemples : bouton, carte, formulaire.

**Déploiement**  
*Anglais : Deployment*  
Action de publier une application sur un serveur ou une plateforme cloud pour la rendre accessible aux utilisateurs. Peut être manuel ou automatisé (CI/CD).

**CDN (Content Delivery Network)** *(anglicisme)*  
*Français : Réseau de diffusion de contenu*  
Réseau de serveurs distribués géographiquement pour servir le contenu (images, scripts, pages) depuis le serveur le plus proche de l'utilisateur, réduisant la latence.

**Serverless** *(anglicisme)*  
*Français : Sans serveur (impropre), Fonctions à la demande*  
Architecture où le code s'exécute dans des fonctions éphémères gérées par le cloud, sans gérer de serveur. Le fournisseur (Vercel, AWS) s'occupe de l'infrastructure.

**Fichier .env**  
Fichier de configuration contenant les variables d'environnement (clés API, URLs de base de données). Ne doit JAMAIS être commité dans Git (secrets).  
📎 Convention : `.env.local` pour le développement, `.env.example` pour documenter les variables requises.

---

### 👤 Personnalités

**Andrej Karpathy**  
Chercheur en IA et entrepreneur. Ex-directeur de l'IA chez Tesla (Autopilot), co-fondateur d'OpenAI. A popularisé le terme "vibe coding" via un post sur X en février 2025, décrivant sa façon de coder avec l'IA.  
📎 Profil X : [@karpathy](https://x.com/karpathy)

---

### 📐 Méthodologie

**Itération**  
Cycle répété d'un processus. En développement agile et vibe coding, chaque itération produit une version améliorée : Intention → Code IA → Test → Correction → Nouvelle intention.

**Boucle de feedback**  
*Anglais : Feedback loop*  
Processus cyclique où le résultat d'une action influence l'action suivante. En vibe coding : le développeur teste le code généré, identifie les problèmes, et reformule son prompt.

**CI/CD (Continuous Integration / Continuous Deployment)** *(anglicisme)*  
*Français : Intégration continue / Déploiement continu*  
Pratiques automatisant les tests (CI) et le déploiement (CD) à chaque commit. Exemple : chaque push sur GitHub déclenche automatiquement les tests et le déploiement sur Vercel.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🤖 IA | 5 |
| 🔤 Anglicismes | 11 |
| 🛠️ Outils/Applications | 4 |
| 📦 Technologies/Frameworks | 6 |
| 💻 Termes techniques | 9 |
| 👤 Personnalités | 1 |
| 📐 Méthodologie | 3 |
| **Total** | **39** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 05-chapitre-1.md (Le Vibe Coding)

> ⚠️ Ce chapitre approfondit des concepts déjà introduits. Seuls les **nouveaux termes** ou **précisions supplémentaires** sont listés ici.

## Termes extraits

### 🤖 Intelligence artificielle

**IA générative**  
*Anglais : Generative AI*  
Catégorie d'intelligence artificielle capable de créer du contenu nouveau (texte, code, images, musique) à partir d'instructions. Les LLM comme GPT, Claude et Gemini sont des IA génératives spécialisées dans le texte et le code.

**Système de prédiction (LLM)**  
Fonctionnement fondamental des modèles de langage : ils anticipent les mots ou tokens les plus probables pour répondre à une demande. Ce n'est pas une "compréhension" au sens humain, mais une prédiction statistique basée sur les patterns appris lors de l'entraînement.

---

### 🔤 Anglicismes

**Développement assisté par IA** *(calque)*  
*Anglais : AI-assisted development*  
Approche où l'IA aide le développeur sans le remplacer : suggestions de code, corrections automatiques, génération de boilerplate. Le vibe coding est une forme poussée de développement assisté.

**Refactoring / Refactorisation** *(anglicisme)*  
*Français : Remaniement, restructuration*  
Action de réorganiser le code existant pour le rendre plus lisible, maintenable ou performant, sans changer son comportement externe. L'IA peut proposer des refactorisations automatiques.

**Boilerplate** *(anglicisme)*  
*Français : Code standard, code répétitif*  
Code générique et répétitif nécessaire au fonctionnement mais n'apportant pas de valeur métier directe. Exemples : configuration, imports, structure de base d'un composant. L'IA excelle à générer ce type de code.

**Dev / Développeur** *(abréviation anglaise)*  
Abréviation courante de "developer" (développeur) dans le jargon informatique. "Communauté dev" = communauté des développeurs.

---

### 💻 Termes techniques

**Prototype**  
Version préliminaire d'une application permettant de tester et valider les concepts avant le développement complet. Un prototype peut être fonctionnel (code) ou visuel (maquette). Le vibe coding permet de créer des prototypes rapidement.

**Bibliothèque (informatique)**  
*Anglais : Library*  
Collection de fonctions et de code préécrit réutilisable dans un projet. Exemple : React est une bibliothèque UI. Les hallucinations de l'IA peuvent inventer des bibliothèques inexistantes.

**Lisibilité du code**  
*Anglais : Code readability*  
Qualité d'un code facilement compréhensible par un humain. Un code lisible utilise des noms explicites, une structure claire et des commentaires pertinents. L'IA peut améliorer la lisibilité en réorganisant le code.

**Maintenabilité**  
*Anglais : Maintainability*  
Facilité avec laquelle un code peut être modifié, corrigé ou étendu dans le futur. Un code maintenable est bien structuré, documenté et respecte les conventions. La dette technique réduit la maintenabilité.

**Exécuter / Exécution**  
Action de faire tourner un programme pour qu'il effectue ses instructions. En vibe coding, chaque modification doit être exécutée et testée immédiatement pour vérifier son bon fonctionnement.

---

### 📐 Méthodologie

**Partenariat humain-IA**  
Concept central du vibe coding : l'IA et le développeur travaillent ensemble, chacun apportant ses forces. L'IA génère et propose, l'humain guide, valide et décide. Ni l'un ni l'autre ne peut produire un résultat optimal seul.

**Esprit critique (en programmation)**  
Capacité à questionner et vérifier les propositions de l'IA plutôt que de les accepter aveuglément. Compétence essentielle du vibe coding car l'IA peut se tromper avec assurance.

**Validation humaine**  
Étape indispensable du vibe coding où le développeur vérifie que le code généré par l'IA fonctionne correctement, respecte les spécifications et ne contient pas d'erreurs ou d'incohérences.

**Programmation traditionnelle**  
Approche classique où le développeur écrit manuellement chaque ligne de code, par opposition au vibe coding où l'IA génère une partie du code. Reste nécessaire pour comprendre et corriger les propositions de l'IA.

**Traçabilité**  
*Anglais : Traceability*  
Capacité à suivre l'historique des modifications et des décisions. En vibe coding : conserver une trace des échanges avec l'IA, des versions du code et des raisons des choix techniques.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🤖 IA | 2 |
| 🔤 Anglicismes | 4 |
| 💻 Termes techniques | 5 |
| 📐 Méthodologie | 5 |
| **Total** | **16** |

> 📝 Note : Ce chapitre étant théorique et reprenant beaucoup de concepts déjà définis, le nombre de nouveaux termes est volontairement réduit pour éviter les doublons.

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 06-chapitre-2.md (Blaiz'Bot : contexte du projet)

> ⚠️ Ce chapitre présente le projet BlaizBot. Seuls les **nouveaux termes** non définis précédemment sont listés.

## Termes extraits

### 🔤 Anglicismes

**KPI (Key Performance Indicator)** *(anglicisme)*  
*Français : Indicateur clé de performance*  
Mesure quantifiable permettant d'évaluer la performance ou la progression vers un objectif. Dans BlaizBot : taux de réussite aux quiz, temps de révision, score IA, nombre de sessions, etc. Permet à l'élève et au professeur de suivre l'évolution sans se limiter aux notes.

**LMS (Learning Management System)** *(anglicisme)*  
*Français : Système de gestion de l'apprentissage*  
Plateforme logicielle complète pour gérer la formation en ligne : création de cours, évaluations, suivi des apprenants, forums, etc. Exemples : Moodle, Canvas, Blackboard. BlaizBot n'est PAS un LMS complet, c'est un prototype ciblé sur la révision assistée par IA.

**Score IA**  
Indicateur calculé à partir des interactions de l'élève avec l'assistant IA : qualité des questions posées, compréhension démontrée, progression dans les révisions. Visible par le professeur sans accès au contenu des conversations.

**Session (utilisateur)**  
*Anglais : Session*  
Période d'activité d'un utilisateur connecté à l'application. Dans BlaizBot, le nombre de sessions de révision est un KPI permettant de mesurer l'engagement de l'élève.

---

### 🛠️ Outils et applications

**Moodle**  
Plateforme LMS open source très répandue dans l'éducation. Permet de créer des cours en ligne, des quiz, des forums et de suivre la progression des apprenants. Mentionné comme exemple de ce que BlaizBot n'est PAS (trop complexe pour un MVP).  
📎 Site : [https://moodle.org](https://moodle.org)  
📎 Documentation : [https://docs.moodle.org](https://docs.moodle.org)

---

### 💻 Termes techniques

**Interface (application)**  
Écran ou ensemble d'écrans destiné à un type d'utilisateur spécifique. BlaizBot possède trois interfaces distinctes : Administrateur, Professeur et Élève. Chaque interface expose des fonctionnalités adaptées au rôle.

**Rôle (utilisateur)**  
Catégorie définissant les permissions et l'interface d'un utilisateur dans l'application. BlaizBot définit quatre rôles : ADMIN, TEACHER, STUDENT, PARENT (ce dernier non implémenté dans le MVP).

**Logique métier**  
*Anglais : Business logic*  
Ensemble des règles et processus qui définissent le fonctionnement de l'application selon le domaine concerné. Dans BlaizBot : règles de création de cours, calcul de progression, gestion des assignations, comportement du chat IA.

**Données agrégées**  
*Anglais : Aggregated data*  
Informations regroupées et résumées (moyennes, totaux, tendances) plutôt que détails individuels. Le professeur voit des KPI agrégés (score moyen, nombre de sessions) sans accéder au contenu exact des conversations IA.

**Confidentialité**  
*Anglais : Privacy*  
Protection des informations personnelles et sensibles. Dans BlaizBot, les conversations élève-IA restent privées : le professeur accède uniquement aux indicateurs agrégés, pas au contenu des échanges.

**Ressource (pédagogique)**  
Document ou contenu associé à un cours : fichiers PDF, liens, vidéos, images. Le professeur dépose des ressources que l'élève peut consulter pour réviser.

---

### 📐 Méthodologie

**Périmètre (projet)**  
*Anglais : Scope*  
Délimitation précise de ce qui est inclus et exclu d'un projet. Définir le périmètre évite le "scope creep" (dérive du périmètre) et permet de livrer un produit cohérent dans les délais.

**Scénario de test / démonstration**  
Séquence d'actions prédéfinie permettant de tester ou présenter une fonctionnalité de bout en bout. Exemple : "L'admin crée un prof → Le prof crée un cours → L'élève consulte et pose une question à l'IA".

**Terrain d'essai**  
Contexte ou projet utilisé pour expérimenter une méthode ou une technologie en conditions réelles. BlaizBot est le terrain d'essai du vibe coding pour ce travail de maturité.

**Conditions réelles**  
Situation où un prototype est testé avec de vraies interactions et contraintes, par opposition à un test théorique ou isolé. Le vibe coding est évalué "en conditions réelles" à travers le développement complet de BlaizBot.

---

### 🏫 Domaine éducatif

**Révision**  
Processus d'apprentissage consistant à revoir et consolider des connaissances déjà étudiées. L'objectif principal de BlaizBot est de faciliter la révision via un assistant IA personnalisé.

**Progression (pédagogique)**  
Évolution mesurable des compétences ou connaissances d'un apprenant au fil du temps. Dans BlaizBot, la progression est suivie via des KPI (quiz réussis, chapitres complétés, score IA).

**Assistant pédagogique**  
Outil (humain ou IA) aidant un apprenant dans son parcours éducatif. Dans BlaizBot, l'assistant pédagogique est un chatbot IA (Gemini) qui répond aux questions, donne des indices et guide les révisions sans fournir directement les réponses.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 4 |
| 🛠️ Outils/Applications | 1 |
| 💻 Termes techniques | 6 |
| 📐 Méthodologie | 4 |
| 🏫 Domaine éducatif | 3 |
| **Total** | **18** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 07-chapitre-3.md (Pré-projet : de l'idée au wireframe)

> ⚠️ Chapitre riche en méthodologie. Seuls les **nouveaux termes** non définis précédemment sont listés.

## Termes extraits

### 🔤 Anglicismes

**Prompt système** *(anglicisme)*  
*Anglais : System prompt*  
Instructions de base données à une IA au début d'une conversation ou d'un projet pour définir son comportement, son rôle et ses limites. Permet de cadrer l'assistance tout au long des échanges. Peut être ajusté au fil du temps.

**Pipeline** *(anglicisme)*  
*Français : Chaîne de traitement, flux de travail*  
Séquence d'étapes automatisées ou semi-automatisées pour transformer une entrée en sortie. Dans le projet : idée → code → test → commit → déploiement.

**Linter** *(anglicisme)*  
Outil d'analyse statique qui parcourt le code pour détecter des erreurs, des incohérences ou des mauvaises pratiques sans exécuter le programme. ESLint est un linter pour JavaScript/TypeScript.

**Mock / Mockées (données)** *(anglicisme)*  
*Français : Données simulées, données factices*  
Données fictives utilisées pendant le développement pour tester l'interface sans connexion à une vraie base de données ou API. Permet de travailler sur le frontend avant que le backend soit prêt.

**Fil de discussion** *(calque)*  
*Anglais : Thread*  
Dans ChatGPT et autres outils, conversation séparée sur un sujet spécifique. Permet d'organiser les échanges par thème (planification, bugs, documentation) sans mélanger les contextes.

**Base de connaissances** *(calque)*  
*Anglais : Knowledge base*  
Ensemble de documents, notes et références fournis à une IA pour enrichir son contexte. Dans ChatGPT Projects, permet d'uploader des fichiers que l'IA peut consulter.

**Livrable** *(calque de l'anglais « deliverable »)*  
Résultat concret d'une phase de projet, prêt à être utilisé ou transmis. Exemples de livrables : wireframe Markdown, inventaire UI, prompt de kickoff.

**Garde-fou** *(métaphore)*  
*Anglais : Guardrail*  
Règle ou contrainte mise en place pour éviter les dérives. En vibe coding : règles de qualité, limites données aux agents IA, validations humaines systématiques.

---

### 🛠️ Outils et applications

**GitHub Desktop**  
Application graphique pour utiliser Git sans ligne de commande. Permet de visualiser les changements, créer des commits, gérer les branches et synchroniser avec GitHub.  
🏢 Éditeur : GitHub (Microsoft)  
📎 Site : [https://desktop.github.com](https://desktop.github.com)

**Figma**  
Outil de design collaboratif en ligne pour créer des maquettes, prototypes et interfaces utilisateur. Mentionné comme alternative au wireframe Markdown (non utilisé dans ce projet).  
📎 Site : [https://www.figma.com](https://www.figma.com)  
📎 Documentation : [https://help.figma.com](https://help.figma.com)

**ChatGPT Projects**  
Fonctionnalité de ChatGPT permettant de créer des espaces de travail dédiés avec prompt système personnalisé, fils de discussion thématiques et base de connaissances uploadée.  
🏢 Éditeur : OpenAI  
📎 Accessible via : [https://chat.openai.com](https://chat.openai.com)

---

### 💻 Termes techniques

**Terminal (informatique)**  
Interface en ligne de commande permettant d'exécuter des instructions textuelles. Dans VS Code, le terminal intégré permet de lancer l'application, exécuter des scripts ou des commandes Git sans quitter l'éditeur.

**.gitignore**  
Fichier spécial de Git listant les fichiers et dossiers à exclure du versionnement. Typiquement : `.env` (secrets), `node_modules/` (dépendances), fichiers de build. Essentiel pour la sécurité et la propreté du dépôt.

**Dépôt (Git)**  
*Anglais : Repository (repo)*  
Espace de stockage contenant tous les fichiers d'un projet et leur historique de versions. Peut être local (sur l'ordinateur) ou distant (sur GitHub).

**Message de commit**  
Texte court décrivant les modifications enregistrées dans un commit. Doit être clair et explicite pour faciliter la compréhension de l'historique. Convention courante : `feat:`, `fix:`, `docs:`, etc.

**Squelette (projet)**  
*Anglais : Scaffold, boilerplate*  
Structure de base d'un projet générée automatiquement : dossiers, fichiers de configuration, pages initiales. Point de départ sur lequel on itère ensuite.

**Inventaire UI**  
Liste exhaustive des éléments d'interface à développer : pages, composants, boutons, formulaires, actions. Extrait du wireframe pour servir de checklist de développement.

**Cartographie (application)**  
Vue d'ensemble de la structure d'une application : pages, liens entre elles, fonctionnalités par section. Le wireframe est une forme de cartographie.

---

### 📐 Méthodologie

**Cadrage (projet)**  
Étape initiale définissant les objectifs, le périmètre et les contraintes d'un projet. Permet d'éviter de partir dans toutes les directions et de rester focalisé sur l'essentiel.

**Découpage en tâches**  
Action de diviser un travail complexe en sous-tâches simples et réalisables. Facilite l'estimation, le suivi et la délégation à l'IA (qui fonctionne mieux avec des demandes ciblées).

**TODO list**  
*Français : Liste de tâches*  
Document listant les actions à accomplir. La TODO v0 est la première version, initiale et simplifiée, servant de fil directeur.

**Agents IA spécialisés**  
Approche consistant à créer plusieurs "profils" d'IA avec des rôles distincts (Planification, Bug, Documentation, Code) plutôt qu'un assistant généraliste. Chaque agent a ses consignes et limites propres.

**Référentiel de rôles**  
Document décrivant les différents agents IA, leur mission, leurs limites et le format attendu de leurs réponses. Sert de "fiche d'identité" pour chaque assistant.

**Documentation vivante**  
Documentation qui évolue avec le projet, versionnée comme le code. Le wireframe Markdown est un exemple : il fait partie du dépôt Git et peut être mis à jour au fil du développement.

---

### 🏗️ Architecture et conception

**Stack technique**  
→ Déjà défini (chapitre 04). Ici utilisé dans le contexte du choix de l'architecture du projet.

**Architecture technique**  
Organisation globale d'un système informatique : choix des technologies, structure des dossiers, séparation frontend/backend, flux de données. Décidée avant le développement pour assurer la cohérence.

**Routes (navigation)**  
Chemins définissant la structure de l'application et la navigation entre les pages. Dans Next.js, les routes sont créées automatiquement à partir de la structure des dossiers.

**Composant commun**  
Élément d'interface réutilisable dans plusieurs pages : barre de navigation, pied de page, boutons standardisés. Réduit la duplication et facilite la maintenance.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 8 |
| 🛠️ Outils/Applications | 3 |
| 💻 Termes techniques | 7 |
| 📐 Méthodologie | 6 |
| 🏗️ Architecture | 3 |
| **Total** | **27** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 08-chapitre-4.md (Wireframe codé et verrouillage du plan)

> ⚠️ Ce chapitre approfondit des concepts déjà introduits (wireframe, composants, itérations). Seuls les **nouveaux termes** ou **précisions supplémentaires** sont listés ici.

## Termes extraits

### 🔤 Anglicismes

**Kickoff** *(anglicisme)*  
→ Déjà défini (chapitre 04). Ici : prompt de lancement très détaillé pour démarrer une phase de développement, regroupant objectifs, stack, règles et feuille de route.

**Design system** *(anglicisme)*  
*Français : Système de design, charte graphique fonctionnelle*  
Ensemble de règles de conception unifiées : palette de couleurs, typographie, espacements, composants UI standardisés. Garantit la cohérence visuelle sur toute l'application.

**Layout** *(anglicisme)*  
→ Déjà défini (chapitre 04). Ici précisé : structure commune (sidebar + header + zone centrale) partagée par toutes les pages après connexion.

**Header** *(anglicisme)*  
*Français : En-tête*  
Barre supérieure d'une page web contenant généralement le titre de la page, le menu utilisateur et des actions contextuelles.

**Sidebar** *(anglicisme)*  
*Français : Barre latérale, menu latéral*  
Zone de navigation verticale située sur le côté de l'écran, contenant les liens vers les différentes sections de l'application.

**Mock data** *(anglicisme)*  
*Français : Données simulées, données factices*  
Jeu de données de test créé manuellement pour simuler le fonctionnement d'une application avant la connexion à une vraie base de données. Permet de tester l'affichage et l'ergonomie.

**Placeholder** *(anglicisme)*  
*Français : Espace réservé, contenu provisoire*  
Élément temporaire (texte, image, composant) inséré pour marquer l'emplacement futur d'un contenu réel. Utilisé pendant le prototypage.

**Backlog** *(anglicisme)*  
*Français : Carnet de commandes, liste de fonctionnalités*  
Liste ordonnée et priorisée des tâches ou fonctionnalités à développer. En méthodologie agile, le backlog évolue au fil du projet.

**Gabarit** *(calque de l'anglais « template »)*  
Modèle réutilisable servant de base pour créer des éléments similaires. Exemples : gabarit de prompt, gabarit de composant, gabarit de page.

**UX (User Experience)** *(anglicisme)*  
*Français : Expérience utilisateur*  
Qualité de l'expérience vécue par un utilisateur lors de l'interaction avec un produit. Inclut l'ergonomie, la facilité d'utilisation et la satisfaction globale.

**CRUD** *(anglicisme)*  
Acronyme de Create, Read, Update, Delete (Créer, Lire, Mettre à jour, Supprimer). Désigne les quatre opérations de base sur les données d'une application.

---

### 🛠️ Outils et applications

**Figma**  
Outil de design d'interface collaboratif en ligne. Permet de créer des maquettes graphiques (mockups), des prototypes interactifs et des design systems partagés.  
🏢 Éditeur : Figma Inc. (Adobe)  
📎 Site : [https://www.figma.com](https://www.figma.com)  
📎 Documentation : [https://help.figma.com](https://help.figma.com)

---

### 📦 Technologies et frameworks

**JSON (JavaScript Object Notation)**  
Format d'échange de données léger et lisible, basé sur la syntaxe JavaScript. Très utilisé pour les API REST et les fichiers de configuration.  
📎 Spécification : [https://www.json.org](https://www.json.org)

**CSS (Cascading Style Sheets)**  
*Français : Feuilles de style en cascade*  
Langage de description utilisé pour définir la présentation visuelle des pages web (couleurs, polices, marges, disposition).  
📎 Documentation : [https://developer.mozilla.org/fr/docs/Web/CSS](https://developer.mozilla.org/fr/docs/Web/CSS)

---

### 💻 Termes techniques

**Prototype interactif**  
Maquette cliquable simulant le comportement de l'application finale. Permet de tester la navigation et l'ergonomie avant le développement complet.

**Composants configurables**  
Composants React conçus pour s'adapter à différents contextes via des paramètres (props). Exemple : un composant `DataTable` configurable pour afficher des utilisateurs, des classes ou des cours.

**KPI (Key Performance Indicator)** *(anglicisme)*  
*Français : Indicateur clé de performance*  
Mesure quantifiable permettant d'évaluer l'atteinte d'objectifs. Dans BlaizBot : nombre d'élèves actifs, taux de complétion, scores moyens.

**Session de travail**  
Période dédiée à une tâche spécifique, généralement d'une durée limitée. En vibe coding, chaque session suit le cycle : intention → génération → test → correction.

**Recette interne**  
*Anglais : Internal testing*  
Phase de test réalisée par le développeur lui-même avant de soumettre le produit à des utilisateurs externes. Permet de détecter les bugs évidents et les problèmes d'ergonomie.

**Notification (toast)**  
*Anglais : Toast notification*  
Message court et temporaire affiché à l'écran pour informer l'utilisateur d'une action (succès, erreur, information). Non bloquant, il disparaît automatiquement.

**État actif (navigation)**  
Indication visuelle montrant quelle page ou section est actuellement sélectionnée dans un menu de navigation. Exemple : onglet surligné dans la sidebar.

**Formulaire (réinitialisation)**  
Remise à zéro des champs d'un formulaire après soumission, permettant de saisir une nouvelle entrée sans données résiduelles.

---

### 📐 Méthodologie

**Comparatif**  
Analyse mettant en parallèle deux approches ou versions pour évaluer leurs avantages et inconvénients respectifs. Ici : wireframe Markdown vs wireframe codé.

**Découpage par modules fonctionnels**  
Organisation du projet en blocs indépendants correspondant à des fonctionnalités distinctes (Admin, Professeur, Élève, IA). Facilite le développement incrémental et les tests.

**Critères de fin (exit criteria)**  
Conditions précises à remplir pour considérer une phase ou une tâche comme terminée. Permettent de savoir quand passer à l'étape suivante.

**Dépendances (tâches)**  
Relations entre tâches indiquant qu'une tâche ne peut démarrer qu'après la complétion d'une autre. Exemple : le dashboard nécessite des données déjà exploitables.

**Prompt-type / Gabarit de prompt**  
Modèle standardisé de prompt réutilisable selon le type de tâche (création de composant, refactorisation, correction de bug). Améliore la cohérence des résultats de l'IA.

**Agent orchestrateur**  
Agent IA dont le rôle est de découper une tâche complexe en étapes, définir un plan d'action et coordonner le travail entre les différents agents spécialisés.

**Agent standards**  
Agent IA dédié à la vérification de la qualité du code : respect des conventions, absence de secrets, structure correcte. Joue le rôle de garde-fou.

---

### 🏗️ Architecture et conception

**Squelette (scaffold)**  
Structure de base d'un projet ou d'une application générée automatiquement, fournissant les dossiers, fichiers et configurations initiales.

**Arborescence du projet**  
Organisation hiérarchique des dossiers et fichiers d'un projet. Une bonne arborescence facilite la navigation et la maintenance du code.

**Endpoint API**  
Point d'accès d'une API correspondant à une URL spécifique et une opération (GET, POST, PUT, DELETE). Exemple : `POST /api/users` pour créer un utilisateur.

**Verrouillage du plan**  
Décision de figer l'architecture et la feuille de route après validation, pour éviter les remises en question permanentes et permettre un développement stable.

---

### 🎓 Termes éducatifs (BlaizBot)

**Dashboard élève**  
Tableau de bord personnel affichant la progression, les objectifs et l'accès rapide aux cours, révisions et assistant IA.

**Dashboard professeur**  
Interface de suivi orientée classe, avec indicateurs (KPI) sur les élèves, alertes (difficultés, devoirs non rendus) et accès à la gestion des cours.

**Dashboard administrateur**  
Vue globale de la plateforme : statistiques système, gestion des utilisateurs, classes et paramètres généraux.

**Assignation**  
Action d'attribuer un cours, un devoir ou un quiz à un élève ou une classe, éventuellement avec une date limite.

**Parcours utilisateur**  
Séquence d'écrans et d'actions qu'un utilisateur suit pour accomplir un objectif (de la connexion à la réalisation d'un quiz). Sert à valider l'ergonomie et la cohérence.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 11 |
| 🛠️ Outils/Applications | 1 |
| 📦 Technologies/Frameworks | 2 |
| 💻 Termes techniques | 8 |
| 📐 Méthodologie | 7 |
| 🏗️ Architecture | 4 |
| 🎓 Termes éducatifs | 5 |
| **Total** | **38** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 09-chapitre-5.md (Développement de l'application)

> ⚠️ Ce chapitre décrit l'implémentation technique du MVP. Seuls les **nouveaux termes** non définis précédemment sont listés.

## Termes extraits

### 🔤 Anglicismes

**Middleware** *(anglicisme)*  
*Français : Intergiciel, logiciel intermédiaire*  
Code qui s'exécute entre la requête de l'utilisateur et la réponse du serveur. Dans Next.js, le middleware (`src/middleware.ts`) vérifie l'authentification et applique les règles RBAC avant d'accéder aux pages.

**JWT (JSON Web Token)** *(anglicisme)*  
Standard ouvert pour créer des jetons d'authentification sécurisés. Le token contient des informations encodées (identité, rôle) et est signé cryptographiquement. Stocké dans un cookie, il permet de maintenir la session.  
📎 Spécification : [https://jwt.io](https://jwt.io)

**Cookie** *(anglicisme)*  
Petit fichier texte stocké par le navigateur, utilisé pour conserver des informations entre les requêtes (session, préférences). Dans BlaizBot, le cookie de session contient le JWT d'authentification.

**Hachage (mot de passe)** *(calque de l'anglais « hashing »)*  
Transformation cryptographique irréversible d'un mot de passe en une chaîne de caractères fixe. Permet de stocker les mots de passe de manière sécurisée : on compare les hachages, jamais les mots de passe en clair.

**Agile** *(anglicisme)*  
*Français : Méthode agile*  
Ensemble de méthodologies de développement favorisant l'itération, la collaboration et l'adaptation au changement. Le vibe coding s'inscrit naturellement dans une approche agile par ses cycles courts.

**Seed (base de données)** *(anglicisme)*  
*Français : Données d'amorçage, jeu de données initial*  
Script ou processus qui remplit la base de données avec des données de test ou de démonstration. Permet de travailler avec un environnement réaliste dès le développement.

**Brouillon (isDraft)** *(traduction de « draft »)*  
État d'un contenu (cours, article) non encore publié. Le professeur peut préparer un cours en mode brouillon avant de le rendre visible aux élèves.

**Responsive / Responsivité** *(anglicisme)*  
*Français : Adaptatif, conception adaptative*  
Capacité d'une interface à s'adapter automatiquement à différentes tailles d'écran (ordinateur, tablette, mobile). Grâce à Tailwind CSS, BlaizBot ajuste son affichage selon le support.

**Asynchrone** *(calque de l'anglais « asynchronous »)*  
Mode d'exécution où les opérations ne bloquent pas le programme en attendant leur résultat. Les appels API et les requêtes IA sont asynchrones pour ne pas figer l'interface.

**Indicateur de chargement** *(anglais : Loading indicator)*  
Élément visuel (spinner, barre de progression) indiquant qu'une opération est en cours. Améliore l'expérience utilisateur en signalant que l'application n'est pas bloquée.

---

### 🛠️ Outils et applications

**Neon**  
Service de base de données PostgreSQL serverless, compatible avec Vercel. Offre une mise à l'échelle automatique et une latence réduite pour les applications cloud.  
📎 Site : [https://neon.tech](https://neon.tech)  
📎 Documentation : [https://neon.tech/docs](https://neon.tech/docs)

---

### 📦 Technologies et frameworks

**Gemini 2.0 Flash**  
Version optimisée du modèle Gemini de Google, conçue pour la rapidité. Supporte le multimodal (texte, image, audio, vidéo) et le streaming en temps réel. Utilisé dans BlaizBot pour le chat pédagogique.  
🏢 Éditeur : Google DeepMind  
📎 Documentation : [https://ai.google.dev/gemini-api](https://ai.google.dev/gemini-api)

---

### 💻 Termes techniques

**Modèle de données**  
Représentation abstraite de la structure des données d'une application : entités, attributs et relations. Dans Prisma, le modèle est défini dans `schema.prisma` et génère 46 tables pour BlaizBot.

**Table (base de données)**  
Structure de stockage organisant les données en lignes (enregistrements) et colonnes (champs). Exemple : table `User` avec colonnes `id`, `email`, `role`, `passwordHash`.

**Relation 1:1 (one-to-one)**  
Association entre deux entités où chaque enregistrement d'une table correspond à exactement un enregistrement d'une autre. Exemple : `User` ↔ `StudentProfile`.

**Structure hiérarchique**  
Organisation en niveaux imbriqués. Dans BlaizBot : Cours → Chapitres → Sections → Cartes. Permet une navigation structurée du contenu pédagogique.

**Carte pédagogique**  
Unité de contenu dans BlaizBot. 5 types : Note (texte libre), Leçon (contenu structuré), Vidéo (lien média), Exercice (question ouverte), Quiz (QCM avec correction automatique).

**QCM (Questionnaire à Choix Multiples)**  
Type d'exercice où l'élève choisit parmi plusieurs réponses proposées. Permet une correction automatique immédiate.

**Correction automatique**  
Évaluation instantanée des réponses de l'élève par comparaison avec les réponses attendues. Possible pour les QCM et certains formats structurés.

**Prompt stack**  
Empilement structuré de prompts envoyés au modèle IA : (1) prompt système de base, (2) contexte RAG du cours, (3) prompt personnalisé de l'élève, (4) historique de conversation. Permet des réponses contextualisées.

**Mode streaming**  
Affichage progressif des réponses de l'IA, mot par mot, au fur et à mesure de la génération. Rend l'échange plus naturel et réduit l'attente perçue.

**Requête agrégée**  
Requête de base de données calculant des statistiques (moyennes, comptages, sommes) plutôt que retournant des données individuelles. Utilisée pour les KPI des dashboards.

**Taux de complétion**  
Pourcentage de contenu terminé par rapport au total. Dans BlaizBot : chapitres complétés / total chapitres d'un cours.

**Taux de réussite**  
Pourcentage de réponses correctes sur un exercice ou ensemble d'exercices. Indicateur de performance pédagogique.

---

### 📐 Méthodologie

**Développement par phases**  
Organisation du travail en étapes successives et logiques : Auth → Admin → Professeur → Élève → IA → Stabilisation. Chaque phase a des objectifs et critères de fin définis.

**Boucle TODO → prompt → code → test → commit**  
Cycle de travail répété pour chaque tâche : identifier la tâche, formuler le prompt, intégrer le code généré, tester immédiatement, valider par un commit. Cœur de la méthode vibe coding.

**Test en conditions réelles**  
Validation d'une fonctionnalité en l'utilisant comme un vrai utilisateur, avec des données et scénarios réalistes. Plus fiable que les tests unitaires isolés pour détecter les problèmes d'ergonomie.

**Refactoring léger**  
Réorganisation minimale du code pour améliorer la lisibilité sans modifier le comportement. Découpage de composants volumineux, suppression de code redondant.

**Scénario de bout en bout (E2E)**  
*Anglais : End-to-end scenario*  
Test couvrant un parcours utilisateur complet, de l'action initiale au résultat final. Exemple : création de cours → assignation → réalisation par l'élève → consultation des résultats.

---

### 🏗️ Architecture et conception

**Route API**  
Chemin d'accès exposant une fonctionnalité backend. Dans Next.js : `/api/teacher/courses` pour les opérations sur les cours, `/api/ai/chat` pour le chat IA.

**Route protégée**  
Page ou API accessible uniquement aux utilisateurs authentifiés avec le bon rôle. Le middleware vérifie le JWT et applique les règles RBAC.

**Redirection automatique**  
Navigation vers une page spécifique déclenchée par le système. Après connexion, l'utilisateur est redirigé vers le dashboard correspondant à son rôle.

**Séparation des vues**  
Architecture où chaque rôle a son propre espace avec ses propres données filtrées. Un professeur ne voit pas les mêmes informations qu'un élève ou un admin.

**Filtrage par session**  
Restriction des données accessibles en fonction de l'utilisateur connecté. Le backend vérifie le rôle et l'identité avant de retourner les données autorisées.

---

### 🎓 Termes éducatifs (BlaizBot)

**Révision libre**  
Mode d'entraînement où l'élève choisit lui-même les cartes de révision, sans assignation obligatoire. Complète les exercices assignés par le professeur.

**Supplément de révision**  
Contenu créé par l'élève pour son usage personnel (fiches, notes). Utilise les mêmes types de cartes que les cours mais en mode édition élève.

**Coach IA**  
Module affichant des indicateurs personnalisés (compréhension, autonomie, rigueur), des badges et des recommandations basées sur l'activité de l'élève.

**Tuteur virtuel**  
Rôle de l'assistant IA dans BlaizBot : accompagner l'élève dans ses révisions, répondre aux questions, guider la réflexion sans donner directement les réponses.

**Guidage progressif**  
Approche pédagogique de l'IA : poser des questions, donner des indices, encourager la réflexion avant de fournir la solution complète. Favorise l'apprentissage actif.

**Apprentissage actif**  
*Anglais : Active learning*  
Méthode pédagogique où l'apprenant construit ses connaissances par la réflexion et l'action, plutôt que par la réception passive d'informations.

**Échéance (deadline)**  
Date limite pour rendre un devoir ou compléter un exercice. Affichée dans l'agenda de l'élève et utilisée pour le suivi par le professeur.

---

### 🔐 Sécurité

**HTTPS**  
*HyperText Transfer Protocol Secure*  
Protocole de communication sécurisé chiffrant les échanges entre le navigateur et le serveur. Obligatoire en production pour protéger les cookies de session et les données sensibles.

**Message d'erreur générique**  
Réponse volontairement vague en cas d'échec d'authentification ("Identifiants incorrects") pour ne pas révéler si un email existe dans la base (protection contre l'énumération).

**Variables d'environnement**  
→ Déjà défini (fichier .env). Ici précisé : stockées dans `.env.local` en développement, configurées directement sur Vercel en production.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 10 |
| 🛠️ Outils/Applications | 1 |
| 📦 Technologies/Frameworks | 1 |
| 💻 Termes techniques | 13 |
| 📐 Méthodologie | 5 |
| 🏗️ Architecture | 5 |
| 🎓 Termes éducatifs | 7 |
| 🔐 Sécurité | 3 |
| **Total** | **45** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 10-chapitre-6.md (Fonctionnement de l'application)

> ⚠️ Ce chapitre décrit le fonctionnement concret de l'application terminée. Seuls les **nouveaux termes** non définis précédemment sont listés.

## Termes extraits

### 🔤 Anglicismes

**Client-serveur** *(modèle)*  
Architecture où le client (navigateur) envoie des requêtes au serveur qui traite les données et renvoie les réponses. Next.js génère le contenu côté serveur avant de l'envoyer au navigateur.

**WebSocket** *(anglicisme)*  
Protocole de communication bidirectionnelle en temps réel entre le navigateur et le serveur. Non utilisé dans BlaizBot (messagerie simple), mais mentionné comme amélioration possible.

**Push notification** *(anglicisme)*  
*Français : Notification push, notification instantanée*  
Message envoyé automatiquement à l'utilisateur sans qu'il ait besoin de rafraîchir l'application. Non implémenté dans le MVP, prévu comme amélioration future.

**Multimodal** *(anglicisme)*  
Capacité d'un modèle IA à traiter plusieurs types de données : texte, images, audio, vidéo. Gemini 2.0 Flash est multimodal, ce qui permet des interactions riches.

---

### 💻 Termes techniques

**Rendu côté serveur (SSR)**  
*Anglais : Server-Side Rendering*  
Technique où le HTML est généré sur le serveur à chaque requête avant d'être envoyé au navigateur. Améliore le référencement (SEO) et le temps de chargement initial.

**Génération statique (SSG)**  
*Anglais : Static Site Generation*  
Technique où les pages HTML sont pré-générées au moment du build. Plus rapide que SSR mais moins adapté au contenu dynamique.

**Requête Prisma**  
Appel à la base de données via l'ORM Prisma. Syntaxe TypeScript typée qui génère automatiquement les requêtes SQL. Exemple : `prisma.user.findMany()`.

**Token JWT (détail)**  
→ Déjà défini. Ici précisé : le token BlaizBot contient l'identité de l'utilisateur et son rôle, encodés et signés cryptographiquement pour garantir l'intégrité.

**Flux de données**  
Parcours des informations à travers les différentes couches de l'application : interface → API → base de données → retour. Comprendre les flux aide à débugger et optimiser.

**Requête POST / GET / PUT / DELETE**  
Méthodes HTTP standard pour les API REST :  
- GET : récupérer des données  
- POST : créer une ressource  
- PUT : modifier une ressource  
- DELETE : supprimer une ressource

**Rafraîchissement (données)**  
Rechargement périodique des données depuis le serveur pour afficher les mises à jour. La messagerie BlaizBot rafraîchit régulièrement sans WebSocket.

**Actions rapides (IA)**  
Boutons pré-configurés dans l'interface de chat qui déclenchent des prompts spécifiques : "Générer un quiz", "Créer un résumé", "Expliquer cet exercice".

---

### 🏗️ Architecture et conception

**Couche frontend / backend**  
Séparation logique de l'application :  
- Frontend : interface visible (React, composants UI)  
- Backend : logique serveur (API routes, accès BDD, authentification)  
Next.js unifie les deux dans un seul projet.

**Routes API dédiées**  
Organisation des endpoints par domaine fonctionnel :  
- `/api/admin/*` : opérations admin  
- `/api/teacher/*` : opérations professeur  
- `/api/student/*` : opérations élève  
- `/api/ai/*` : interactions IA

**Schéma de base de données**  
Définition formelle de la structure des données : tables, colonnes, types, relations, contraintes. Dans Prisma : fichier `schema.prisma` décrivant les 46 modèles de BlaizBot.

**Table des assignations**  
Table pivot reliant cours/exercices aux élèves/classes avec métadonnées (date limite, statut). Permet le suivi des devoirs et la gestion des échéances.

**Table de progression**  
Stockage de l'avancement de chaque élève : sections terminées, scores, temps passé. Alimente les KPI des dashboards.

**Table de résultats**  
Enregistrement des scores et réponses aux exercices/quiz. Permet la correction, le suivi et le calcul des moyennes.

---

### 🎓 Termes éducatifs (BlaizBot)

**Scénario de démonstration**  
Séquence d'actions prédéfinie pour montrer le fonctionnement complet de l'application. Le scénario BlaizBot en 7 étapes valide le flux Admin → Prof → Élève → Résultats.

**Comptes de démonstration**  
Utilisateurs fictifs créés pour tester et présenter l'application. Dans BlaizBot : 1 admin, 2 professeurs, 6 élèves répartis dans 4 classes.

**Cycle pédagogique complet**  
Enchaînement création → assignation → réalisation → évaluation → suivi. Le scénario de démonstration valide ce cycle de bout en bout.

**Question intermédiaire**  
Technique pédagogique de l'IA : avant de donner la réponse, poser une question pour guider la réflexion. "Qu'as-tu déjà essayé ?" ou "Quel est le premier terme à isoler ?".

**Score (quiz)**  
Résultat chiffré d'un exercice, généralement exprimé en fraction (2/3) ou pourcentage (66%). Affiché immédiatement pour les QCM à correction automatique.

**Explication (correction)**  
Texte accompagnant une réponse incorrecte pour aider l'élève à comprendre son erreur. Améliore la valeur pédagogique des quiz.

---

### 📐 Méthodologie

**Validation de bout en bout**  
Processus de test couvrant l'intégralité d'un parcours, de l'action initiale au résultat final. Confirme que tous les modules interagissent correctement.

**Preuve de faisabilité**  
*Anglais : Proof of concept (POC)*  
Démonstration qu'un concept ou une architecture fonctionne en pratique. Le wireframe codé a servi de preuve de faisabilité avant le développement complet.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 4 |
| 💻 Termes techniques | 8 |
| 🏗️ Architecture | 6 |
| 🎓 Termes éducatifs | 6 |
| 📐 Méthodologie | 2 |
| **Total** | **26** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 11-chapitre-7.md (Prospective : l'avenir du vibe coding)

> ⚠️ Chapitre réflexif et prospectif. Nouveaux termes liés à l'évolution du métier, l'éthique et la formation.

## Termes extraits

### 🔤 Anglicismes

**Scope creep** *(anglicisme)*  
*Français : Dérive du périmètre, glissement de périmètre*  
Extension progressive et non contrôlée du périmètre d'un projet, ajoutant des fonctionnalités non prévues initialement. Risque majeur en développement, évitable par un cadrage strict.

**Boîte noire** *(calque de l'anglais « black box »)*  
Système dont on utilise les résultats sans comprendre le fonctionnement interne. Risque du vibe coding : dépendre d'une IA sans comprendre ce qu'elle génère.

---

### 🛠️ Outils et applications

**Cursor**  
Éditeur de code basé sur VS Code, spécialisé dans l'intégration IA. Permet de dialoguer avec l'IA sur l'ensemble du projet, pas seulement sur le fichier courant. Va plus loin que GitHub Copilot dans l'assistance conversationnelle.  
📎 Site : [https://cursor.sh](https://cursor.sh)

**GPT-4**  
Modèle de langage d'OpenAI, successeur de GPT-3.5. Réputé pour sa polyvalence, sa capacité à suivre des instructions complexes et sa performance sur le code. Base de ChatGPT Plus et de nombreuses applications.  
🏢 Éditeur : OpenAI  
📎 Documentation : [https://platform.openai.com/docs/models/gpt-4](https://platform.openai.com/docs/models/gpt-4)

---

### 💻 Termes techniques

**Contexte (IA)**  
Ensemble des informations fournies au modèle pour une requête : prompt système, historique de conversation, fichiers de référence. Les LLM actuels ont une limite de contexte (fenêtre de tokens) qui restreint la taille des projets analysables.

**Fenêtre de contexte**  
*Anglais : Context window*  
Nombre maximum de tokens qu'un modèle peut traiter simultanément. Limite actuelle des LLM : les projets très larges dépassent la fenêtre et perdent en cohérence.

**Prédiction statistique**  
Mécanisme fondamental des LLM : générer le prochain token le plus probable basé sur les patterns appris. Ce n'est pas une "compréhension" mais un calcul de probabilité.

**Code vulnérable**  
Code contenant des failles de sécurité exploitables : injections SQL, XSS, secrets exposés, etc. L'IA peut générer du code vulnérable sans s'en rendre compte, nécessitant une relecture humaine.

---

### 📐 Méthodologie / Évolution du métier

**Pilote (développeur)**  
Nouvelle posture du développeur en vibe coding : il définit les objectifs, guide l'IA avec des consignes claires, vérifie les résultats et prend les décisions. Moins exécutant, plus superviseur.

**Automatisation des tâches répétitives**  
Délégation à l'IA des parties mécaniques du développement : boilerplate, création de pages similaires, formulaires standards. Libère du temps pour les tâches à plus forte valeur ajoutée.

**Vision architecturale**  
Compétence de conception globale : structurer un projet, organiser les modules, anticiper l'évolution, faire communiquer les composants. Reste entièrement humaine et gagne en importance avec le vibe coding.

**Formation continue**  
*Anglais : Continuous learning*  
Apprentissage tout au long de la carrière pour rester à jour face aux évolutions technologiques. Enjeu majeur avec l'émergence des outils IA.

**Auditeur de code généré**  
Nouveau rôle potentiel : spécialiste vérifiant la qualité, la sécurité et la conformité du code produit par l'IA. Combine compétences techniques et esprit critique.

**Intégrateur IA**  
Rôle émergent : professionnel spécialisé dans l'intégration d'outils IA dans les équipes et processus de développement existants.

---

### ⚖️ Éthique et société (nouvelle catégorie)

**Propriété intellectuelle (code généré)**  
Question juridique non résolue : à qui appartient le code généré par l'IA ? À l'utilisateur, à l'éditeur du modèle, aux auteurs des données d'entraînement ? Les législations peinent à suivre.

**Dépendance technologique**  
Risque de devenir incapable de travailler sans les outils IA. Importance de maintenir des compétences de programmation autonome.

**Impact environnemental (IA)**  
Coût énergétique de l'entraînement et de l'utilisation des modèles de langage. Chaque requête consomme de l'électricité et génère du CO₂. Facteur à considérer dans une utilisation responsable.

**Équité d'accès**  
Inégalité d'accès aux meilleurs outils IA (payants, limités géographiquement). Risque de fracture numérique entre ceux qui peuvent utiliser ces outils et les autres.

**Fracture numérique**  
*Anglais : Digital divide*  
Écart entre les personnes ayant accès aux technologies et compétences numériques, et celles qui en sont exclues. L'IA pourrait creuser cette fracture si l'accès reste inégal.

---

### 🚧 Risques et limites

**Accumulation de dette technique**  
Risque d'accepter du code IA fonctionnel mais non optimal : redondances, mauvaises pratiques, complexité inutile. Le gain de temps initial se transforme en coût de maintenance.

**Perte de compréhension**  
Danger de ne plus comprendre son propre projet quand l'IA écrit tout. En cas de bug ou d'évolution, on se retrouve face à du code non maîtrisé.

**Dépendance psychologique**  
Perte du réflexe de chercher soi-même, de lire la documentation, de comprendre en profondeur. Confort immédiat qui peut nuire à l'apprentissage long terme.

**Code généré sans contexte**  
L'IA ne connaît pas les spécificités du projet : contraintes métier, conventions d'équipe, historique de décisions. Elle peut proposer des solutions théoriquement correctes mais inadaptées au contexte réel.

---

### 🔮 Prospective (nouvelle catégorie)

**Développement en langage naturel**  
Vision future : créer des applications en décrivant ce qu'on veut, sans écrire de code. Possible pour des projets simples, le code restera nécessaire pour les projets complexes.

**Architecte-superviseur**  
Évolution du rôle de développeur vers 2030 : définir les grandes lignes, valider les choix de l'IA, intervenir sur les parties critiques. Les tâches répétitives entièrement automatisées.

**Spécialiste prompt engineering**  
Nouveau métier potentiel : expert en formulation de consignes efficaces pour les IA. Combine compétences linguistiques, techniques et compréhension des modèles.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 2 |
| 🛠️ Outils/Applications | 2 |
| 💻 Termes techniques | 4 |
| 📐 Méthodologie/Évolution | 6 |
| ⚖️ Éthique et société | 5 |
| 🚧 Risques et limites | 4 |
| 🔮 Prospective | 3 |
| **Total** | **26** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# Chapitre : 12-chapitre-8.md (Conclusion générale)

> ⚠️ Chapitre de bilan et réflexion. Reprend les concepts-clés du travail. Peu de nouveaux termes, principalement des récapitulatifs et quelques précisions complémentaires.

## Termes extraits

### 🔤 Anglicismes

**Bug** *(anglicisme courant)*  
*Français : Bogue (officiel mais peu utilisé), erreur de programmation*  
Défaut dans un programme provoquant un comportement inattendu. Peut aller de l'affichage incorrect à un crash complet. L'IA peut introduire des bugs subtils que seuls les tests révèlent.

---

### 💻 Termes techniques

**WebSockets**  
Protocole de communication bidirectionnelle persistante entre le client (navigateur) et le serveur. Permet des échanges en temps réel sans rechargement de page. Utilisé pour les messageries instantanées, les notifications push.  
📎 Documentation : [https://developer.mozilla.org/fr/docs/Web/API/WebSockets_API](https://developer.mozilla.org/fr/docs/Web/API/WebSockets_API)

**Notifications en temps réel**  
*Anglais : Real-time notifications*  
Alertes envoyées instantanément à l'utilisateur sans qu'il ait à rafraîchir la page. Nécessite WebSockets ou Server-Sent Events (SSE). Amélioration prioritaire pour BlaizBot.

**Indicateurs de lecture/saisie**  
*Anglais : Read receipts / Typing indicators*  
Fonctionnalités de messagerie montrant si le message a été lu ("vu") et si l'interlocuteur est en train d'écrire ("..."). Standard dans les apps modernes, absentes dans la version actuelle de BlaizBot.

---

### 🛠️ Outils et plateformes

**Moodle**  
Plateforme d'apprentissage en ligne (LMS) open source, très répandue dans l'éducation. Permet de créer des cours, quiz, forums. Une intégration avec BlaizBot faciliterait l'adoption par les écoles.  
📎 Site : [https://moodle.org](https://moodle.org)

**Google Classroom**  
Service Google de gestion de classes virtuelles. Largement utilisé dans les écoles. Une intégration permettrait de synchroniser notes, devoirs et élèves entre les deux plateformes.  
📎 Site : [https://classroom.google.com](https://classroom.google.com)

---

### 🎓 Termes éducatifs / Pédagogie

**LMS (Learning Management System)**  
*Français : Système de gestion de l'apprentissage*  
Plateforme logicielle pour administrer, documenter, suivre et diffuser des formations en ligne. Exemples : Moodle, Google Classroom, Canvas. BlaizBot pourrait s'interfacer avec ces systèmes existants.

**Analyse prédictive (éducation)**  
Application de l'IA pour anticiper les difficultés des élèves avant qu'elles ne se manifestent. Basée sur les patterns de réponses, temps passé, historique. Perspective d'amélioration pour BlaizBot.

**Contenu adaptatif**  
*Anglais : Adaptive content*  
Contenu pédagogique qui s'ajuste automatiquement au niveau et au rythme de chaque élève. L'IA permet de personnaliser exercices et explications selon les lacunes détectées.

**Fiches de révision personnalisées**  
Documents de synthèse générés automatiquement par l'IA, adaptés aux besoins spécifiques de chaque élève. Cible les points faibles identifiés dans les exercices précédents.

---

### 📐 Méthodologie / Compétences

**Compétences transversales**  
*Anglais : Soft skills, transversal skills*  
Capacités applicables dans différents contextes : résolution de problèmes, esprit critique, organisation, communication. Le vibe coding développe ces compétences autant que les compétences techniques.

**Esprit critique (face à l'IA)**  
Capacité à évaluer objectivement les propositions de l'IA, identifier les erreurs, ne pas accepter aveuglément. Compétence essentielle pour un usage efficace du vibe coding.

**Capitaliser (sur l'expérience)**  
Tirer parti des apprentissages passés pour améliorer ses pratiques futures. La documentation permet de capitaliser : ne pas refaire les mêmes erreurs, réutiliser les solutions qui fonctionnent.

---

### 📝 Bilan et enseignements (récapitulatif)

**Les 5 enseignements clés du projet** *(synthèse)*  
1. L'IA est puissante mais imparfaite → vérification humaine obligatoire  
2. Qualité du prompt = qualité du résultat → prompt engineering essentiel  
3. Tests et validation restent indispensables → l'IA ne "comprend" pas  
4. Documentation cruciale → traçabilité des décisions  
5. L'humain garde le contrôle stratégique → architecture, sécurité, logique métier

**Collaboration humain-IA**  
Modèle de travail où l'humain définit les objectifs et valide les résultats, tandis que l'IA génère les implémentations. Ni remplacement ni opposition, mais complémentarité.

---

## Note sur ce chapitre

Ce chapitre de conclusion reprend et synthétise de nombreux concepts déjà définis dans les chapitres précédents :
- MVP, wireframe, brainstorming (chapitres 1-4)
- Next.js, React, TypeScript, Prisma, NextAuth, Vercel (chapitre 5)
- Hallucinations, prompt engineering, scope creep (chapitres 3, 5, 7)
- Tests unitaires, déploiement, dette technique (chapitres 5, 7)

Ces termes ne sont pas redéfinis ici pour éviter les doublons. Ils seront consolidés dans le glossaire final.

---

## Statistiques du chapitre

| Catégorie | Nombre de termes |
|-----------|------------------|
| 🔤 Anglicismes | 1 |
| 💻 Termes techniques | 3 |
| 🛠️ Outils/Plateformes | 2 |
| 🎓 Termes éducatifs | 4 |
| 📐 Méthodologie | 3 |
| 📝 Bilan (synthèse) | 2 |
| **Total** | **15** |

---

*Chapitre traité le : 17 janvier 2026*

---

---

# 🏁 EXTRACTION TERMINÉE

## Récapitulatif global

| Chapitre | Termes extraits |
|----------|-----------------|
| 02-avant-propos | 29 |
| 04-introduction-generale | 39 |
| 05-chapitre-1 | 16 |
| 06-chapitre-2 | 18 |
| 07-chapitre-3 | 27 |
| 08-chapitre-4 | 38 |
| 09-chapitre-5 | 45 |
| 10-chapitre-6 | 26 |
| 11-chapitre-7 | 26 |
| **12-chapitre-8** | **15** |
| **TOTAL BRUT** | **279 termes** |

## Catégories utilisées

| Emoji | Catégorie |
|-------|-----------|
| 🔤 | Anglicismes |
| 💻 | Termes techniques |
| 🛠️ | Outils et applications |
| 📦 | Frameworks et bibliothèques |
| 🤖 | Intelligence artificielle |
| 📐 | Méthodologie |
| 👤 | Personnalités |
| 🏫 | Domaine éducatif |
| 🏗️ | Architecture logicielle |
| 🎓 | Termes éducatifs BlaizBot |
| 🔐 | Sécurité |
| ⚖️ | Éthique et société |
| 🚧 | Risques et limites |
| 🔮 | Prospective |
| 📝 | Bilan / Synthèse |

---

## Prochaine étape : CONSOLIDATION

Le fichier `glossaire-provisoire.md` contient **279 termes bruts** avec des doublons potentiels entre chapitres.

**Actions à réaliser :**
1. Fusionner les définitions dupliquées (garder la plus complète)
2. Harmoniser le format de chaque entrée
3. Trier par ordre alphabétique
4. Créer le fichier `glossaire.md` final (version propre)
5. Ajouter une section "Index des anglicismes" en annexe

---

*Extraction terminée le : 17 janvier 2026*
