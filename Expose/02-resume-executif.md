# Résumé exécutif

---

## Le projet en quelques mots

Ce travail de maturité explore le **vibe coding**, une nouvelle manière de programmer en collaborant avec une intelligence artificielle. L'idée est simple : au lieu d'écrire tout le code à la main, le développeur décrit ce qu'il veut obtenir, l'IA propose une solution, puis le développeur teste, corrige et améliore progressivement. Pour tester cette méthode de manière concrète, j'ai développé **BlaizBot**, une application web complète destinée à aider les élèves à réviser leurs cours avec l'aide d'un assistant intelligent.

## Ce que j'ai réalisé

J'ai créé BlaizBot en suivant une démarche structurée en cinq grandes étapes :

**Étape 1 — Comprendre le vibe coding**  
J'ai d'abord étudié cette nouvelle approche : comment elle fonctionne, quels sont les modèles d'IA disponibles (ChatGPT, Claude, Gemini), et pourquoi elle change la façon de programmer. J'ai compris que le développeur devient un "pilote" qui guide l'IA avec des consignes claires, plutôt qu'un simple codeur.

**Étape 2 — Concevoir l'application**  
Avant d'écrire la moindre ligne de code, j'ai dessiné l'application sur papier (wireframe) pour définir précisément ce qu'elle devait faire. J'ai identifié trois types d'utilisateurs : l'administrateur qui gère la plateforme, le professeur qui crée les cours, et l'élève qui révise. J'ai ensuite transformé ce plan en un prototype interactif pour valider que tout était cohérent.

**Étape 3 — Développer le MVP**  
J'ai construit l'application étape par étape, en utilisant des technologies modernes (Next.js, React, TypeScript). À chaque fois, je décrivais précisément à l'IA ce que je voulais, elle proposait du code, je testais immédiatement, et je corrigeais si nécessaire. Ce cycle "demande → code → test → correction" s'est répété des centaines de fois. Au final, l'application comprend une base de données avec 46 tables, un système de connexion sécurisé, et trois interfaces complètes.

**Étape 4 — Intégrer l'assistant IA**  
J'ai connecté BlaizBot à Gemini, un modèle d'IA de Google, pour créer un chatbot pédagogique. Cet assistant peut répondre aux questions des élèves, les guider dans leurs révisions, et leur donner des indices sans livrer directement les réponses. J'ai dû lui donner des règles précises pour qu'il agisse comme un bon tuteur.

**Étape 5 — Stabiliser et tester**  
J'ai corrigé les derniers bugs, testé tous les parcours utilisateurs (de la connexion à la réalisation d'un quiz), et préparé une démonstration complète de l'application.

## Ce que j'ai appris

En développant BlaizBot, j'ai constaté que le vibe coding présente de vrais avantages :
- **Rapidité** : Certaines tâches répétitives (créer des pages similaires, des formulaires) sont beaucoup plus rapides à générer avec l'IA.
- **Accessibilité** : Même avec peu d'expérience, on peut créer une application complexe en suivant une méthode structurée.
- **Apprentissage** : L'IA peut expliquer son code et proposer des améliorations, ce qui aide à progresser.

Mais cette méthode a aussi des limites importantes :
- **Erreurs fréquentes** : L'IA peut se tromper, inventer des fonctionnalités qui n'existent pas, ou proposer du code qui ne marche pas.
- **Validation nécessaire** : Il faut toujours tester ce que l'IA génère, car elle ne comprend pas vraiment ce qu'elle fait.
- **Responsabilité humaine** : Les décisions importantes (architecture, sécurité, choix techniques) restent du ressort du développeur.

## Conclusion

Ce projet démontre qu'il est possible de créer une application web complète en utilisant le vibe coding, à condition de garder le contrôle et de ne pas faire confiance aveuglément à l'IA. Le développeur reste essentiel : il définit les objectifs, valide les résultats et corrige les erreurs. L'IA est un outil puissant, mais c'est l'humain qui pilote.

Ce travail montre aussi que le métier de développeur est en train de changer. Dans le futur, savoir bien communiquer avec une IA (ce qu'on appelle le "prompt engineering") deviendra aussi important que savoir coder. Les compétences requises évoluent : moins de temps passé à écrire du code répétitif, plus de temps consacré à l'architecture, aux tests et à la prise de décisions.

---

**Mots-clés** : Vibe Coding, Intelligence Artificielle, Développement Web, BlaizBot, ChatGPT, Claude, Gemini, Next.js, Application Éducative

**Nombre de mots** : ~600  
**Temps de lecture estimé** : 3-4 minutes
