# Chapitre 3 — Pré-projet : de l'idée au wireframe

---

## 3.1 Brainstorming et cadrage du MVP

Avant d'écrire la moindre ligne de code, j'ai commencé par un brainstorming pour clarifier l'idée de Blaiz'bot et cadrer un MVP réaliste. Pour cela, j'ai longuement échangé avec ChatGPT afin de définir le besoin, les fonctionnalités essentielles et les limites du projet. Ce travail m'a évité de partir dans toutes les directions et m'a permis de garder un objectif atteignable pour un premier prototype.

À ce stade, j'ai choisi de me concentrer sur les fonctions de base d'une plateforme éducative : gestion de cours, suivi des élèves et communication simple, en laissant de côté les idées trop secondaires ou trop complexes. J'ai aussi identifié dès le départ trois types d'utilisateurs, avec des besoins différents : administrateur, professeur et élève. Cette distinction m'a aidé à structurer le MVP sans oublier l'essentiel, tout en restant dans un périmètre gérable.

Ensuite, j'ai utilisé ChatGPT comme un véritable espace de travail pour organiser le projet. J'ai créé un projet dédié dans l'interface et ouvert plusieurs fils de discussion thématiques (planification, documentation, suivi des bugs, etc.). Cette organisation m'a permis de garder un contexte clair pour chaque sujet et d'éviter de répéter les mêmes informations. La prochaine étape a été de configurer cet espace de manière plus précise pour l'adapter à ma méthode de travail.

---

## 3.2 Organisation du projet ChatGPT

Dans le projet ChatGPT dédié à Blaiz'bot, j'ai commencé par créer un prompt système global : un ensemble de consignes qui cadrent l'IA dès le départ. Ce cadre précise le rôle attendu de ChatGPT, le style de réponse souhaité et des règles de méthode (avancer étape par étape, rester clair, expliquer simplement, et justifier ce qui est affirmé). L'objectif est que l'assistance reste cohérente tout au long du projet. Ce prompt n'est pas resté figé : je l'ai ajusté au fur et à mesure. Chaque fois que je trouvais une règle utile, je l'ajoutais pour améliorer la manière dont ChatGPT m'accompagne.

En parallèle, j'ai organisé le projet en plusieurs fils de discussion, chacun lié à un thème précis (planification, aide au codage, vérification, suivi des problèmes, etc.). Cela limite les confusions et évite de perdre du contexte. J'ai aussi enrichi la base de connaissances avec des documents et des notes (outils choisis, méthode du vibe coding, extraits de documentation), afin que l'IA s'appuie sur des références communes et ne me redemande pas sans cesse les mêmes informations. Ces choix d'organisation sont documentés ici à titre de méthodologie personnelle.

Enfin, il faut distinguer l'organisation et le développement. ChatGPT m'aide surtout à structurer les idées et la méthode. Le code, lui, est écrit et testé dans Visual Studio Code, avec l'appui de GitHub Copilot et du modèle Claude (Sonnet pour le code courant, Opus pour les tâches complexes). Cette séparation me permet de garder le contrôle : l'IA propose, mais c'est moi qui valide et j'implémente.

---

## 3.3 Outils et workflow (VS Code, GitHub, Vercel, Word)

Pour développer Blaiz'bot dans de bonnes conditions, j'ai choisi des outils modernes, adaptés à la méthode du vibe coding. Le cœur du travail se fait dans Visual Studio Code (VS Code), mon éditeur de code principal. Son interface me permet de tout avoir sous les yeux : les fichiers du projet, le code en cours d'édition et un terminal intégré pour lancer l'application ou exécuter des commandes. Cette organisation facilite un cycle rapide écrire → tester → corriger, essentiel pour un développement itératif. VS Code propose aussi de nombreuses extensions utiles, ce qui améliore la productivité et la lisibilité du code.

Pour la gestion des versions, j'utilise GitHub. Chaque étape importante du projet est enregistrée dans un dépôt Git, ce qui me permet de conserver un historique clair des modifications. Cela facilite le retour en arrière en cas d'erreur et rend visible l'évolution du projet étape par étape. Pour simplifier cette gestion, j'utilise GitHub Desktop, qui m'aide à visualiser les changements, rédiger des messages de commit clairs et synchroniser le code en ligne facilement. VS Code et GitHub fonctionnent ainsi ensemble : je développe localement, puis j'enregistre régulièrement les avancées.

Afin de tester l'application dans des conditions proches du réel, j'ai mis en place un déploiement automatique avec Vercel. À chaque mise à jour du dépôt GitHub, Vercel reconstruit et met en ligne la dernière version de l'application. En quelques minutes, Blaiz'bot est accessible sur Internet, ce qui me permet de vérifier rapidement le fonctionnement des nouvelles fonctionnalités sans déploiement manuel.

Enfin, j'utilise Microsoft Word pour rédiger l'exposé du projet. J'y documente les étapes au fur et à mesure, avec des explications, des captures d'écran et des extraits de code. Cela me permet de garder une cohérence entre le développement technique et le rapport écrit, et d'offrir au lecteur un suivi clair et structuré de la progression du projet.

---

## 3.4 Pipeline de travail et traçabilité

Tout au long du projet, j'ai suivi un pipeline simple et rigoureux pour passer d'une idée à une fonctionnalité réelle dans l'application : idée → code → test → commit → déploiement. Je commence par définir clairement la tâche à accomplir, souvent en échangeant avec l'IA pour préciser le résultat attendu. Ensuite, j'implémente la modification dans VS Code, en m'aidant de Copilot ou de ChatGPT si nécessaire. Une fois le code écrit, je teste immédiatement l'application en local pour vérifier que tout fonctionne comme prévu. Si le test est concluant, je crée un commit Git avec un message explicite, puis je l'envoie sur GitHub. À partir de là, Vercel déclenche automatiquement le déploiement, ce qui me permet de vérifier rapidement la fonctionnalité sur la version en ligne.

Ce pipeline apporte une vraie traçabilité. Chaque étape laisse une preuve : la réflexion et les consignes restent enregistrées dans les discussions avec l'IA, les commits sur GitHub montrent précisément ce qui a été ajouté ou modifié, et le déploiement sur Vercel permet de voir le résultat dans un contexte proche du réel. En parallèle, j'ai documenté ces étapes dans l'exposé avec des captures d'écran et des extraits de code, afin qu'on puisse suivre clairement l'évolution du projet. Cette méthode "une tâche → un test → un commit → un déploiement" m'a aidé à avancer de façon régulière, sans accumuler du code non testé.

---

## 3.5 Règles de qualité et sécurité minimales

Dès le début, je me suis fixé quelques règles simples pour garantir la qualité du code et un minimum de sécurité. En vibe coding, l'IA peut produire beaucoup de code très vite. Sans garde-fous, on risque d'obtenir un projet difficile à relire, à corriger et à faire évoluer.

La première règle concerne la lisibilité et la cohérence du code. J'utilise un formatage automatique avec Prettier : à chaque sauvegarde dans VS Code, le code est réindenté et mis en forme selon un style unique. Cela évite les différences entre ce que j'écris moi-même et ce que l'IA génère. En parallèle, un linter (ESLint) m'alerte immédiatement sur des erreurs courantes ou des oublis (imports manquants, variables inutilisées, etc.). Je corrige ces alertes au fur et à mesure, ce qui maintient un code propre et homogène.

La deuxième règle concerne la protection des informations sensibles. Je n'intègre jamais de clés d'API ou de mots de passe directement dans le code. Tous les secrets sont stockés dans un fichier .env, qui n'est pas versionné grâce à .gitignore. Ainsi, même si le dépôt est en ligne, ces données restent protégées, ce qui évite qu'une clé oubliée soit récupérée et utilisée par quelqu'un d'autre.

Enfin, je teste l'application régulièrement, surtout après avoir ajouté du code généré par l'IA. Relancer et vérifier souvent permet de détecter un bug immédiatement, au moment où il apparaît, plutôt que trop tard après plusieurs modifications. Cela réduit aussi le temps de recherche, car je sais précisément quel changement a pu provoquer le problème.

Avec ces règles de base (formatage, contrôle des alertes, secrets isolés, tests fréquents), le projet reste stable, compréhensible et prêt à évoluer.

---

## 3.6 Première TODO "v0" (liste initiale)

Avant de créer l'interface, j'ai rédigé une première liste de tâches très simple, que j'appelle la TODO "v0". L'objectif était d'avoir un fil directeur concret pour structurer la maquette et la navigation, sans partir dans tous les sens. J'y ai noté les écrans et fonctionnalités indispensables du MVP sous forme de tâches courtes, par exemple : créer une page de connexion, mettre en place un tableau de bord élève, intégrer un agenda ou ajouter une messagerie prof-élève.

En construisant cette liste, j'ai veillé à ce que chaque tâche soit bien délimitée et réalisable rapidement. Quand une idée était trop large (comme "faire toute la messagerie"), je la découpais en sous-tâches plus précises : créer l'interface, envoyer un message, afficher l'historique, etc. Travailler par petites unités m'a aidé de deux façons : je peux tester chaque ajout immédiatement, et l'IA a moins de chances de partir dans la mauvaise direction parce que les demandes restent très ciblées.

Au final, cette TODO v0 m'a servi de plan de route simplifié. Elle m'a permis de ne pas oublier les pages importantes pendant le wireframe et de garder une logique claire dans la construction de l'application.

---

## 3.7 Création des agents IA (référentiel de rôles)

Plutôt que d'utiliser une seule IA généraliste pour tout, j'ai choisi de créer plusieurs agents IA spécialisés. L'idée est simple : chaque type de problème mérite un "assistant" avec le bon contexte et la bonne mission, au lieu de demander à la même IA de tout faire. J'ai donc défini plusieurs rôles, par exemple un agent Planification pour organiser les étapes et les priorités, un agent Correction de bug quand quelque chose ne fonctionne pas, un agent Relecture de code pour vérifier la cohérence du projet, et un agent Documentation pour m'aider à rédiger des notes claires.

Pour mettre ces agents en place, j'ai créé un fichier Markdown dédié à chacun dans le dépôt GitHub. Chaque fichier sert de fiche d'identité : j'y décris le rôle, les limites (ce que l'agent a le droit ou non de faire) et le format attendu des réponses. Par exemple, l'agent Relecture de code doit analyser le code sans ajouter de fonctionnalités et lister les problèmes repérés. L'agent Correction de bug doit proposer directement les modifications nécessaires pour résoudre l'erreur, sans partir sur d'autres sujets. Ce référentiel m'aide à obtenir des réponses plus cadrées et plus utiles.

En pratique, je me suis concentré sur quelques agents clés, plutôt que d'en créer trop. L'objectif n'était pas de multiplier les profils, mais de couvrir les besoins fréquents du projet sans me disperser. À chaque étape, je savais quel agent utiliser : planification pour la vue d'ensemble, correction de bug en cas de blocage, documentation pour améliorer mes explications, etc. Cette approche multi-agents a rendu l'utilisation de l'IA plus efficace et plus maîtrisée, tout en gardant l'humain au centre des décisions.

---

## 3.8 Wireframe Markdown (v1)

Avant de développer l'interface graphique, j'ai créé une première maquette textuelle (wireframe) pour clarifier la structure de Blaiz'bot. L'objectif n'était pas de dessiner un design détaillé, mais de cartographier les pages nécessaires, d'indiquer leur contenu principal et de réfléchir à la navigation entre elles. Cette étape m'a servi de plan de route : en définissant l'organisation générale à l'avance, j'ai pu développer plus sereinement, sans coder "au hasard" et sans oublier des écrans importants.

J'ai d'abord réalisé un wireframe en Markdown pour définir la structure, plutôt que dans un outil graphique comme Figma. Le Markdown est rapide à écrire et suffisant pour décrire la logique d'une application : titres pour les pages, listes pour les éléments à afficher, et quelques notes sur les actions possibles. Un autre avantage est que ce fichier a été versionné sur GitHub comme le reste du projet. Il reste donc facile à consulter, à modifier, et il fait partie de la documentation vivante. Par la suite, j'ai transformé ce wireframe Markdown en prototype HTML/CSS/JavaScript interactif (avec données mockées et API simulée) avant le développement React/Next.js.

Concrètement, le wireframe décrit les trois espaces de l'application : Administrateur, Professeur et Élève. Pour chaque rôle, j'ai listé les pages essentielles et leur fonction. Côté élève, on retrouve un tableau de bord (progression, objectifs), une page Cours (contenus et ressources), une section Révisions (suppléments personnels), un agenda et l'assistant IA. Côté professeur, j'ai prévu des pages pour la gestion de classe, le suivi des résultats et la création ou mise à jour de cours et exercices. L'administrateur dispose d'un espace orienté "plateforme" : gestion des comptes, rôles, structure et supervision globale. Cette maquette a ensuite guidé la création des routes, du menu de navigation et des composants d'interface. En comparant régulièrement le développement avec le wireframe, je pouvais vérifier que je respectais bien le périmètre prévu.

Enfin, ce document a aussi été très utile pour travailler avec l'IA. Il me permettait de formuler des demandes précises : au lieu de dire "crée une page élève", je pouvais décrire exactement la page attendue et ses éléments. Résultat : l'IA comprenait mieux le contexte et proposait du code plus pertinent dès la première version. Au final, ce wireframe m'a fait gagner du temps, a amélioré la cohérence de l'interface et constitue une preuve que le projet a été conçu de manière structurée avant d'être codé.

---

## 3.9 Analyse du wireframe Markdown par l'IA (inventaire UI)

Une fois le wireframe Markdown terminé, j'ai demandé à l'IA d'en extraire un inventaire détaillé de l'interface utilisateur. L'objectif était de "traduire" la maquette, page par page, en une liste concrète de tout ce qu'il faudrait coder : boutons, menus, champs de formulaire, listes, icônes, ainsi que les actions associées.

Pour cela, j'ai fourni le texte complet du wireframe à ChatGPT avec une consigne simple : pour chaque page décrite, lister les composants visuels et les interactions nécessaires. L'IA a alors parcouru chaque écran et a produit une liste structurée. Par exemple, pour un tableau de bord élève, elle a identifié des éléments comme l'affichage de la progression, une liste d'objectifs et des boutons d'action. Pour une page de messagerie, elle a listé le champ de saisie, le bouton d'envoi et l'affichage de la conversation.

Cet inventaire m'a été utile à deux niveaux. D'abord, il m'a servi de contrôle : si un élément essentiel n'apparaissait pas, c'était un signal que ma maquette manquait de précision ou qu'une fonction avait été oubliée. Ensuite, il m'a fourni une base de travail pour le développement du front-end, en transformant la maquette en "liste des choses à coder". C'est une étape que j'aurais pu faire à la main, mais l'automatiser avec ChatGPT m'a fait gagner du temps et m'a donné rapidement une vue complète.

---

## 3.10 Prompt de lancement pour coder le wireframe (kickoff wireframe)

À ce stade, j'avais deux bases solides : la maquette complète de l'application en Markdown et l'inventaire détaillé des éléments d'interface à développer. Avant de commencer à coder, il restait une étape importante : choisir une stack technique cohérente et préparer un prompt capable de lancer le projet proprement.

Pour éviter de me baser uniquement sur mon intuition, j'ai demandé à ChatGPT de me conseiller une architecture adaptée au périmètre du MVP. Je lui ai décrit la structure du wireframe, les besoins principaux de l'application et les contraintes de simplicité. L'IA m'a proposé une combinaison d'outils modernes et cohérents (framework web, langage, organisation du projet, base de données, etc.). En comparant ces suggestions avec mes propres connaissances, j'ai pu fixer des choix techniques raisonnables : une base solide, mais sans complexité inutile, afin de rester aligné avec l'objectif du prototype.

Une fois ces décisions prises, j'ai rédigé un prompt de lancement (kickoff) destiné à générer le squelette de Blaiz'bot. Ce prompt regroupait tout ce dont l'IA avait besoin dès le départ :
- l'inventaire UI page par page (pour savoir quelles pages créer et quoi y mettre)
- des consignes de structure (dossiers, pages, composants communs, navigation)
- des règles de code et de cohérence (noms, conventions, fichiers, organisation)

L'objectif était de transformer l'inventaire UI en plan de construction. Concrètement, je demandais à l'IA de générer une première version complète du wireframe codé : pages correspondantes à la maquette, navigation fonctionnelle, composants principaux (même simplifiés) et une base de mise en forme.

Après l'envoi de ce prompt, j'ai obtenu un projet initial exploitable : une structure claire et un prototype minimal sur lequel je pouvais ensuite itérer. Tout n'était pas finalisé, mais j'avais déjà une base fonctionnelle, ce qui confirmait que le prompt était assez complet pour guider l'IA dans la création du projet.

---

## 3.11 Sortie de phase 3

Pour conclure cette phase de pré-projet, tout était prêt pour démarrer le développement du wireframe codé dans de bonnes conditions. J'ai vérifié que l'ensemble maquette Markdown + inventaire UI + prompt de lancement formait un tout cohérent et suffisait pour lancer le prototype sans improviser. Ces trois livrables constituent une base solide : la maquette définit clairement ce qu'il faut construire, l'inventaire UI permet de s'assurer qu'aucun élément d'interface important n'a été oublié, et le prompt de kickoff regroupe toutes les consignes nécessaires pour que l'IA génère un squelette fidèle au plan.

Grâce à ce travail préparatoire, j'aborde la suite avec une vision claire et une méthode structurée. La phase 3 m'a permis de poser des fondations stables avant d'écrire réellement du code. À ce stade, j'ai une architecture technique choisie, un wireframe minimal déjà cadré, et une liste de tâches suffisamment précise pour avancer étape par étape. Tout est donc en place pour lancer le développement de Blaiz'bot de manière plus sûre et plus régulière.

---

**Pages estimées** : 12-14 pages  
**Temps de lecture** : 18-22 minutes  
**Mots-clés** : Wireframe, Markdown, Agents IA, ChatGPT, GitHub, VS Code, Vercel, TODO, Pipeline
