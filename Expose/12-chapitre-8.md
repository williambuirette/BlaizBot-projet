# Chapitre 8 — Conclusion générale

> Bilan du travail accompli. Ce que j'ai réalisé, ce que j'ai appris, les difficultés rencontrées, les pistes pour aller plus loin. Et une réflexion personnelle sur le vibe coding.

---

## 8.1 Synthèse des travaux réalisés

Au terme de ce travail de maturité, le point sur ce que j'ai accompli. Le projet avait deux objectifs : créer une application fonctionnelle en utilisant le vibe coding, et documenter cette démarche de manière claire. Je pense avoir atteint ces deux objectifs — même si le résultat n'est pas parfait.

**Sur le plan théorique** : j'ai étudié ce qu'est le vibe coding. Comment cette approche fonctionne, quels sont les outils disponibles (ChatGPT, Claude, Gemini), pourquoi elle change la façon de programmer. Cette phase a posé les bases avant de me lancer.

**Sur le plan pratique** : j'ai créé Blaiz'bot, une application web éducative complète. Résultat final :
- 3 interfaces distinctes (admin, professeur, élève)
- 46 tables Prisma
- Authentification sécurisée avec gestion des rôles
- Assistant IA pédagogique connecté à Gemini
- Déploiement sur Vercel, accessible en ligne

**Méthode suivie** : brainstorming pour cadrer le MVP → wireframe pour visualiser l'application avant de coder → développement étape par étape, test de chaque modification, correction des erreurs au fur et à mesure. Ce cycle "demande → code → test → correction" s'est répété des centaines de fois.

**Documentation** : cet exposé retrace la démarche complète, depuis l'idée initiale jusqu'à la démonstration finale. J'ai essayé d'être précis sur les choix faits, les problèmes rencontrés, les solutions trouvées. Objectif : montrer le processus réel, pas une version idéalisée.

---

## 8.2 Apports personnels et compétences acquises

Ce projet m'a beaucoup appris, sur plusieurs plans. Compétences techniques, méthodologiques, transversales.

**Technique.** J'ai progressé sur des technologies que je ne maîtrisais pas au départ. Next.js, React, TypeScript — des outils que je comprends maintenant et que je sais utiliser. J'ai appris à structurer une base de données avec Prisma, créer des API REST, gérer l'authentification avec NextAuth, déployer sur Vercel. Et intégrer une IA générative (Gemini) dans une application web.

**Méthodologie.** Organiser un projet de A à Z. Découper le travail en phases, créer un backlog de tâches, suivre sa progression — c'était nouveau pour moi. J'ai aussi développé des compétences en "prompt engineering" : formuler des consignes claires pour obtenir de bons résultats de l'IA. Demande pratique et précision.

**Résolution de problèmes.** Quand quelque chose ne marchait pas : analyser la situation, identifier la cause, trouver une solution. J'ai aussi développé mon esprit critique face aux propositions de l'IA — elle peut se tromper, et il faut savoir le reconnaître.

**Organisation et rigueur.** Travailler seul sur un projet de cette ampleur demande de la discipline. Garder une trace de ce qu'on fait, ne pas se disperser, avancer régulièrement même quand on est bloqué. La rédaction de cet exposé m'a aussi obligé à clarifier mes idées.

---

## 8.3 Limites du projet et difficultés rencontrées

Ce serait malhonnête de ne présenter que les réussites. Ce projet a aussi ses limites, et j'ai rencontré des difficultés tout au long du développement.

**Limite 1 : les tests.** Je n'ai pas mis en place de tests unitaires complets. Le temps m'a manqué, j'ai préféré concentrer mes efforts sur les fonctionnalités du MVP. Résultat : certains bugs ont pu passer inaperçus, le code est moins robuste qu'il pourrait l'être. Point à améliorer si je devais continuer.

**Limite 2 : l'interface mobile.** J'ai conçu l'application en priorité pour les écrans d'ordinateur. Sur téléphone, l'expérience est correcte mais pas optimale. Certaines pages sont difficiles à naviguer, des ajustements seraient nécessaires.

**Limite 3 : la messagerie.** Elle fonctionne, mais pas en temps réel — il faut rafraîchir la page pour voir les nouveaux messages. Une vraie messagerie instantanée demanderait des technologies supplémentaires (WebSockets, par exemple) que je n'ai pas eu le temps d'intégrer.

**Difficultés rencontrées :**

- **Hallucinations de l'IA.** Défi constant. L'IA peut inventer des fonctions qui n'existent pas, proposer du code qui ne compile pas, suggérer des approches inadaptées. J'ai appris à repérer ces erreurs, mais ça m'a coûté du temps et de la frustration.

- **Scope creep.** La tentation d'ajouter des fonctionnalités non prévues. Quand on voit que quelque chose est possible, on a envie de l'intégrer. Mais ça allonge le projet et fait perdre de vue l'essentiel. J'ai dû me recentrer plusieurs fois sur le MVP.

- **Travailler seul.** Avantage et contrainte à la fois. Pas de conflits d'équipe, mais pas non plus de regard extérieur pour repérer mes erreurs ou proposer des idées différentes. Un projet d'équipe aurait sans doute été plus riche, mais aussi plus complexe à coordonner.

---

## 8.4 Perspectives d'amélioration de Blaiz'bot

Si je devais continuer à développer Blaiz'bot, plusieurs améliorations me semblent prioritaires.

**Court terme :**
- **Expérience mobile.** Adapter l'interface pour téléphone et tablette — rendrait l'application bien plus pratique pour les élèves.
- **Notifications temps réel.** Prévenir les utilisateurs quand ils reçoivent un message ou quand un nouveau contenu est disponible.
- **Messagerie améliorée.** Discussion instantanée, indicateurs de lecture et de saisie.
- **Tests automatisés.** Garantir la qualité du code à long terme.

**Moyen terme :**
- **Espace Parent.** Les parents pourraient suivre la progression de leur enfant sans interférer avec le travail du professeur.
- **Génération automatique de contenu.** L'IA pourrait créer des résumés de cours, exercices supplémentaires, fiches de révision personnalisées.
- **Gamification poussée.** Défis entre élèves, succès à débloquer, classements motivants.
- **Recommandations personnalisées.** Adapter le parcours d'apprentissage selon les résultats de chaque élève.

**Long terme :**
- **Analyse prédictive.** L'IA pourrait repérer, avant un contrôle, quels élèves risquent d'avoir des problèmes sur quels sujets.
- **Contenu adaptatif.** Niveau qui s'ajuste automatiquement à chacun.
- **Version multilingue.** Ouvrir l'application à d'autres marchés.
- **Intégration LMS.** Moodle, Google Classroom — faciliter l'adoption par les établissements scolaires.

Tout cela reste du domaine du possible, mais demanderait beaucoup plus de temps et de ressources que ce travail de maturité.

---

## 8.5 Réflexion finale sur le vibe coding

Au terme de ce projet, je porte un regard nuancé sur le vibe coding. Cette approche m'a permis de créer une application que je n'aurais probablement pas pu développer seul en si peu de temps. Mais elle m'a aussi montré ses limites et ses risques.

**Enseignement 1 : l'IA est un outil puissant mais imparfait.** Elle peut générer du code rapidement, proposer des solutions créatives, automatiser des tâches répétitives. Mais elle peut aussi se tromper, inventer des choses qui n'existent pas, produire du code qui ne fonctionne pas. Sans vérification humaine, les erreurs s'accumulent.

**Enseignement 2 : la qualité du prompt détermine la qualité du résultat.** Consignes vagues → réponses vagues. Quand je prenais le temps de bien expliquer ce que je voulais, avec contexte et exemples, les résultats étaient bien meilleurs. Le prompt engineering est une vraie compétence à développer.

**Enseignement 3 : le test et la validation restent essentiels.** L'IA ne comprend pas vraiment ce qu'elle fait. Elle prédit des suites de caractères probables, pas de notion de "fonctionnement correct". C'est au développeur de vérifier que le code fait ce qu'il est censé faire.

**Enseignement 4 : la documentation est cruciale.** Quand on travaille avec l'IA, facile de perdre le fil de ce qui a été fait et pourquoi. Garder une trace des décisions, des problèmes et des solutions permet de ne pas tourner en rond et de capitaliser sur son expérience.

**Enseignement 5 : l'humain garde le contrôle des décisions importantes.** L'architecture de l'application, les choix de sécurité, la logique métier — tout cela reste du ressort du développeur. L'IA peut aider à implémenter, mais c'est l'humain qui décide.

---

**Pour l'avenir** : le vibe coding va continuer à se développer. Les outils vont s'améliorer, les modèles vont devenir plus puissants et plus fiables. Les développeurs qui sauront collaborer efficacement avec l'IA auront un avantage. Mais ceux qui perdront leurs compétences fondamentales en programmation risquent de devenir dépendants d'un outil qu'ils ne maîtrisent pas vraiment.

Ce travail de maturité m'a fait vivre concrètement cette transformation du métier de développeur. L'expérience a été enrichissante, parfois frustrante, toujours instructive. Je ne regrette pas d'avoir choisi ce sujet.

**Mot de la fin** : le vibe coding n'est pas une menace pour les développeurs, c'est une opportunité de se concentrer sur ce qui compte vraiment — comprendre les problèmes, concevoir des solutions et créer de la valeur. Le code n'est qu'un moyen, pas une fin.

---

**Pages estimées** : 5-6 pages  
**Temps de lecture** : 8-10 minutes  
**Mots-clés** : Conclusion, Bilan, Apprentissage, Perspectives, Réflexion, Avenir
