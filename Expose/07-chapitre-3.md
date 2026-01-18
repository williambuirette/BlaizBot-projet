# Chapitre 3 — Pré-projet : de l'idée au wireframe

---

## 3.1 Brainstorming et cadrage du MVP

Avant d'écrire la moindre ligne de code, j'ai commencé par clarifier l'idée de Blaiz'bot. Un brainstorming. J'ai longuement échangé avec ChatGPT pour définir le besoin, les fonctionnalités essentielles et les limites du projet. Sans ce travail, j'aurais pu partir dans toutes les directions. Là, j'avais un objectif atteignable pour un premier prototype.

Je me suis concentré sur les fonctions de base d'une plateforme éducative : gestion de cours, suivi des élèves, communication simple. J'ai laissé de côté les idées trop secondaires ou complexes. Et dès le départ, j'ai identifié trois types d'utilisateurs avec des besoins différents : administrateur, professeur, élève. Cette distinction m'a aidé à structurer le MVP sans oublier l'essentiel.

J'ai aussi utilisé ChatGPT comme espace de travail. J'ai créé un projet dédié et ouvert plusieurs fils de discussion thématiques : planification, documentation, suivi des bugs... Ça m'a permis de garder un contexte clair pour chaque sujet et d'éviter de répéter les mêmes infos. L'étape suivante : configurer cet espace plus précisément pour l'adapter à ma méthode.

---

## 3.2 Organisation du projet ChatGPT

Dans le projet ChatGPT dédié à Blaiz'bot, j'ai créé un **prompt système global** — un ensemble de consignes qui cadrent l'IA dès le départ. Quel rôle pour ChatGPT ? Quel style de réponse ? Quelles règles de méthode (avancer étape par étape, rester clair, justifier ce qui est affirmé) ? L'idée : que l'assistance reste cohérente tout au long du projet. Et ce prompt n'est pas resté figé. Chaque fois que je trouvais une règle utile, je l'ajoutais.

J'ai aussi organisé le projet en plusieurs fils de discussion, chacun lié à un thème : planification, aide au codage, vérification, suivi des problèmes... Ça évite les confusions et la perte de contexte. J'ai enrichi la base de connaissances avec des documents (outils choisis, méthode du vibe coding, extraits de documentation) pour que l'IA s'appuie sur des références communes et ne me redemande pas sans cesse les mêmes informations.

Une distinction importante : organisation ≠ développement. ChatGPT m'aide à structurer les idées et la méthode. Mais le code, lui, est écrit et testé dans Visual Studio Code, avec GitHub Copilot et Claude (Sonnet pour le code courant, Opus pour les tâches complexes). L'IA propose, c'est moi qui valide et qui implémente.

---

## 3.3 Outils et workflow (VS Code, GitHub, Vercel, Word)

Pour développer Blaiz'bot, j'ai choisi des outils modernes, adaptés au vibe coding.

**VS Code** est mon éditeur principal. J'ai tout sous les yeux : fichiers du projet, code en cours d'édition, terminal intégré pour lancer l'application. Ça facilite le cycle écrire → tester → corriger, essentiel pour un développement itératif. Les extensions sont nombreuses et utiles.

**GitHub** pour la gestion des versions. Chaque étape importante est enregistrée dans un dépôt Git — je conserve un historique clair des modifications. Si je fais une erreur, je peux revenir en arrière. J'utilise GitHub Desktop pour visualiser les changements, rédiger des messages de commit clairs et synchroniser le code facilement. Je développe localement, puis j'enregistre régulièrement les avancées.

**Vercel** pour le déploiement automatique. À chaque mise à jour du dépôt GitHub, Vercel reconstruit et met en ligne la dernière version. En quelques minutes, Blaiz'bot est accessible sur Internet. Je peux vérifier rapidement si les nouvelles fonctionnalités marchent, sans déploiement manuel.

**Microsoft Word** pour l'exposé. J'y documente les étapes au fur et à mesure — explications, captures d'écran, extraits de code. Ça garde une cohérence entre le développement technique et le rapport écrit.

---

## 3.4 Pipeline de travail et traçabilité

J'ai suivi un pipeline simple pour passer d'une idée à une fonctionnalité réelle :

**idée → code → test → commit → déploiement**

D'abord, je définis clairement la tâche, souvent en échangeant avec l'IA pour préciser le résultat attendu. Ensuite, j'implémente dans VS Code (avec Copilot ou ChatGPT si besoin). Je teste immédiatement en local. Si ça marche, je crée un commit Git avec un message explicite, puis je l'envoie sur GitHub. Vercel déclenche automatiquement le déploiement — je peux vérifier la fonctionnalité sur la version en ligne.

Ce pipeline apporte une vraie traçabilité. Chaque étape laisse une preuve : les réflexions restent dans les discussions avec l'IA, les commits montrent précisément ce qui a été modifié, le déploiement permet de voir le résultat en conditions réelles. J'ai aussi documenté ces étapes dans l'exposé (captures, extraits de code). Cette méthode "une tâche → un test → un commit" m'a aidé à avancer régulièrement, sans accumuler du code non testé.

---

## 3.5 Règles de qualité et sécurité minimales

Dès le début, je me suis fixé quelques règles simples. Pourquoi ? Parce qu'en vibe coding, l'IA produit beaucoup de code très vite. Sans garde-fous, on se retrouve avec un projet difficile à relire, à corriger, à faire évoluer.

**Règle 1 : lisibilité.** J'utilise Prettier pour le formatage automatique — à chaque sauvegarde, le code est réindenté selon un style unique. Plus de différences entre ce que j'écris et ce que l'IA génère. En parallèle, ESLint m'alerte sur les erreurs courantes (imports manquants, variables inutilisées...). Je corrige au fur et à mesure. Le code reste propre et homogène.

**Règle 2 : secrets protégés.** Jamais de clés d'API ou de mots de passe dans le code. Tous les secrets vont dans un fichier `.env`, qui n'est pas versionné grâce à `.gitignore`. Même si le dépôt est public, ces données restent protégées.

**Règle 3 : tests fréquents.** Je teste l'application régulièrement, surtout après avoir ajouté du code généré par l'IA. Relancer souvent permet de détecter un bug immédiatement, au moment où il apparaît — pas trois modifications plus tard quand on ne sait plus d'où ça vient.

Avec ces règles de base (formatage, alertes, secrets isolés, tests), le projet reste stable et compréhensible.

---

## 3.6 Première TODO "v0" (liste initiale)

Avant de créer l'interface, j'ai rédigé une première liste de tâches très simple : la TODO "v0". L'idée ? Avoir un fil directeur concret pour structurer la maquette, sans partir dans tous les sens. J'y ai noté les écrans et fonctionnalités indispensables du MVP sous forme de tâches courtes : créer une page de connexion, mettre en place un tableau de bord élève, intégrer un agenda, ajouter une messagerie prof-élève...

Chaque tâche devait être bien délimitée et réalisable rapidement. Quand une idée était trop large ("faire toute la messagerie"), je la découpais : créer l'interface, envoyer un message, afficher l'historique. Travailler par petites unités m'a aidé de deux façons : je peux tester chaque ajout immédiatement, et l'IA a moins de chances de partir dans la mauvaise direction parce que les demandes restent ciblées.

Cette TODO v0 m'a servi de plan de route simplifié — ne pas oublier les pages importantes, garder une logique claire.

---

## 3.7 Création des agents IA (référentiel de rôles)

Plutôt qu'une seule IA généraliste pour tout, j'ai créé plusieurs **agents spécialisés**. L'idée : chaque type de problème mérite un "assistant" avec le bon contexte et la bonne mission. J'ai défini plusieurs rôles — un agent Planification pour organiser les étapes, un agent Correction de bug quand quelque chose ne marche pas, un agent Relecture de code pour vérifier la cohérence, un agent Documentation pour m'aider à rédiger.

Pour chaque agent, j'ai créé un fichier Markdown dans le dépôt GitHub. Une sorte de fiche d'identité : rôle, limites (ce qu'il a le droit ou non de faire), format attendu des réponses. Par exemple, l'agent Relecture doit analyser le code sans ajouter de fonctionnalités — il liste les problèmes, point final. L'agent Correction de bug propose directement les modifications nécessaires, sans partir sur d'autres sujets. Ce référentiel m'aide à obtenir des réponses plus cadrées.

Je me suis concentré sur quelques agents clés, pas plus. L'objectif n'était pas de multiplier les profils, mais de couvrir les besoins fréquents sans me disperser. À chaque étape, je savais quel agent utiliser. Cette approche multi-agents a rendu l'IA plus efficace — tout en gardant l'humain au centre des décisions.

---

## 3.8 Wireframe Markdown (v1)

Avant de coder l'interface, j'ai créé une maquette textuelle — un wireframe. Pas un design détaillé. Juste une cartographie des pages, leur contenu principal, la navigation entre elles. Cette étape m'a servi de plan de route : en définissant l'organisation à l'avance, j'ai pu développer sans coder "au hasard" et sans oublier des écrans importants.

Pourquoi en Markdown plutôt que Figma ? C'est rapide à écrire et suffisant pour décrire la logique d'une application : titres pour les pages, listes pour les éléments, notes sur les actions possibles. Et le fichier est versionné sur GitHub comme le reste du projet — facile à consulter, à modifier, partie de la documentation vivante. Par la suite, j'ai transformé ce wireframe Markdown en prototype HTML/CSS/JS interactif (données mockées, API simulée) avant de passer à React/Next.js.

Concrètement, le wireframe décrit les trois espaces : **Administrateur**, **Professeur**, **Élève**. Pour chaque rôle, j'ai listé les pages essentielles. Côté élève : tableau de bord (progression, objectifs), page Cours, section Révisions, agenda, assistant IA. Côté professeur : gestion de classe, suivi des résultats, création de cours et exercices. L'administrateur : gestion des comptes, rôles, structure, supervision. Cette maquette a guidé la création des routes, du menu, des composants. En comparant régulièrement le développement avec le wireframe, je vérifiais que je restais dans le périmètre prévu.

Ce document a aussi été très utile pour travailler avec l'IA. Au lieu de dire "crée une page élève", je pouvais décrire exactement la page attendue. Résultat : l'IA comprenait mieux le contexte et proposait du code pertinent dès la première version. Ce wireframe m'a fait gagner du temps et prouve que le projet a été conçu de manière structurée.

---

## 3.9 Analyse du wireframe Markdown par l'IA (inventaire UI)

Wireframe terminé. Étape suivante : demander à l'IA d'en extraire un **inventaire UI détaillé**. L'idée ? "Traduire" la maquette, page par page, en liste concrète de ce qu'il faudrait coder : boutons, menus, champs de formulaire, listes, icônes, actions associées.

J'ai fourni le texte complet du wireframe à ChatGPT avec une consigne simple : pour chaque page, lister les composants visuels et les interactions. L'IA a parcouru chaque écran et produit une liste structurée. Par exemple, pour le tableau de bord élève : affichage de la progression, liste d'objectifs, boutons d'action. Pour la messagerie : champ de saisie, bouton d'envoi, affichage de la conversation.

Cet inventaire m'a servi à deux niveaux. D'abord, comme contrôle : si un élément essentiel n'apparaissait pas, c'était un signal que ma maquette manquait de précision. Ensuite, comme base de travail pour le front-end — la maquette transformée en "liste des choses à coder". J'aurais pu le faire à la main, mais l'automatiser m'a fait gagner du temps.

---

## 3.10 Prompt de lancement pour coder le wireframe (kickoff wireframe)

J'avais maintenant deux bases solides : la maquette Markdown et l'inventaire UI. Avant de coder, il restait une étape : choisir une stack technique cohérente et préparer un prompt capable de lancer le projet proprement.

Pour ne pas me baser uniquement sur mon intuition, j'ai demandé à ChatGPT de me conseiller une architecture adaptée au MVP. Je lui ai décrit le wireframe, les besoins principaux et les contraintes de simplicité. L'IA m'a proposé une combinaison d'outils modernes (framework web, langage, organisation, base de données...). En comparant avec mes connaissances, j'ai fixé des choix raisonnables : une base solide, sans complexité inutile.

Ensuite, j'ai rédigé un **prompt de kickoff** pour générer le squelette de Blaiz'bot. Il regroupait :
- l'inventaire UI page par page
- des consignes de structure (dossiers, pages, composants, navigation)
- des règles de code (noms, conventions, organisation)

Concrètement, je demandais à l'IA de générer une première version du wireframe codé : pages correspondantes à la maquette, navigation fonctionnelle, composants principaux (même simplifiés), base de mise en forme.

Résultat : un projet initial exploitable. Structure claire, prototype minimal sur lequel itérer. Tout n'était pas finalisé, mais j'avais déjà une base fonctionnelle. Le prompt était assez complet pour guider l'IA.

---

## 3.11 Sortie de phase 3

Fin de la phase pré-projet. Tout était prêt pour démarrer le développement du wireframe codé dans de bonnes conditions.

J'ai vérifié que l'ensemble — maquette Markdown + inventaire UI + prompt de kickoff — formait un tout cohérent. Ces trois livrables constituent une base solide : la maquette définit ce qu'il faut construire, l'inventaire UI garantit qu'aucun élément n'a été oublié, le prompt de kickoff regroupe les consignes pour que l'IA génère un squelette fidèle au plan.

La phase 3 m'a permis de poser des fondations stables avant d'écrire du code. J'ai une architecture technique choisie, un wireframe cadré, une liste de tâches précise. Tout est en place pour lancer le développement de façon plus sûre et plus régulière.

---

**Pages estimées** : 12-14 pages  
**Temps de lecture** : 18-22 minutes  
**Mots-clés** : Wireframe, Markdown, Agents IA, ChatGPT, GitHub, VS Code, Vercel, TODO, Pipeline
