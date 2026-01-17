# Chapitre 5 — Développement de l'application (implémentation du MVP)

> **Stack technique** : Next.js 16.1.1 | React 19.2.3 | TypeScript 5.x (strict) | Tailwind CSS v4 | Prisma 6.19 | NextAuth v5 | Gemini 2.0 Flash

Chapitre 5 – Développement de l'application (implémentation du MVP)

> **Stack technique** : Next.js 16.1.1 | React 19.2.3 | TypeScript 5.x (strict) | Tailwind CSS v4 | Prisma 6.19 | NextAuth v5 | Gemini 2.0 Flash

5.1 Initialisation du dépôt applicatif

J'ai commencé le développement de Blaiz'bot en créant le dépôt principal du projet. Pour aller vite tout en restant rigoureux, j'ai choisi une stack moderne : Next.js 16.1.1 (avec React 19.2.3), configuré avec TypeScript strict et Tailwind CSS v4. Ce choix correspond à l'architecture prévue et offre un environnement full-stack (interface + routes API) adapté au vibe coding. Mon premier objectif était simple : obtenir un "Hello World" qui tourne en local, afin de valider que le projet démarre correctement.

Concrètement, j'ai utilisé la commande officielle de Next.js pour générer la structure de base avec les dépendances nécessaires (React, TypeScript, Tailwind, etc.). J'ai rencontré une première difficulté : npm refusait le nom "BlaizBot" à cause des majuscules, car le nom du package doit être en minuscules. Pour contourner le problème, j'ai initialisé le projet dans un dossier temporaire sans majuscules, puis j'ai déplacé les fichiers dans le dépôt "BlaizBot-V1" et ajusté le nom dans les fichiers de configuration. Grâce à cette manipulation, le projet a pu se lancer sans erreur.

Ensuite, j'ai vérifié et renforcé la configuration. J'ai activé le mode strict de TypeScript pour garder une bonne discipline dès le départ et ajouté quelques options de sécurité supplémentaires. Côté styles, j'ai confirmé que Tailwind fonctionnait bien. La version utilisée (Tailwind v4, fin 2025) introduit une nouvelle syntaxe, donc j'ai vérifié que le fichier global utilisait bien @import "tailwindcss";, afin d'éviter des conflits et d'avoir une configuration propre.

Enfin, j'ai démarré le serveur de développement et affiché la page par défaut de Next.js sur le navigateur (port 3000). En moins d'une heure, j'avais un dépôt initialisé et une première version exécutable, ce qui m'a rassuré : l'environnement était prêt pour la suite.
[Capture d'écran : écran d'accueil "Hello World" après l'initialisation]

5.2 Traduction du wireframe codé en routes / layouts / navigation

Une fois le projet Next.js en place, j'ai reproduit l'ossature de l'interface telle qu'elle avait été validée dans le wireframe codé. L'objectif était de traduire chaque écran et chaque parcours de navigation du prototype en pages réelles dans Next.js. Pour cela, j'ai utilisé l'App Router, qui organise les routes à partir de l'arborescence des dossiers.

J'ai structuré l'application en trois sections correspondant aux rôles : Administrateur, Professeur et Élève. J'ai créé un espace pour les pages publiques (notamment l'écran de connexion), puis un dossier parent regroupant toutes les pages accessibles uniquement après authentification. À l'intérieur, j'ai séparé clairement les routes en trois sous-espaces (admin, teacher, student). Cette organisation reflète exactement la logique du projet : chaque rôle possède son propre environnement, avec ses pages dédiées, ce qui évite de mélanger les fonctionnalités.

Ensuite, j'ai mis en place des layouts partagés pour garantir une navigation uniforme. Toutes les pages internes reprennent la même structure : une barre latérale pour naviguer, un header pour le contexte (titre, menu utilisateur), et une zone centrale pour le contenu. Grâce aux layouts de Next.js, j'ai défini une mise en page commune pour l'espace connecté, ce qui permet aux pages admin, prof et élève d'hériter automatiquement de la même structure. J'ai intégré en React les éléments du wireframe, comme le menu latéral et ses onglets, afin qu'ils s'affichent partout où il faut.

Enfin, pour chaque page prévue dans le wireframe, j'ai créé la route correspondante et ajouté un contenu minimal (souvent un titre ou un composant "placeholder"). Le but était de valider le squelette complet : pouvoir cliquer, naviguer et vérifier que toutes les pages existent, même si elles sont encore vides. Cette étape a confirmé que l'architecture UI était en place et fidèle au wireframe.
[Capture d'écran : navigation commune avec sidebar + header]


5.3 Mise en place des composants UI partagés

Une fois la structure des pages en place, je me suis concentré sur les composants réutilisables de l'interface. L'application contient beaucoup d'éléments qui reviennent souvent (boutons, cartes, tableaux, formulaires, fenêtres modales, notifications, etc.). Pour gagner du temps et garder un rendu cohérent, j'ai choisi de factoriser ces éléments dès le début en créant une base de composants UI partagés.

Je me suis appuyé sur une bibliothèque adaptée à Next.js et Tailwind : shadcn/ui (basée sur Radix UI). Ce choix m'a permis d'intégrer rapidement des composants solides, accessibles et déjà bien pensés, puis de les ajuster au style de Blaiz'bot. Par exemple, j'ai ajouté un menu déroulant pour les listes d'options, un système de toast pour afficher des messages courts (succès, erreur, info), ainsi que des composants de base comme des boutons, champs de formulaire et éléments de mise en page. En quelques commandes, ces briques ont été intégrées au projet et prêtes à être réutilisées.

En parallèle, j'ai organisé le code pour garder une structure claire. J'ai créé un dossier src/components/ui/ pour les composants génériques d'interface, un dossier src/components/layout/ pour les éléments communs de structure (comme la Sidebar et le Header), et un dossier src/components/features/ pour les composants liés aux fonctionnalités métier. Cette séparation aide à distinguer ce qui est "général" de ce qui est spécifique à Blaiz'bot, ce qui facilite la maintenance.

Une fois cette base posée, j'ai commencé à utiliser ces composants dans les pages. Par exemple, j'ai ajouté des cartes de statistiques sur un dashboard, des toasts pour confirmer certaines actions (comme une connexion réussie), et parfois un indicateur de chargement lorsque des données sont en cours de récupération. Le résultat est une interface plus homogène : mêmes styles, mêmes comportements, et une expérience plus intuitive.
[Capture d'écran : exemple d'un composant réutilisé sur plusieurs pages] 

5.4 Modèle de données et base de données (MVP)

Pour que le MVP de Blaiz'bot fonctionne réellement, il fallait stocker plusieurs types de données : les utilisateurs (avec leur rôle), les cours et leurs ressources, les exercices, les résultats, ainsi que des indicateurs de progression. J'ai donc mis en place une base de données relationnelle correspondant à ce modèle minimal. J'ai choisi PostgreSQL via un service managé (Vercel Postgres / Neon), ce qui évite de gérer l'infrastructure de base de données.

J'ai ensuite défini un schéma de base de données adapté aux besoins du MVP. Le modèle complet comprend 46 tables (modèles Prisma), dont les profils utilisateurs (StudentProfile/TeacherProfile en 1:1 avec User), la structure arborescente des cours (Course → Chapter → Section → Card), les suppléments élève, les conversations IA, la messagerie et le calendrier. On retrouve notamment une table User avec les informations essentielles (nom, email, rôle, etc.). Selon le rôle, l'utilisateur est associé à des données spécifiques : un élève est lié à une classe, tandis qu'un professeur est lié à des matières et à des classes qu'il suit. J'ai aussi prévu des tables Class (groupes d'élèves) et Subject (matières).

Pour la partie pédagogique, j'ai ajouté une table Course qui représente les cours créés par les professeurs (titre, matière, auteur, contenu). Une table Exercise regroupe les exercices liés à un cours. Pour gérer ce qui est donné aux élèves, une table Assignment permet d'assigner un cours ou un exercice à un élève ou à une classe, avec éventuellement une échéance. Enfin, j'ai prévu une table de résultats (scores par exercice) et une table de progression pour suivre l'avancement d'un élève dans un cours.

Pour manipuler ces données facilement dans le code, j'ai utilisé Prisma comme ORM. J'ai décrit toutes les entités et leurs relations dans schema.prisma, puis Prisma génère les méthodes nécessaires pour créer, lire, mettre à jour et supprimer des données, sans écrire de SQL à la main. J'ai ensuite exécuté les migrations vers l'instance PostgreSQL.

Enfin, j'ai préparé un seed (jeu de données de test) comprenant un environnement complet pour la démo : 1 admin, 2 professeurs, 6 élèves répartis dans 4 classes, 6 matières, plusieurs cours avec des cartes pédagogiques, et des données de progression. Même pour un prototype, j'ai stocké les mots de passe sous forme hachée. À partir de là, l'application pouvait déjà s'appuyer sur de vraies données persistantes, ce qui marque une différence essentielle avec le wireframe codé, qui restait surtout statique.
[Capture d'écran : aperçu du schéma Prisma ou exemple de liste (utilisateurs / cours) affichée depuis la base]

5.5 Authentification et rôles

Comme Blaiz'bot propose plusieurs types d'utilisateurs et des espaces réservés à chacun, j'ai mis en place l'authentification dès que la base de données a été opérationnelle. L'objectif était double : permettre à un utilisateur de se connecter avec email + mot de passe, et garantir qu'il n'accède qu'aux pages correspondant à son rôle (admin, professeur ou élève). Pour cela, j'ai utilisé NextAuth.js (v5), bien adapté à Next.js, car il gère proprement les sessions, la sécurité et les redirections.

J'ai d'abord créé une page de connexion accessible à tous, placée dans l'espace public de l'application. Elle contient un formulaire simple : email et mot de passe. À l'envoi, NextAuth vérifie les identifiants en les comparant aux données de la base. Le mot de passe est contrôlé en le comparant à sa version hachée stockée en base (ce qui évite de stocker un mot de passe en clair). Si les identifiants sont corrects, une session est créée. J'ai configuré cette session pour inclure aussi le rôle de l'utilisateur, car c'est ce rôle qui pilote ensuite l'accès aux pages et l'affichage des menus.

Après la connexion, j'ai mis en place une redirection automatique vers l'espace correspondant. Par exemple, un professeur est envoyé vers son tableau de bord (/teacher/dashboard), un élève vers le sien (/student/dashboard), et l'admin vers l'interface d'administration. Cela évite à l'utilisateur de chercher "où aller" et l'amène directement dans son environnement.

J'ai également protégé les routes : côté pages et côté API, la session est vérifiée. J'ai créé un middleware Next.js (src/middleware.ts) qui s'exécute avant chaque requête. Il vérifie la présence d'un token JWT, extrait le rôle de l'utilisateur, et applique les règles RBAC : un professeur ne peut pas accéder aux routes /admin, un élève ne peut pas accéder aux routes /teacher. En cas d'accès non autorisé, redirection vers /unauthorized. Cela garantit qu'un élève ne puisse pas ouvrir une page professeur, et qu'aucun utilisateur non identifié n'accède à des données sensibles.

Dans le MVP, je me suis limité aux trois rôles principaux (admin, professeur, élève). Le rôle Parent existe dans le modèle de données (pour une évolution future), mais aucune interface n'a été implémentée pour ce rôle. Enfin, j'ai ajouté quelques protections simples : cookies de session sécurisés en production (HTTPS) et messages d'erreur génériques pour éviter de révéler si un email existe ou non. À la fin de cette étape, je pouvais me connecter avec les comptes de test et vérifier que chacun voyait exactement ce qu'il devait voir.
[Capture d'écran : écran de connexion + redirection vers le bon dashboard] 

5.6 Développement par phases (méthode réelle d'itération)

Pour développer le MVP de manière efficace, j'ai appliqué une méthode de travail par phases itératives, proche d'un fonctionnement agile. Le projet avait déjà été découpé en phases lors de la fin de la phase 4 (backlog v1). Il ne restait plus qu'à dérouler ce plan en pratique, tâche après tâche, en utilisant le vibe coding comme méthode de production.

Pour chaque phase, je suivais une boucle de travail très régulière. D'abord, je choisissais une tâche précise, volontairement petite (par exemple : "ajouter la création d'un cours", plutôt que "faire tout le module cours"). Ensuite, je rédigeais un prompt clair à l'IA (ChatGPT ou Claude selon le besoin), en donnant le contexte utile : objectif exact, fichiers concernés, contraintes de style ou de sécurité. L'IA proposait alors une solution, généralement du code TypeScript/React, que j'intégrais dans le projet.

La règle la plus importante était de tester immédiatement. Après chaque ajout, je lançais l'application en local et je vérifiais le comportement dans le navigateur. Si quelque chose ne fonctionnait pas, je corrigeais soit en repassant par l'IA avec un prompt plus ciblé ("corrige ce bug", "améliore l'affichage"), soit par de petits ajustements manuels quand c'était plus rapide. Une fois la tâche validée, je faisais un commit Git avec un message explicite. Cela me permettait de figer une étape stable et de garder un historique clair.

Cette boucle peut se résumer ainsi : TODO → prompt → code → test → correctif → commit. Chaque phase regroupait plusieurs tâches, mais je ne me concentrais que sur une à la fois. Par exemple, la phase "Auth" a été traitée étape par étape : page de login, configuration NextAuth, gestion des rôles, tests multi-comptes, etc. Ensuite, je suis passé aux phases suivantes (Admin, Professeur, Élève), puis seulement après à l'intégration IA et à la préparation de la démo.

Travailler ainsi m'a aidé à garder les changements petits et contrôlables. À chaque commit, le projet restait fonctionnel, et en cas de bug, je pouvais identifier rapidement la dernière modification responsable. Cela apporte aussi une forte traçabilité : chaque fonctionnalité correspond à des prompts et à des commits, ce qui sert directement l'objectif du travail de maturité (montrer la démarche).
[Capture d'écran : extrait du backlog avec les tâches cochées montrant la progression]

5.7 Espace Administrateur (cadre de la plateforme)

Après l'authentification, j'ai développé l'espace Administrateur, qui sert de socle à la plateforme. Son rôle est de gérer le cadre général (comptes, rôles, structure) sans intervenir directement dans le contenu pédagogique. Pour le MVP, je me suis concentré sur le minimum nécessaire : gestion des utilisateurs, attribution des rôles, et organisation classes / matières.

L'interface admin s'ouvre sur un dashboard simple, avec quelques statistiques globales (par exemple nombre d'utilisateurs, nombre de cours, etc.). Ce tableau de bord donne une vue d'ensemble, mais l'essentiel se trouve dans les pages de gestion.

La première est la gestion des utilisateurs. J'ai créé une page qui liste tous les comptes (admins, professeurs, élèves) avec leurs informations de base. Depuis cette page, l'administrateur peut ajouter, modifier ou supprimer un utilisateur. Lors de la création, il choisit le rôle, puis peut rattacher la personne à une classe ou à une matière selon le cas. J'ai veillé à ce que seuls les rôles définis dans le système soient disponibles, pour éviter des incohérences.

La deuxième partie est la gestion des classes. L'administrateur peut créer et éditer des classes, qui représentent des groupes d'élèves (par exemple "10H"). Il peut leur donner un nom, un niveau, puis y assigner des élèves via une sélection d'utilisateurs. Cette étape est importante, car ce sont les classes qui permettront ensuite aux professeurs d'assigner des cours ou des devoirs à un groupe entier.

Enfin, j'ai ajouté la gestion des matières. La gestion des matières permet de créer, éditer et supprimer des disciplines (Mathématiques, Français, Histoire, etc.) et de les lier à des professeurs. L'ajout de couleurs ou icônes reste une amélioration possible pour le futur. Ainsi, quand un enseignant crée un cours, il choisit parmi les matières qui lui sont attribuées, ce qui évite des erreurs et facilite le filtrage des contenus.

Côté ergonomie, j'ai gardé cet espace sobre et efficace : tableaux avec actions (éditer, supprimer), bouton d'ajout, et formulaires réutilisables (page dédiée ou fenêtre modale). Avec ces fonctions, l'administrateur peut préparer le terrain : créer les comptes, structurer classes et matières, et s'assurer que chaque utilisateur est bien catégorisé.
[Capture d'écran : gestion des utilisateurs dans l'interface admin]

5.8 Espace Professeur (contenu et suivi)

Le développement de l'espace Professeur a été une étape centrale, car c'est là que se créent les contenus pédagogiques et que se fait le suivi des élèves. J'ai implémenté ces fonctionnalités progressivement, en gardant l'objectif du MVP : une base complète et testable, sans complexité inutile.

J'ai d'abord réalisé le dashboard professeur. Cette page d'accueil donne une vue rapide sur l'activité : quelques indicateurs (KPI) comme le nombre de classes, le nombre d'élèves, le nombre de cours créés et les messages non lus. J'ai aussi ajouté une zone "alertes" (par exemple devoirs non rendus ou progression très faible), afin que le professeur repère rapidement les points à surveiller. L'affichage reste simple mais lisible, avec des icônes et une présentation claire. Les valeurs sont calculées à partir des données enregistrées (résultats et progression).

Ensuite, j'ai développé la section Mes Cours, qui sert à créer, organiser et modifier le contenu. Le professeur voit la liste de ses cours (titre, matière, informations utiles), avec un bouton Nouveau cours. Le formulaire de création permet de saisir un titre, choisir une matière parmi celles attribuées au professeur, et ajouter une description. Chaque cours est organisé en une structure hiérarchique : Cours → Chapitres → Sections → Cartes. Il existe 5 types de cartes pédagogiques (Note, Leçon, Vidéo, Exercice, Quiz), chacune avec son interface d'édition et ses paramètres spécifiques. Le professeur peut également ajouter des ressources (PDF, liens, images, etc.) via une table dédiée, et éditer le contenu via une interface web basique (champs texte, éditeur, ajout de fichier). Toutes les modifications sont enregistrées en base, afin que l'élève retrouve ensuite le cours tel qu'il a été construit.

Un autre volet important est la gestion des exercices et assignations. J'ai mis en place une page Assignations où le professeur crée un devoir ou un quiz et l'assigne à une classe ou à certains élèves, avec éventuellement une date limite. Une assignation apparaît ensuite dans une liste avec son statut, et le professeur peut consulter le suivi : élèves concernés, état (non commencé / en cours / terminé) et note si disponible. Pour le MVP, la correction reste simple : automatique pour certains formats (ex. QCM) ou saisie manuelle. Les notes alimentent les KPI du dashboard.

J'ai aussi ajouté Mes Classes, permettant au professeur de consulter la composition de ses classes et d'accéder rapidement aux élèves. Enfin, une section Messages permet de communiquer en privé ou en groupe. La messagerie est volontairement basique (pas du temps réel strict), mais conserve l'historique des échanges.

Dernier point : l'espace professeur intègre des actions assistées par IA, comme générer un quiz ou un résumé à partir d'un cours (détaillé plus loin). L'assistant IA est utilisé différemment selon le rôle : côté élève, il agit comme un tuteur pédagogique pour les révisions ; côté professeur, il sert à générer du contenu (quiz, résumés) à partir des cours. J'ai validé l'ensemble avec le compte professeur de démo, en créant un cours, en ajoutant des exercices et en les assignant à l'élève de test, pour vérifier que le suivi et les résultats apparaissent correctement.
[Capture d'écran : interface "Mes Cours" d'un professeur]

5.9 Espace Élève (révision et entraînement)

L'espace Élève constitue le troisième pilier de l'application. J'ai accordé une attention particulière à sa simplicité et à son aspect motivant, car il s'adresse à des utilisateurs jeunes qui ont besoin d'un outil clair et encourageant pour réviser. Après avoir finalisé l'espace professeur, j'ai donc développé les fonctionnalités côté élève, centrées sur l'accès aux contenus, l'entraînement et le suivi de la progression.

À la connexion, l'élève arrive sur un dashboard personnel. Ce tableau de bord présente, en un coup d'œil, les informations essentielles : progression globale (%), moyenne (/20), cours terminés, exercices en attente. Pour le MVP, j'ai privilégié une présentation positive, par exemple avec des barres ou graphiques de progression, afin que l'élève puisse s'auto-évaluer sans ressentir la pression d'une note. Ces données sont calculées à partir de l'historique d'activité et des résultats stockés en base.

Depuis ce dashboard, l'élève accède à plusieurs sections. La page Mes Cours liste tous les cours qui lui ont été assignés. Pour chacun, il voit le titre, la matière, le professeur et son avancement (chapitres terminés / total). En entrant dans un cours, le contenu apparaît tel que structuré par le professeur, chapitre par chapitre, avec textes et ressources. L'élève peut marquer un chapitre comme terminé, ce qui met à jour sa progression et rend l'avancement visuellement explicite.

La section Révisions permet de s'entraîner. D'un côté, l'élève retrouve ses assignations (devoirs ou quiz imposés par le professeur), avec leurs échéances. Il peut répondre aux questions via une interface simple et soumettre son travail. Selon le type d'exercice, un score est affiché immédiatement ou un statut "en attente de correction" apparaît. D'un autre côté, j'ai prévu un mode de révision libre s'appuyant sur des cartes de révision de différents types (notes, leçons, vidéos, exercices, quiz), permettant un entraînement varié. En plus de consulter les cours, l'élève peut créer ses propres suppléments de révision (Mes Révisions). Ces suppléments utilisent les mêmes 5 types de cartes que les cours, mais l'élève est en mode édition. Les suppléments peuvent être liés à un cours existant ou créés de manière indépendante. Les résultats de ces entraînements alimentent également les statistiques du dashboard.

Un agenda complète l'espace élève. Il affiche les échéances importantes (quiz, devoirs, examens simulés) sous forme de liste ou de calendrier. Cette vue aide l'élève à s'organiser et se met à jour automatiquement lorsque le professeur crée ou modifie une assignation. Pour le MVP, cet agenda est informatif, sans fonctionnalités avancées.

L'élève dispose aussi d'une messagerie, lui permettant d'échanger avec ses professeurs ou avec des groupes de classe. L'interface est volontairement simple et conserve l'historique des échanges. Elle complète l'assistant IA, car certaines questions nécessitent un contact humain.

L'élève dispose également d'un module Coach IA qui affiche des indicateurs personnalisés (compréhension, autonomie, rigueur), des badges et des recommandations basées sur son activité. Enfin, l'assistant IA est accessible via une page dédiée de chat, agissant comme un tuteur virtuel disponible à tout moment. En testant l'espace élève avec un compte de démonstration, j'ai pu consulter un cours, réaliser un quiz, utiliser les révisions et poser une question à l'IA. Les mises à jour de progression étaient cohérentes, confirmant que l'espace élève remplit bien son rôle : permettre d'apprendre, de s'entraîner et de suivre ses progrès à son rythme.

5.10 Intégration du chat IA (prompt stack + règles pédagogiques)

Une des fonctionnalités clés de Blaiz'bot est l'intégration d'un assistant conversationnel IA destiné à accompagner l'élève dans ses révisions. Une fois les espaces Professeur et Élève fonctionnels, j'ai donc relié l'application à un modèle de langage avancé, en veillant à encadrer strictement son comportement pour qu'il reste pertinent sur le plan pédagogique.

Techniquement, j'ai utilisé l'API du modèle Gemini 2.0 Flash de Google. Ce modèle supporte le multimodal (texte, image, audio, vidéo), le streaming en temps réel et est optimisé pour la rapidité, ce qui le rend adapté à un usage interactif et éducatif. L'intégration s'est faite via des routes API dédiées dans Next.js, par exemple une route /api/ai/chat pour les échanges conversationnels, et d'autres endpoints pour la génération de quiz ou de contenus. Le frontend élève communique avec ces routes, qui transmettent ensuite la requête au modèle IA.

Cependant, appeler le modèle "brut" n'était pas suffisant. J'ai donc mis en place un prompt stack, c'est-à-dire un ensemble structuré de consignes et de contextes injectés à chaque appel. Le prompt stack se compose de plusieurs couches : (1) le prompt système de base (rôle de tuteur pédagogique), (2) le contexte RAG (extraits du cours en cours), (3) le prompt personnalisé de l'élève (s'il en a défini un), et (4) l'historique de conversation. Cette structure permet à l'IA de répondre de manière contextualisée. D'abord, l'IA reçoit un contexte lié au cours : si l'élève travaille sur un chapitre précis, un résumé ou des extraits pertinents du cours sont ajoutés au prompt. Cela permet à l'IA de rester alignée sur le contenu réellement étudié. Ensuite, j'ai ajouté des règles pédagogiques générales : expliquer étape par étape, privilégier la reformulation, donner des exemples concrets, et éviter de livrer immédiatement la réponse complète.

L'IA est guidée par un prompt système pédagogique qui l'encourage à poser des questions, donner des indices et guider la réflexion plutôt que livrer immédiatement la réponse complète. Ce comportement par défaut favorise l'apprentissage actif : l'assistant donne des pistes, pose des questions intermédiaires et encourage la réflexion. Si l'élève le demande explicitement, l'IA peut alors fournir une explication plus détaillée. Ce fonctionnement permet de conserver une vraie valeur éducative et d'éviter que l'IA ne devienne un simple distributeur de réponses.

J'ai également imposé un format de réponse adapté à l'apprentissage : raisonnement explicité, langage simple, longueur contrôlée pour ne pas surcharger l'élève. Côté interface, le chat est intégré dans une page dédiée de l'espace Élève, avec un affichage en bulles et une réponse en streaming, ce qui rend l'échange plus naturel. L'élève peut aussi réinitialiser la conversation.

Lors des tests, le chatbot s'est montré cohérent et utile : il explique, guide, puis détaille quand on le lui demande. Cette intégration apporte une réelle plus-value pédagogique au prototype Blaiz'bot, en complétant l'enseignant par un tuteur virtuel disponible à tout moment.

5.11 KPI, séparation des vues et confidentialité

Dès le départ, je voulais deux choses : des KPI utiles pour le suivi pédagogique, et une confidentialité réelle pour les échanges entre l'élève et l'assistant IA. À la fin du MVP, j'ai veillé à équilibrer ces deux objectifs.

Côté KPI, j'ai consolidé ce qui existe dans les interfaces Élève et Professeur. L'élève voit sur son dashboard des indicateurs simples : progression globale (%), moyenne (/20), cours terminés, exercices en attente. Ces KPI sont pensés pour l'aider à se situer sans pression. Le professeur, lui, dispose de KPI orientés "suivi de classe" : nombre de classes, nombre d'élèves, nombre de cours créés, messages non lus, ainsi que des moyennes par exercice, taux de réussite, taux de complétion par cours, et signaux qui permettent de repérer rapidement une notion problématique. J'ai également prévu des métriques liées à l'usage de l'IA, par exemple un compteur de questions posées. Techniquement, ces KPI sont calculés via des requêtes agrégées sur la base de données (moyennes, comptages, taux), puis mis en forme dans les dashboards.

La confidentialité a été traitée avec soin. Comme prévu dès la conception, le professeur n'a pas accès au contenu des conversations entre l'élève et le chatbot IA. Même si certains messages peuvent être enregistrés (pour le fonctionnement ou un futur diagnostic), ces données sont stockées dans une zone séparée et ne sont jamais requêtées dans les vues professeur. Un enseignant peut voir des résultats et une progression, mais pas les questions exactes ni les réponses reçues. Les conversations détaillées élève–IA restent privées, mais le professeur peut consulter des indicateurs agrégés (score IA, nombre de sessions) sans accéder au contenu des échanges.

Plus largement, j'ai appliqué une séparation stricte des vues et des données selon les rôles. Le backend filtre les données en fonction de la session : un professeur accède à des résumés (scores, progression), pas à l'historique complet des tentatives ni aux conversations. L'administrateur, de son côté, ne voit que des statistiques globales et agrégées. L'objectif est de préserver un espace de confiance : l'élève doit pouvoir poser des questions librement, sans peur d'être "surveillé".

Enfin, j'ai vérifié les points de sécurité classiques : secrets dans .env.local non commité, mots de passe hachés, et clés API protégées. Au final, Blaiz'bot combine des indicateurs pédagogiquement utiles avec une confidentialité stricte, ce que j'ai validé lors des tests finaux : le suivi est possible, sans fenêtre indiscrète sur les révisions individuelles.
[Capture d'écran : KPI côté prof sans détail de conversations]

5.12 Stabilisation de la démo

Une fois toutes les fonctionnalités principales implémentées, j'ai consacré une phase spécifique à la stabilisation de la démo. L'objectif était de corriger les derniers bugs, de tester l'ensemble des parcours utilisateurs et de garantir une application suffisamment fiable pour être présentée.

J'ai commencé par rejouer plusieurs scénarios complets, de bout en bout, avec les comptes de test (admin, professeur, élève). Par exemple : création d'un cours par le professeur, assignation d'un exercice, réalisation de celui-ci par l'élève, puis consultation des résultats côté professeur. Ces tests en conditions réelles m'ont permis de repérer quelques problèmes mineurs, comme des listes qui ne se rafraîchissaient pas automatiquement ou des éléments de navigation manquants dans certains écrans. Chaque anomalie a été corrigée soit directement dans le code, soit avec l'aide de l'IA via des prompts ciblés, jusqu'à éliminer les dysfonctionnements visibles.

J'ai ensuite effectué un refactoring léger. Certaines parties du code, générées rapidement lors du développement, étaient devenues trop longues ou difficiles à lire. J'ai donc découpé quelques composants trop volumineux en sous-composants plus simples et supprimé du code redondant. Ces modifications n'ont pas changé le comportement de l'application, mais ont amélioré sa lisibilité et sa maintenabilité.

En parallèle, j'ai vérifié la cohérence de l'interface : uniformisation des libellés, contrôle des liens, et tests de navigation. J'ai aussi testé la responsivité sur différentes tailles d'écran (ordinateur, tablette, mobile). Grâce à Tailwind, l'ensemble était déjà fonctionnel, mais j'ai ajusté certains détails, comme le comportement de la barre latérale sur mobile.

Enfin, j'ai validé le déploiement sur Vercel et vérifié que les appels à l'API, notamment ceux liés à l'IA, étaient bien gérés de manière asynchrone avec des indicateurs de chargement.

À l'issue de cette phase, j'ai pu réaliser une démonstration fluide et sans bug bloquant. Le MVP est stable, cohérent et prêt à être présenté, ce qui était un objectif essentiel pour valoriser la démarche et le travail réalisé.
[Capture d'écran : parcours complet de démonstration de l'application]

5.13 Bilan MVP (fini / partiel / repoussé)

Arrivé à la fin du MVP, il est important de faire un bilan honnête. L'objectif était de produire une application fonctionnelle qui démontre clairement le concept de Blaiz'bot, tout en restant dans des contraintes réalistes de temps et de ressources. Le résultat est globalement solide, mais certaines parties sont complètes, d'autres restent simplifiées, et quelques idées ont été repoussées.

**Fini et opérationnel.** Le périmètre principal du MVP est couvert. Les trois interfaces (Administrateur, Professeur, Élève) sont en place et permettent les actions essentielles :
•	l'admin gère les utilisateurs, classes et matières ;
•	le professeur crée et organise des cours (avec la structure hiérarchique chapitres/sections/cartes), assigne des exercices et consulte les résultats ;
•	l'élève accède aux cours, s'entraîne, suit sa progression et peut demander de l'aide au Coach IA.
Le chat IA est intégré et respecte une logique pédagogique (guidage progressif favorisant la réflexion). La messagerie existe également comme canal de communication, même si elle reste volontairement simple. Cela suffit pour démontrer un cycle complet : création d'un cours, assignation, entraînement, résultats.

**Partiel ou à approfondir.** Certaines fonctionnalités existent mais restent basiques. Par exemple, la révision libre (cartes de révision) fonctionne, mais avec un contenu limité : une version plus avancée pourrait générer automatiquement davantage de cartes à partir des cours. Les KPI affichés sont pertinents mais restent "essentiels" : on pourrait ajouter un historique, des graphiques plus détaillés ou des filtres. La messagerie n'est pas en temps réel et ne propose pas de fonctions avancées (notifications push, statuts, etc.), ce qui est acceptable pour une preuve de concept mais devrait évoluer pour un usage réel.

**Repoussé ou volontairement exclu.** Plusieurs idées ont été mises de côté pour tenir le cadre du MVP : support multimédia plus riche, analyses avancées par IA (recommandations automatiques de révision), ou fonctionnalités "LMS" complètes. Les cours disposent d'un état brouillon/publié (isDraft) : le professeur peut préparer un cours en brouillon avant de le publier pour ses élèves. Le rôle Parent existe dans le modèle de données (pour une évolution future), mais aucune interface n'a été implémentée pour ce rôle, car non indispensable à la démonstration.

Enfin, le MVP a été surtout testé "en interne", en jouant moi-même les rôles. Un test avec de vrais élèves et professeurs pourrait révéler des ajustements d'ergonomie ou des besoins supplémentaires.

En conclusion, le MVP est abouti sur ses fonctions fondamentales et remplit son objectif : montrer concrètement une plateforme éducative multi-rôles intégrant une IA, développée rapidement grâce au vibe coding.

---

**Pages estimées** : 16-18 pages  
**Temps de lecture** : 25-30 minutes  
**Mots-clés** : Next.js, TypeScript, Prisma, NextAuth, Gemini, Base de données, Authentification, MVP
