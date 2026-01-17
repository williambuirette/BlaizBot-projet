# Glossaire — Compilation provisoire

> Ce fichier compile tous les termes du glossaire-provisoire.md, dédupliqués et triés alphabétiquement.  
> Les références bibliographiques ont été extraites vers `bibliographie-compile.md`.

---

## Légende des catégories

| Icône | Catégorie |
|-------|-----------|
| 🔤 | Anglicisme (terme anglais avec équivalent français) |
| 💻 | Terme technique / Concept informatique |
| 🛠️ | Outil / Application / Service |
| 📦 | Framework / Bibliothèque |
| 🤖 | Intelligence artificielle |
| 📐 | Méthodologie / Processus |
| 👤 | Personnalité |
| 🏗️ | Architecture logicielle |
| 🎓 | Terme éducatif (BlaizBot) |
| 🔐 | Sécurité |
| ⚖️ | Éthique et société |
| 🚧 | Risques et limites |
| 🔮 | Prospective |

---

# A

**Agile** 🔤  
*Français : Méthode agile*  
Ensemble de méthodologies de développement favorisant l'itération, la collaboration et l'adaptation au changement. Le vibe coding s'inscrit naturellement dans une approche agile par ses cycles courts.

**Agent orchestrateur** 📐  
Agent IA dont le rôle est de découper une tâche complexe en étapes, définir un plan d'action et coordonner le travail entre les différents agents spécialisés.

**Agent standards** 📐  
Agent IA dédié à la vérification de la qualité du code : respect des conventions, absence de secrets, structure correcte. Joue le rôle de garde-fou.

**Agents IA spécialisés** 📐  
Approche consistant à créer plusieurs "profils" d'IA avec des rôles distincts (Planification, Bug, Documentation, Code) plutôt qu'un assistant généraliste. Chaque agent a ses consignes et limites propres.

**Analyse prédictive (éducation)** 🎓  
Application de l'IA pour anticiper les difficultés des élèves avant qu'elles ne se manifestent. Basée sur les patterns de réponses, temps passé, historique.

**Andrej Karpathy** 👤  
Chercheur en IA et entrepreneur. Ex-directeur de l'IA chez Tesla (Autopilot), co-fondateur d'OpenAI. A popularisé le terme "vibe coding" via un post sur X en février 2025.

**API (Application Programming Interface)** 💻  
*Français : Interface de programmation*  
Ensemble de règles et protocoles permettant à des logiciels de communiquer entre eux. Une API web expose des endpoints (URLs) pour effectuer des opérations CRUD.

**App Router** 🔤  
Système de routage de Next.js 13+ basé sur le système de fichiers. Les dossiers dans `app/` définissent automatiquement les routes de l'application.

**Application web** 💻  
Programme informatique accessible via un navigateur web, sans nécessiter d'installation locale. Fonctionne sur le modèle client-serveur.

**Apprentissage actif** 🎓  
*Anglais : Active learning*  
Méthode pédagogique où l'apprenant construit ses connaissances par la réflexion et l'action, plutôt que par la réception passive d'informations.

**Arborescence du projet** 🏗️  
Organisation hiérarchique des dossiers et fichiers d'un projet. Une bonne arborescence facilite la navigation et la maintenance du code.

**Architecte-superviseur** 🔮  
Évolution du rôle de développeur vers 2030 : définir les grandes lignes, valider les choix de l'IA, intervenir sur les parties critiques. Les tâches répétitives entièrement automatisées.

**Architecture technique** 🏗️  
Organisation globale d'un système informatique : choix des technologies, structure des dossiers, séparation frontend/backend, flux de données.

**Assignation** 🎓  
Action d'attribuer un cours, un devoir ou un quiz à un élève ou une classe, éventuellement avec une date limite.

**Assistant pédagogique** 🎓  
Outil (humain ou IA) aidant un apprenant dans son parcours éducatif. Dans BlaizBot, l'assistant pédagogique est un chatbot IA qui guide les révisions sans fournir directement les réponses.

**Asynchrone** 💻  
*Anglais : Asynchronous*  
Mode d'exécution où les opérations ne bloquent pas le programme en attendant leur résultat. Les appels API et les requêtes IA sont asynchrones.

**Auditeur de code généré** 📐  
Nouveau rôle potentiel : spécialiste vérifiant la qualité, la sécurité et la conformité du code produit par l'IA.

**Automatisation des tâches répétitives** 📐  
Délégation à l'IA des parties mécaniques du développement : boilerplate, création de pages similaires, formulaires standards.

---

# B

**Backend** 🔤  
*Français : Partie serveur, côté serveur*  
Partie d'une application qui s'exécute sur le serveur : logique métier, accès à la base de données, authentification, API.

**Backlog** 🔤  
*Français : Carnet de commandes, liste de fonctionnalités*  
Liste ordonnée et priorisée des tâches ou fonctionnalités à développer. En méthodologie agile, le backlog évolue au fil du projet.

**Base de connaissances** 💻  
*Anglais : Knowledge base*  
Ensemble de documents, notes et références fournis à une IA pour enrichir son contexte.

**Base de données** 💻  
Système organisé de stockage et de gestion de données. Permet de stocker, rechercher et manipuler des informations de manière structurée.

**Bibliothèque (informatique)** 💻  
*Anglais : Library*  
Collection de fonctions et de code préécrit réutilisable dans un projet. Exemple : React est une bibliothèque UI.

**Boîte noire** 🚧  
*Anglais : Black box*  
Système dont on utilise les résultats sans comprendre le fonctionnement interne. Risque du vibe coding : dépendre d'une IA sans comprendre ce qu'elle génère.

**Boilerplate** 🔤  
*Français : Code standard, code répétitif*  
Code générique et répétitif nécessaire au fonctionnement mais n'apportant pas de valeur métier directe.

**Boucle de feedback** 📐  
*Anglais : Feedback loop*  
Processus cyclique où le résultat d'une action influence l'action suivante. En vibe coding : test → identification des problèmes → reformulation du prompt.

**Boucle TODO → prompt → code → test → commit** 📐  
Cycle de travail répété pour chaque tâche. Cœur de la méthode vibe coding.

**Brainstorming** 🔤  
*Français : Remue-méninges*  
Technique de créativité visant à produire un maximum d'idées sur un sujet donné, sans jugement initial.

**Brouillon (isDraft)** 💻  
État d'un contenu (cours, article) non encore publié. Le professeur peut préparer un cours en mode brouillon.

**Bug** 🔤  
*Français : Bogue (terme officiel)*  
Erreur ou défaut dans un programme informatique provoquant un comportement inattendu ou incorrect.

---

# C

**Cadrage (projet)** 📐  
Étape initiale définissant les objectifs, le périmètre et les contraintes d'un projet.

**Capitaliser (sur l'expérience)** 📐  
Tirer parti des apprentissages passés pour améliorer ses pratiques futures.

**Carte pédagogique** 🎓  
Unité de contenu dans BlaizBot. 5 types : Note, Leçon, Vidéo, Exercice, Quiz.

**Cartographie (application)** 💻  
Vue d'ensemble de la structure d'une application : pages, liens entre elles, fonctionnalités par section.

**CDN (Content Delivery Network)** 💻  
*Français : Réseau de diffusion de contenu*  
Réseau de serveurs distribués géographiquement pour servir le contenu depuis le serveur le plus proche de l'utilisateur.

**Chatbot** 💻  
*Français : Agent conversationnel*  
Programme informatique simulant une conversation avec un utilisateur, généralement via du texte.

**CI/CD** 📐  
*Français : Intégration continue / Déploiement continu*  
Pratiques automatisant les tests (CI) et le déploiement (CD) à chaque commit.

**Client-serveur (modèle)** 🏗️  
Architecture où le client (navigateur) envoie des requêtes au serveur qui traite les données et renvoie les réponses.

**Coach IA** 🎓  
Module affichant des indicateurs personnalisés (compréhension, autonomie, rigueur), des badges et des recommandations basées sur l'activité de l'élève.

**Code vulnérable** 🔐  
Code contenant des failles de sécurité exploitables : injections SQL, XSS, secrets exposés, etc.

**Collaboration humain-IA** 📐  
Modèle de travail où l'humain définit les objectifs et valide les résultats, tandis que l'IA génère les implémentations.

**Commit** 🔤  
*Français : Validation, enregistrement*  
Dans Git, instantané des modifications du code à un moment donné, accompagné d'un message descriptif.

**Comparatif** 📐  
Analyse mettant en parallèle deux approches ou versions pour évaluer leurs avantages et inconvénients.

**Compétences transversales** 📐  
*Anglais : Soft skills*  
Capacités applicables dans différents contextes : résolution de problèmes, esprit critique, organisation, communication.

**Comptes de démonstration** 🎓  
Utilisateurs fictifs créés pour tester et présenter l'application.

**Composant (React)** 💻  
Bloc de code réutilisable encapsulant une partie de l'interface utilisateur. Peut recevoir des propriétés (props) et maintenir un état interne.

**Composant commun** 🏗️  
Élément d'interface réutilisable dans plusieurs pages : barre de navigation, pied de page, boutons standardisés.

**Composants configurables** 💻  
Composants React conçus pour s'adapter à différents contextes via des paramètres (props).

**Conditions réelles** 📐  
Situation où un prototype est testé avec de vraies interactions et contraintes, par opposition à un test théorique.

**Confidentialité** 🔐  
*Anglais : Privacy*  
Protection des informations personnelles et sensibles.

**Contenu adaptatif** 🎓  
*Anglais : Adaptive content*  
Contenu pédagogique qui s'ajuste automatiquement au niveau et au rythme de chaque élève.

**Contexte (IA)** 🤖  
Ensemble des informations fournies au modèle pour une requête : prompt système, historique de conversation, fichiers de référence.

**Cookie** 🔐  
Petit fichier texte stocké par le navigateur, utilisé pour conserver des informations entre les requêtes.

**Correction automatique** 🎓  
Évaluation instantanée des réponses de l'élève par comparaison avec les réponses attendues.

**Couche frontend / backend** 🏗️  
Séparation logique de l'application : frontend (interface visible) et backend (logique serveur).

**Critères de fin (exit criteria)** 📐  
Conditions précises à remplir pour considérer une phase ou une tâche comme terminée.

**CRUD** 💻  
Acronyme de Create, Read, Update, Delete. Désigne les quatre opérations de base sur les données.

**Cycle pédagogique complet** 🎓  
Enchaînement création → assignation → réalisation → évaluation → suivi.

---

# D

**Dashboard administrateur** 🎓  
Vue globale de la plateforme : statistiques système, gestion des utilisateurs, classes et paramètres généraux.

**Dashboard élève** 🎓  
Tableau de bord personnel affichant la progression, les objectifs et l'accès rapide aux cours, révisions et assistant IA.

**Dashboard professeur** 🎓  
Interface de suivi orientée classe, avec indicateurs (KPI) sur les élèves, alertes et accès à la gestion des cours.

**Découpage en tâches** 📐  
Action de diviser un travail complexe en sous-tâches simples et réalisables.

**Découpage par modules fonctionnels** 📐  
Organisation du projet en blocs indépendants correspondant à des fonctionnalités distinctes (Admin, Professeur, Élève, IA).

**Dépendance technologique** ⚖️  
Risque de devenir incapable de travailler sans les outils IA.

**Dépendance psychologique** 🚧  
Perte du réflexe de chercher soi-même, de lire la documentation, de comprendre en profondeur.

**Dépendances (tâches)** 📐  
Relations entre tâches indiquant qu'une tâche ne peut démarrer qu'après la complétion d'une autre.

**Déploiement** 💻  
*Anglais : Deployment*  
Action de publier une application sur un serveur ou une plateforme cloud pour la rendre accessible aux utilisateurs.

**Dépôt (Git)** 💻  
*Anglais : Repository (repo)*  
Espace de stockage contenant tous les fichiers d'un projet et leur historique de versions.

**Design system** 🔤  
*Français : Système de design*  
Ensemble de règles de conception unifiées : palette de couleurs, typographie, espacements, composants UI standardisés.

**Dette technique** 🔤  
*Anglais : Technical debt*  
Coût futur engendré par des choix de développement rapides ou simplifiés.

**Dev / Développeur** 🔤  
Abréviation courante de "developer" (développeur) dans le jargon informatique.

**Développement assisté par IA** 📐  
*Anglais : AI-assisted development*  
Approche où l'IA aide le développeur sans le remplacer.

**Développement en langage naturel** 🔮  
Vision future : créer des applications en décrivant ce qu'on veut, sans écrire de code.

**Développement par phases** 📐  
Organisation du travail en étapes successives et logiques.

**Documentation vivante** 📐  
Documentation qui évolue avec le projet, versionnée comme le code.

**Données agrégées** 💻  
*Anglais : Aggregated data*  
Informations regroupées et résumées (moyennes, totaux, tendances) plutôt que détails individuels.

---

# E

**Échéance (deadline)** 🎓  
Date limite pour rendre un devoir ou compléter un exercice.

**Endpoint API** 🏗️  
Point d'accès d'une API correspondant à une URL spécifique et une opération (GET, POST, PUT, DELETE).

**Équité d'accès** ⚖️  
Inégalité d'accès aux meilleurs outils IA (payants, limités géographiquement).

**Esprit critique (en programmation)** 📐  
Capacité à questionner et vérifier les propositions de l'IA plutôt que de les accepter aveuglément.

**État actif (navigation)** 💻  
Indication visuelle montrant quelle page ou section est actuellement sélectionnée dans un menu.

**Exécuter / Exécution** 💻  
Action de faire tourner un programme pour qu'il effectue ses instructions.

**Explication (correction)** 🎓  
Texte accompagnant une réponse incorrecte pour aider l'élève à comprendre son erreur.

---

# F

**Fenêtre de contexte** 🤖  
*Anglais : Context window*  
Nombre maximum de tokens qu'un modèle peut traiter simultanément.

**Fichier .env** 💻  
Fichier de configuration contenant les variables d'environnement (clés API, URLs de base de données). Ne doit JAMAIS être commité dans Git.

**Fiches de révision personnalisées** 🎓  
Documents de synthèse générés automatiquement par l'IA, adaptés aux besoins spécifiques de chaque élève.

**Fil de discussion** 💻  
*Anglais : Thread*  
Dans ChatGPT et autres outils, conversation séparée sur un sujet spécifique.

**Filtrage par session** 🏗️  
Restriction des données accessibles en fonction de l'utilisateur connecté.

**Flux de données** 💻  
Parcours des informations à travers les différentes couches de l'application.

**Formation continue** 📐  
*Anglais : Continuous learning*  
Apprentissage tout au long de la carrière pour rester à jour face aux évolutions technologiques.

**Formulaire (réinitialisation)** 💻  
Remise à zéro des champs d'un formulaire après soumission.

**Fracture numérique** ⚖️  
*Anglais : Digital divide*  
Écart entre les personnes ayant accès aux technologies numériques et celles qui en sont exclues.

**Frontend** 🔤  
*Français : Interface cliente*  
Partie d'une application visible et manipulée par l'utilisateur. S'exécute dans le navigateur.

**Full-stack** 🔤  
*Français : Pile complète*  
Désigne un développement couvrant à la fois le frontend et le backend.

---

# G

**Gabarit** 💻  
*Anglais : Template*  
Modèle réutilisable servant de base pour créer des éléments similaires.

**Garde-fou** 📐  
*Anglais : Guardrail*  
Règle ou contrainte mise en place pour éviter les dérives.

**Génération statique (SSG)** 💻  
*Anglais : Static Site Generation*  
Technique où les pages HTML sont pré-générées au moment du build.

**.gitignore** 💻  
Fichier spécial de Git listant les fichiers et dossiers à exclure du versionnement.

**GPT (Generative Pre-trained Transformer)** 🤖  
Architecture de réseau de neurones développée par OpenAI. Base des LLM modernes.

**Guidage progressif** 🎓  
Approche pédagogique de l'IA : poser des questions, donner des indices, encourager la réflexion avant de fournir la solution complète.

---

# H

**Hachage (mot de passe)** 🔐  
*Anglais : Hashing*  
Transformation cryptographique irréversible d'un mot de passe en une chaîne de caractères fixe.

**Hallucination (IA)** 🤖  
Phénomène où un modèle d'IA génère des informations fausses, inventées ou incohérentes tout en les présentant avec assurance.

**Header** 🔤  
*Français : En-tête*  
Barre supérieure d'une page web contenant généralement le titre de la page et le menu utilisateur.

**HTTPS** 🔐  
*HyperText Transfer Protocol Secure*  
Protocole de communication sécurisé chiffrant les échanges entre le navigateur et le serveur.

---

# I

**IA générative** 🤖  
*Anglais : Generative AI*  
Catégorie d'intelligence artificielle capable de créer du contenu nouveau (texte, code, images) à partir d'instructions.

**Impact environnemental (IA)** ⚖️  
Coût énergétique de l'entraînement et de l'utilisation des modèles de langage.

**Indicateur de chargement** 💻  
*Anglais : Loading indicator*  
Élément visuel (spinner, barre de progression) indiquant qu'une opération est en cours.

**Indicateurs de lecture/saisie** 💻  
*Anglais : Read receipts / Typing indicators*  
Fonctionnalités de messagerie montrant si le message a été lu et si l'interlocuteur est en train d'écrire.

**Intégrateur IA** 📐  
Rôle émergent : professionnel spécialisé dans l'intégration d'outils IA dans les équipes existantes.

**Intelligence artificielle (IA)** 🤖  
*Anglais : Artificial Intelligence (AI)*  
Branche de l'informatique visant à créer des systèmes capables d'effectuer des tâches qui nécessitent normalement l'intelligence humaine.

**Interface (application)** 💻  
Écran ou ensemble d'écrans destiné à un type d'utilisateur spécifique.

**Interface utilisateur (UI)** 💻  
*Anglais : User Interface*  
Ensemble des éléments visuels et interactifs permettant à un utilisateur d'interagir avec une application.

**Inventaire UI** 💻  
Liste exhaustive des éléments d'interface à développer : pages, composants, boutons, formulaires, actions.

**Itération** 📐  
Cycle répété d'un processus. En développement agile et vibe coding, chaque itération produit une version améliorée.

---

# J

**JWT (JSON Web Token)** 🔐  
Standard ouvert pour créer des jetons d'authentification sécurisés. Le token contient des informations encodées (identité, rôle) et est signé cryptographiquement.

---

# K

**Kickoff** 🔤  
*Français : Lancement, démarrage*  
Réunion ou document de lancement d'un projet ou d'une phase. Prompt initial détaillé pour démarrer une nouvelle étape de développement.

**KPI (Key Performance Indicator)** 💻  
*Français : Indicateur clé de performance*  
Mesure quantifiable permettant d'évaluer la performance ou la progression vers un objectif.

---

# L

**Langage naturel** 💻  
Langue parlée ou écrite par les humains (français, anglais, etc.), par opposition aux langages de programmation.

**Layout** 🔤  
*Français : Mise en page, gabarit*  
Structure visuelle partagée entre plusieurs pages (en-tête, menu latéral, pied de page).

**Linter** 💻  
Outil d'analyse statique qui parcourt le code pour détecter des erreurs ou mauvaises pratiques sans exécuter le programme.

**Lisibilité du code** 💻  
*Anglais : Code readability*  
Qualité d'un code facilement compréhensible par un humain.

**Livrable** 📐  
*Anglais : Deliverable*  
Résultat concret d'une phase de projet, prêt à être utilisé ou transmis.

**LLM (Large Language Model)** 🤖  
*Français : Grand modèle de langage*  
Modèle d'IA entraîné sur d'immenses quantités de texte pour comprendre et générer du langage naturel.

**LMS (Learning Management System)** 🎓  
*Français : Système de gestion de l'apprentissage*  
Plateforme logicielle pour administrer, documenter, suivre et diffuser des formations en ligne.

**Logique métier** 💻  
*Anglais : Business logic*  
Ensemble des règles et processus qui définissent le fonctionnement de l'application selon le domaine concerné.

---

# M

**Maintenabilité** 💻  
*Anglais : Maintainability*  
Facilité avec laquelle un code peut être modifié, corrigé ou étendu dans le futur.

**Markdown** 💻  
Langage de balisage léger permettant de formater du texte avec une syntaxe simple (titres, listes, liens, code).

**Message d'erreur générique** 🔐  
Réponse volontairement vague en cas d'échec d'authentification pour ne pas révéler si un email existe dans la base.

**Message de commit** 💻  
Texte court décrivant les modifications enregistrées dans un commit.

**Middleware** 💻  
*Français : Intergiciel*  
Code qui s'exécute entre la requête de l'utilisateur et la réponse du serveur.

**Migration (base de données)** 💻  
Script décrivant une modification du schéma de base de données. Permet de versionner l'évolution de la structure de données.

**Mock / Mockées (données)** 💻  
*Français : Données simulées*  
Données fictives utilisées pendant le développement pour tester l'interface sans connexion à une vraie base de données.

**Mode streaming** 💻  
Affichage progressif des réponses de l'IA, mot par mot, au fur et à mesure de la génération.

**Modèle de données** 💻  
Représentation abstraite de la structure des données d'une application : entités, attributs et relations.

**Multimodal** 🤖  
Capacité d'un modèle IA à traiter plusieurs types de données : texte, images, audio, vidéo.

**MVP (Minimum Viable Product)** 🔤  
*Français : Produit minimum viable*  
Version d'un produit avec juste assez de fonctionnalités pour être utilisable par les premiers utilisateurs.

---

# N

**Notification (toast)** 💻  
*Anglais : Toast notification*  
Message court et temporaire affiché à l'écran pour informer l'utilisateur d'une action.

**Notifications en temps réel** 💻  
*Anglais : Real-time notifications*  
Alertes envoyées instantanément à l'utilisateur sans qu'il ait à rafraîchir la page.

---

# O

**ORM (Object-Relational Mapping)** 💻  
*Français : Mapping objet-relationnel*  
Technique permettant de manipuler une base de données relationnelle comme des objets dans le code.

---

# P

**Parcours utilisateur** 🎓  
Séquence d'écrans et d'actions qu'un utilisateur suit pour accomplir un objectif.

**Partenariat humain-IA** 📐  
Concept central du vibe coding : l'IA et le développeur travaillent ensemble, chacun apportant ses forces.

**Périmètre (projet)** 📐  
*Anglais : Scope*  
Délimitation précise de ce qui est inclus et exclu d'un projet.

**Perte de compréhension** 🚧  
Danger de ne plus comprendre son propre projet quand l'IA écrit tout.

**Pilote (développeur)** 📐  
Nouvelle posture du développeur en vibe coding : il définit les objectifs, guide l'IA, vérifie les résultats et prend les décisions.

**Pipeline** 💻  
*Français : Chaîne de traitement*  
Séquence d'étapes automatisées ou semi-automatisées pour transformer une entrée en sortie.

**Placeholder** 🔤  
*Français : Espace réservé*  
Élément temporaire inséré pour marquer l'emplacement futur d'un contenu réel.

**Prédiction statistique** 🤖  
Mécanisme fondamental des LLM : générer le prochain token le plus probable basé sur les patterns appris.

**Preuve de faisabilité** 📐  
*Anglais : Proof of concept (POC)*  
Démonstration qu'un concept ou une architecture fonctionne en pratique.

**Programmation traditionnelle** 📐  
Approche classique où le développeur écrit manuellement chaque ligne de code, par opposition au vibe coding.

**Progression (pédagogique)** 🎓  
Évolution mesurable des compétences ou connaissances d'un apprenant au fil du temps.

**Prompt** 🔤  
*Français : Invite, consigne, requête*  
Instruction ou question donnée à un modèle d'IA pour obtenir une réponse ou une génération.

**Prompt engineering** 🔤  
*Français : Ingénierie de prompts*  
Art et technique de formuler des instructions précises et efficaces pour obtenir les meilleurs résultats d'une IA générative.

**Prompt stack** 💻  
Empilement structuré de prompts envoyés au modèle IA : prompt système + contexte RAG + prompt utilisateur + historique.

**Prompt système** 💻  
*Anglais : System prompt*  
Instructions de base données à une IA au début d'une conversation pour définir son comportement et ses limites.

**Prompt-type / Gabarit de prompt** 📐  
Modèle standardisé de prompt réutilisable selon le type de tâche.

**Propriété intellectuelle (code généré)** ⚖️  
Question juridique non résolue : à qui appartient le code généré par l'IA ?

**Prototype** 💻  
Version préliminaire d'une application permettant de tester et valider les concepts avant le développement complet.

**Prototype interactif** 💻  
Maquette cliquable simulant le comportement de l'application finale.

**Push notification** 💻  
*Français : Notification push*  
Message envoyé automatiquement à l'utilisateur sans qu'il ait besoin de rafraîchir l'application.

---

# Q

**QCM (Questionnaire à Choix Multiples)** 🎓  
Type d'exercice où l'élève choisit parmi plusieurs réponses proposées. Permet une correction automatique immédiate.

**Question intermédiaire** 🎓  
Technique pédagogique de l'IA : avant de donner la réponse, poser une question pour guider la réflexion.

**Quiz** 🎓  
Questionnaire interactif permettant de tester des connaissances.

---

# R

**RAG (Retrieval-Augmented Generation)** 🤖  
*Français : Génération augmentée par récupération*  
Technique combinant un modèle de langage avec une base de connaissances externe.

**Rafraîchissement (données)** 💻  
Rechargement périodique des données depuis le serveur pour afficher les mises à jour.

**RBAC (Role-Based Access Control)** 🔐  
*Français : Contrôle d'accès basé sur les rôles*  
Système de gestion des permissions où les droits d'accès sont attribués en fonction du rôle de l'utilisateur.

**Recette interne** 📐  
*Anglais : Internal testing*  
Phase de test réalisée par le développeur lui-même avant de soumettre le produit à des utilisateurs externes.

**Redirection automatique** 🏗️  
Navigation vers une page spécifique déclenchée par le système.

**Refactoring / Refactorisation** 🔤  
*Français : Remaniement, restructuration*  
Action de réorganiser le code existant pour le rendre plus lisible ou maintenable, sans changer son comportement.

**Refactoring léger** 📐  
Réorganisation minimale du code pour améliorer la lisibilité sans modifier le comportement.

**Référentiel de rôles** 📐  
Document décrivant les différents agents IA, leur mission, leurs limites et le format attendu de leurs réponses.

**Relation 1:1 (one-to-one)** 💻  
Association entre deux entités où chaque enregistrement d'une table correspond à exactement un enregistrement d'une autre.

**Rendu côté serveur (SSR)** 💻  
*Anglais : Server-Side Rendering*  
Technique où le HTML est généré sur le serveur à chaque requête avant d'être envoyé au navigateur.

**Requête agrégée** 💻  
Requête de base de données calculant des statistiques (moyennes, comptages, sommes) plutôt que retournant des données individuelles.

**Requête POST / GET / PUT / DELETE** 💻  
Méthodes HTTP standard pour les API REST.

**Requête Prisma** 💻  
Appel à la base de données via l'ORM Prisma. Syntaxe TypeScript typée.

**Ressource (pédagogique)** 🎓  
Document ou contenu associé à un cours : fichiers PDF, liens, vidéos, images.

**Responsive / Responsivité** 🔤  
*Français : Adaptatif*  
Capacité d'une interface à s'adapter automatiquement à différentes tailles d'écran.

**Révision** 🎓  
Processus d'apprentissage consistant à revoir et consolider des connaissances déjà étudiées.

**Révision libre** 🎓  
Mode d'entraînement où l'élève choisit lui-même les cartes de révision, sans assignation obligatoire.

**Rôle (utilisateur)** 💻  
Catégorie définissant les permissions et l'interface d'un utilisateur dans l'application.

**Route (web)** 💻  
URL ou chemin d'accès à une ressource ou une page dans une application web.

**Route API** 🏗️  
Chemin d'accès exposant une fonctionnalité backend.

**Route protégée** 🏗️  
Page ou API accessible uniquement aux utilisateurs authentifiés avec le bon rôle.

**Routes (navigation)** 🏗️  
Chemins définissant la structure de l'application et la navigation entre les pages.

**Routes API dédiées** 🏗️  
Organisation des endpoints par domaine fonctionnel.

---

# S

**Scénario de bout en bout (E2E)** 📐  
*Anglais : End-to-end scenario*  
Test couvrant un parcours utilisateur complet, de l'action initiale au résultat final.

**Scénario de démonstration** 🎓  
Séquence d'actions prédéfinie pour montrer le fonctionnement complet de l'application.

**Scénario de test / démonstration** 📐  
Séquence d'actions prédéfinie permettant de tester ou présenter une fonctionnalité de bout en bout.

**Schéma de base de données** 🏗️  
Définition formelle de la structure des données : tables, colonnes, types, relations, contraintes.

**Scope creep** 🚧  
*Français : Dérive du périmètre*  
Extension progressive et non contrôlée du périmètre d'un projet.

**Score (quiz)** 🎓  
Résultat chiffré d'un exercice, généralement exprimé en fraction ou pourcentage.

**Score IA** 🎓  
Indicateur calculé à partir des interactions de l'élève avec l'assistant IA.

**Seed (base de données)** 💻  
*Français : Données d'amorçage*  
Script qui remplit la base de données avec des données de test ou de démonstration.

**Séparation des vues** 🏗️  
Architecture où chaque rôle a son propre espace avec ses propres données filtrées.

**Serverless** 🔤  
*Français : Sans serveur, Fonctions à la demande*  
Architecture où le code s'exécute dans des fonctions éphémères gérées par le cloud.

**Session (utilisateur)** 💻  
Période d'activité d'un utilisateur connecté à l'application.

**Session de travail** 📐  
Période dédiée à une tâche spécifique, généralement d'une durée limitée.

**Sidebar** 🔤  
*Français : Barre latérale*  
Zone de navigation verticale située sur le côté de l'écran.

**Spécialiste prompt engineering** 🔮  
Nouveau métier potentiel : expert en formulation de consignes efficaces pour les IA.

**Squelette (projet)** 💻  
*Anglais : Scaffold*  
Structure de base d'un projet générée automatiquement.

**Stack technique** 🔤  
*Français : Pile technologique*  
Ensemble des technologies, langages et outils utilisés pour développer une application.

**Streaming (IA)** 🤖  
Technique d'affichage progressif des réponses de l'IA, mot par mot.

**Structure hiérarchique** 💻  
Organisation en niveaux imbriqués. Dans BlaizBot : Cours → Chapitres → Sections → Cartes.

**Supplément de révision** 🎓  
Contenu créé par l'élève pour son usage personnel (fiches, notes).

**Système de prédiction (LLM)** 🤖  
Fonctionnement fondamental des modèles de langage : anticiper les mots les plus probables.

---

# T

**Table (base de données)** 💻  
Structure de stockage organisant les données en lignes et colonnes.

**Table de progression** 🏗️  
Stockage de l'avancement de chaque élève : sections terminées, scores, temps passé.

**Table de résultats** 🏗️  
Enregistrement des scores et réponses aux exercices/quiz.

**Table des assignations** 🏗️  
Table pivot reliant cours/exercices aux élèves/classes avec métadonnées.

**Taux de complétion** 💻  
Pourcentage de contenu terminé par rapport au total.

**Taux de réussite** 💻  
Pourcentage de réponses correctes sur un exercice.

**Terminal (informatique)** 💻  
Interface en ligne de commande permettant d'exécuter des instructions textuelles.

**Terrain d'essai** 📐  
Contexte ou projet utilisé pour expérimenter une méthode ou une technologie en conditions réelles.

**Test en conditions réelles** 📐  
Validation d'une fonctionnalité en l'utilisant comme un vrai utilisateur, avec des données et scénarios réalistes.

**TODO list** 📐  
*Français : Liste de tâches*  
Document listant les actions à accomplir.

**Token** 🤖  
Unité de base utilisée par les LLM pour traiter le texte. Peut être un mot, une partie de mot ou un caractère.

**Traçabilité** 📐  
*Anglais : Traceability*  
Capacité à suivre l'historique des modifications et des décisions.

**Travail de maturité** 📐  
En Suisse, travail de recherche et rédaction réalisé par les élèves en fin de gymnase (équivalent du lycée).

**Tuteur virtuel** 🎓  
Rôle de l'assistant IA dans BlaizBot : accompagner l'élève dans ses révisions, répondre aux questions, guider la réflexion.

---

# U

**UX (User Experience)** 🔤  
*Français : Expérience utilisateur*  
Qualité de l'expérience vécue par un utilisateur lors de l'interaction avec un produit.

---

# V

**Validation de bout en bout** 📐  
Processus de test couvrant l'intégralité d'un parcours, de l'action initiale au résultat final.

**Validation humaine** 📐  
Étape indispensable du vibe coding où le développeur vérifie que le code généré par l'IA fonctionne correctement.

**Variables d'environnement** 🔐  
Paramètres de configuration stockés en dehors du code source.

**Verrouillage du plan** 📐  
Décision de figer l'architecture et la feuille de route après validation.

**Versionner / Versionnement** 📐  
Action de sauvegarder différentes versions d'un fichier ou projet au fil du temps.

**Vibe coding** 🔤  
Littéralement « coder à l'intuition ». Nouvelle approche de programmation où le développeur décrit ce qu'il veut en langage naturel et laisse l'IA générer le code. Popularisé par Andrej Karpathy en février 2025.

**Vision architecturale** 📐  
Compétence de conception globale : structurer un projet, organiser les modules, anticiper l'évolution.

---

# W

**WebSocket** 💻  
Protocole de communication bidirectionnelle en temps réel entre le navigateur et le serveur.

**Wireframe** 🔤  
*Français : Maquette fil de fer*  
Représentation schématique d'une interface utilisateur, montrant la structure et les fonctionnalités sans le design graphique final.

---

# 📊 Statistiques de compilation

## Par catégorie

| Catégorie | Icône | Nombre |
|-----------|-------|--------|
| Anglicismes | 🔤 | 42 |
| Termes techniques | 💻 | 78 |
| Intelligence artificielle | 🤖 | 14 |
| Méthodologie | 📐 | 48 |
| Architecture | 🏗️ | 18 |
| Termes éducatifs | 🎓 | 32 |
| Sécurité | 🔐 | 10 |
| Éthique et société | ⚖️ | 5 |
| Risques et limites | 🚧 | 5 |
| Prospective | 🔮 | 3 |
| Personnalités | 👤 | 1 |
| **TOTAL DÉDUPLIQUÉ** | | **~200 termes uniques** |

> Note : Certains termes apparaissaient dans plusieurs chapitres avec des nuances. Une seule définition consolidée a été conservée.

---

## Prochaine étape

1. Relecture et validation des définitions
2. Vérification de la cohérence des catégories
3. Création du fichier `glossaire.md` final (formaté pour l'exposé)
4. Ajout d'un index des anglicismes en annexe

---

*Compilation effectuée le : 17 janvier 2026*
