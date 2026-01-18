# Chapitre 6 — Fonctionnement de l'application

> MVP terminé. Ce chapitre montre comment Blaiz'bot fonctionne concrètement : architecture technique, parcours de chaque utilisateur, et interactions entre les différentes parties de l'application.

---

## 6.1 Architecture technique globale

Avant de détailler ce que voit chaque utilisateur, voici comment l'application est construite "sous le capot". L'architecture de Blaiz'bot reste moderne et relativement simple — adaptée à un projet de cette taille.

**Le cœur : Next.js.** Ce framework gère à la fois l'interface visible (front-end) et la logique serveur (API). Quand un utilisateur ouvre une page, Next.js génère le contenu côté serveur et l'envoie au navigateur. Les interactions dynamiques (envoyer un message, poser une question à l'IA) passent par des routes API internes → pas besoin de serveur séparé.

**Stockage : PostgreSQL + Prisma.** Les données (utilisateurs, cours, résultats, messages) sont dans une base PostgreSQL hébergée chez Vercel. L'accès passe par Prisma — je peux écrire des requêtes en TypeScript plutôt qu'en SQL brut. Code plus lisible, moins d'erreurs.

**Authentification : NextAuth v5.** À la connexion, NextAuth vérifie les identifiants, crée une session sécurisée et stocke un token JWT dans un cookie. Ce token contient le rôle (admin, professeur, élève), ce qui contrôle ensuite l'accès aux pages et fonctionnalités.

**IA : Gemini 2.0 Flash.** Les appels passent par des routes dédiées (`/api/ai/chat` pour le chat, `/api/ai/generate` pour la génération de contenu). Les réponses arrivent en streaming — le texte s'affiche au fur et à mesure, comme dans une vraie conversation.

**Déploiement : Vercel.** À chaque push sur GitHub, Vercel reconstruit automatiquement l'application et la met en ligne en quelques minutes. Gain de temps énorme : je pouvais tester chaque modification dans un environnement réel, immédiatement.

---

## 6.2 Parcours utilisateur : l'administrateur

L'administrateur est le premier à intervenir — c'est lui qui prépare le terrain pour les autres. Son espace est sobre et centré sur la gestion du système.

**Dashboard.** Après connexion : statistiques globales (nombre d'utilisateurs, de classes, de cours), alertes si quelque chose nécessite attention. Vue d'ensemble rapide, sans détails pédagogiques.

**Gestion des utilisateurs.** Fonction principale. Une page liste tous les comptes (admins, profs, élèves) avec leurs infos : nom, email, rôle, classe ou matière. L'admin peut :
- Ajouter un utilisateur (nom, email, mot de passe temporaire, rôle)
- Modifier ou supprimer un compte
- Attribuer des matières à un prof, assigner un élève à une classe

**Gestion des classes.** Créer et organiser les groupes d'élèves. Une classe a un nom ("10H", "3ème B") et un niveau. L'admin y ajoute des élèves → facilite ensuite le travail du prof pour les assignations.

**Gestion des matières.** Créer les disciplines (Mathématiques, Français, Histoire...) et les associer aux professeurs. Résultat : quand un enseignant crée un cours, il choisit parmi ses matières attribuées. Pas d'incohérence possible.

En pratique, l'admin intervient surtout au début (création des comptes et de la structure), puis ponctuellement (nouvel élève, modification de rôle). Interface volontairement simple — ce n'est pas lui qui utilise les fonctions pédagogiques au quotidien.

---

## 6.3 Parcours utilisateur : le professeur

L'espace Professeur est au cœur de Blaiz'bot — c'est là que se créent les contenus pédagogiques et que se fait le suivi des élèves. J'ai voulu cet espace complet mais accessible : un enseignant doit pouvoir l'utiliser sans formation préalable.

**Dashboard.** Indicateurs utiles : nombre de classes, d'élèves, de cours créés, messages non lus. Zone "alertes" pour les points d'attention (devoirs non rendus, progression très faible). Le prof repère rapidement ce qui mérite son attention.

**Mes Cours — outil principal de création.** Liste des cours (titre, matière, infos pratiques). Bouton "Nouveau cours" → formulaire de création. Structure hiérarchique :
- **Cours → Chapitres → Sections → Cartes**
- 5 types de cartes : Note (texte libre), Leçon (contenu structuré), Vidéo (lien), Exercice (question ouverte), Quiz (QCM avec correction auto)
- Ressources complémentaires (PDF, liens, images) à n'importe quel niveau

**Assignations.** Cours créé → l'assigner aux élèves. Choisir un cours ou un exercice, l'attribuer à une classe ou à certains élèves, avec date limite optionnelle. L'assignation apparaît automatiquement côté élève. Suivi de l'avancement : qui a commencé, qui a terminé, notes obtenues.

**Mes Classes.** Composition de chaque groupe. Voir les élèves, consulter leur progression individuelle, accéder aux résultats détaillés.

**Messagerie.** Échanger avec les élèves, individuellement ou par groupe. Simple (pas de temps réel strict), mais historique conservé — suffisant pour le suivi pédagogique.

**Assistant IA (création de contenu).** Différent de l'IA élève : ici, générer des quiz à partir d'un cours, créer des résumés, obtenir des suggestions d'exercices. Accessible via des boutons dédiés dans l'interface de gestion des cours.

---

## 6.4 Parcours utilisateur : l'élève

L'espace Élève — celui que j'ai voulu rendre le plus simple et le plus encourageant. Un élève qui se connecte doit comprendre immédiatement où il en est et quoi faire ensuite.

**Dashboard personnalisé.** Progression globale (%), moyenne (/20), cours terminés, exercices à faire. Présentation positive : barres de progression, couleurs encourageantes. L'élève peut s'auto-évaluer sans ressentir uniquement la pression d'une note. Données calculées automatiquement depuis l'historique d'activité.

**Mes Cours.** Tous les cours assignés. Pour chacun : titre, matière, professeur, avancement (chapitres terminés / total). En entrant dans un cours, le contenu apparaît tel que structuré par le prof : chapitres, sections, cartes. L'élève lit, regarde les vidéos, marque chaque section comme terminée → progression enregistrée, visible sur le dashboard.

**Révisions — deux types d'activités :**
1. **Exercices assignés** (devoirs, quiz avec dates limites). Répondre via l'interface, soumettre. Correction automatique (QCM) ou en attente de validation (questions ouvertes).
2. **Suppléments personnels.** L'élève crée ses propres fiches de révision avec les mêmes 5 types de cartes. Utile pour organiser ses révisions à sa façon.

**Agenda.** Échéances importantes : devoirs à rendre, quiz programmés, examens. Mise à jour automatique quand le prof crée ou modifie une assignation. Aide à s'organiser.

**Messagerie.** Échanger avec les profs ou les autres élèves de la classe. Simple mais historique conservé.

**Coach IA.** Indicateurs personnalisés (compréhension, autonomie, rigueur), recommandations basées sur l'activité. Complète l'assistant IA principal en offrant une vue d'ensemble de la progression.

---

## 6.5 Fonctionnement de l'assistant IA

Fonctionnalité centrale de Blaiz'bot. L'assistant accompagne l'élève dans ses révisions — tuteur virtuel disponible à tout moment. J'ai voulu qu'il soit utile sans être un simple distributeur de réponses.

**Techniquement : Gemini 2.0 Flash** (Google). Modèle rapide, multimodal (texte, image), réponses en streaming. L'interface ressemble à une messagerie classique : l'élève tape sa question, la réponse s'affiche progressivement, mot par mot. Plus naturel.

**Ce qui rend l'assistant pertinent : le prompt stack.** À chaque échange, le modèle reçoit plusieurs couches d'informations :
1. **Prompt système de base** — rôle : "Tu es un tuteur pédagogique bienveillant, tu aides l'élève à comprendre sans donner directement les réponses."
2. **Contexte du cours** — si l'élève travaille sur un chapitre précis, des extraits pertinents sont ajoutés au prompt. L'IA reste alignée sur ce qui est réellement étudié.
3. **Historique de conversation** — l'IA se souvient des échanges précédents.

**Règles pédagogiques** dans le prompt système. L'IA est encouragée à poser des questions, donner des indices, guider la réflexion. Exemple : un élève demande "comment résoudre cette équation ?". L'assistant répond d'abord "qu'as-tu déjà essayé ?" ou "quel est le premier terme que tu peux isoler ?". Si l'élève insiste ou dit qu'il est bloqué, alors l'IA détaille. Apprentissage actif.

**Actions rapides** en plus du chat libre : générer un quiz sur le chapitre, créer un résumé, demander une explication d'un exercice spécifique. Boutons accessibles directement dans l'interface → prompts pré-configurés.

**Confidentialité.** Les conversations élève–IA restent privées. Le professeur ne peut pas lire le contenu des échanges — seulement des indicateurs agrégés (nombre de questions posées, score IA). Jamais le détail des discussions. Important : l'élève doit pouvoir poser des questions librement, sans crainte d'être jugé.

---

## 6.6 Flux de données et interactions entre modules

Comment les différentes parties de l'application communiquent ? Voici les principaux flux.

**Flux 1 : Création de contenu.** Un professeur crée un cours → les données sont envoyées à l'API (`/api/teacher/courses`) → enregistrées en base via Prisma. Le cours est stocké avec sa structure hiérarchique. Quand le prof assigne ce cours à une classe, une entrée est créée dans la table des assignations (référence au cours + élèves concernés). À partir de là, le cours apparaît automatiquement dans "Mes Cours" des élèves.

**Flux 2 : Progression.** L'élève marque une section comme terminée ou complète un exercice → info envoyée à l'API (`/api/student/progress` ou `/api/student/exercises`) → enregistrée dans les tables de progression et de résultats. Ces tables alimentent les KPI des dashboards : progression globale, moyenne, taux de complétion. Côté prof, mêmes données → suivi par élève ou par classe.

**Flux 3 : IA.** L'élève envoie un message dans le chat → requête passe par `/api/ai/chat`. Cette route récupère le contexte (cours en cours via Prisma, historique de conversation, paramètres de prompt), construit le prompt complet, l'envoie à l'API Gemini. Réponse en streaming → transmise au front-end → affichage progressif. Si bouton de génération (quiz, résumé), alors `/api/ai/generate` avec un prompt différent.

**Flux 4 : Messagerie.** Messages stockés dans une table dédiée (expéditeur, destinataire ou groupe, contenu). À l'ouverture d'une conversation, chargement par ordre chronologique. Pas de temps réel strict (pas de WebSocket), mais rafraîchissement régulier pour afficher les nouveaux messages.

**Flux 5 : Authentification.** Intervient à chaque requête. Le middleware Next.js vérifie le token JWT, extrait le rôle. Ce rôle filtre les données : un élève n'accède qu'à ses propres cours et résultats, un prof ne voit que ses classes, l'admin a une vue globale mais sans détail des conversations IA.

---

## 6.7 Scénario de démonstration complet

Pour valider que l'application fonctionne de bout en bout, j'ai suivi un scénario de démonstration complet — cas d'usage réaliste pour vérifier que tous les modules interagissent correctement.

**Étape 1 — Admin prépare le terrain.** L'admin se connecte, crée deux comptes : un professeur (M. Dupont, mathématiques) et un élève (Marie, classe 10H). Il crée la classe "10H", y assigne Marie, associe "Mathématiques" à M. Dupont.

**Étape 2 — Le prof crée un cours.** M. Dupont se connecte, va dans "Mes Cours", crée "Les fractions". Deux chapitres : "Introduction aux fractions" et "Opérations sur les fractions". Dans le premier, une section "Définition" avec une carte Leçon + une carte Quiz (3 questions à choix multiples).

**Étape 3 — Assignation.** Toujours connecté, M. Dupont va dans "Assignations", sélectionne le cours "Les fractions", l'assigne à la classe 10H avec date limite dans deux semaines.

**Étape 4 — L'élève consulte le cours.** Marie se connecte. Sur son dashboard : "1 exercice à faire". Elle clique sur "Mes Cours", trouve "Les fractions". Ouvre le premier chapitre, lit la leçon, marque la section comme terminée. Barre de progression : 0% → 25%.

**Étape 5 — Question à l'IA.** Marie ne comprend pas comment additionner des fractions. Elle ouvre l'assistant IA, tape : "Comment additionner deux fractions ?" L'assistant répond par une question : "Que penses-tu qu'il faut faire avec les dénominateurs ?" Marie réfléchit : "les mettre égaux ?". L'assistant confirme et explique la méthode étape par étape.

**Étape 6 — Quiz.** Marie retourne au cours, lance le quiz. Répond aux trois questions. Score immédiat : 2/3. La réponse incorrecte est indiquée avec une explication.

**Étape 7 — Le prof consulte les résultats.** M. Dupont se reconnecte, va dans "Mes Classes" → 10H. Il voit : Marie a 25% de progression sur "Les fractions", score de 66% au premier quiz. Il peut envoyer un message d'encouragement ou organiser une révision en classe sur le point qui a posé problème.

Ce scénario valide l'ensemble du flux : création de contenu → assignation → consultation → interaction IA → évaluation → suivi. Lors de mes tests, tout a fonctionné correctement. Le MVP est opérationnel et prêt à être présenté.

---

**Pages estimées** : 8-10 pages  
**Temps de lecture** : 12-15 minutes  
**Mots-clés** : Architecture, Next.js, Prisma, Gemini, Parcours utilisateur, Chat IA, Démonstration
