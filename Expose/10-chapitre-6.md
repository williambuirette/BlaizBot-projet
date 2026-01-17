# Chapitre 6 — Fonctionnement de l'application

> Ce chapitre présente le fonctionnement concret de Blaiz'bot une fois le MVP terminé. Il décrit l'architecture technique, les parcours de chaque type d'utilisateur, et montre comment les différentes parties de l'application interagissent entre elles.

---

## 6.1 Architecture technique globale

Avant de décrire ce que voit chaque utilisateur, il est utile de comprendre comment l'application est construite "sous le capot". L'architecture de Blaiz'bot suit un schéma moderne et relativement simple, adapté à un projet de cette taille.

Le cœur de l'application repose sur Next.js, un framework qui permet de gérer à la fois l'interface visible (le front-end) et la logique serveur (les API). Concrètement, quand un utilisateur ouvre une page, Next.js génère le contenu côté serveur et l'envoie au navigateur. Les interactions plus dynamiques (comme envoyer un message ou poser une question à l'IA) passent par des routes API internes, ce qui évite de devoir gérer un serveur séparé.

Pour stocker les données (utilisateurs, cours, résultats, messages), j'utilise une base de données PostgreSQL hébergée chez Vercel. L'accès à cette base se fait via Prisma, un outil qui permet d'écrire des requêtes en TypeScript plutôt qu'en SQL brut. Cela rend le code plus lisible et réduit les risques d'erreurs.

L'authentification est gérée par NextAuth (v5). Quand un utilisateur se connecte, NextAuth vérifie ses identifiants, crée une session sécurisée et stocke un token JWT dans un cookie. Ce token contient le rôle de l'utilisateur (admin, professeur ou élève), ce qui permet ensuite de contrôler l'accès aux différentes pages et fonctionnalités.

Enfin, l'intelligence artificielle est intégrée via l'API Gemini 2.0 Flash de Google. Les appels à l'IA passent par des routes dédiées (/api/ai/chat pour le chat, /api/ai/generate pour la génération de contenu). Les réponses sont envoyées en streaming, ce qui permet d'afficher le texte au fur et à mesure qu'il est généré, comme dans une vraie conversation.

Le tout est déployé sur Vercel. À chaque mise à jour du code sur GitHub, Vercel reconstruit automatiquement l'application et la met en ligne en quelques minutes. Cette automatisation m'a fait gagner beaucoup de temps pendant le développement, car je pouvais tester rapidement chaque modification dans un environnement réel.

[Capture d'écran : schéma simplifié de l'architecture (frontend → API → BDD + IA)]

---

## 6.2 Parcours utilisateur : l'administrateur

L'administrateur est le premier rôle à utiliser l'application, car c'est lui qui prépare le terrain pour les autres. Son espace est volontairement sobre et centré sur la gestion du système.

Après connexion, l'administrateur arrive sur un tableau de bord qui affiche quelques statistiques globales : nombre total d'utilisateurs, de classes, de cours créés, et éventuellement des alertes si quelque chose nécessite son attention. Ce dashboard donne une vue d'ensemble rapide sans entrer dans les détails pédagogiques.

La fonction principale de l'administrateur est la gestion des utilisateurs. Depuis une page dédiée, il peut voir la liste complète des comptes (admins, professeurs, élèves), avec leurs informations de base : nom, email, rôle, classe ou matière associée. Il peut ajouter un nouvel utilisateur via un formulaire simple (nom, email, mot de passe temporaire, rôle), modifier les informations d'un compte existant, ou le supprimer si nécessaire. Quand il crée un professeur, il peut lui attribuer des matières. Quand il crée un élève, il l'assigne à une classe.

La gestion des classes permet de créer et d'organiser les groupes d'élèves. Une classe a un nom (par exemple "10H" ou "3ème B") et un niveau. L'administrateur peut ensuite y ajouter des élèves, ce qui facilite le travail du professeur pour les assignations de cours ou de devoirs.

La gestion des matières fonctionne de la même manière : l'administrateur crée les disciplines disponibles (Mathématiques, Français, Histoire, etc.) et les associe aux professeurs concernés. Ainsi, quand un enseignant crée un cours, il choisit parmi les matières qui lui sont attribuées, ce qui évite les incohérences.

En pratique, l'administrateur intervient surtout au début (création des comptes et de la structure) et ponctuellement ensuite (ajout d'un nouvel élève, modification d'un rôle). Son interface reste volontairement simple, car ce n'est pas lui qui utilise les fonctions pédagogiques au quotidien.

[Capture d'écran : page de gestion des utilisateurs dans l'interface admin]

---

## 6.3 Parcours utilisateur : le professeur

L'espace Professeur est au cœur de Blaiz'bot, car c'est là que se créent les contenus pédagogiques et que se fait le suivi des élèves. J'ai voulu rendre cet espace à la fois complet et accessible, pour qu'un enseignant puisse l'utiliser sans formation préalable.

À la connexion, le professeur arrive sur son tableau de bord. Celui-ci affiche des indicateurs utiles : nombre de classes suivies, nombre d'élèves total, nombre de cours créés, et messages non lus. Une zone "alertes" peut signaler des points d'attention, comme des devoirs non rendus ou des élèves dont la progression est très faible. Ces informations permettent au professeur de repérer rapidement ce qui mérite son attention.

La section "Mes Cours" est l'outil principal de création de contenu. Le professeur y voit la liste de ses cours, avec le titre, la matière et quelques informations pratiques. En cliquant sur "Nouveau cours", il accède à un formulaire pour créer un nouveau contenu. La structure d'un cours est hiérarchique : un cours contient des chapitres, chaque chapitre contient des sections, et chaque section peut contenir différents types de cartes pédagogiques. J'ai défini cinq types de cartes : Note (texte libre), Leçon (contenu structuré), Vidéo (lien vers une ressource), Exercice (question ouverte) et Quiz (QCM avec correction automatique). Le professeur peut aussi ajouter des ressources complémentaires (PDF, liens, images) à n'importe quel niveau de la structure.

Une fois un cours créé, le professeur peut l'assigner à ses élèves. La page "Assignations" permet de choisir un cours ou un exercice spécifique, puis de l'attribuer à une classe entière ou à certains élèves, avec éventuellement une date limite. L'assignation apparaît ensuite automatiquement dans l'espace élève concerné. Le professeur peut suivre l'avancement : qui a commencé, qui a terminé, quelles sont les notes obtenues.

La section "Mes Classes" donne un accès rapide à la composition de chaque groupe. Le professeur peut voir quels élèves font partie d'une classe, consulter leur progression individuelle, et accéder à leurs résultats détaillés si besoin.

La messagerie permet d'échanger avec les élèves, soit individuellement, soit par groupe. Elle reste volontairement simple (pas de temps réel strict), mais conserve l'historique des conversations, ce qui est suffisant pour un suivi pédagogique.

Enfin, le professeur dispose d'un assistant IA orienté création de contenu. Contrairement à l'élève qui utilise l'IA pour réviser, le professeur peut l'utiliser pour générer automatiquement des quiz à partir d'un cours, créer des résumés ou obtenir des suggestions d'exercices. Cette fonctionnalité est accessible via des boutons dédiés dans l'interface de gestion des cours.

[Capture d'écran : interface de création d'un cours avec la structure chapitres/sections/cartes]

---

## 6.4 Parcours utilisateur : l'élève

L'espace Élève est celui que j'ai voulu rendre le plus simple et le plus encourageant possible. Un élève qui se connecte doit comprendre immédiatement où il en est et quoi faire ensuite.

Le tableau de bord affiche des indicateurs personnalisés : progression globale (en pourcentage), moyenne actuelle (sur 20), nombre de cours terminés, et liste des exercices à faire. J'ai privilégié une présentation positive, avec des barres de progression et des couleurs encourageantes, pour que l'élève puisse s'auto-évaluer sans ressentir uniquement la pression d'une note. Ces données sont calculées automatiquement à partir de l'historique d'activité.

La section "Mes Cours" liste tous les cours qui ont été assignés à l'élève. Pour chacun, il voit le titre, la matière, le professeur responsable et son avancement (chapitres terminés sur le total). En entrant dans un cours, le contenu apparaît tel que structuré par le professeur : chapitres, sections, cartes pédagogiques. L'élève peut lire le contenu, regarder les vidéos, et marquer chaque section comme terminée. Cette progression est enregistrée et visible sur le dashboard.

La section "Révisions" regroupe deux types d'activités. D'un côté, les exercices assignés par le professeur, avec leurs dates limites. L'élève peut y répondre directement via l'interface et soumettre son travail. Selon le type d'exercice (QCM ou question ouverte), la correction est automatique ou en attente de validation par le professeur. De l'autre côté, l'élève peut créer ses propres suppléments de révision. Ces suppléments utilisent les mêmes types de cartes que les cours (notes, leçons, quiz), mais c'est l'élève qui les crée pour son usage personnel. C'est utile pour organiser ses propres fiches de révision.

L'agenda affiche les échéances importantes : devoirs à rendre, quiz programmés, examens à venir. Cette vue aide l'élève à s'organiser et se met à jour automatiquement quand le professeur crée ou modifie une assignation.

La messagerie permet d'échanger avec les professeurs ou avec les autres élèves de la classe. Comme côté professeur, elle reste simple mais conserve l'historique des échanges.

Enfin, l'élève dispose d'un module "Coach IA" qui affiche des indicateurs personnalisés (compréhension, autonomie, rigueur) ainsi que des recommandations basées sur son activité. Ce module complète l'assistant IA principal en offrant une vue d'ensemble de la progression.

[Capture d'écran : tableau de bord élève avec progression et exercices à faire]

---

## 6.5 Fonctionnement de l'assistant IA

L'assistant IA est une des fonctionnalités centrales de Blaiz'bot. Son rôle est d'accompagner l'élève dans ses révisions, comme un tuteur virtuel disponible à tout moment. J'ai voulu qu'il soit utile sans être un simple distributeur de réponses.

Techniquement, l'assistant utilise l'API Gemini 2.0 Flash de Google. Ce modèle est rapide, supporte le multimodal (texte, image) et peut générer des réponses en streaming, ce qui rend l'échange plus naturel. L'interface de chat ressemble à une messagerie classique : l'élève tape sa question, et la réponse s'affiche progressivement, mot par mot.

Ce qui rend l'assistant pertinent, c'est le système de "prompt stack" que j'ai mis en place. À chaque échange, le modèle reçoit plusieurs couches d'informations. D'abord, un prompt système de base qui définit son rôle : "Tu es un tuteur pédagogique bienveillant, tu aides l'élève à comprendre sans donner directement les réponses." Ensuite, le contexte du cours en cours : si l'élève travaille sur un chapitre précis, des extraits pertinents de ce cours sont ajoutés au prompt. Cela permet à l'IA de répondre en lien avec ce qui est réellement étudié. Enfin, l'historique de la conversation est inclus, pour que l'IA se souvienne des échanges précédents.

J'ai aussi ajouté des règles pédagogiques dans le prompt système. L'IA est encouragée à poser des questions, donner des indices et guider la réflexion plutôt que livrer immédiatement la solution complète. Par exemple, si un élève demande "comment résoudre cette équation ?", l'assistant va d'abord demander "qu'as-tu déjà essayé ?" ou "quel est le premier terme que tu peux isoler ?". Si l'élève insiste ou dit qu'il est bloqué, l'IA peut alors donner une explication plus détaillée. Ce comportement favorise l'apprentissage actif.

En plus du chat libre, l'assistant propose des actions rapides : générer un quiz sur le chapitre en cours, créer un résumé, ou demander une explication d'un exercice spécifique. Ces boutons sont accessibles directement dans l'interface et déclenchent des prompts pré-configurés.

Côté confidentialité, les conversations entre l'élève et l'IA restent privées. Le professeur ne peut pas lire le contenu des échanges. Il a accès uniquement à des indicateurs agrégés : nombre de questions posées, score IA (si l'élève a utilisé des quiz générés), mais jamais au détail des discussions. Cette séparation est importante pour que l'élève se sente libre de poser des questions sans crainte d'être jugé.

[Capture d'écran : interface de chat avec l'assistant IA]

---

## 6.6 Flux de données et interactions entre modules

Pour comprendre comment les différentes parties de l'application communiquent, voici les principaux flux de données.

Le premier flux est la création de contenu. Quand un professeur crée un cours, les données sont envoyées à l'API (/api/teacher/courses), qui les enregistre dans la base de données via Prisma. Le cours est alors stocké avec sa structure hiérarchique (chapitres, sections, cartes). Quand le professeur assigne ce cours à une classe, une entrée est créée dans la table des assignations, avec une référence au cours et aux élèves concernés. À partir de ce moment, le cours apparaît automatiquement dans l'espace "Mes Cours" des élèves de cette classe.

Le deuxième flux concerne la progression. Quand un élève marque une section comme terminée ou complète un exercice, cette information est envoyée à l'API (/api/student/progress ou /api/student/exercises). Les données sont enregistrées dans les tables de progression et de résultats. Ces tables alimentent ensuite les KPI affichés sur les dashboards : progression globale de l'élève, moyenne, taux de complétion. Côté professeur, les mêmes données permettent d'afficher le suivi par élève ou par classe.

Le troisième flux est celui de l'IA. Quand l'élève envoie un message dans le chat, la requête passe par /api/ai/chat. Cette route récupère d'abord le contexte nécessaire : le cours en cours (via une requête Prisma), l'historique de conversation récent, et les paramètres de prompt. Elle construit ensuite le prompt complet et l'envoie à l'API Gemini. La réponse revient en streaming et est transmise au front-end, qui l'affiche progressivement. Si l'élève utilise un bouton de génération (quiz, résumé), la route /api/ai/generate est utilisée, avec un prompt différent adapté à la tâche demandée.

Le quatrième flux est la messagerie. Les messages entre utilisateurs sont stockés dans une table dédiée, avec l'expéditeur, le destinataire (ou le groupe), et le contenu. Quand un utilisateur ouvre une conversation, les messages sont chargés par ordre chronologique. La messagerie n'est pas en temps réel strict (pas de WebSocket), mais les données sont rafraîchies régulièrement pour afficher les nouveaux messages.

Enfin, l'authentification intervient à chaque requête. Le middleware Next.js vérifie la présence du token JWT et extrait le rôle de l'utilisateur. Ce rôle est utilisé pour filtrer les données : un élève ne peut accéder qu'à ses propres cours et résultats, un professeur ne voit que ses classes, et l'admin a une vue globale mais sans détail des conversations IA.

[Schéma : flux simplifié Professeur → Base de données → Élève]

---

## 6.7 Scénario de démonstration complet

Pour valider que l'application fonctionne de bout en bout, j'ai suivi un scénario de démonstration complet qui reproduit un cas d'usage réaliste. Ce scénario permet de vérifier que tous les modules interagissent correctement.

**Étape 1 : Préparation par l'administrateur.** L'admin se connecte et crée deux comptes : un professeur (M. Dupont, mathématiques) et un élève (Marie, classe 10H). Il crée également la classe "10H" et y assigne Marie. Il associe la matière "Mathématiques" à M. Dupont.

**Étape 2 : Création d'un cours par le professeur.** M. Dupont se connecte, accède à "Mes Cours" et crée un nouveau cours intitulé "Les fractions". Il ajoute deux chapitres : "Introduction aux fractions" et "Opérations sur les fractions". Dans le premier chapitre, il crée une section "Définition" avec une carte Leçon expliquant ce qu'est une fraction, et une carte Quiz avec trois questions à choix multiples.

**Étape 3 : Assignation à l'élève.** Toujours connecté, M. Dupont va dans "Assignations", sélectionne le cours "Les fractions" et l'assigne à la classe 10H, avec une date limite dans deux semaines.

**Étape 4 : L'élève consulte le cours.** Marie se connecte. Sur son dashboard, elle voit "1 exercice à faire". Elle clique sur "Mes Cours" et trouve le cours "Les fractions". Elle ouvre le premier chapitre, lit la leçon sur la définition des fractions, puis marque la section comme terminée. Sa barre de progression passe de 0% à 25%.

**Étape 5 : L'élève pose une question à l'IA.** Marie ne comprend pas bien comment additionner des fractions. Elle ouvre l'assistant IA et tape : "Comment additionner deux fractions ?" L'assistant lui répond en posant d'abord une question : "Que penses-tu qu'il faut faire avec les dénominateurs ?" Marie réfléchit et répond "les mettre égaux ?". L'assistant confirme et explique la méthode étape par étape.

**Étape 6 : L'élève fait le quiz.** Marie retourne au cours et lance le quiz du premier chapitre. Elle répond aux trois questions. Le score s'affiche immédiatement : 2/3. La réponse incorrecte est indiquée avec une explication.

**Étape 7 : Le professeur consulte les résultats.** M. Dupont se reconnecte et va dans "Mes Classes" puis sélectionne la 10H. Il voit que Marie a une progression de 25% sur le cours "Les fractions" et un score de 66% au premier quiz. Il peut décider de lui envoyer un message d'encouragement ou d'organiser une révision en classe sur le point qui a posé problème.

Ce scénario valide l'ensemble du flux : création de contenu, assignation, consultation, interaction avec l'IA, évaluation et suivi. Lors de mes tests, tout a fonctionné correctement, ce qui confirme que le MVP est opérationnel et prêt à être présenté.

[Captures d'écran : montage des 7 étapes du scénario]

---

**Pages estimées** : 8-10 pages  
**Temps de lecture** : 12-15 minutes  
**Mots-clés** : Architecture, Next.js, Prisma, Gemini, Parcours utilisateur, Chat IA, Démonstration
