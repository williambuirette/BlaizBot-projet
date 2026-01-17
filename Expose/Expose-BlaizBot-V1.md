# Exposé BlaizBot - V1

> Version corrigée et consolidée de l'exposé

---

## Instructions
Ce document est la version révisée de l'exposé, avec les corrections factuelles appliquées.

---

1.1 Mise en contexte

Ces dernières années, les progrès de l'intelligence artificielle ont fortement transformé la façon de programmer et d'interagir avec les machines. Dans ce contexte, une nouvelle pratique appelée vibe coding est apparue dans le monde du développement. Le terme s'est diffusé récemment dans la communauté dev ; l'origine souvent citée est un message de l'informaticien Andrej Karpathy sur la plateforme X en février 2025, où il décrit une manière de coder plus intuitive, où l'on suit son instinct et où l'on en vient presque à "oublier" le code, car une partie des tâches techniques est confiée à une IA.

Le principe est simple : au lieu d'écrire tout le code à la main, le développeur décrit précisément ce qu'il veut obtenir. L'IA propose alors une première version. Ensuite, le développeur teste, corrige ce qui ne fonctionne pas, puis améliore progressivement le résultat par petites itérations. Cela ne signifie pas "coder sans réfléchir". Au contraire, il faut savoir guider l'IA avec des consignes claires et garder le contrôle sur les décisions importantes.

Cette approche explique le succès grandissant du vibe coding. Elle permet d'automatiser de nombreuses tâches répétitives et d'accélérer la réalisation d'un projet. Par exemple, des éléments standards d'une application web (pages, formulaires, composants similaires) peuvent être générés plus rapidement. L'IA peut aussi proposer des améliorations utiles sur la lisibilité, l'organisation ou la structure du code, et aider à repérer plus tôt certaines erreurs. Avec une méthode rigoureuse, on peut donc avancer plus vite qu'en développement classique, tout en rendant la programmation plus accessible à des personnes moins expérimentées.

Cependant, l'intervention humaine reste indispensable. Une IA peut se tromper, produire du code incomplet ou incohérent, ou proposer une solution qui semble correcte mais ne fonctionne pas une fois testée. Le développeur doit donc vérifier ce qui est produit, comprendre les propositions et corriger si nécessaire. Le vibe coding est avant tout un partenariat : l'IA exécute une partie du travail fastidieux, mais l'humain reste le juge final.

En conclusion, le vibe coding annonce une évolution du métier de programmeur. Pour rester efficaces, les développeurs devront apprendre à utiliser les outils d'IA avec méthode, prudence et esprit critique, au même titre que les compétences de programmation classiques.

1.2 Principe de fonctionnement

Le vibe coding repose sur l'utilisation de modèles de langage appelés LLM (Large Language Models), qui sont au cœur des intelligences artificielles génératives actuelles. En 2025, parmi les plus connus, on trouve notamment GPT (OpenAI), Claude (Anthropic) ou Gemini (Google / DeepMind). Ces modèles ont été entraînés pour comprendre et générer du texte, ce qui leur permet aussi de produire du code à partir d'instructions formulées en langage naturel.

De manière simplifiée, un LLM fonctionne comme un système de prédiction : il anticipe les mots ou les lignes de code les plus probables pour répondre à une demande. C'est ainsi qu'il peut expliquer un concept, proposer une solution ou générer un extrait de programme cohérent à partir d'une simple description. Toutefois, dans le cadre du vibe coding, le choix du modèle est moins important que la méthode de travail adoptée.

Le principe central du vibe coding consiste à décrire clairement son intention, puis à avancer étape par étape jusqu'à obtenir un résultat fonctionnel. Cette méthode peut être résumée sous la forme d'une boucle continue :
Intention → Génération par l'IA → Test → Correction → Amélioration.
Le développeur commence par expliquer précisément ce qu'il souhaite faire. Le LLM propose alors une première version du code. Celui-ci est ensuite exécuté et testé. En fonction du résultat, le développeur corrige ou affine sa demande, puis relance l'IA. Ce cycle se répète jusqu'à obtenir un fonctionnement satisfaisant.

Un exemple simple permet d'illustrer ce processus. Si un bug apparaît dans un programme, le développeur décrit le problème à l'IA. Celle-ci propose une correction que le développeur intègre et teste immédiatement. Si le bug persiste ou si un nouveau problème survient, la demande est précisée et une nouvelle itération est lancée. Le même principe s'applique pour ajouter une fonctionnalité ou créer un élément d'interface, comme une page de connexion : l'IA fournit une base, ensuite améliorée progressivement.

Pour que le vibe coding soit efficace, certaines règles doivent être respectées : travailler par petites étapes, tester à chaque modification, conserver une trace des échanges et ne jamais faire une confiance aveugle à l'IA. Même performante, une intelligence artificielle peut produire du code imparfait. Le rôle du développeur reste donc essentiel : il garde la responsabilité du résultat final et utilise l'IA comme un outil d'accélération, et non comme un remplaçant.

1.3 Avantages, limites et rôle de l'humain

Le vibe coding présente de nombreux avantages, en particulier pour développer rapidement un projet avec peu de ressources. L'intelligence artificielle peut prendre en charge une grande partie du travail technique : elle génère une première version du code, propose des corrections et accélère des tâches répétitives qui seraient longues en programmation traditionnelle. Elle peut également améliorer un code existant en le réorganisant, afin de le rendre plus clair et plus efficace.

Parmi les principaux avantages du vibe coding, on peut citer l'automatisation de tâches répétitives, comme la création de pages web ou de composants similaires, ainsi qu'un gain de temps important. L'IA peut aussi aider à détecter plus rapidement certaines erreurs ou incohérences et proposer des améliorations sur la lisibilité et la structure du code. Enfin, cette approche rend la programmation plus accessible : même avec peu de connaissances techniques au départ, il est possible de créer un prototype fonctionnel en suivant une méthode progressive.

Cependant, le vibe coding comporte aussi des limites importantes. L'IA n'est pas infaillible : elle peut produire un code incomplet, inadapté ou même totalement incorrect. Il arrive qu'elle propose des solutions qui semblent valables en théorie, mais qui ne fonctionnent pas une fois testées. Elle peut également « halluciner », c'est-à-dire inventer des fonctionnalités ou des bibliothèques inexistantes, ou complexifier inutilement un projet en ajoutant des éléments superflus. Si ses propositions sont acceptées sans vérification, cela peut créer de la dette technique et rendre le code difficile à maintenir.

C'est pour ces raisons que le rôle de l'humain reste central. Le développeur doit définir les objectifs du projet, tester et valider chaque étape, corriger les erreurs et s'assurer de la cohérence globale du code. Il lui revient aussi de décider quand simplifier une fonctionnalité ou, au contraire, l'approfondir, et de garder une trace du travail effectué, notamment des échanges avec l'IA et des différentes versions du code.

En résumé, le vibe coding ne supprime pas la réflexion humaine : il modifie la manière de coder. Le développeur devient davantage un pilote qui structure ses idées, guide l'IA avec des consignes claires et garde un regard critique sur les résultats. À l'avenir, savoir utiliser l'IA avec méthode et prudence sera essentiel pour rester maître de ses projets et s'adapter aux évolutions du métier.

CHAPITRE 2
BLAIZ'BOT - CONTEXTE DU PROJET

2.1 Présentation de l'application

Blaiz'bot est le projet que j'ai choisi de réaliser pour mon travail de maturité. C'est une application web dont l'objectif est d'aider les enseignants à faire réviser leurs cours à leurs élèves, en s'appuyant sur une intelligence artificielle comme assistant pédagogique.

L'application est organisée autour de trois interfaces distinctes, liées à trois rôles : administrateur, professeur et élève. Cette séparation permet d'éviter de mélanger les responsabilités et de garder une structure simple.

L'interface élève permet de consulter les contenus de cours et les ressources associées, d'organiser ses révisions avec un agenda et des objectifs, et d'utiliser un chatbot IA pour poser des questions, demander des explications ou s'entraîner. L'élève peut aussi suivre sa progression grâce à des KPI (indicateurs clés de performance), afin d'identifier ses points forts et ses points faibles sans dépendre uniquement des notes.

L'interface professeur sert à gérer les classes et les cours : création et organisation des contenus (matières, chapitres, ressources), proposition d'exercices, suivi des résultats, et consultation de KPI pour repérer des difficultés récurrentes, soit chez un élève, soit dans une partie de la classe.

L'interface administrateur gère le cadre général : comptes, rôles, structure des classes et supervision du bon fonctionnement.

L'IA est surtout centrée sur l'aide à la révision de l'élève. Les conversations détaillées élève–IA restent privées, mais le professeur peut consulter des indicateurs agrégés (score IA, nombre de sessions) sans accéder au contenu des échanges. Cela permet de préserver la confidentialité tout en gardant une vision pédagogique exploitable. Enfin, Blaiz'bot n'a pas pour but d'être une plateforme scolaire complète : c'est un prototype cohérent et testable pour illustrer la démarche du vibe coding.


2.2 Motivations

Ma première motivation avec ce projet, c'est de travailler sur un cas concret pour tester le vibe coding dans des conditions réelles. Blaiz'bot est un bon terrain d'essai, parce qu'il mélange plusieurs éléments importants : une interface, une logique de gestion (cours, exercices, progression) et des usages différents selon qu'on est élève ou professeur. Je ne voulais pas rester dans une idée "sur le papier", mais aboutir à un prototype qui fonctionne et que je peux réellement montrer.

Ma deuxième motivation vient du domaine choisi. Réviser, c'est souvent difficile, surtout parce que les élèves ne bloquent pas tous au même moment ni sur les mêmes notions. Avec Blaiz'bot, l'objectif est de rendre la révision plus simple et plus interactive : l'élève avance à son rythme, peut se corriger et comprend mieux ce qu'il doit retravailler. De l'autre côté, le professeur n'a pas seulement une note finale : il peut repérer plus facilement les difficultés qui reviennent et ajuster son cours ou ses exercices.

Enfin, il y a une motivation plus personnelle. J'aime l'informatique et j'avais envie de progresser en construisant une application complète, depuis l'idée de départ jusqu'au prototype. Ce travail me permet de développer des compétences concrètes, comme l'organisation d'un projet, la création d'interfaces, la logique d'une application et l'intégration d'une IA, tout en restant dans un cadre scolaire clair et mesurable.

2.3 Objectifs et périmètre

2.3.1 Objectif principal

L'objectif de ce travail n'est pas seulement de créer Blaiz'bot, mais aussi de rédiger un exposé qui explique clairement comment le projet a été réalisé. Le rapport doit décrire la démarche étape par étape : découpage en tâches, formulation des consignes, tests, puis corrections quand c'est nécessaire. L'idée est de montrer le déroulement réel du développement, avec une progression logique et des preuves concrètes.

Dans ce cadre, l'application sert surtout de support à la démonstration. Le but n'est pas d'ajouter un maximum de fonctionnalités, mais de construire une version cohérente et compréhensible, puis d'expliquer le processus de façon structurée. Le rapport doit mettre en avant les choix, les limites assumées et la manière dont les problèmes ont été résolus au fil des itérations.

2.3.2 Le MVP

Pour rester réaliste, je vise un produit minimum viable (MVP), c'est-à-dire une version minimale mais complète, qui fonctionne de bout en bout et peut être démontrée avec un scénario simple.

Dans le MVP, l'application doit permettre au minimum :
•	un accès par rôles (administrateur, professeur, élève) ;
•	un espace professeur pour organiser des cours, déposer des ressources et proposer des exercices ;
•	un espace élève pour consulter les contenus, s'entraîner et suivre sa progression ;
•	un chat IA centré sur l'aide à la révision, lié aux cours ;
•	une visualisation de la progression via des indicateurs, sans montrer au professeur le contenu exact du chat élève-IA.

L'objectif est d'obtenir une application assez stable pour être testée et présentée, sans complexité inutile. Certaines améliorations d'expérience utilisateur (par exemple l'affichage progressif des réponses de l'IA) restent des bonus, mais le cœur du MVP doit d'abord être fonctionnel.

2.3.3 Limites du périmètre

Certaines améliorations pourront être envisagées plus tard, une fois le prototype stabilisé. À l'inverse, certaines idées sont volontairement exclues, car elles rendraient le projet trop lourd pour un travail de maturité.

Par exemple, l'objectif n'est pas de créer une plateforme scolaire complète de type LMS (comme Moodle), ni d'ajouter des fonctions complexes comme l'anti-triche, la surveillance avancée ou des analyses pédagogiques très détaillées. Le rôle Parent existe dans le modèle de données (pour une évolution future), mais aucune interface ni logique métier n'a été implémentée pour ce rôle dans le MVP. Le périmètre reste donc volontairement limité : une application claire, une démonstration réaliste et un rapport qui explique précisément la méthode suivie.


Chapitre 3 — Pré‑projet (jusqu'au wireframe Markdown)

3.1 Brainstorming et cadrage du MVP

Avant d'écrire la moindre ligne de code, j'ai commencé par un brainstorming pour clarifier l'idée de Blaiz'bot et cadrer un MVP réaliste. Pour cela, j'ai longuement échangé avec ChatGPT afin de définir le besoin, les fonctionnalités essentielles et les limites du projet. Ce travail m'a évité de partir dans toutes les directions et m'a permis de garder un objectif atteignable pour un premier prototype.

À ce stade, j'ai choisi de me concentrer sur les fonctions de base d'une plateforme éducative : gestion de cours, suivi des élèves et communication simple, en laissant de côté les idées trop secondaires ou trop complexes. J'ai aussi identifié dès le départ trois types d'utilisateurs, avec des besoins différents : administrateur, professeur et élève. Cette distinction m'a aidé à structurer le MVP sans oublier l'essentiel, tout en restant dans un périmètre gérable.

Ensuite, j'ai utilisé ChatGPT comme un véritable espace de travail pour organiser le projet. J'ai créé un projet dédié dans l'interface et ouvert plusieurs fils de discussion thématiques (planification, documentation, suivi des bugs, etc.). Cette organisation m'a permis de garder un contexte clair pour chaque sujet et d'éviter de répéter les mêmes informations. La prochaine étape a été de configurer cet espace de manière plus précise pour l'adapter à ma méthode de travail. [image]

3.2 Organisation du projet ChatGPT

Dans le projet ChatGPT dédié à Blaiz'bot, j'ai commencé par créer un prompt système global : un ensemble de consignes qui cadrent l'IA dès le départ. Ce cadre précise le rôle attendu de ChatGPT, le style de réponse souhaité et des règles de méthode (avancer étape par étape, rester clair, expliquer simplement, et justifier ce qui est affirmé). L'objectif est que l'assistance reste cohérente tout au long du projet. Ce prompt n'est pas resté figé : je l'ai ajusté au fur et à mesure. Chaque fois que je trouvais une règle utile, je l'ajoutais pour améliorer la manière dont ChatGPT m'accompagne. [prompt system]

En parallèle, j'ai organisé le projet en plusieurs fils de discussion, chacun lié à un thème précis (planification, aide au codage, vérification, suivi des problèmes, etc.). Cela limite les confusions et évite de perdre du contexte. J'ai aussi enrichi la base de connaissances avec des documents et des notes (outils choisis, méthode du vibe coding, extraits de documentation), afin que l'IA s'appuie sur des références communes et ne me redemande pas sans cesse les mêmes informations. Ces choix d'organisation sont documentés ici à titre de méthodologie personnelle.

Enfin, il faut distinguer l'organisation et le développement. ChatGPT m'aide surtout à structurer les idées et la méthode. Le code, lui, est écrit et testé dans Visual Studio Code, avec l'appui de GitHub Copilot et du modèle Claude (Sonnet pour le code courant, Opus pour les tâches complexes). Cette séparation me permet de garder le contrôle : l'IA propose, mais c'est moi qui valide et j'implémente.

3.3 Outils et workflow (VS Code, GitHub, Vercel, Word)

Pour développer Blaiz'bot dans de bonnes conditions, j'ai choisi des outils modernes, adaptés à la méthode du vibe coding. Le cœur du travail se fait dans Visual Studio Code (VS Code), mon éditeur de code principal. Son interface me permet de tout avoir sous les yeux : les fichiers du projet, le code en cours d'édition et un terminal intégré pour lancer l'application ou exécuter des commandes. Cette organisation facilite un cycle rapide écrire → tester → corriger, essentiel pour un développement itératif. VS Code propose aussi de nombreuses extensions utiles, ce qui améliore la productivité et la lisibilité du code.

Pour la gestion des versions, j'utilise GitHub. Chaque étape importante du projet est enregistrée dans un dépôt Git, ce qui me permet de conserver un historique clair des modifications. Cela facilite le retour en arrière en cas d'erreur et rend visible l'évolution du projet étape par étape. Pour simplifier cette gestion, j'utilise GitHub Desktop, qui m'aide à visualiser les changements, rédiger des messages de commit clairs et synchroniser le code en ligne facilement. VS Code et GitHub fonctionnent ainsi ensemble : je développe localement, puis j'enregistre régulièrement les avancées.

Afin de tester l'application dans des conditions proches du réel, j'ai mis en place un déploiement automatique avec Vercel. À chaque mise à jour du dépôt GitHub, Vercel reconstruit et met en ligne la dernière version de l'application. En quelques minutes, Blaiz'bot est accessible sur Internet, ce qui me permet de vérifier rapidement le fonctionnement des nouvelles fonctionnalités sans déploiement manuel.

Enfin, j'utilise Microsoft Word pour rédiger l'exposé du projet. J'y documente les étapes au fur et à mesure, avec des explications, des captures d'écran et des extraits de code. Cela me permet de garder une cohérence entre le développement technique et le rapport écrit, et d'offrir au lecteur un suivi clair et structuré de la progression du projet.

3.4 Pipeline de travail et traçabilité

Tout au long du projet, j'ai suivi un pipeline simple et rigoureux pour passer d'une idée à une fonctionnalité réelle dans l'application : idée → code → test → commit → déploiement. Je commence par définir clairement la tâche à accomplir, souvent en échangeant avec l'IA pour préciser le résultat attendu. Ensuite, j'implémente la modification dans VS Code, en m'aidant de Copilot ou de ChatGPT si nécessaire. Une fois le code écrit, je teste immédiatement l'application en local pour vérifier que tout fonctionne comme prévu. Si le test est concluant, je crée un commit Git avec un message explicite, puis je l'envoie sur GitHub. À partir de là, Vercel déclenche automatiquement le déploiement, ce qui me permet de vérifier rapidement la fonctionnalité sur la version en ligne.

Ce pipeline apporte une vraie traçabilité. Chaque étape laisse une preuve : la réflexion et les consignes restent enregistrées dans les discussions avec l'IA, les commits sur GitHub montrent précisément ce qui a été ajouté ou modifié, et le déploiement sur Vercel permet de voir le résultat dans un contexte proche du réel. En parallèle, j'ai documenté ces étapes dans l'exposé avec des captures d'écran et des extraits de code, afin qu'on puisse suivre clairement l'évolution du projet. Cette méthode "une tâche → un test → un commit → un déploiement" m'a aidé à avancer de façon régulière, sans accumuler du code non testé.

3.5 Règles de qualité et sécurité minimales

Dès le début, je me suis fixé quelques règles simples pour garantir la qualité du code et un minimum de sécurité. En vibe coding, l'IA peut produire beaucoup de code très vite. Sans garde-fous, on risque d'obtenir un projet difficile à relire, à corriger et à faire évoluer.

La première règle concerne la lisibilité et la cohérence du code. J'utilise un formatage automatique avec Prettier : à chaque sauvegarde dans VS Code, le code est réindenté et mis en forme selon un style unique. Cela évite les différences entre ce que j'écris moi-même et ce que l'IA génère. En parallèle, un linter (ESLint) m'alerte immédiatement sur des erreurs courantes ou des oublis (imports manquants, variables inutilisées, etc.). Je corrige ces alertes au fur et à mesure, ce qui maintient un code propre et homogène. [image]

La deuxième règle concerne la protection des informations sensibles. Je n'intègre jamais de clés d'API ou de mots de passe directement dans le code. Tous les secrets sont stockés dans un fichier .env, qui n'est pas versionné grâce à .gitignore. Ainsi, même si le dépôt est en ligne, ces données restent protégées, ce qui évite qu'une clé oubliée soit récupérée et utilisée par quelqu'un d'autre.

Enfin, je teste l'application régulièrement, surtout après avoir ajouté du code généré par l'IA. Relancer et vérifier souvent permet de détecter un bug immédiatement, au moment où il apparaît, plutôt que trop tard après plusieurs modifications. Cela réduit aussi le temps de recherche, car je sais précisément quel changement a pu provoquer le problème.

Avec ces règles de base (formatage, contrôle des alertes, secrets isolés, tests fréquents), le projet reste stable, compréhensible et prêt à évoluer.

3.6 Première TODO "v0" (liste initiale)

Avant de créer l'interface, j'ai rédigé une première liste de tâches très simple, que j'appelle la TODO "v0". L'objectif était d'avoir un fil directeur concret pour structurer la maquette et la navigation, sans partir dans tous les sens. J'y ai noté les écrans et fonctionnalités indispensables du MVP sous forme de tâches courtes, par exemple : créer une page de connexion, mettre en place un tableau de bord élève, intégrer un agenda ou ajouter une messagerie prof-élève.

En construisant cette liste, j'ai veillé à ce que chaque tâche soit bien délimitée et réalisable rapidement. Quand une idée était trop large (comme "faire toute la messagerie"), je la découpais en sous-tâches plus précises : créer l'interface, envoyer un message, afficher l'historique, etc. Travailler par petites unités m'a aidé de deux façons : je peux tester chaque ajout immédiatement, et l'IA a moins de chances de partir dans la mauvaise direction parce que les demandes restent très ciblées.

Au final, cette TODO v0 m'a servi de plan de route simplifié. Elle m'a permis de ne pas oublier les pages importantes pendant le wireframe et de garder une logique claire dans la construction de l'application.

3.7 Création des agents IA (référentiel de rôles)

Plutôt que d'utiliser une seule IA généraliste pour tout, j'ai choisi de créer plusieurs agents IA spécialisés. L'idée est simple : chaque type de problème mérite un "assistant" avec le bon contexte et la bonne mission, au lieu de demander à la même IA de tout faire. J'ai donc défini plusieurs rôles, par exemple un agent Planification pour organiser les étapes et les priorités, un agent Correction de bug quand quelque chose ne fonctionne pas, un agent Relecture de code pour vérifier la cohérence du projet, et un agent Documentation pour m'aider à rédiger des notes claires.

Pour mettre ces agents en place, j'ai créé un fichier Markdown dédié à chacun dans le dépôt GitHub. Chaque fichier sert de fiche d'identité : j'y décris le rôle, les limites (ce que l'agent a le droit ou non de faire) et le format attendu des réponses. Par exemple, l'agent Relecture de code doit analyser le code sans ajouter de fonctionnalités et lister les problèmes repérés. L'agent Correction de bug doit proposer directement les modifications nécessaires pour résoudre l'erreur, sans partir sur d'autres sujets. Ce référentiel m'aide à obtenir des réponses plus cadrées et plus utiles.

En pratique, je me suis concentré sur quelques agents clés, plutôt que d'en créer trop. L'objectif n'était pas de multiplier les profils, mais de couvrir les besoins fréquents du projet sans me disperser. À chaque étape, je savais quel agent utiliser : planification pour la vue d'ensemble, correction de bug en cas de blocage, documentation pour améliorer mes explications, etc. Cette approche multi-agents a rendu l'utilisation de l'IA plus efficace et plus maîtrisée, tout en gardant l'humain au centre des décisions. [image]

3.8 Wireframe Markdown (v1)

Avant de développer l'interface graphique, j'ai créé une première maquette textuelle (wireframe) pour clarifier la structure de Blaiz'bot. L'objectif n'était pas de dessiner un design détaillé, mais de cartographier les pages nécessaires, d'indiquer leur contenu principal et de réfléchir à la navigation entre elles. Cette étape m'a servi de plan de route : en définissant l'organisation générale à l'avance, j'ai pu développer plus sereinement, sans coder "au hasard" et sans oublier des écrans importants.

J'ai d'abord réalisé un wireframe en Markdown pour définir la structure, plutôt que dans un outil graphique comme Figma. Le Markdown est rapide à écrire et suffisant pour décrire la logique d'une application : titres pour les pages, listes pour les éléments à afficher, et quelques notes sur les actions possibles. Un autre avantage est que ce fichier a été versionné sur GitHub comme le reste du projet. Il reste donc facile à consulter, à modifier, et il fait partie de la documentation vivante. Par la suite, j'ai transformé ce wireframe Markdown en prototype HTML/CSS/JavaScript interactif (avec données mockées et API simulée) avant le développement React/Next.js. [Markdown]

Concrètement, le wireframe décrit les trois espaces de l'application : Administrateur, Professeur et Élève. Pour chaque rôle, j'ai listé les pages essentielles et leur fonction. Côté élève, on retrouve un tableau de bord (progression, objectifs), une page Cours (contenus et ressources), une section Révisions (suppléments personnels), un agenda et l'assistant IA. Côté professeur, j'ai prévu des pages pour la gestion de classe, le suivi des résultats et la création ou mise à jour de cours et exercices. L'administrateur dispose d'un espace orienté "plateforme" : gestion des comptes, rôles, structure et supervision globale. Cette maquette a ensuite guidé la création des routes, du menu de navigation et des composants d'interface. En comparant régulièrement le développement avec le wireframe, je pouvais vérifier que je respectais bien le périmètre prévu. [image]

Enfin, ce document a aussi été très utile pour travailler avec l'IA. Il me permettait de formuler des demandes précises : au lieu de dire "crée une page élève", je pouvais décrire exactement la page attendue et ses éléments. Résultat : l'IA comprenait mieux le contexte et proposait du code plus pertinent dès la première version. Au final, ce wireframe m'a fait gagner du temps, a amélioré la cohérence de l'interface et constitue une preuve que le projet a été conçu de manière structurée avant d'être codé.

3.9 Analyse du wireframe Markdown par l'IA (inventaire UI)

Une fois le wireframe Markdown terminé, j'ai demandé à l'IA d'en extraire un inventaire détaillé de l'interface utilisateur. L'objectif était de "traduire" la maquette, page par page, en une liste concrète de tout ce qu'il faudrait coder : boutons, menus, champs de formulaire, listes, icônes, ainsi que les actions associées.

Pour cela, j'ai fourni le texte complet du wireframe à ChatGPT avec une consigne simple : pour chaque page décrite, lister les composants visuels et les interactions nécessaires. L'IA a alors parcouru chaque écran et a produit une liste structurée. Par exemple, pour un tableau de bord élève, elle a identifié des éléments comme l'affichage de la progression, une liste d'objectifs et des boutons d'action. Pour une page de messagerie, elle a listé le champ de saisie, le bouton d'envoi et l'affichage de la conversation.

Cet inventaire m'a été utile à deux niveaux. D'abord, il m'a servi de contrôle : si un élément essentiel n'apparaissait pas, c'était un signal que ma maquette manquait de précision ou qu'une fonction avait été oubliée. Ensuite, il m'a fourni une base de travail pour le développement du front-end, en transformant la maquette en "liste des choses à coder". C'est une étape que j'aurais pu faire à la main, mais l'automatiser avec ChatGPT m'a fait gagner du temps et m'a donné rapidement une vue complète. [Markdown]

3.10 Prompt de lancement pour coder le wireframe (kickoff wireframe)

À ce stade, j'avais deux bases solides : la maquette complète de l'application en Markdown et l'inventaire détaillé des éléments d'interface à développer. Avant de commencer à coder, il restait une étape importante : choisir une stack technique cohérente et préparer un prompt capable de lancer le projet proprement.

Pour éviter de me baser uniquement sur mon intuition, j'ai demandé à ChatGPT de me conseiller une architecture adaptée au périmètre du MVP. Je lui ai décrit la structure du wireframe, les besoins principaux de l'application et les contraintes de simplicité. L'IA m'a proposé une combinaison d'outils modernes et cohérents (framework web, langage, organisation du projet, base de données, etc.). En comparant ces suggestions avec mes propres connaissances, j'ai pu fixer des choix techniques raisonnables : une base solide, mais sans complexité inutile, afin de rester aligné avec l'objectif du prototype.

Une fois ces décisions prises, j'ai rédigé un prompt de lancement (kickoff) destiné à générer le squelette de Blaiz'bot. Ce prompt regroupait tout ce dont l'IA avait besoin dès le départ :
•	l'inventaire UI page par page (pour savoir quelles pages créer et quoi y mettre) ;
•	des consignes de structure (dossiers, pages, composants communs, navigation) ;
•	des règles de code et de cohérence (noms, conventions, fichiers, organisation).

L'objectif était de transformer l'inventaire UI en plan de construction. Concrètement, je demandais à l'IA de générer une première version complète du wireframe codé : pages correspondantes à la maquette, navigation fonctionnelle, composants principaux (même simplifiés) et une base de mise en forme.

Après l'envoi de ce prompt, j'ai obtenu un projet initial exploitable : une structure claire et un prototype minimal sur lequel je pouvais ensuite itérer. Tout n'était pas finalisé, mais j'avais déjà une base fonctionnelle, ce qui confirmait que le prompt était assez complet pour guider l'IA dans la création du projet.

3.11 Sortie de phase 3

Pour conclure cette phase de pré-projet, tout était prêt pour démarrer le développement du wireframe codé dans de bonnes conditions. J'ai vérifié que l'ensemble maquette Markdown + inventaire UI + prompt de lancement formait un tout cohérent et suffisait pour lancer le prototype sans improviser. Ces trois livrables constituent une base solide : la maquette définit clairement ce qu'il faut construire, l'inventaire UI permet de s'assurer qu'aucun élément d'interface important n'a été oublié, et le prompt de kickoff regroupe toutes les consignes nécessaires pour que l'IA génère un squelette fidèle au plan.

Grâce à ce travail préparatoire, j'aborde la suite avec une vision claire et une méthode structurée. La phase 3 m'a permis de poser des fondations stables avant d'écrire réellement du code. À ce stade, j'ai une architecture technique choisie, un wireframe minimal déjà cadré, et une liste de tâches suffisamment précise pour avancer étape par étape. Tout est donc en place pour lancer le développement de Blaiz'bot de manière plus sûre et plus régulière.

Chapitre 4 – Wireframe codé et verrouillage du plan

4.1 Exécution du kickoff wireframe

Une fois le wireframe préparé dans les chapitres précédents, je suis passé à sa mise en pratique en code. L'objectif de ce kickoff wireframe était de transformer les écrans planifiés en une interface web interactive, afin de valider concrètement l'enchaînement des pages et la structure générale du prototype. J'ai commencé par configurer correctement mon environnement de développement (projet Next.js déjà prêt, dépendances installées) pour pouvoir travailler dans de bonnes conditions.

Ensuite, j'ai lancé une première session en m'appuyant sur deux assistants IA complémentaires : ChatGPT pour m'aider à organiser le travail et clarifier les étapes, puis Claude dans VS Code pour générer le code du prototype. Concrètement, j'ai d'abord demandé à ChatGPT de m'aider à découper le travail : quels composants créer en premier, comment structurer la navigation, et dans quel ordre avancer. Une fois ce plan d'attaque défini, j'ai rédigé un prompt de kickoff pour Claude, en décrivant précisément le premier composant à coder (par exemple la barre de navigation latérale).

Claude a alors produit le code directement dans Visual Studio Code, et j'ai pu l'exécuter et le tester immédiatement. J'ai avancé ainsi, composant par composant, en validant chaque petite itération (bouton, page, menu). Cette collaboration en temps réel m'a permis de voir rapidement une première version du prototype prendre forme, fidèle à la maquette conçue en amont. 

4.2 Design system et structure UI du prototype

Dès le début du prototypage, j'ai mis en place un design system simple pour garantir une cohérence visuelle sur toute l'application. L'idée est de définir quelques règles de base communes : une palette de couleurs (par exemple une couleur principale pour les actions, du vert pour les succès, du rouge pour les alertes), des choix de typographie (police, tailles standards pour titres et textes) et des composants UI réutilisables (boutons, formulaires, icônes). En m'appuyant sur le style du wireframe initial, j'ai traduit ces décisions directement dans le code. Par exemple, j'ai créé des classes CSS ou des composants React pour les boutons principaux et secondaires, afin qu'ils gardent le même rendu partout. Ce cadre m'a fait gagner du temps et a donné un résultat plus homogène, sans devoir "réinventer" le style à chaque nouvel écran.

En parallèle, j'ai défini une structure UI claire dès le départ. Le prototype repose sur un layout commun : une barre latérale (sidebar) pour la navigation, un en-tête (header) pour afficher le titre de la page et le menu utilisateur, puis une zone centrale où s'affiche le contenu de chaque écran. J'ai choisi d'implémenter cette ossature au début pour que toutes les pages s'intègrent naturellement dans le même cadre. Avec Next.js, cela s'est traduit par des composants partagés (Sidebar, Header) utilisés sur l'ensemble de l'espace après connexion. Grâce à cette base stable, j'ai pu me concentrer sur le contenu de chaque page en gardant une interface cohérente et lisible.

4.3 Écrans et parcours Élève / Professeur / Admin

Une fois le layout général en place, j'ai développé les écrans spécifiques pour les trois types d'utilisateurs de Blaiz'bot : élève, professeur et administrateur. Pour chaque profil, j'ai repris les pages prévues dans le wireframe et j'ai construit un parcours utilisateur "typique", afin de vérifier que la navigation et la logique globale restent cohérentes.

Côté élève, après la connexion, l'utilisateur arrive sur un tableau de bord personnel. Il y voit des informations simples sur sa progression (avancement, cours terminés, exercices réalisés, etc.). Depuis ce point central, il peut accéder à la liste de ses cours, à une section Révisions (suppléments personnels), à un agenda de travail, et à l'assistant IA sous forme de chat pédagogique. L'interface inclut aussi un onglet Messages qui sert de centre de communication (messagerie simulée à ce stade). L'objectif est que l'élève comprenne rapidement où il en est et puisse aller directement à l'activité voulue.

Côté professeur, l'accueil est également un dashboard, mais orienté "suivi". Il regroupe des indicateurs (KPI) sur la classe, et peut signaler des points d'attention (élèves en difficulté, devoirs non rendus, etc.). Le professeur dispose ensuite de pages pour gérer ses classes (listes, groupes) et ses cours (création, édition, organisation en chapitres et exercices). Une partie importante du parcours est l'onglet assignations, qui permet d'attribuer un cours, un devoir ou un quiz à une classe, avec éventuellement une date limite. Le professeur a aussi une section Messages pour échanger avec un élève ou un groupe. Enfin, un module d'IA est prévu dans cet espace pour aider à produire du contenu (quiz, résumés), même si ce n'est pas encore fonctionnel à ce stade.

Côté administrateur, l'interface est centrée sur la gestion du système. Le dashboard affiche des statistiques globales (utilisateurs, classes, cours). L'admin accède surtout à des pages de gestion (CRUD) : utilisateurs, classes, matières, et une page paramètres pour les réglages globaux (dont, plus tard, les clés d'API IA et certains paramètres d'authentification).

Ces trois parcours ont été intégrés dans le wireframe codé. Pour l'instant, il s'agit surtout de pages statiques ou semi-fonctionnelles : la navigation est en place, la structure est visible, mais plusieurs actions "réelles" (messagerie complète, correction de quiz, etc.) seront implémentées dans les phases suivantes. L'essentiel, à ce stade, était de valider une maquette multi-rôles cohérente et fluide, sans trou dans le plan.

4.4 Modules, composants réutilisables et données simulées

En construisant le prototype, j'ai cherché à éviter un maximum de répétitions, afin de garder un code plus propre et plus facile à maintenir. Pour cela, j'ai créé des modules et des composants réutilisables. L'idée est simple : plutôt que de recoder plusieurs fois le même type d'élément, je le construis une seule fois, puis je le réutilise partout où j'en ai besoin.

Par exemple, l'interface admin et l'interface professeur utilisent toutes les deux des tableaux pour afficher des listes (utilisateurs, élèves d'une classe, cours, etc.). Au lieu d'avoir plusieurs tableaux presque identiques, j'ai développé des composants de table configurables (UsersTable, ClassesTable, SubjectsTable) pour les listes d'entités, suivant la même logique de réutilisation. J'ai appliqué la même logique à d'autres éléments : cartes de statistiques (un chiffre clé avec une icône), fenêtres modales de formulaire (ajout d'un utilisateur, création d'un cours), ou encore bulles de messages pour le chat. Cette approche correspond bien aux bonnes pratiques de React/Next.js, et l'IA m'a d'ailleurs souvent poussé à généraliser un composant dès qu'un motif revenait. Au final, le wireframe codé ressemble à un assemblage de "briques" : boutons, cartes, formulaires, menus, etc., ce qui accélère le prototypage tout en gardant un style uniforme.

Pour que le prototype soit parlant visuellement, j'ai aussi dû l'alimenter avec des données simulées. Comme la base de données n'était pas encore connectée, j'ai créé des jeux de données factices : faux élèves, faux professeurs, exemples de classes et de cours. Ainsi, quand on ouvre la page "Utilisateurs" côté admin, on voit une liste avec des noms, e-mails et rôles qui servent uniquement de test. De la même manière, le dashboard élève affiche une progression ou un temps d'étude à partir de valeurs fictives codées en dur. J'ai stocké ces données sous forme d'objets JavaScript ou de fichiers JSON, comme une base temporaire.

Ces "mock data" m'ont permis de tester l'affichage, la lisibilité, et les limites de l'interface (listes longues, tableaux chargés), et de repérer des problèmes d'UX avant d'aller plus loin.


4.5 Itérations et corrections issues du prototype

La réalisation du wireframe codé s'est faite de manière itérative, avec de nombreux allers-retours pour améliorer le rendu et corriger ce qui n'allait pas. Après chaque écran ou composant généré avec l'aide de l'IA, je testais l'application et je relisais le code pour repérer soit des écarts par rapport au plan initial, soit des détails qui méritaient d'être améliorés. Cette "recette interne" m'a permis d'identifier plusieurs types de corrections.

D'abord, j'ai dû faire des ajustements de design une fois le prototype visible à l'écran. Certains textes étaient trop petits ou pas assez contrastés, donc j'ai affiné les styles (tailles de police, marges, couleurs) pour améliorer la lisibilité. J'ai aussi uniformisé certains libellés dans les menus et les boutons afin qu'ils soient plus clairs pour un utilisateur qui découvre l'application (par exemple simplifier un intitulé ou choisir un mot plus parlant).

Ensuite, le test du prototype a révélé quelques oublis ou besoins non anticipés dans le wireframe. Par exemple, après la création d'un cours ou d'un utilisateur, il n'y avait pas de retour visuel. En pratique, c'est déstabilisant : on ne sait pas si l'action a fonctionné. J'ai donc ajouté une notification simple (non bloquante) pour confirmer les actions importantes, comme "Cours créé avec succès".

Enfin, j'ai corrigé des erreurs mineures de comportement. Un exemple typique : la sidebar ne mettait pas en surbrillance le bon onglet lors de certains clics, à cause d'une petite erreur dans la logique de l'état actif. J'ai aussi ajusté certains formulaires simulés pour qu'ils se réinitialisent correctement après soumission, même sans base de données réelle.

À chaque problème repéré, je formulais un prompt précis (souvent à Claude) pour obtenir une correction ciblée, puis je testais immédiatement. Ce cycle rapide détection → correction → test a rendu le wireframe codé plus robuste : design plus propre, navigation plus fluide, et structure complète. Même sans tests externes à ce stade, le fait d'utiliser le prototype "comme si j'étais" un élève ou un professeur m'a aidé à améliorer l'expérience et à valider le plan avant la suite. 

4.6 Comparatif "wireframe Markdown vs wireframe codé"

Avec le recul, il est intéressant de comparer le wireframe initial en Markdown (textuel) et le wireframe codé (prototype interactif). Les deux approches ont joué un rôle complémentaire, avec des avantages différents.

Le wireframe Markdown était avant tout une spécification écrite : une cartographie précise des pages, sections et éléments, sans rendu visuel. Il a été très utile au début, car il m'a obligé à penser l'application de manière complète. En décrivant tout "noir sur blanc", j'ai pu repérer des oublis, ajuster la structure et vérifier que chaque fonctionnalité avait sa place. Le format est aussi très agile : modifier un écran revient souvent à ajouter ou déplacer quelques lignes. En revanche, sa limite principale est l'abstraction : il faut se représenter mentalement l'interface, ce qui est moins parlant, surtout pour quelqu'un qui n'a pas l'habitude de ce type de document.

Le wireframe codé, à l'inverse, est un prototype visuel et interactif. On peut cliquer, naviguer, et se mettre dans la peau d'un utilisateur. C'est beaucoup plus efficace pour valider l'ergonomie, la cohérence des parcours et la lisibilité générale. Il sert aussi de preuve de faisabilité : coder l'interface permet de confirmer que ce qui était imaginé est réalisable dans la stack choisie. Son inconvénient est qu'il demande plus de temps et d'efforts : la moindre modification implique de toucher au code et de relancer l'application. Il est donc moins adapté au brainstorming rapide.

Au final, les deux se complètent : le Markdown a servi de plan détaillé, et le prototype codé a été le premier test concret de ce plan. Grâce à l'IA, le passage de l'un à l'autre a été plus fluide, car le document Markdown a servi de référence directe pour générer une base de prototype fidèle.

4.7 Ajustement du plan et finalisation de l'architecture avec l'IA

Après la réalisation du prototype, j'ai pris du recul pour ajuster le plan global avant de poursuivre le développement. Le fait de disposer d'une version concrète de l'application m'a permis d'identifier certains points à améliorer, aussi bien dans la feuille de route que dans l'architecture. Pour cette phase de consolidation, j'ai de nouveau sollicité l'IA, principalement ChatGPT, cette fois dans un rôle de conseiller stratégique. Je lui ai décrit l'état du prototype, les difficultés rencontrées et mes pistes d'amélioration afin d'avoir un regard extérieur.

Un changement important a concerné l'organisation des phases du projet. Initialement, le développement était découpé en grandes phases assez générales. Après le wireframe codé, il est apparu plus pertinent de progresser par modules fonctionnels distincts. L'interface Administrateur, par exemple, représente un travail conséquent à elle seule ; j'ai donc décidé d'en faire une phase dédiée. Il en va de même pour les parties Professeur et Élève, chacune riche en fonctionnalités. Avec l'aide de ChatGPT, j'ai redéfini un plan plus granulaire : une phase Admin, une phase Professeur, une phase Élève, puis une phase dédiée à l'IA. Cette approche rend la progression plus lisible et facilite les tests intermédiaires. J'ai verrouillé ce nouveau plan en définissant pour chaque phase des objectifs clairs et des critères de fin précis.

En parallèle, j'ai finalisé l'architecture technique de l'application. Le prototype avait déjà validé les grandes lignes, mais certains détails restaient à préciser. Avec l'IA, j'ai revu la structure de la base de données, les API prévues et l'arborescence du projet. En rejouant les parcours utilisateurs à partir du prototype, j'ai par exemple identifié un champ manquant dans le modèle de données, que j'ai pu ajouter avant d'aller plus loin. ChatGPT a aussi servi de contrôle croisé en comparant les fonctionnalités du prototype avec la liste des endpoints API planifiés, ce qui m'a permis de corriger un doublon et un oubli.

Enfin, j'ai confirmé une dernière fois les choix technologiques au regard du plan mis à jour. À l'issue de cette étape, le plan de développement et l'architecture ont été considérés comme stabilisés, ce qui m'a permis d'aborder la suite avec une vision claire et sans remise en question permanente.

4.8 Refonte des TODO : backlog par phases (v1)

Après avoir affiné le plan de développement, j'ai entièrement réorganisé le fichier TODO pour qu'il reflète ce nouveau découpage et les priorités à venir. Au départ, ma liste de tâches était assez brute : des idées ajoutées au fil du projet, parfois sous forme de notes dispersées. Il fallait la transformer en un backlog clair, utilisable comme vraie feuille de route.

J'ai donc créé une version v1 du backlog, structurée par phases. Concrètement, le document TODO contient désormais des sections identifiées (par exemple : Phase 1 – Setup, Phase 2 – Admin, Phase 3 – Prof, Phase 4 – Élève, Phase 5 – IA). Sous chaque phase, j'ai listé des tâches précises et suffisamment petites pour être réalisées en une session de travail quand c'est possible. Par exemple, pour la phase Admin, on retrouve des éléments du type : implémenter la page liste des utilisateurs (front-end + API), tester la création/suppression, vérifier les permissions sur les routes, etc. J'ai également noté les dépendances : certaines tâches ne peuvent démarrer qu'après d'autres (par exemple un dashboard qui nécessite déjà des données élèves exploitables).

Cette refonte a été facilitée par un agent IA orienté gestion de projet. Je lui ai demandé de relire mes anciennes notes et de les répartir dans les bonnes phases, tout en proposant des formulations plus claires. L'IA a aussi mis en évidence des tâches implicites que je n'avais pas forcément écrites, comme préparer des comptes de démonstration ou prévoir des tests de base en fin de parcours. En intégrant ces points, j'ai obtenu un backlog plus complet et mieux priorisé.

Cette organisation est essentielle pour la suite : chaque phase devient une checklist, ce qui rend l'avancement mesurable, repérable et plus simple à piloter.

4.9 Gabarits de prompts par tâche et usage des agents

Au fil du prototypage, j'ai appris que la qualité des résultats dépend beaucoup de la façon dont on "parle" à l'IA. Plutôt que d'improviser un prompt à chaque nouvelle fonctionnalité, j'ai commencé à créer des gabarits de prompts selon le type de tâche. L'objectif est double : gagner du temps et obtenir des réponses plus fiables dès la première génération.

Par exemple, pour créer un nouveau composant React à partir du wireframe, mon prompt-type inclut presque toujours : le nom du composant, le rôle concerné (élève / prof / admin), une description courte de l'objectif, la liste des données attendues (props ou structure), et un rappel des règles du design system (styles, cohérence visuelle, comportement). En donnant ces informations de façon structurée, l'IA comprend mieux le contexte et produit du code plus proche de ce que j'attends. J'ai aussi des gabarits différents pour d'autres cas : refactorisation (améliorer un fichier sans changer le comportement), correction de bug (reproduire, identifier, corriger), ou rédaction d'un test unitaire. La forme varie, mais l'idée reste la même : standardiser le dialogue pour éviter les oublis et limiter les réponses trop vagues.

En parallèle, j'ai exploité les agents IA spécialisés mis en place dans mon environnement. Plutôt que d'utiliser une seule IA polyvalente, j'ai plusieurs profils avec des rôles clairs. Par exemple, un agent "orchestrateur" sert à découper une tâche complexe en étapes et à cadrer le plan d'action. Un agent orienté "gestion de projet" m'aide à maintenir le backlog : définir la prochaine tâche prioritaire, reformuler proprement une TODO, ou mettre à jour le fichier de suivi. Un agent "standards" joue le rôle de garde-fou qualité, en vérifiant que le code respecte les conventions (structure, lisibilité, pas de secrets, etc.). D'autres agents servent à refactoriser, documenter ou relire avant validation.

Dans la pratique, ces agents sont utilisés directement dans l'interface de développement : je sélectionne le bon agent selon le besoin, ce qui rend les échanges plus ciblés. Claude est surtout utilisé pour produire et corriger du code, tandis que ChatGPT reste très utile pour la réflexion globale, la planification et la rédaction. En résumé, je travaille comme avec une petite équipe d'assistants virtuels : chacun a sa spécialité, et moi je garde la décision finale. Ces gabarits de prompts et cette organisation par agents sont devenus la base de ma méthode de travail assistée par IA pour la suite du développement.

4.10 Prompt de lancement du développement de l'application (kickoff app)

À la fin de cette phase de prototypage, j'avais tout ce qu'il fallait pour passer au développement complet de Blaiz'bot. Pour marquer clairement ce changement de rythme, j'ai rédigé un prompt de lancement très détaillé : une sorte de brief initial destiné à l'agent de codage. L'objectif était simple : donner à l'IA un contexte stable et complet, afin qu'elle génère ensuite du "vrai" code métier, sans repartir dans des approximations.

Dans ce prompt, je commence par rappeler les objectifs globaux du projet : développer une application éducative full-stack avec trois interfaces (Élève, Professeur, Administrateur) et une couche IA (chat et génération de contenu). Ensuite, je liste la stack technique validée pour que l'IA sache exactement sur quoi s'appuyer : Next.js pour le front-end, PostgreSQL avec Prisma pour la base de données, et NextAuth pour l'authentification. J'ajoute aussi un rappel des règles de travail que je veux voir respectées : cohérence avec le design system, code lisible, pas de secrets en clair, et une organisation de projet propre (en reprenant les conventions établies dans mes documents de référence).

Le prompt contient également la feuille de route par phases, afin de donner un ordre d'attaque clair. Je précise ce qui est déjà fait (wireframe Markdown, prototype codé, verrouillage du plan) et ce qui vient ensuite : Phase 1 (base de données + auth), Phase 2 (Admin), Phase 3 (Prof), Phase 4 (Élève), Phase 5 (IA), puis une phase finale de tests et de stabilisation. Surtout, j'indique explicitement que l'on démarre immédiatement par la Phase 1, pour éviter toute ambiguïté.

Un point important du prompt est la gestion des variables d'environnement. J'y rappelle que les clés et paramètres sensibles doivent rester dans le fichier .env.local. J'y mentionne notamment l'existence d'une clé API pour Gemini (obtenue via Google), stockée sous une variable du type GEMINI_API_KEY, ainsi que les autres variables nécessaires (URL de base de données, secret d'authentification, etc.). Le but n'est pas de donner la clé dans le prompt, mais de préciser à l'IA où se brancher et comment respecter les bonnes pratiques.

Enfin, le prompt se termine par une consigne d'action claire : commencer la Phase 1 étape par étape (initialisation Prisma, schéma, puis configuration NextAuth), en validant chaque étape avant d'aller plus loin. C'était le signal officiel : on sortait du mode "prototype" et on entrait dans le développement réel, avec un cadre verrouillé et un backlog prêt à exécuter.


4.11 Sortie de phase 4

La phase 4 de mon projet, dédiée au wireframe codé et au verrouillage du plan, se termine sur un double résultat positif. D'un côté, je dispose désormais d'un prototype fonctionnel de Blaiz'bot qui représente fidèlement la vision de départ : les pages principales sont en place, la navigation est cohérente, l'ergonomie a pu être testée, et le design system donne un rendu homogène. Ce wireframe codé devient une base précieuse pour la suite, car il servira de référence visuelle et technique pour intégrer progressivement les vraies fonctionnalités.

De l'autre côté, le plan de développement de la V1 est maintenant stabilisé. Grâce aux ajustements faits après les tests du prototype, et avec l'appui de l'IA, le projet est découpé en phases plus logiques, le backlog est structuré et priorisé, et l'architecture globale a été confirmée (front-end, routes, modèle de données, et future intégration IA). Cela réduit fortement les incertitudes avant d'entrer dans une phase plus "production".

À la sortie de cette phase, je peux donc compter sur plusieurs livrables : une documentation plus à jour, un prototype web navigable que je peux montrer pour illustrer le projet, et un dépôt de code organisé, prêt à accueillir les prochaines implémentations. J'ai aussi consolidé une méthode de travail efficace, avec des agents IA spécialisés et des gabarits de prompts, ce qui rend la suite plus cadrée.

Cette étape marque la fin de la préparation. La phase suivante consistera à passer du prototype à l'application réelle : connecter le front-end à une base de données, implémenter les règles métier (cours, droits par rôle, etc.) et intégrer l'IA de manière robuste, en suivant la feuille de route définie.

________________________________________

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

# Chapitre 7 — Prospective : l'avenir du vibe coding

> Ce chapitre propose une réflexion sur l'avenir du vibe coding et ses implications. Après avoir expérimenté cette méthode tout au long du projet Blaiz'bot, je partage ici mes observations et mes interrogations sur l'évolution du métier de développeur.

---

## 7.1 État actuel du vibe coding (2025-2026)

Quand j'ai commencé ce projet en Septembre 2025, le terme "vibe coding" était encore assez confidentiel. Quelques mois plus tard, il est devenu un sujet de discussion courant dans la communauté des développeurs. Ce qui était au départ une expression lancée par Andrej Karpathy sur les réseaux sociaux est devenu une vraie tendance, avec ses partisans et ses sceptiques.

Aujourd'hui, les outils pour pratiquer le vibe coding sont nombreux et de plus en plus accessibles. GitHub Copilot est probablement le plus répandu : intégré directement dans VS Code, il suggère du code en temps réel pendant qu'on tape. Cursor est un éditeur qui va encore plus loin en permettant de dialoguer avec l'IA sur l'ensemble du projet. Du côté des assistants conversationnels, ChatGPT (OpenAI), Claude (Anthropic) et Gemini (Google) proposent tous des capacités avancées pour générer et expliquer du code. Chacun a ses forces : Claude est souvent cité pour sa rigueur et sa capacité à respecter des consignes complexes, GPT-4 pour sa polyvalence, Gemini pour son intégration dans l'écosystème Google.

Pourtant, ces outils ont encore des limites visibles. Les modèles de langage peuvent "halluciner", c'est-à-dire inventer des fonctions ou des bibliothèques qui n'existent pas. Ils ont du mal à garder un contexte cohérent sur des projets très larges. Et surtout, ils ne comprennent pas vraiment ce qu'ils produisent : ils génèrent du texte statistiquement probable, pas du code réfléchi. Ces limites expliquent pourquoi le vibe coding reste une méthode assistée, et pas une solution autonome.

Malgré tout, l'adoption progresse rapidement. Des entreprises utilisent déjà ces outils pour accélérer le développement de prototypes ou automatiser des tâches répétitives. Des indépendants lancent des produits en quelques semaines là où il aurait fallu des mois. Le vibe coding n'est plus une curiosité expérimentale : c'est une pratique qui s'installe durablement dans le paysage du développement logiciel.

---

## 7.2 Impact sur le métier de développeur

Cette évolution soulève une question que beaucoup se posent : le métier de développeur est-il menacé ? Après avoir passé plusieurs mois à travailler avec l'IA, ma réponse est nuancée. Le métier change, mais il ne disparaît pas. Il se transforme.

Traditionnellement, un développeur passe une grande partie de son temps à écrire du code ligne par ligne : syntaxe, boucles, conditions, gestion des erreurs. Avec le vibe coding, une partie de ce travail "mécanique" peut être déléguée à l'IA. Le développeur devient alors davantage un pilote qu'un exécutant. Il définit ce qu'il veut, guide l'IA avec des consignes claires, vérifie les résultats et corrige si nécessaire. C'est un changement de posture important.

Ce recentrage n'est pas forcément une mauvaise nouvelle. En automatisant les tâches répétitives, le développeur peut consacrer plus de temps aux décisions qui comptent vraiment : l'architecture du projet, le choix des technologies, la qualité de l'expérience utilisateur, la sécurité. Ce sont des compétences qui demandent du recul et de l'expérience, et que l'IA ne peut pas remplacer.

Cela dit, cette transformation ne concerne pas tous les développeurs de la même manière. Ceux qui se limitaient à reproduire des solutions standard risquent de voir leur valeur diminuer, car c'est exactement ce que l'IA fait bien. En revanche, ceux qui savent concevoir, critiquer et adapter conservent un rôle central. Le vibe coding amplifie les compétences de celui qui l'utilise : il ne crée pas de valeur tout seul.

---

## 7.3 Évolution des compétences requises

Si le métier change, les compétences attendues évoluent aussi. En travaillant sur Blaiz'bot, j'ai réalisé que certaines capacités devenaient plus importantes qu'avant, tandis que d'autres perdaient de leur poids relatif.

La première compétence clé est ce qu'on appelle le "prompt engineering" : savoir formuler des consignes claires et précises pour obtenir des résultats exploitables de l'IA. Ce n'est pas aussi simple qu'il y paraît. Un prompt vague donne une réponse vague. Un prompt trop détaillé peut perdre l'IA dans des contraintes contradictoires. J'ai appris à structurer mes demandes, à donner du contexte, à préciser le format attendu. C'est une compétence nouvelle, qui demande de la pratique.

La deuxième compétence est l'esprit critique. L'IA propose, mais c'est l'humain qui décide. Il faut savoir lire du code généré, détecter les erreurs, repérer les incohérences. Cela suppose une base solide en programmation : on ne peut pas critiquer ce qu'on ne comprend pas. Paradoxalement, utiliser l'IA efficacement demande de maîtriser les fondamentaux, pas de les ignorer.

La troisième compétence est la vision architecturale. Quand l'IA peut générer rapidement des composants, la vraie valeur se situe dans la capacité à organiser l'ensemble : comment structurer le projet, comment faire communiquer les modules, comment anticiper l'évolution. C'est un travail de conception qui reste entièrement humain.

Enfin, la communication et la documentation prennent de l'importance. Travailler avec l'IA, c'est souvent travailler avec du texte : prompts, explications, spécifications. Plus on sait s'exprimer clairement, plus on obtient de bons résultats. Et documenter son travail reste essentiel pour permettre à d'autres (ou à soi-même plus tard) de comprendre ce qui a été fait.

---

## 7.4 Implications pour l'éducation et la formation

Ces évolutions posent des questions importantes pour l'enseignement de l'informatique. Comment former les développeurs de demain quand les outils changent aussi vite ? Faut-il encore apprendre à coder "à la main" si l'IA peut le faire ?

Ma conviction, après ce projet, est que les fondamentaux restent indispensables. Comprendre la logique de programmation, savoir lire et structurer du code, connaître les concepts clés (variables, fonctions, objets, bases de données) : tout cela reste la base. Sans ces connaissances, on ne peut pas évaluer ce que l'IA produit, ni corriger ses erreurs. On devient dépendant d'une boîte noire qu'on ne maîtrise pas.

En revanche, la manière d'enseigner peut évoluer. Plutôt que de passer des semaines sur la syntaxe pure, on pourrait intégrer plus tôt des projets concrets où l'IA assiste l'apprentissage. L'étudiant apprend à coder, mais aussi à dialoguer avec l'IA, à valider ses propositions, à identifier ses limites. C'est d'ailleurs un peu ce que j'ai fait avec Blaiz'bot : j'ai appris en construisant, avec l'IA comme partenaire.

Il faudra aussi former les professionnels déjà en poste. Le vibe coding n'est pas réservé aux débutants : des développeurs expérimentés peuvent y trouver un gain de productivité important, à condition de s'adapter. La formation continue devient donc un enjeu majeur, que ce soit par des cours en ligne, des ateliers ou simplement par la pratique.

Enfin, de nouveaux métiers pourraient émerger autour de l'IA : spécialistes du prompt engineering, auditeurs de code généré, intégrateurs IA dans les équipes de développement. Le paysage professionnel est en train de se recomposer, et personne ne sait exactement à quoi il ressemblera dans cinq ou dix ans.

---

## 7.5 Enjeux éthiques et sociétaux

Le vibe coding soulève aussi des questions qui dépassent la technique. Pendant mon projet, j'en ai identifié plusieurs qui méritent réflexion.

La première concerne la propriété intellectuelle. Quand une IA génère du code, à qui appartient-il ? À l'utilisateur qui a formulé le prompt ? À l'entreprise qui a entraîné le modèle ? Aux auteurs du code sur lequel le modèle a été entraîné ? Ces questions n'ont pas encore de réponse claire, et les législations peinent à suivre l'évolution technologique. En attendant, il est prudent de vérifier les licences et de ne pas publier du code généré sans réflexion.

La deuxième question est celle de la dépendance. Les outils que j'ai utilisés (GitHub Copilot, Claude, Gemini) sont tous proposés par de grandes entreprises. Si leurs conditions changent, si les prix augmentent, ou si un service ferme, les développeurs qui en dépendent se retrouvent en difficulté. Il est important de garder une capacité à travailler sans ces outils, même si on les utilise au quotidien.

La troisième question concerne l'impact environnemental. Entraîner et faire tourner des modèles de langage consomme énormément d'énergie. Chaque requête à l'IA a un coût carbone. Ce n'est pas une raison pour arrêter de les utiliser, mais c'est un facteur à prendre en compte, surtout si l'usage se généralise à grande échelle.

Enfin, il y a la question de l'équité d'accès. Les meilleurs outils d'IA sont souvent payants ou réservés à certaines régions. Cela crée un risque de fracture : ceux qui ont accès aux outils avancés progressent plus vite, tandis que les autres restent à l'écart. L'éducation et l'accès aux technologies deviennent des enjeux de justice sociale.

---

## 7.6 Limites et risques du vibe coding

Après plusieurs mois de pratique intensive, je suis convaincu de l'utilité du vibe coding. Mais je suis aussi conscient de ses limites et de ses risques, qu'il serait malhonnête de passer sous silence.

Le premier risque est celui de l'accumulation de dette technique. L'IA peut générer du code qui fonctionne, mais qui n'est pas optimal : redondances, mauvaises pratiques, structures inutilement complexes. Si on accepte tout sans relire, le projet devient difficile à maintenir. J'ai moi-même dû refactoriser plusieurs fois des parties générées trop vite. Le gain de temps initial peut se transformer en perte de temps plus tard.

Le deuxième risque est la perte de compréhension. Quand l'IA écrit tout, on peut finir par ne plus vraiment comprendre son propre projet. C'est dangereux : en cas de bug ou d'évolution, on se retrouve face à du code qu'on n'a pas écrit et qu'on ne maîtrise pas. J'ai essayé d'éviter ce piège en relisant systématiquement ce que l'IA produisait, mais je comprends que la tentation de "faire confiance" soit forte.

Le troisième risque concerne la sécurité. L'IA peut proposer du code vulnérable sans s'en rendre compte. Elle ne connaît pas le contexte de sécurité du projet, les bonnes pratiques spécifiques à un domaine, ou les pièges classiques. C'est au développeur de vérifier ces aspects, ce qui demande des compétences que l'IA ne peut pas remplacer.

Enfin, il y a le risque de dépendance psychologique. Quand on s'habitue à avoir une IA qui répond à tout, on peut perdre le réflexe de chercher soi-même, de lire la documentation, de comprendre en profondeur. C'est un piège subtil, car l'IA est confortable. Mais le confort immédiat peut nuire à l'apprentissage à long terme.

---

## 7.7 Vision prospective : le développement logiciel en 2030

Que sera le développement logiciel dans cinq ans ? Personne ne le sait vraiment, mais on peut formuler quelques hypothèses à partir des tendances actuelles.

Les modèles de langage vont probablement continuer à s'améliorer. Ils seront capables de maintenir un contexte plus large, de comprendre des projets entiers plutôt que des fichiers isolés. Ils feront moins d'erreurs, hallucinneront moins, et proposeront des solutions plus adaptées au contexte. Cela rendra le vibe coding encore plus efficace.

On peut imaginer que le développement en "langage naturel" deviendra courant pour certains types de projets. Créer une application simple pourrait se faire en décrivant ce qu'on veut, sans jamais voir une ligne de code. Pour des projets plus complexes, le code restera nécessaire, mais l'IA assistera à chaque étape : génération, tests, documentation, déploiement.

Le rôle du développeur évoluera vers celui d'architecte et de superviseur. Il définira les grandes lignes, validera les choix de l'IA, et interviendra sur les parties critiques. Les tâches répétitives seront entièrement automatisées. Cela libérera du temps pour la créativité, la stratégie et l'innovation.

Mais cette évolution n'est pas garantie. Les limites techniques actuelles pourraient persister. Des régulations pourraient freiner le déploiement des IA. Des scandales (bugs majeurs, failles de sécurité) pourraient refroidir l'enthousiasme. L'avenir se construira au fil des choix collectifs : ceux des entreprises, des gouvernements, et des développeurs eux-mêmes.

Ce que je retiens de ce projet, c'est que le vibe coding n'est ni une révolution miraculeuse ni une menace existentielle. C'est un outil puissant, qui demande de la méthode et de l'esprit critique. Ceux qui sauront l'utiliser intelligemment en tireront un avantage. Ceux qui le subiront passivement risquent de se retrouver dépassés. Comme toujours avec la technologie, c'est l'usage qui fait la différence.

---
Maxime Buirette