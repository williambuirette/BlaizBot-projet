# Chapitre 8 — Conclusion générale

> Ce dernier chapitre fait le bilan du travail accompli. J'y présente ce que j'ai réalisé, ce que j'ai appris, les difficultés que j'ai rencontrées et les pistes pour aller plus loin. Je termine par une réflexion personnelle sur le vibe coding et ce qu'il représente pour l'avenir du développement.

---

## 8.1 Synthèse des travaux réalisés

Au terme de ce travail de maturité, je peux faire le point sur ce que j'ai accompli. Le projet avait deux objectifs : créer une application fonctionnelle en utilisant le vibe coding, et documenter cette démarche de manière claire et structurée. Je pense avoir atteint ces deux objectifs, même si le résultat n'est pas parfait.

Sur le plan théorique, j'ai d'abord étudié ce qu'est le vibe coding. J'ai compris comment cette nouvelle approche fonctionne, quels sont les outils disponibles (ChatGPT, Claude, Gemini) et pourquoi elle change la façon de programmer. Cette phase m'a permis de poser les bases avant de me lancer dans le développement.

Sur le plan pratique, j'ai créé BlaizBot, une application web éducative complète. Le résultat final comprend trois interfaces distinctes (administrateur, professeur, élève), une base de données avec 46 tables Prisma, un système d'authentification sécurisé avec gestion des rôles, et un assistant IA pédagogique connecté à Gemini. L'application est déployée sur Vercel et accessible en ligne.

Pour arriver à ce résultat, j'ai suivi une méthode structurée. J'ai commencé par un brainstorming pour cadrer le MVP, puis j'ai créé un wireframe pour visualiser l'application avant de coder. Ensuite, j'ai développé étape par étape, en testant chaque modification et en corrigeant les erreurs au fur et à mesure. Ce cycle "demande → code → test → correction" s'est répété des centaines de fois tout au long du projet.

La documentation a aussi été un travail important. Cet exposé retrace la démarche complète, depuis l'idée initiale jusqu'à la démonstration finale. J'ai essayé d'être précis sur les choix que j'ai faits, les problèmes que j'ai rencontrés et les solutions que j'ai trouvées. L'objectif était de montrer le processus réel, pas une version idéalisée.

---

## 8.2 Apports personnels et compétences acquises

Ce projet m'a beaucoup appris, sur plusieurs plans. Certaines compétences sont techniques, d'autres sont plus méthodologiques ou transversales.

Du côté technique, j'ai progressé sur des technologies que je ne maîtrisais pas au départ. Next.js, React et TypeScript sont devenus des outils que je comprends et que je sais utiliser. J'ai appris à structurer une base de données avec Prisma, à créer des API REST, à gérer l'authentification avec NextAuth et à déployer une application sur Vercel. J'ai aussi découvert comment intégrer une IA générative (Gemini) dans une application web.

Sur le plan méthodologique, j'ai appris à organiser un projet de A à Z. Découper le travail en phases, créer un backlog de tâches, suivre sa progression : tout cela était nouveau pour moi. J'ai aussi développé des compétences en "prompt engineering", c'est-à-dire l'art de formuler des consignes claires pour obtenir de bons résultats de l'IA. C'est une compétence qui demande de la pratique et de la précision.

Plus largement, ce projet m'a appris à résoudre des problèmes complexes. Quand quelque chose ne marchait pas, je devais analyser la situation, identifier la cause et trouver une solution. J'ai aussi développé mon esprit critique face aux propositions de l'IA : elle peut se tromper, et il faut savoir reconnaître quand c'est le cas.

Enfin, j'ai beaucoup progressé en organisation et en rigueur. Travailler seul sur un projet de cette ampleur demande de la discipline. Il faut garder une trace de ce qu'on fait, ne pas se disperser et avancer régulièrement même quand on est bloqué. La rédaction de cet exposé m'a aussi obligé à clarifier mes idées et à les exprimer de manière compréhensible.

---

## 8.3 Limites du projet et difficultés rencontrées

Il serait malhonnête de ne présenter que les réussites. Ce projet a aussi ses limites, et j'ai rencontré des difficultés tout au long du développement.

La première limite concerne les tests. Je n'ai pas mis en place de tests unitaires complets. Le temps m'a manqué, et j'ai préféré concentrer mes efforts sur les fonctionnalités du MVP. Résultat : certains bugs ont pu passer inaperçus, et le code est moins robuste qu'il pourrait l'être. C'est un point que j'améliorerais si je devais continuer le projet.

L'interface mobile est une autre faiblesse. J'ai conçu l'application en priorité pour les écrans d'ordinateur. Sur téléphone, l'expérience utilisateur est correcte mais pas optimale. Certaines pages sont difficiles à naviguer, et des ajustements seraient nécessaires pour un usage mobile confortable.

La messagerie reste basique. Elle fonctionne, mais elle n'est pas en temps réel : il faut rafraîchir la page pour voir les nouveaux messages. Une vraie messagerie instantanée demanderait des technologies supplémentaires (WebSockets, par exemple) que je n'ai pas eu le temps d'intégrer.

Côté difficultés, la gestion des "hallucinations" de l'IA a été un défi constant. L'IA peut inventer des fonctions qui n'existent pas, proposer du code qui ne compile pas, ou suggérer des approches inadaptées. J'ai appris à repérer ces erreurs, mais ça m'a coûté du temps et de la frustration.

J'ai aussi eu du mal à éviter le "scope creep", c'est-à-dire la tentation d'ajouter des fonctionnalités non prévues. Quand on voit que quelque chose est possible, on a envie de l'intégrer. Mais cela allonge le projet et peut faire perdre de vue l'essentiel. J'ai dû me recentrer plusieurs fois sur le MVP.

Enfin, travailler seul a été à la fois un avantage et une contrainte. Pas de conflits d'équipe, mais pas non plus de regard extérieur pour repérer mes erreurs ou proposer des idées différentes. Un projet d'équipe aurait sans doute été plus riche, mais aussi plus complexe à coordonner.

---

## 8.4 Perspectives d'amélioration de Blaiz'Bot

Si je devais continuer à développer BlaizBot, plusieurs améliorations me semblent prioritaires.

À court terme, je commencerais par l'expérience mobile. Adapter l'interface pour qu'elle soit vraiment confortable sur téléphone et tablette rendrait l'application beaucoup plus pratique pour les élèves. J'ajouterais aussi des notifications en temps réel, pour que les utilisateurs soient prévenus quand ils reçoivent un message ou quand un nouveau contenu est disponible.

La messagerie mériterait d'être améliorée. Une vraie discussion instantanée, avec des indicateurs de lecture et de saisie, rendrait les échanges plus fluides entre élèves et professeurs. Des tests automatisés seraient aussi importants pour garantir la qualité du code à long terme.

À moyen terme, l'espace Parent serait une addition logique. Les parents pourraient suivre la progression de leur enfant sans interférer avec le travail du professeur. L'IA pourrait aussi être utilisée pour générer automatiquement du contenu pédagogique : résumés de cours, exercices supplémentaires, fiches de révision personnalisées.

La gamification pourrait être poussée plus loin. Des défis entre élèves, des succès à débloquer, des classements motivants : ces éléments rendraient les révisions plus engageantes. Les recommandations personnalisées, basées sur les résultats de chaque élève, permettraient d'adapter le parcours d'apprentissage.

À long terme, on pourrait imaginer une analyse prédictive des difficultés. L'IA pourrait repérer, avant même un contrôle, quels élèves risquent d'avoir des problèmes sur quels sujets. Le contenu pourrait s'adapter automatiquement au niveau de chacun. Une version multilingue ouvrirait l'application à d'autres marchés. Et une intégration avec des LMS existants (Moodle, Google Classroom) faciliterait l'adoption par les établissements scolaires.

Tout cela reste du domaine du possible, mais demanderait beaucoup plus de temps et de ressources que ce travail de maturité.

---

## 8.5 Réflexion finale sur le vibe coding

Au terme de ce projet, je porte un regard nuancé sur le vibe coding. Cette approche m'a permis de créer une application que je n'aurais probablement pas pu développer seul en si peu de temps. Mais elle m'a aussi montré ses limites et ses risques.

Le premier enseignement, c'est que l'IA est un outil puissant mais imparfait. Elle peut générer du code rapidement, proposer des solutions créatives et automatiser des tâches répétitives. Mais elle peut aussi se tromper, inventer des choses qui n'existent pas et produire du code qui ne fonctionne pas. Sans vérification humaine, les erreurs s'accumulent.

Le deuxième enseignement, c'est que la qualité du prompt détermine la qualité du résultat. Quand je donnais des consignes vagues, j'obtenais des réponses vagues. Quand je prenais le temps de bien expliquer ce que je voulais, avec du contexte et des exemples, les résultats étaient bien meilleurs. Le "prompt engineering" est une vraie compétence qu'il faut développer.

Le troisième enseignement, c'est que le test et la validation restent essentiels. L'IA ne comprend pas vraiment ce qu'elle fait. Elle prédit des suites de caractères probables, mais elle n'a pas de notion de "fonctionnement correct". C'est au développeur de vérifier que le code fait ce qu'il est censé faire.

Le quatrième enseignement, c'est que la documentation est cruciale. Quand on travaille avec l'IA, il est facile de perdre le fil de ce qui a été fait et pourquoi. Garder une trace des décisions, des problèmes et des solutions permet de ne pas tourner en rond et de capitaliser sur son expérience.

Le cinquième enseignement, c'est que l'humain garde le contrôle des décisions importantes. L'architecture de l'application, les choix de sécurité, la logique métier : tout cela reste du ressort du développeur. L'IA peut aider à implémenter, mais c'est l'humain qui décide.

Pour l'avenir, je pense que le vibe coding va continuer à se développer. Les outils vont s'améliorer, les modèles vont devenir plus puissants et plus fiables. Les développeurs qui sauront collaborer efficacement avec l'IA auront un avantage. Mais ceux qui perdront leurs compétences fondamentales en programmation risquent de devenir dépendants d'un outil qu'ils ne maîtrisent pas vraiment.

Ce travail de maturité m'a fait vivre concrètement cette transformation du métier de développeur. L'expérience a été enrichissante, parfois frustrante, toujours instructive. Je ne regrette pas d'avoir choisi ce sujet. Le vibe coding n'est pas une menace pour les développeurs, c'est une opportunité de se concentrer sur ce qui compte vraiment : comprendre les problèmes, concevoir des solutions et créer de la valeur. Le code n'est qu'un moyen, pas une fin.

---

**Mots-clés** : Conclusion, Bilan, Compétences, Limites, Perspectives, Réflexion, Vibe Coding, Avenir  
**Temps de lecture** : 10 minutes  
**Pages estimées** : 5-6 pages

Le vibe coding représente une évolution majeure du développement logiciel. Ce projet a démontré qu'il est possible de créer une application complexe en un temps réduit grâce à la collaboration humain-IA, tout en maintenant un niveau de qualité acceptable.

**Leçons clés** :
1. L'IA est un outil puissant, mais nécessite un pilotage humain
2. La qualité du prompt détermine la qualité du résultat
3. Le test et la validation restent essentiels
4. La documentation est cruciale
5. L'humain garde le contrôle des décisions importantes

**Vision d'avenir** :
Le vibe coding va continuer à se démocratiser. Les développeurs qui sauront collaborer efficacement avec l'IA auront un avantage compétitif. Cependant, la maîtrise des fondamentaux de la programmation restera indispensable pour comprendre, valider et optimiser le code généré.

**Mot de la fin** :
Ce travail de maturité m'a permis de vivre concrètement cette transformation du métier de développeur. L'expérience a été enrichissante et m'a préparé aux défis du développement logiciel de demain. Le vibe coding n'est pas une menace pour les développeurs, mais une opportunité de se concentrer sur ce qui compte vraiment : résoudre des problèmes et créer de la valeur.

---

**Pages estimées** : 5-6 pages  
**Temps de lecture** : 8-10 minutes  
**Mots-clés** : Conclusion, Bilan, Apprentissage, Perspectives, Réflexion, Avenir
