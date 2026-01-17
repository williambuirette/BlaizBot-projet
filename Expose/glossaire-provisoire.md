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

<!-- PROCHAIN CHAPITRE À TRAITER : 09-chapitre-5.md -->
