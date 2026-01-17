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

**Pages estimées** : 6-8 pages  
**Temps de lecture** : 10-12 minutes  
**Mots-clés** : Prospective, Éthique, Compétences, Formation, Transformation digitale, 2030
