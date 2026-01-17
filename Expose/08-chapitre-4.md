# Chapitre 4 — Wireframe codé et verrouillage du plan

> **Note** : Ce chapitre contient le contenu complet du Chapitre 4 extrait de Expose-BlaizBot-V1.md  
> À copier depuis la ligne 239 à 340 environ

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

---

**Pages estimées** : 10-12 pages  
**Temps de lecture** : 15-20 minutes  
**Mots-clés** : Prototype, Design System, Next.js, React, Itérations, Backlog, Refactoring
