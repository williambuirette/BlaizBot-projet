# Avant-propos

> Ce chapitre présente le projet en quelques mots et explique en toute transparence comment cet exposé a été rédigé.

---

# PARTIE A — Résumé du projet

## Le projet en quelques mots

Ce travail de maturité explore le **vibe coding**, une nouvelle manière de programmer en collaborant avec une intelligence artificielle. L'idée est simple : au lieu d'écrire tout le code à la main, le développeur décrit ce qu'il veut obtenir, l'IA propose une solution, puis le développeur teste, corrige et améliore progressivement. Pour tester cette méthode de manière concrète, j'ai développé **BlaizBot**, une application web complète destinée à aider les élèves à réviser leurs cours avec l'aide d'un assistant intelligent.

---

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

---

## Ce que j'ai appris

En développant BlaizBot, j'ai constaté que le vibe coding présente de vrais avantages :
- **Rapidité** : Certaines tâches répétitives (créer des pages similaires, des formulaires) sont beaucoup plus rapides à générer avec l'IA.
- **Accessibilité** : Même avec peu d'expérience, on peut créer une application complexe en suivant une méthode structurée.
- **Apprentissage** : L'IA peut expliquer son code et proposer des améliorations, ce qui aide à progresser.

Mais cette méthode a aussi des limites importantes :
- **Erreurs fréquentes** : L'IA peut se tromper, inventer des fonctionnalités qui n'existent pas, ou proposer du code qui ne marche pas.
- **Validation nécessaire** : Il faut toujours tester ce que l'IA génère, car elle ne comprend pas vraiment ce qu'elle fait.
- **Responsabilité humaine** : Les décisions importantes (architecture, sécurité, choix techniques) restent du ressort du développeur.

---

## Conclusion du résumé

Ce projet démontre qu'il est possible de créer une application web complète en utilisant le vibe coding, à condition de garder le contrôle et de ne pas faire confiance aveuglément à l'IA. Le développeur reste essentiel : il définit les objectifs, valide les résultats et corrige les erreurs. L'IA est un outil puissant, mais c'est l'humain qui pilote.

Ce travail montre aussi que le métier de développeur est en train de changer. Dans le futur, savoir bien communiquer avec une IA (ce qu'on appelle le "prompt engineering") deviendra aussi important que savoir coder. Les compétences requises évoluent : moins de temps passé à écrire du code répétitif, plus de temps consacré à l'architecture, aux tests et à la prise de décisions.

---

# PARTIE B — Note méthodologique sur la rédaction

## Pourquoi cette note ?

Dans un travail qui porte précisément sur l'utilisation de l'intelligence artificielle pour développer une application, il me semblait important d'être transparent sur la manière dont j'ai rédigé l'exposé lui-même. Utiliser l'IA pour écrire un rapport sur l'IA peut paraître paradoxal, mais c'est en réalité cohérent avec la démarche du vibe coding : l'IA est un outil d'assistance, pas un remplaçant.

Cette note a donc pour objectif de clarifier exactement ce que j'ai fait moi-même, ce que l'IA a fait, et comment j'ai gardé le contrôle sur le résultat final.

---

## Outils utilisés pour la rédaction

Pour rédiger cet exposé, j'ai utilisé plusieurs outils complémentaires :

**ChatGPT (OpenAI)** a servi principalement pour le brainstorming initial, la structuration des idées et la relecture de certains passages. Je lui posais des questions sur la structure à adopter, sur la clarté de mes explications, ou pour reformuler des phrases trop techniques.

**Claude (Anthropic)**, intégré dans Visual Studio Code via GitHub Copilot, a été utilisé pour la rédaction de certains paragraphes à partir de mes notes et de mes consignes. Je lui fournissais le contexte (ce que je voulais expliquer, le style souhaité, les informations factuelles) et il proposait une première version que je relisais et modifiais ensuite. Claude a également été utilisé pour la mise en page des fichiers Markdown, l'organisation des chapitres et la structuration visuelle du document (titres, tableaux, listes).

**Gemini (Google)** a été utilisé ponctuellement comme troisième source d'assistance, notamment pour comparer des réponses ou obtenir un angle différent sur certaines questions.

**Visual Studio Code** a été mon environnement de travail principal, aussi bien pour le code que pour la rédaction de l'exposé. L'avantage de VS Code est de pouvoir travailler directement sur les fichiers Markdown du projet tout en ayant accès aux différentes interfaces d'IA en parallèle. J'avais généralement plusieurs fenêtres ouvertes : VS Code avec le code et les fichiers de l'exposé, plus les interfaces web de ChatGPT, Claude et Gemini accessibles à côté. Cette configuration me permettait de passer rapidement d'un outil à l'autre selon le besoin, et de copier-coller du contexte entre l'application et les assistants IA.

**Microsoft Word** a été utilisé pour la mise en forme finale, l'ajout des captures d'écran et la préparation du document à imprimer.

**Markdown et GitHub** ont servi à organiser les brouillons et à versionner l'évolution du texte, exactement comme pour le code de l'application. Cela m'a permis de garder un historique clair des modifications et de revenir en arrière si nécessaire.

---

## Méthode de travail

Ma méthode de rédaction a suivi un processus en plusieurs étapes, similaire à celui du vibe coding appliqué au développement :

**Étape 1 : Prise de notes brutes.** Tout au long du projet, j'ai noté dans des fichiers Markdown ce que je faisais, les décisions prises, les problèmes rencontrés et les solutions trouvées. Ces notes constituent la matière première de l'exposé.

**Étape 2 : Structuration du plan.** Avec l'aide de ChatGPT, j'ai défini une table des matières détaillée qui couvre tous les aspects du projet. Ce plan a évolué au fil de la rédaction, mais il m'a donné un cadre clair dès le départ.

**Étape 3 : Rédaction assistée par chapitre.** Pour chaque chapitre, je procédais ainsi :
- Je relisais mes notes et les éléments factuels (code, commits, captures)
- Je rédigeais un premier brouillon, parfois avec l'aide de l'IA pour formuler certains passages
- Je relisais intégralement pour vérifier l'exactitude et le style
- Je corrigeais, reformulais et complétais jusqu'à obtenir un texte qui me convenait

**Étape 4 : Vérification des faits.** J'ai systématiquement vérifié que les informations techniques étaient correctes : versions des outils, noms des technologies, fonctionnement réel de l'application. L'IA peut inventer ou se tromper, donc cette vérification était indispensable.

**Étape 5 : Relecture finale.** Une fois tous les chapitres rédigés, j'ai relu l'ensemble pour m'assurer de la cohérence globale, corriger les répétitions et harmoniser le style.

---

## Ce que l'IA a fait

L'IA a contribué à plusieurs aspects de la rédaction :

- **Génération de premiers jets** : à partir de mes consignes et de mes notes, l'IA proposait une première version de certains paragraphes ou sections. Cela m'a fait gagner du temps sur la "page blanche".

- **Reformulation et clarification** : quand je trouvais mes explications trop techniques ou confuses, je demandais à l'IA de les reformuler de manière plus accessible.

- **Structuration** : l'IA m'a aidé à organiser mes idées, à découper les chapitres en sections logiques et à créer des transitions cohérentes.

- **Vérification de cohérence** : je lui faisais parfois relire des passages pour repérer des incohérences ou des oublis.

---

## Ce que j'ai fait moi-même

Malgré l'assistance de l'IA, le travail humain est resté central :

- **Toutes les décisions de contenu** : c'est moi qui ai décidé quoi inclure, quoi exclure, comment présenter les choses et quel niveau de détail adopter.

- **La vérification factuelle** : j'ai vérifié chaque information technique en la comparant avec le code réel, les commits Git et les captures d'écran.

- **Le style et le ton** : j'ai relu et modifié chaque passage pour qu'il corresponde à ma manière de m'exprimer. L'IA a tendance à être plus formelle ou plus générique que je ne le souhaite.

- **La cohérence globale** : j'ai assuré que les chapitres s'enchaînent logiquement et que le fil conducteur reste clair du début à la fin.

- **Les exemples concrets** : tous les exemples viennent de mon expérience réelle sur le projet. Je n'ai pas inventé de situations.

- **Les illustrations** : les captures d'écran, les schémas et les extraits de code sont tous issus du projet réel.

---

## Pourquoi cette approche est-elle honnête ?

Je considère que cette méthode est honnête pour plusieurs raisons :

**Transparence** : je déclare clairement ce que l'IA a fait et ce que j'ai fait. Il n'y a pas de dissimulation.

**Cohérence avec le sujet** : puisque l'exposé porte sur l'utilisation de l'IA pour développer, il est logique (et même démonstratif) d'utiliser l'IA pour rédiger. Cela illustre concrètement la méthode décrite.

**Contrôle humain** : l'IA n'a jamais eu le dernier mot. Chaque phrase de cet exposé a été relue, validée ou modifiée par moi. Le résultat final reflète ma compréhension et mes choix.

**Apprentissage réel** : utiliser l'IA ne m'a pas empêché d'apprendre. Au contraire, reformuler ses propositions, corriger ses erreurs et vérifier ses affirmations m'a obligé à comprendre en profondeur ce que j'écrivais.

---

## Limites de cette approche

Il serait malhonnête de ne pas mentionner les limites :

- **Risque de passivité** : quand l'IA propose un texte correct, on peut être tenté de l'accepter sans réfléchir. J'ai essayé de rester vigilant.

- **Style parfois générique** : malgré mes corrections, certains passages peuvent garder un ton un peu "IA", moins personnel que si j'avais tout écrit seul.

- **Dépendance à l'outil** : sans l'IA, la rédaction aurait pris plus de temps. Cela pose la question de savoir si je serais capable de produire le même travail sans assistance.

---

## Conclusion de cette note

Cette note vise à montrer que l'utilisation de l'IA pour rédiger un exposé n'est pas de la triche si elle est faite de manière transparente et contrôlée. L'IA est un outil puissant qui peut accélérer le travail, mais elle ne remplace pas la réflexion, la vérification et les décisions humaines.

En déclarant ouvertement ma méthode, j'espère contribuer à un débat plus sain sur l'usage de l'IA dans le contexte académique. Plutôt que d'interdire ou de cacher, je crois qu'il est plus constructif d'apprendre à utiliser ces outils de manière responsable et de l'assumer clairement.

---

**Mots-clés** : Vibe Coding, Intelligence Artificielle, Développement Web, BlaizBot, ChatGPT, Claude, Gemini, Next.js, Transparence

**Pages estimées** : 4-5 pages  
**Temps de lecture** : 8 minutes
