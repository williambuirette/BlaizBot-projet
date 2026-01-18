# Chapitre 5 — Développement de l'application (implémentation du MVP)

> **Stack technique** : Next.js 16.1.1 | React 19.2.3 | TypeScript 5.x (strict) | Tailwind CSS v4 | Prisma 6.19 | NextAuth v5 | Gemini 2.0 Flash

---

## 5.1 Initialisation du dépôt applicatif

J'ai démarré le développement en créant le dépôt principal. Stack moderne : Next.js 16.1.1 (avec React 19.2.3), TypeScript strict, Tailwind CSS v4. Ce choix correspond à l'architecture prévue et offre un environnement full-stack adapté au vibe coding. Premier objectif : un "Hello World" qui tourne en local.

J'ai utilisé la commande officielle de Next.js pour générer la structure de base. **Première difficulté** : npm refusait le nom "BlaizBot" à cause des majuscules (le nom du package doit être en minuscules). Solution : initialiser dans un dossier temporaire sans majuscules, puis déplacer les fichiers dans "BlaizBot-V1" et ajuster la config. Le projet a pu se lancer.

J'ai activé le mode strict de TypeScript pour garder une bonne discipline et ajouté quelques options de sécurité. Vérification Tailwind : la v4 (fin 2025) introduit une nouvelle syntaxe, donc j'ai confirmé que le fichier global utilisait `@import "tailwindcss";`. Serveur lancé, page par défaut affichée sur le port 3000. En moins d'une heure, dépôt initialisé et première version exécutable.

---

## 5.2 Traduction du wireframe codé en routes / layouts / navigation

Projet Next.js en place. J'ai reproduit l'ossature de l'interface validée dans le wireframe codé. L'objectif : traduire chaque écran et chaque parcours en pages réelles. J'ai utilisé l'App Router, qui organise les routes à partir de l'arborescence des dossiers.

**Structure en trois sections** correspondant aux rôles : Administrateur, Professeur, Élève. Un espace pour les pages publiques (connexion), puis un dossier parent pour les pages accessibles uniquement après authentification. À l'intérieur, trois sous-espaces (admin, teacher, student). Cette organisation reflète la logique du projet : chaque rôle a son propre environnement avec ses pages dédiées.

**Layouts partagés** pour une navigation uniforme. Toutes les pages internes reprennent la même structure : sidebar pour naviguer, header pour le contexte, zone centrale pour le contenu. Grâce aux layouts de Next.js, j'ai défini une mise en page commune — les pages admin, prof et élève héritent automatiquement de la même structure.

Pour chaque page du wireframe, j'ai créé la route correspondante et ajouté un contenu minimal (titre ou placeholder). Le but : valider le squelette complet, pouvoir cliquer et naviguer, vérifier que toutes les pages existent même si elles sont vides. L'architecture UI était en place.

---

## 5.3 Mise en place des composants UI partagés

Structure des pages en place. Je me suis concentré sur les **composants réutilisables**. L'application contient beaucoup d'éléments qui reviennent souvent (boutons, cartes, tableaux, formulaires, modales, notifications...). Pour gagner du temps et garder un rendu cohérent, j'ai factorisé ces éléments dès le début.

Je me suis appuyé sur **shadcn/ui** (basée sur Radix UI), adaptée à Next.js et Tailwind. Ça m'a permis d'intégrer rapidement des composants solides, accessibles, puis de les ajuster au style de Blaiz'bot. Menu déroulant, système de toast pour les messages courts, boutons, champs de formulaire, éléments de mise en page — en quelques commandes, ces briques étaient intégrées et prêtes à l'emploi.

J'ai organisé le code pour garder une structure claire :
- `src/components/ui/` → composants génériques d'interface
- `src/components/layout/` → éléments de structure (Sidebar, Header)
- `src/components/features/` → composants liés aux fonctionnalités métier

Cette séparation distingue ce qui est "général" de ce qui est spécifique à Blaiz'bot. Plus facile à maintenir.

J'ai utilisé ces composants dans les pages : cartes de stats sur un dashboard, toasts pour confirmer des actions (connexion réussie), indicateurs de chargement. Résultat : interface homogène, mêmes styles, mêmes comportements.

---

## 5.4 Modèle de données et base de données (MVP)

Pour que le MVP fonctionne réellement, il fallait stocker les données : utilisateurs (avec rôle), cours et ressources, exercices, résultats, indicateurs de progression. J'ai mis en place une base de données relationnelle avec **PostgreSQL** via un service managé (Vercel Postgres / Neon) — pas d'infrastructure à gérer.

**Schéma de la base** : 46 modèles Prisma. Parmi eux :
- Profils utilisateurs (StudentProfile/TeacherProfile en 1:1 avec User)
- Structure hiérarchique des cours (Course → Chapter → Section → Card)
- 5 types de cartes pédagogiques (Note, Leçon, Vidéo, Exercice, Quiz)
- Suppléments élève, conversations IA, messagerie, calendrier

La table **User** contient les infos essentielles (nom, email, rôle). Selon le rôle, l'utilisateur est associé à des données spécifiques : un élève est lié à une classe, un professeur à des matières et classes. Tables **Class** (groupes d'élèves) et **Subject** (matières).

Partie pédagogique : table **Course** (cours créés par les profs), table **Exercise** (exercices liés à un cours), table **Assignment** (assigner un cours ou exercice à un élève/classe avec échéance). Tables de résultats (scores) et de progression.

J'ai utilisé **Prisma** comme ORM. Décrit toutes les entités dans `schema.prisma`, Prisma génère les méthodes CRUD sans écrire de SQL. Migrations exécutées vers PostgreSQL.

**Seed de démo** : 1 admin, 2 professeurs, 6 élèves répartis dans 4 classes, 6 matières, plusieurs cours avec cartes pédagogiques, données de progression. Mots de passe hachés même pour un prototype. À partir de là, l'application s'appuyait sur de vraies données persistantes — différence essentielle avec le wireframe statique.
---

## 5.5 Authentification et rôles

Blaiz'bot propose plusieurs types d'utilisateurs avec des espaces réservés. J'ai mis en place l'authentification dès que la base de données était opérationnelle. Double objectif : permettre de se connecter avec email + mot de passe, et garantir que chacun n'accède qu'aux pages de son rôle. Pour ça, **NextAuth.js (v5)**, bien adapté à Next.js.

**Page de connexion** dans l'espace public. Formulaire simple : email et mot de passe. À l'envoi, NextAuth vérifie les identifiants en les comparant à la base. Le mot de passe est contrôlé en comparant sa version hachée — jamais de mot de passe en clair. Si c'est bon, session créée. J'ai configuré cette session pour inclure le rôle, car c'est ce rôle qui pilote ensuite l'accès aux pages et l'affichage des menus.

**Redirection automatique** après connexion vers l'espace correspondant. Un professeur → `/teacher/dashboard`, un élève → `/student/dashboard`, l'admin → interface d'administration. L'utilisateur arrive directement dans son environnement.

**Protection des routes** : côté pages et côté API, la session est vérifiée. J'ai créé un middleware Next.js (`src/middleware.ts`) qui s'exécute avant chaque requête. Il vérifie le token JWT, extrait le rôle, applique les règles RBAC : un professeur ne peut pas accéder aux routes `/admin`, un élève ne peut pas accéder aux routes `/teacher`. Accès non autorisé → redirection vers `/unauthorized`.

Le rôle Parent existe dans le modèle (pour une évolution future), mais aucune interface n'a été implémentée. Protections simples ajoutées : cookies sécurisés en production (HTTPS), messages d'erreur génériques pour ne pas révéler si un email existe ou non. À la fin de cette étape, je pouvais me connecter avec les comptes de test et vérifier que chacun voyait exactement ce qu'il devait voir.

---

## 5.6 Développement par phases (méthode réelle d'itération)

Pour développer le MVP efficacement, j'ai appliqué une méthode par **phases itératives**, proche d'un fonctionnement agile. Le projet avait été découpé en phases lors du backlog v1. Il restait à dérouler ce plan, tâche après tâche.

Pour chaque phase, une boucle de travail très régulière :
1. Choisir une tâche précise, volontairement petite ("ajouter la création d'un cours", pas "faire tout le module cours")
2. Rédiger un prompt clair à l'IA (ChatGPT ou Claude), avec le contexte utile : objectif exact, fichiers concernés, contraintes
3. Intégrer le code proposé dans le projet
4. **Tester immédiatement** — la règle la plus importante
5. Corriger si nécessaire (repasser par l'IA ou ajustements manuels)
6. Commit Git avec message explicite

Cette boucle : **TODO → prompt → code → test → correctif → commit**

Chaque phase regroupait plusieurs tâches, mais je ne me concentrais que sur une à la fois. La phase "Auth" a été traitée étape par étape : page de login, configuration NextAuth, gestion des rôles, tests multi-comptes. Puis phases suivantes (Admin, Professeur, Élève), puis intégration IA, puis démo.

Travailler ainsi m'a aidé à garder les changements petits et contrôlables. À chaque commit, le projet restait fonctionnel. En cas de bug, j'identifiais rapidement la dernière modification responsable. Forte traçabilité : chaque fonctionnalité correspond à des prompts et des commits — ce qui sert directement l'objectif du travail de maturité.
---

## 5.7 Espace Administrateur (cadre de la plateforme)

Après l'authentification, j'ai développé l'**espace Administrateur** — le socle de la plateforme. Son rôle : gérer le cadre général (comptes, rôles, structure) sans intervenir dans le contenu pédagogique. Pour le MVP, je me suis concentré sur le minimum : gestion des utilisateurs, attribution des rôles, organisation classes/matières.

**Dashboard admin** : quelques statistiques globales (nombre d'utilisateurs, nombre de cours). Vue d'ensemble, mais l'essentiel est dans les pages de gestion.

**Gestion des utilisateurs** : page qui liste tous les comptes (admins, profs, élèves) avec leurs infos de base. L'admin peut ajouter, modifier ou supprimer un utilisateur. Lors de la création, il choisit le rôle, puis peut rattacher la personne à une classe ou à une matière. Seuls les rôles définis dans le système sont disponibles.

**Gestion des classes** : créer et éditer des classes (groupes d'élèves, par exemple "10H"). Nom, niveau, puis assignation des élèves. Important : ce sont les classes qui permettent aux profs d'assigner cours ou devoirs à un groupe entier.

**Gestion des matières** : créer, éditer, supprimer des disciplines (Maths, Français, Histoire...) et les lier à des professeurs. Quand un enseignant crée un cours, il choisit parmi les matières qui lui sont attribuées.

Ergonomie sobre : tableaux avec actions (éditer, supprimer), bouton d'ajout, formulaires réutilisables. Avec ces fonctions, l'admin prépare le terrain pour le reste.

---

## 5.8 Espace Professeur (contenu et suivi)

L'**espace Professeur** a été une étape centrale — c'est là que se créent les contenus pédagogiques et que se fait le suivi des élèves. Implémentation progressive, objectif MVP : base complète et testable.

**Dashboard professeur** : page d'accueil avec vue rapide sur l'activité. KPI : nombre de classes, d'élèves, de cours créés, messages non lus. Zone "alertes" (devoirs non rendus, progression faible). Affichage simple, icônes, présentation claire. Valeurs calculées depuis la base.

**Mes Cours** : créer, organiser, modifier le contenu. Liste des cours (titre, matière), bouton "Nouveau cours". Formulaire : titre, matière (parmi celles attribuées), description. Structure hiérarchique : **Cours → Chapitres → Sections → Cartes**. 5 types de cartes pédagogiques (Note, Leçon, Vidéo, Exercice, Quiz), chacune avec son interface d'édition. Possibilité d'ajouter des ressources (PDF, liens, images). Toutes les modifs enregistrées en base.

**Assignations** : page où le prof crée un devoir ou quiz et l'assigne à une classe ou des élèves, avec date limite optionnelle. Liste avec statut, suivi : élèves concernés, état (non commencé / en cours / terminé), note si disponible. Correction simple pour le MVP : automatique pour les QCM ou saisie manuelle. Les notes alimentent les KPI.

**Mes Classes** : consulter la composition des classes, accéder rapidement aux élèves. **Messages** : communication privée ou en groupe, basique mais avec historique.

L'espace professeur intègre des **actions assistées par IA** : générer un quiz ou un résumé à partir d'un cours. L'assistant IA sert à générer du contenu côté prof (différent du tuteur pédagogique côté élève). Validé avec le compte prof de démo : création cours, ajout exercices, assignation à l'élève test, vérification du suivi.
---

## 5.9 Espace Élève (révision et entraînement)

L'**espace Élève** — troisième pilier de l'application. J'ai accordé une attention particulière à sa simplicité et son aspect motivant. Il s'adresse à des utilisateurs jeunes qui ont besoin d'un outil clair et encourageant.

**Dashboard personnel** à la connexion. En un coup d'œil : progression globale (%), moyenne (/20), cours terminés, exercices en attente. Présentation positive (barres de progression) pour que l'élève puisse s'auto-évaluer sans pression. Données calculées depuis l'historique d'activité.

Depuis le dashboard, plusieurs sections :

- **Mes Cours** : tous les cours assignés. Titre, matière, professeur, avancement (chapitres terminés / total). En entrant dans un cours, le contenu apparaît chapitre par chapitre. L'élève peut marquer un chapitre comme terminé → mise à jour de la progression.

- **Révisions** : s'entraîner. D'un côté, les assignations (devoirs/quiz imposés, avec échéances). Répondre via interface simple, soumettre, score immédiat ou "en attente de correction". D'un autre côté, mode révision libre avec cartes de différents types. L'élève peut aussi créer ses propres suppléments (**Mes Révisions**) — mêmes 5 types de cartes, mode édition. Ces résultats alimentent les stats du dashboard.

- **Agenda** : échéances importantes (quiz, devoirs, examens) sous forme de liste ou calendrier. Mise à jour automatique quand le prof crée/modifie une assignation.

- **Messagerie** : échanger avec les profs ou groupes de classe. Interface simple, historique conservé. Complète l'assistant IA car certaines questions nécessitent un contact humain.

- **Coach IA** : indicateurs personnalisés (compréhension, autonomie, rigueur), badges, recommandations basées sur l'activité.

- **Assistant IA** : page dédiée de chat, tuteur virtuel disponible à tout moment.

Test avec compte de démo : consulter un cours, faire un quiz, utiliser les révisions, poser une question à l'IA. Mises à jour de progression cohérentes. L'espace élève remplit son rôle : apprendre, s'entraîner, suivre ses progrès à son rythme.

---

## 5.10 Intégration du chat IA (prompt stack + règles pédagogiques)

Fonctionnalité clé de Blaiz'bot : un **assistant conversationnel IA** pour accompagner l'élève dans ses révisions. Une fois les espaces Professeur et Élève fonctionnels, j'ai relié l'application à un modèle de langage, en encadrant strictement son comportement.

**Techniquement** : API **Gemini 2.0 Flash** de Google. Ce modèle supporte le multimodal (texte, image, audio, vidéo), le streaming temps réel, et il est optimisé pour la rapidité — adapté à un usage interactif. Intégration via routes API dans Next.js (`/api/ai/chat` pour les échanges, autres endpoints pour quiz/contenus). Le frontend communique avec ces routes, qui transmettent au modèle.

Mais appeler le modèle "brut" ne suffisait pas. J'ai mis en place un **prompt stack** — ensemble structuré de consignes injectées à chaque appel :
1. Prompt système de base (rôle de tuteur pédagogique)
2. Contexte RAG (extraits du cours en cours)
3. Prompt personnalisé de l'élève (s'il en a défini un)
4. Historique de conversation

L'IA reçoit un contexte lié au cours : si l'élève travaille sur un chapitre, des extraits pertinents sont ajoutés au prompt. L'IA reste alignée sur le contenu réellement étudié. Règles pédagogiques générales : expliquer étape par étape, privilégier la reformulation, donner des exemples concrets.

**Comportement par défaut** : l'IA pose des questions, donne des indices, guide la réflexion plutôt que livrer la réponse complète. Apprentissage actif. Si l'élève demande explicitement, l'IA détaille plus. Ce fonctionnement évite que l'IA devienne un simple distributeur de réponses.

Format de réponse adapté : raisonnement explicité, langage simple, longueur contrôlée. Interface : page dédiée dans l'espace Élève, affichage en bulles, réponse en streaming, possibilité de réinitialiser la conversation.

Lors des tests, le chatbot s'est montré cohérent et utile : il explique, guide, puis détaille quand demandé. Cette intégration apporte une vraie plus-value pédagogique.
---

## 5.11 KPI, séparation des vues et confidentialité

Dès le départ, je voulais deux choses : des **KPI utiles** pour le suivi pédagogique, et une **confidentialité réelle** pour les échanges élève–IA. À la fin du MVP, j'ai équilibré ces deux objectifs.

**Côté KPI** : l'élève voit sur son dashboard progression globale (%), moyenne (/20), cours terminés, exercices en attente — pour l'aider à se situer sans pression. Le professeur a des KPI orientés "suivi de classe" : nombre de classes, d'élèves, de cours, messages non lus, moyennes par exercice, taux de réussite, taux de complétion par cours, signaux pour repérer les notions problématiques. Métriques liées à l'IA aussi (compteur de questions posées). Techniquement : requêtes agrégées sur la base (moyennes, comptages, taux), mises en forme dans les dashboards.

**Confidentialité** traitée avec soin. Comme prévu, le professeur n'a pas accès au contenu des conversations élève–chatbot. Même si certains messages sont enregistrés (pour le fonctionnement), ces données sont stockées dans une zone séparée et jamais requêtées dans les vues professeur. Un enseignant voit résultats et progression, pas les questions exactes ni les réponses reçues. Il peut consulter des indicateurs agrégés (score IA, nombre de sessions), pas le contenu des échanges.

**Séparation stricte des vues et données** selon les rôles. Le backend filtre selon la session : un prof accède aux résumés (scores, progression), pas à l'historique complet. L'admin ne voit que des stats globales. Objectif : préserver un espace de confiance. L'élève doit pouvoir poser des questions librement, sans peur d'être "surveillé".

Points de sécurité classiques vérifiés : secrets dans `.env.local` non commité, mots de passe hachés, clés API protégées. Blaiz'bot combine indicateurs pédagogiques utiles + confidentialité stricte. Validé lors des tests : le suivi est possible, sans fenêtre indiscrète sur les révisions individuelles.

---

## 5.12 Stabilisation de la démo

Fonctionnalités principales implémentées. J'ai consacré une phase spécifique à la **stabilisation** : corriger les derniers bugs, tester tous les parcours, garantir une application fiable pour la présentation.

J'ai rejoué plusieurs scénarios complets avec les comptes de test (admin, prof, élève). Exemple : création d'un cours par le prof, assignation d'un exercice, réalisation par l'élève, consultation des résultats côté prof. Ces tests m'ont permis de repérer des problèmes mineurs — listes qui ne se rafraîchissaient pas, éléments de navigation manquants. Chaque anomalie corrigée directement ou via prompts ciblés.

**Refactoring léger** : certaines parties du code, générées rapidement, étaient devenues trop longues ou difficiles à lire. J'ai découpé quelques composants volumineux en sous-composants et supprimé du code redondant. Pas de changement de comportement, mais meilleure lisibilité et maintenabilité.

Vérification de la cohérence de l'interface : uniformisation des libellés, contrôle des liens, tests de navigation. Tests de responsivité (ordinateur, tablette, mobile) — grâce à Tailwind, fonctionnel, avec quelques ajustements (comportement sidebar sur mobile).

Validation du déploiement sur Vercel. Appels API (notamment IA) gérés de manière asynchrone avec indicateurs de chargement.

À l'issue de cette phase : démonstration fluide, pas de bug bloquant. MVP stable, cohérent, prêt à être présenté.

---

## 5.13 Bilan MVP (fini / partiel / repoussé)

Fin du MVP. Bilan honnête nécessaire. L'objectif était une application fonctionnelle qui démontre clairement le concept, dans des contraintes réalistes de temps et de ressources. Résultat globalement solide, mais certaines parties sont complètes, d'autres simplifiées, quelques idées repoussées.

**Fini et opérationnel.** Le périmètre principal est couvert. Les trois interfaces permettent les actions essentielles :
- L'admin gère utilisateurs, classes, matières
- Le prof crée et organise des cours (structure hiérarchique), assigne des exercices, consulte les résultats
- L'élève accède aux cours, s'entraîne, suit sa progression, utilise le Coach IA

Le chat IA est intégré avec logique pédagogique. La messagerie existe. Ça suffit pour démontrer un cycle complet : création cours → assignation → entraînement → résultats.

**Partiel ou à approfondir.** Certaines fonctionnalités restent basiques. La révision libre fonctionne mais avec contenu limité — une version avancée pourrait générer automatiquement des cartes depuis les cours. Les KPI sont pertinents mais "essentiels" : on pourrait ajouter historique, graphiques détaillés, filtres. La messagerie n'est pas temps réel, pas de notifications push — acceptable pour une preuve de concept.

**Repoussé ou exclu.** Plusieurs idées mises de côté : support multimédia plus riche, analyses avancées par IA (recommandations automatiques), fonctionnalités "LMS" complètes. Les cours ont un état brouillon/publié (`isDraft`). Le rôle Parent existe dans le modèle mais pas d'interface implémentée.

Le MVP a été surtout testé "en interne". Un test avec de vrais élèves et professeurs pourrait révéler des ajustements d'ergonomie.

**Conclusion** : le MVP est abouti sur ses fonctions fondamentales. Il remplit son objectif — montrer concrètement une plateforme éducative multi-rôles intégrant une IA, développée rapidement grâce au vibe coding.

---

**Pages estimées** : 16-18 pages  
**Temps de lecture** : 25-30 minutes  
**Mots-clés** : Next.js, TypeScript, Prisma, NextAuth, Gemini, Base de données, Authentification, MVP
