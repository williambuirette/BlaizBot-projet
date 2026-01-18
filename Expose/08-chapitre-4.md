# Chapitre 4 — Wireframe codé et verrouillage du plan

---

## 4.1 Exécution du kickoff wireframe

Wireframe prêt. Place au code.

L'objectif de ce kickoff : transformer les écrans planifiés en interface web interactive, pour valider concrètement l'enchaînement des pages et la structure du prototype. J'ai d'abord configuré mon environnement (projet Next.js prêt, dépendances installées).

Puis j'ai lancé une première session avec deux assistants IA complémentaires : **ChatGPT** pour organiser le travail et clarifier les étapes, **Claude** dans VS Code pour générer le code. Concrètement : j'ai d'abord demandé à ChatGPT de m'aider à découper le travail — quels composants créer en premier, comment structurer la navigation, dans quel ordre avancer. Une fois ce plan défini, j'ai rédigé un prompt de kickoff pour Claude, en décrivant précisément le premier composant (la barre de navigation latérale).

Claude a produit le code directement dans VS Code. J'ai pu l'exécuter et le tester immédiatement. J'ai avancé ainsi, composant par composant, en validant chaque petite itération (bouton, page, menu). En quelques sessions, une première version du prototype prenait forme, fidèle à la maquette.

---

## 4.2 Design system et structure UI du prototype

Dès le début, j'ai mis en place un **design system simple** pour garantir la cohérence visuelle. L'idée : définir quelques règles communes — palette de couleurs (couleur principale pour les actions, vert pour les succès, rouge pour les alertes), typographie (police, tailles standards), composants UI réutilisables (boutons, formulaires, icônes). J'ai traduit ces décisions directement dans le code : classes CSS ou composants React pour les boutons principaux et secondaires, même rendu partout. Ça m'a fait gagner du temps — plus besoin de "réinventer" le style à chaque écran.

J'ai aussi défini une **structure UI claire** dès le départ. Le prototype repose sur un layout commun : sidebar pour la navigation, header pour le titre de page et le menu utilisateur, zone centrale pour le contenu. J'ai implémenté cette ossature au début pour que toutes les pages s'intègrent dans le même cadre. Avec Next.js, ça s'est traduit par des composants partagés (Sidebar, Header) utilisés sur tout l'espace après connexion. Base stable, je pouvais me concentrer sur le contenu de chaque page.

---

## 4.3 Écrans et parcours Élève / Professeur / Admin

Layout en place. J'ai ensuite développé les écrans spécifiques pour les trois types d'utilisateurs : élève, professeur, administrateur. Pour chaque profil, j'ai repris les pages du wireframe et construit un parcours "typique" pour vérifier que la navigation reste cohérente.

**Côté élève** : après connexion, l'utilisateur arrive sur un tableau de bord personnel. Il voit sa progression (avancement, cours terminés, exercices réalisés). Depuis ce point central, il accède à ses cours, à une section Révisions, à un agenda, et à l'assistant IA (chat pédagogique). Un onglet Messages sert de centre de communication (simulé à ce stade). L'objectif : que l'élève comprenne rapidement où il en est.

**Côté professeur** : dashboard orienté "suivi". Des KPI sur la classe, des points d'attention (élèves en difficulté, devoirs non rendus). Le prof dispose de pages pour gérer ses classes et ses cours (création, édition, chapitres, exercices). L'onglet Assignations permet d'attribuer un cours ou un quiz à une classe, avec date limite. Messages pour échanger avec un élève ou un groupe. Un module IA est prévu pour générer du contenu (quiz, résumés) — pas encore fonctionnel à ce stade.

**Côté administrateur** : interface centrée sur la gestion du système. Dashboard avec stats globales (utilisateurs, classes, cours). Pages CRUD : utilisateurs, classes, matières. Page paramètres pour les réglages globaux (clés API, authentification, plus tard).

Ces trois parcours sont intégrés dans le wireframe codé. Pour l'instant, ce sont surtout des pages statiques ou semi-fonctionnelles : navigation en place, structure visible, mais plusieurs actions "réelles" (messagerie, correction de quiz) viendront dans les phases suivantes. L'essentiel à ce stade : valider une maquette multi-rôles cohérente, sans trou dans le plan.

---

## 4.4 Modules, composants réutilisables et données simulées

En construisant le prototype, j'ai cherché à éviter les répétitions — code plus propre, plus facile à maintenir. J'ai créé des **composants réutilisables**. L'idée : construire un élément une fois, le réutiliser partout.

Exemple : l'interface admin et l'interface professeur utilisent toutes deux des tableaux pour afficher des listes (utilisateurs, élèves d'une classe, cours). Au lieu de plusieurs tableaux presque identiques, j'ai développé des composants de table configurables (UsersTable, ClassesTable, SubjectsTable). Même logique pour les cartes de statistiques (chiffre clé + icône), les modales de formulaire (ajout utilisateur, création cours), les bulles de chat. L'IA m'a d'ailleurs souvent poussé à généraliser un composant dès qu'un motif revenait. Résultat : le wireframe codé ressemble à un assemblage de "briques" — boutons, cartes, formulaires, menus. Ça accélère le prototypage tout en gardant un style uniforme.

Pour que le prototype soit parlant, j'ai aussi dû l'alimenter avec des **données simulées**. Base de données pas encore connectée → j'ai créé des jeux de données factices : faux élèves, faux professeurs, exemples de classes et de cours. La page "Utilisateurs" côté admin affiche une liste avec noms, emails, rôles — purement pour test. Le dashboard élève montre une progression basée sur des valeurs fictives codées en dur. J'ai stocké ces données en objets JavaScript ou fichiers JSON, comme base temporaire.

Ces "mock data" m'ont permis de tester l'affichage, la lisibilité, les limites de l'interface (listes longues, tableaux chargés) et de repérer des problèmes d'UX avant d'aller plus loin.

---

## 4.5 Itérations et corrections issues du prototype

Le wireframe codé s'est construit de manière itérative. Beaucoup d'allers-retours pour améliorer le rendu et corriger ce qui n'allait pas. Après chaque écran ou composant généré avec l'IA, je testais l'application et je relisais le code pour repérer les écarts par rapport au plan ou les détails à améliorer.

**Ajustements de design.** Certains textes étaient trop petits ou pas assez contrastés — j'ai affiné les styles (tailles de police, marges, couleurs). J'ai uniformisé certains libellés dans les menus et boutons pour plus de clarté.

**Oublis révélés par le test.** Après la création d'un cours ou d'un utilisateur, il n'y avait pas de retour visuel. En pratique, c'est déstabilisant : on ne sait pas si l'action a fonctionné. J'ai donc ajouté une notification simple pour confirmer les actions importantes ("Cours créé avec succès").

**Erreurs de comportement.** Exemple typique : la sidebar ne mettait pas en surbrillance le bon onglet lors de certains clics. Petite erreur dans la logique de l'état actif. J'ai aussi ajusté certains formulaires pour qu'ils se réinitialisent correctement après soumission, même sans base de données réelle.

À chaque problème repéré, je formulais un prompt précis (souvent à Claude) pour obtenir une correction ciblée, puis je testais immédiatement. Ce cycle rapide détection → correction → test a rendu le wireframe plus robuste : design plus propre, navigation plus fluide. Même sans tests externes, utiliser le prototype "comme si j'étais" un élève ou un professeur m'a aidé à améliorer l'expérience.

---

## 4.6 Comparatif "wireframe Markdown vs wireframe codé"

Avec le recul, la comparaison entre le wireframe Markdown (textuel) et le wireframe codé (prototype interactif) est instructive. Les deux approches ont joué des rôles complémentaires.

**Le wireframe Markdown** était avant tout une spécification écrite : cartographie précise des pages et éléments, sans rendu visuel. Très utile au début — ça m'a obligé à penser l'application de manière complète. En décrivant tout "noir sur blanc", j'ai repéré des oublis et ajusté la structure. Format agile : modifier un écran = ajouter ou déplacer quelques lignes. Limite principale : l'abstraction. Il faut se représenter mentalement l'interface.

**Le wireframe codé** est un prototype visuel et interactif. On clique, on navigue, on se met dans la peau d'un utilisateur. Beaucoup plus efficace pour valider l'ergonomie, la cohérence des parcours, la lisibilité. C'est aussi une preuve de faisabilité : coder l'interface confirme que ce qui était imaginé est réalisable dans la stack choisie. Inconvénient : demande plus de temps. La moindre modif implique de toucher au code et relancer l'app. Moins adapté au brainstorming rapide.

Les deux se complètent : le Markdown a servi de plan détaillé, le prototype codé a été le premier test concret de ce plan. Grâce à l'IA, le passage de l'un à l'autre a été plus fluide — le document Markdown a servi de référence directe pour générer une base de prototype fidèle.
---

## 4.7 Ajustement du plan et finalisation de l'architecture avec l'IA

Prototype terminé. J'ai pris du recul pour ajuster le plan global avant de poursuivre. Disposer d'une version concrète de l'application m'a permis d'identifier des points à améliorer, aussi bien dans la feuille de route que dans l'architecture. Pour cette consolidation, j'ai sollicité ChatGPT dans un rôle de conseiller stratégique — je lui ai décrit l'état du prototype, les difficultés rencontrées, mes pistes.

**Changement important : l'organisation des phases.** Initialement, le développement était découpé en grandes phases assez générales. Après le wireframe codé, il est apparu plus pertinent de progresser par modules fonctionnels distincts. L'interface Admin représente un travail conséquent à elle seule → j'en ai fait une phase dédiée. Idem pour Professeur et Élève. Avec ChatGPT, j'ai redéfini un plan plus granulaire : phase Admin, phase Prof, phase Élève, phase IA. Cette approche rend la progression plus lisible. J'ai verrouillé ce nouveau plan en définissant pour chaque phase des objectifs clairs et des critères de fin.

J'ai aussi finalisé l'architecture technique. Le prototype avait validé les grandes lignes, mais certains détails restaient à préciser. Avec l'IA, j'ai revu la structure de la base de données, les API prévues, l'arborescence du projet. En rejouant les parcours utilisateurs, j'ai par exemple identifié un champ manquant dans le modèle de données — ajouté avant d'aller plus loin. ChatGPT a aussi servi de contrôle croisé en comparant les fonctionnalités du prototype avec les endpoints API planifiés : j'ai corrigé un doublon et un oubli.

Confirmation finale des choix technologiques. À l'issue de cette étape, plan de développement et architecture stabilisés. Je pouvais aborder la suite avec une vision claire.

---

## 4.8 Refonte des TODO : backlog par phases (v1)

Plan affiné → j'ai entièrement réorganisé le fichier TODO pour refléter ce nouveau découpage. Au départ, ma liste de tâches était assez brute : idées ajoutées au fil du projet, notes dispersées. Il fallait la transformer en backlog clair, utilisable comme vraie feuille de route.

J'ai créé une **version v1 du backlog**, structurée par phases. Concrètement, le document TODO contient maintenant des sections identifiées (Phase 1 – Setup, Phase 2 – Admin, Phase 3 – Prof, Phase 4 – Élève, Phase 5 – IA). Sous chaque phase, des tâches précises et petites, réalisables en une session quand c'est possible. Exemple pour la phase Admin : implémenter la page liste des utilisateurs (front + API), tester la création/suppression, vérifier les permissions sur les routes. J'ai aussi noté les dépendances : certaines tâches ne peuvent démarrer qu'après d'autres.

Cette refonte a été facilitée par un agent IA orienté gestion de projet. Je lui ai demandé de relire mes anciennes notes et de les répartir dans les bonnes phases, en proposant des formulations plus claires. L'IA a aussi mis en évidence des tâches implicites que je n'avais pas forcément écrites — préparer des comptes de démo, prévoir des tests de base. Backlog plus complet et mieux priorisé.

Cette organisation est essentielle : chaque phase devient une checklist. L'avancement est mesurable, repérable, plus simple à piloter.
---

## 4.9 Gabarits de prompts par tâche et usage des agents

Au fil du prototypage, j'ai appris que la qualité des résultats dépend beaucoup de la façon dont on "parle" à l'IA. Plutôt qu'improviser un prompt à chaque fonctionnalité, j'ai créé des **gabarits de prompts** selon le type de tâche. Double objectif : gagner du temps et obtenir des réponses plus fiables dès la première génération.

Exemple : pour créer un nouveau composant React, mon prompt-type inclut presque toujours le nom du composant, le rôle concerné (élève/prof/admin), une description courte, la liste des données attendues (props), et un rappel du design system. En donnant ces infos de façon structurée, l'IA comprend mieux le contexte et produit du code plus proche de ce que j'attends. J'ai des gabarits différents pour d'autres cas : refactorisation, correction de bug, rédaction de test unitaire. La forme varie, mais l'idée reste la même : standardiser le dialogue.

J'ai aussi exploité les **agents IA spécialisés**. Plutôt qu'une seule IA polyvalente, plusieurs profils avec rôles clairs. Un agent "orchestrateur" pour découper une tâche complexe. Un agent "gestion de projet" pour maintenir le backlog. Un agent "standards" comme garde-fou qualité. D'autres pour refactoriser, documenter ou relire.

Dans la pratique, je sélectionne le bon agent selon le besoin. Claude pour produire et corriger du code, ChatGPT pour la réflexion globale et la planification. Comme une petite équipe d'assistants virtuels : chacun sa spécialité, moi je garde la décision finale. Ces gabarits et cette organisation par agents sont devenus la base de ma méthode de travail.

---

## 4.10 Prompt de lancement du développement de l'application (kickoff app)

Fin de la phase prototypage. J'avais tout pour passer au développement complet. Pour marquer ce changement, j'ai rédigé un **prompt de lancement très détaillé** : un brief initial pour l'agent de codage. Objectif : donner à l'IA un contexte stable et complet, pour qu'elle génère du "vrai" code métier sans approximations.

Dans ce prompt :
- **Objectifs globaux** : développer une application éducative full-stack avec trois interfaces (Élève, Professeur, Administrateur) et une couche IA (chat + génération de contenu)
- **Stack technique validée** : Next.js pour le front, PostgreSQL + Prisma pour la BDD, NextAuth pour l'authentification
- **Règles de travail** : cohérence design system, code lisible, pas de secrets en clair, organisation propre

Le prompt contient aussi la feuille de route par phases. Ce qui est fait (wireframe Markdown, prototype, plan verrouillé), ce qui vient (Phase 1 BDD + auth, Phase 2 Admin, Phase 3 Prof, Phase 4 Élève, Phase 5 IA, phase finale tests). Je précise qu'on démarre par la Phase 1, sans ambiguïté.

Point important : la gestion des variables d'environnement. Les clés et paramètres sensibles restent dans `.env.local`. Clé API Gemini stockée sous `GEMINI_API_KEY`, plus les autres variables (URL BDD, secret auth). Le but : indiquer à l'IA où se brancher et comment respecter les bonnes pratiques.

Consigne finale : commencer la Phase 1 étape par étape (Prisma, schéma, NextAuth), en validant chaque étape avant d'aller plus loin. Signal officiel : on sort du mode "prototype", on entre dans le développement réel.

---

## 4.11 Sortie de phase 4

Fin de la phase wireframe codé et verrouillage du plan. Double résultat positif.

**D'un côté**, un prototype fonctionnel de Blaiz'bot qui représente fidèlement la vision de départ. Pages principales en place, navigation cohérente, ergonomie testée, design system homogène. Ce wireframe codé devient une base précieuse — référence visuelle et technique pour intégrer progressivement les vraies fonctionnalités.

**De l'autre côté**, un plan de développement V1 stabilisé. Grâce aux ajustements faits après les tests, et avec l'appui de l'IA, le projet est découpé en phases logiques, le backlog structuré et priorisé, l'architecture confirmée (front, routes, modèle de données, future intégration IA). Ça réduit fortement les incertitudes.

À la sortie, plusieurs livrables : documentation à jour, prototype web navigable que je peux montrer, dépôt de code organisé. J'ai aussi consolidé une méthode de travail efficace — agents IA spécialisés, gabarits de prompts. La suite est plus cadrée.

Cette étape marque la fin de la préparation. Phase suivante : passer du prototype à l'application réelle. Connecter le front à une base de données, implémenter les règles métier, intégrer l'IA de manière robuste — en suivant la feuille de route définie.

---

**Pages estimées** : 10-12 pages  
**Temps de lecture** : 15-20 minutes  
**Mots-clés** : Prototype, Design System, Next.js, React, Itérations, Backlog, Refactoring
