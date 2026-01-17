# Observation-compile

## 1) Sources compilées
- Exposé : `Expose-BlaizBot.md` (Chap. 1→5)
- Observations :
  - `Observation-ChatGPT-5.2-Codex.md`
  - `Observation-Claude-Opus-4.5.md`
  - `Observation-Claude-sonnet-4.5.md`
  - `Observation-Gemini-3pro.md`

---

## 2) Index de l'exposé (Chap. 1→5)

### Chapitre 1 — Introduction au Vibe Coding
- 1.1 Mise en contexte
- 1.2 Principe de fonctionnement
- 1.3 Avantages, limites et rôle de l'humain

### Chapitre 2 — Blaiz'bot : Contexte du projet
- 2.1 Présentation de l'application
- 2.2 Motivations
- 2.3 Objectifs et périmètre
  - 2.3.1 Objectif principal
  - 2.3.2 Le MVP
  - 2.3.3 Limites du périmètre

### Chapitre 3 — Pré-projet (jusqu'au wireframe Markdown)
- 3.1 Brainstorming et cadrage du MVP
- 3.2 Organisation du projet ChatGPT
- 3.3 Outils et workflow (VS Code, GitHub, Vercel, Word)
- 3.4 Pipeline de travail et traçabilité
- 3.5 Règles de qualité et sécurité minimales
- 3.6 Première TODO "v0" (liste initiale)
- 3.7 Création des agents IA (référentiel de rôles)
- 3.8 Wireframe Markdown (v1)
- 3.9 Analyse du wireframe Markdown par l'IA (inventaire UI)
- 3.10 Prompt de lancement pour coder le wireframe (kickoff wireframe)
- 3.11 Sortie de phase 3

### Chapitre 4 — Wireframe codé et verrouillage du plan
- 4.1 Exécution du kickoff wireframe
- 4.2 Design system et structure UI du prototype
- 4.3 Écrans et parcours Élève / Professeur / Admin
- 4.4 Modules, composants réutilisables et données simulées
- 4.5 Itérations et corrections issues du prototype
- 4.6 Comparatif "wireframe Markdown vs wireframe codé"
- 4.7 Ajustement du plan et finalisation de l'architecture avec l'IA
- 4.8 Refonte des TODO : backlog par phases (v1)
- 4.9 Gabarits de prompts par tâche et usage des agents
- 4.10 Prompt de lancement du développement de l'application (kickoff app)
- 4.11 Sortie de phase 4

### Chapitre 5 — Développement de l'application (MVP)
- 5.1 Initialisation du dépôt applicatif
- 5.2 Traduction du wireframe codé en routes / layouts / navigation
- 5.3 Mise en place des composants UI partagés
- 5.4 Modèle de données et base de données (MVP)
- 5.5 Authentification et rôles
- 5.6 Développement par phases (méthode réelle d'itération)
- 5.7 Espace Administrateur (cadre de la plateforme)
- 5.8 Espace Professeur (contenu et suivi)
- 5.9 Espace Élève (révision et entraînement)
- 5.10 Intégration du chat IA (prompt stack + règles pédagogiques)
- 5.11 KPI, séparation des vues et confidentialité
- 5.12 Stabilisation de la démo
- 5.13 Bilan MVP (fini / partiel / repoussé)

---

## 3) TODO consolidée (dédupliquée)

### Chapitre 1 — Introduction au Vibe Coding

- [ ] **OBS-001 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 1 (section 1.1)
  - **Problème :** L'origine exacte du terme "vibe coding" (Andrej Karpathy, février 2025, plateforme X) est une assertion invérifiable depuis les dépôts autorisés.
  - **Action :** Reformuler pour présenter comme retour d'expérience/contexte culturel plutôt que fait vérifié, ou ajouter une note de source externe.
  - **Proposition de correction :** « Le terme "vibe coding" s'est diffusé récemment dans la communauté dev ; l'origine souvent citée est un message d'Andrej Karpathy sur X en février 2025, bien que cette référence reste externe au projet. »
  - **Preuves / références :** Non vérifiable dans le périmètre autorisé (source externe).
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`

---

### Chapitre 2 — Blaiz'bot : Contexte du projet

- [ ] **OBS-002 — Priorité: Moyenne — Type: Imprécis**
  - **Localisation exposé :** Chapitre 2 (section 2.1, 2.3)
  - **Problème :** L'exposé dit que le rôle "parent" a été "écarté", mais l'enum `Role` dans `schema.prisma` contient bien `PARENT`.
  - **Action :** Préciser que le rôle existe dans le modèle de données mais n'est pas implémenté dans l'UI/RBAC pour le MVP.
  - **Proposition de correction :** « Le rôle Parent existe dans le modèle de données (pour une évolution future), mais aucune interface ni logique métier n'a été implémentée pour ce rôle dans le MVP. »
  - **Preuves / références :** `prisma/schema.prisma` (enum Role contient PARENT), `middleware.ts`
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`, `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-003 — Priorité: Moyenne — Type: Imprécis**
  - **Localisation exposé :** Chapitre 2 (section 2.1)
  - **Problème :** L'exposé affirme que les échanges élève–chatbot ne sont pas accessibles au professeur, mais le code montre que des métriques agrégées (`AIActivityScore`) peuvent être consultées.
  - **Action :** Clarifier la séparation : messages privés vs métriques agrégées (scores IA, nombre de sessions).
  - **Proposition de correction :** « Les conversations détaillées élève–IA restent privées, mais le professeur peut consulter des indicateurs agrégés (score IA, nombre de sessions) sans accéder au contenu des échanges. »
  - **Preuves / références :** `prisma/schema.prisma` (modèle AIActivityScore), `CourseScoreKPIs.tsx`
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`

---

### Chapitre 3 — Pré-projet

- [ ] **OBS-004 — Priorité: Moyenne — Type: Imprécis**
  - **Localisation exposé :** Chapitre 3 (section 3.8)
  - **Problème :** Le wireframe est présenté comme "Markdown uniquement", alors qu'il existe un wireframe HTML/JS interactif complet dans `blaizbot-wireframe/`.
  - **Action :** Mentionner l'évolution : wireframe Markdown → prototype HTML/JS interactif → Next.js.
  - **Proposition de correction :** « J'ai d'abord réalisé un wireframe en Markdown pour définir la structure, puis je l'ai transformé en prototype HTML/CSS/JavaScript interactif (avec données mockées et API simulée) avant le développement React/Next.js. »
  - **Preuves / références :** `blaizbot-wireframe/` contient `index.html`, `admin.html`, `teacher.html`, `student.html`, `data/mockData.js`, `js/api/`
  - **Signalé par :** `Observation-Claude-Opus-4.5.md`, `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-005 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 3 (section 3.2, 3.3)
  - **Problème :** L'organisation interne dans ChatGPT et l'outillage exact (VS Code, Copilot, etc.) ne sont pas traçables dans les dépôts.
  - **Action :** Présenter comme retour d'expérience personnel sans implication de preuve interne.
  - **Proposition de correction :** Aucun changement majeur requis, mais ajouter une note : « Ces choix d'organisation sont documentés ici à titre de méthodologie personnelle. »
  - **Preuves / références :** Non fourni (hors périmètre autorisé).
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`

---

### Chapitre 4 — Wireframe codé et verrouillage du plan

- [ ] **OBS-006 — Priorité: Basse — Type: Imprécis**
  - **Localisation exposé :** Chapitre 4 (section 4.4)
  - **Problème :** L'exposé mentionne un composant générique "DataTable", mais le code montre des tables spécifiques (`UsersTable`, `ClassesTable`, `SubjectsTable`).
  - **Action :** Remplacer l'exemple DataTable par les tables réellement utilisées.
  - **Proposition de correction :** « Par exemple, j'ai développé des composants de table configurables (UsersTable, ClassesTable, SubjectsTable) pour les listes d'entités, suivant la même logique de réutilisation. »
  - **Preuves / références :** `UsersTable.tsx`, absence de composant générique `DataTable`
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`

- [ ] **OBS-007 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 4 (section 4.3)
  - **Problème :** L'exposé mentionne une "page Entraînement" côté élève qui n'existe pas sous ce nom (exercices intégrés aux cours/révisions).
  - **Action :** Corriger la terminologie pour refléter l'organisation réelle.
  - **Proposition de correction :** « Côté élève, on retrouve un tableau de bord, une page Cours, une section Révisions (suppléments personnels), un agenda et l'assistant IA. »
  - **Preuves / références :** Structure routes dans `src/app/(dashboard)/student/`
  - **Signalé par :** `Observation-Claude-Opus-4.5.md`

---

### Chapitre 5 — Développement de l'application (MVP)

- [ ] **OBS-008 — Priorité: Haute — Type: Faux**
  - **Localisation exposé :** Chapitre 5 (section 5.1)
  - **Problème :** L'exposé indique "Next.js version 15", mais le code utilise Next.js 16.1.1 avec React 19.
  - **Action :** Corriger la version Next.js.
  - **Proposition de correction :** « J'ai choisi une stack moderne : Next.js 16 (avec React 19), configuré avec TypeScript strict et Tailwind CSS v4. »
  - **Preuves / références :** `package.json` (next: 16.1.1, react: 19.x), `tsconfig.json`
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`
  - **Notes :** Gemini-3pro indique Next.js 15 comme confirmé, ce qui crée un conflit → voir section 4.

- [ ] **OBS-009 — Priorité: Moyenne — Type: Imprécis**
  - **Localisation exposé :** Chapitre 5 (section 5.4)
  - **Problème :** L'exposé dit "PostgreSQL hébergée via Vercel Postgres", mais les prompts projet mentionnent Neon.
  - **Action :** Préciser l'hébergement réel ou rester neutre ("PostgreSQL managé").
  - **Proposition de correction :** « J'ai choisi PostgreSQL via un service managé (Vercel Postgres / Neon), ce qui évite de gérer l'infrastructure de base de données. »
  - **Preuves / références :** `prisma/schema.prisma` (provider postgresql), `todo-prompts/04-DATABASE-PRISMA.md` mentionne Neon
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-010 — Priorité: Moyenne — Type: Oubli**
  - **Localisation exposé :** Chapitre 5 (section 5.4)
  - **Problème :** Le modèle de données est présenté de façon simplifiée (User, Class, Subject, Course, Exercise), alors que le schéma Prisma contient ~22-35 modèles.
  - **Action :** Mentionner la richesse du schéma complet.
  - **Proposition de correction :** « Le modèle complet comprend environ 25 tables, dont les profils utilisateurs (StudentProfile/TeacherProfile en 1:1 avec User), la structure arborescente des cours (Course → Chapter → Section → Card), les suppléments élève, les conversations IA, la messagerie et le calendrier. »
  - **Preuves / références :** `prisma/schema.prisma` (853 lignes, ~35 modèles selon Opus, ~22 selon Sonnet)
  - **Signalé par :** `Observation-Claude-Opus-4.5.md`, `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-011 — Priorité: Moyenne — Type: Oubli**
  - **Localisation exposé :** Chapitre 5 (section 5.4)
  - **Problème :** Le seed est décrit comme "un admin, un prof et un élève", alors qu'il est bien plus complet.
  - **Action :** Préciser le contenu réel du seed.
  - **Proposition de correction :** « Le seed comprend un environnement complet pour la démo : 1 admin, 2 professeurs, 6 élèves répartis dans 4 classes, 6 matières, plusieurs cours avec des cartes pédagogiques, et des données de progression. »
  - **Preuves / références :** `prisma/seed.ts`
  - **Signalé par :** `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-012 — Priorité: Moyenne — Type: Oubli**
  - **Localisation exposé :** Chapitre 5 (section 5.8)
  - **Problème :** Le système de cartes pédagogiques (5 types : Note, Lesson, Video, Exercise, Quiz) n'est pas mentionné.
  - **Action :** Ajouter un paragraphe sur la structure hiérarchique des cours et les types de cartes.
  - **Proposition de correction :** « Chaque cours est organisé en une structure hiérarchique : Cours → Chapitres → Sections → Cartes. Il existe 5 types de cartes pédagogiques (Note, Leçon, Vidéo, Exercice, Quiz), chacune avec son interface d'édition et ses paramètres spécifiques. »
  - **Preuves / références :** `prisma/schema.prisma` (modèle Card, CardType enum), `blaizbot-wireframe/pages/D-teacher/D-05-courses/`
  - **Signalé par :** `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-013 — Priorité: Moyenne — Type: Oubli**
  - **Localisation exposé :** Chapitre 5 (section 5.9)
  - **Problème :** Le système de suppléments élève (StudentSupplement) n'est pas décrit. L'élève peut créer ses propres cartes de révision.
  - **Action :** Ajouter un paragraphe sur les suppléments de révision élève.
  - **Proposition de correction :** « En plus de consulter les cours, l'élève peut créer ses propres suppléments de révision (Mes Révisions). Ces suppléments utilisent les mêmes 5 types de cartes que les cours, mais l'élève est en mode édition. Les suppléments peuvent être liés à un cours existant ou créés de manière indépendante. »
  - **Preuves / références :** `prisma/schema.prisma` (StudentSupplement), `blaizbot-wireframe/pages/C-student/C-04-revisions/`, `NAVIGATION-ROADMAP.md`
  - **Signalé par :** `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-014 — Priorité: Haute — Type: Faux**
  - **Localisation exposé :** Chapitre 5 (section 5.10)
  - **Problème :** L'exposé décrit un "mode indice" puis "mode réponse" avec bouton "Afficher la réponse", mais le code montre un système d'artefacts interactifs différent.
  - **Action :** Décrire le fonctionnement réel du chat IA (prompt pédagogique encourageant la réflexion, pas de toggle explicite indice/réponse).
  - **Proposition de correction :** « L'IA est guidée par un prompt système pédagogique qui l'encourage à poser des questions, donner des indices et guider la réflexion plutôt que livrer immédiatement la réponse complète. Il n'y a pas de bouton explicite "mode indice/réponse", mais le comportement par défaut favorise l'apprentissage actif. »
  - **Preuves / références :** `src/lib/ai/gemini.ts` (SYSTEM_PROMPTS), `src/app/(dashboard)/student/chat/page.tsx`, absence de toggle UI
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`

- [ ] **OBS-015 — Priorité: Basse — Type: Imprécis**
  - **Localisation exposé :** Chapitre 5 (section 5.9)
  - **Problème :** Le terme "flashcards" est utilisé alors que le système est plus complet (5 types de cartes).
  - **Action :** Éviter le terme "flashcards" ou le contextualiser.
  - **Proposition de correction :** « La révision libre s'appuie sur des cartes de révision de différents types (notes, leçons, vidéos, exercices, quiz), permettant un entraînement varié. »
  - **Preuves / références :** `prisma/schema.prisma` (CardType enum), pages révisions
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`

- [ ] **OBS-016 — Priorité: Haute — Type: Faux**
  - **Localisation exposé :** Chapitre 5 (section 5.7)
  - **Problème :** L'exposé dit que l'admin peut "associer une couleur ou une icône" aux matières, mais le schéma et l'UI ne le permettent pas.
  - **Action :** Retirer cette affirmation ou la signaler comme fonctionnalité future.
  - **Proposition de correction :** « La gestion des matières permet de créer, éditer et supprimer des disciplines (Mathématiques, Français, etc.) et de les lier à des professeurs. L'ajout de couleurs ou icônes reste une amélioration possible pour le futur. »
  - **Preuves / références :** `prisma/schema.prisma` (modèle Subject sans champ color/icon), `SubjectFormModal.tsx`
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`

- [ ] **OBS-017 — Priorité: Moyenne — Type: Faux**
  - **Localisation exposé :** Chapitre 5 (section 5.13)
  - **Problème :** L'exposé dit "ce qui est créé est directement utilisable" (pas d'état brouillon), mais le code montre un champ `isDraft` sur les cours.
  - **Action :** Corriger pour refléter l'existence du système brouillon/publication.
  - **Proposition de correction :** « Les cours disposent d'un état brouillon/publié (isDraft). Le professeur peut préparer un cours en brouillon avant de le publier pour ses élèves. »
  - **Preuves / références :** `prisma/schema.prisma` (Course.isDraft), `CourseForm.tsx` (boutons Brouillon/Publier)
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`

- [ ] **OBS-018 — Priorité: Moyenne — Type: Oubli**
  - **Localisation exposé :** Chapitre 5 (section 5.9)
  - **Problème :** Le module "Coach IA" élève (avec KPIs avancés : compréhension, autonomie, rigueur) existe mais n'est pas décrit.
  - **Action :** Ajouter un paragraphe sur le Coach IA privé.
  - **Proposition de correction :** « L'élève dispose également d'un module Coach IA qui affiche des indicateurs personnalisés (compréhension, autonomie, rigueur), des badges et des recommandations basées sur son activité. »
  - **Preuves / références :** `src/app/(dashboard)/student/coach/page.tsx`, `prisma/schema.prisma` (AIActivityScore, badges)
  - **Signalé par :** `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`

- [ ] **OBS-019 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 5 (section 5.5)
  - **Problème :** Le middleware RBAC et son fonctionnement sont mentionnés rapidement sans détails.
  - **Action :** Détailler le fonctionnement du middleware Next.js pour la protection des routes.
  - **Proposition de correction :** « J'ai créé un middleware Next.js (src/middleware.ts) qui s'exécute avant chaque requête. Il vérifie la présence d'un token JWT, extrait le rôle de l'utilisateur, et applique les règles RBAC : un professeur ne peut pas accéder aux routes /admin, un élève ne peut pas accéder aux routes /teacher. En cas d'accès non autorisé, redirection vers /unauthorized. »
  - **Preuves / références :** `src/middleware.ts`
  - **Signalé par :** `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-020 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 5 (section 5.10)
  - **Problème :** Le prompt stack n'est pas assez détaillé (structure multi-couches).
  - **Action :** Décrire les couches du prompt stack.
  - **Proposition de correction :** « Le prompt stack se compose de plusieurs couches : (1) le prompt système de base (rôle de tuteur pédagogique), (2) le contexte RAG (extraits du cours en cours), (3) le prompt personnalisé de l'élève (s'il en a défini un), et (4) l'historique de conversation. Cette structure permet à l'IA de répondre de manière contextualisée. »
  - **Preuves / références :** `src/lib/ai/gemini.ts` (SYSTEM_PROMPTS), `src/app/api/ai/chat/route.ts`
  - **Signalé par :** `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-021 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 5 (section 5.10)
  - **Problème :** L'exposé présente le chat IA comme destiné uniquement à l'élève, mais le professeur peut aussi l'utiliser (génération de quiz, résumés).
  - **Action :** Préciser les deux usages selon le rôle.
  - **Proposition de correction :** « L'assistant IA est utilisé différemment selon le rôle : côté élève, il agit comme un tuteur pédagogique pour les révisions. Côté professeur, il sert à générer du contenu (quiz, résumés) à partir des cours. »
  - **Preuves / références :** `src/lib/ai/gemini.ts` (prompts quiz, exercise), wireframe prof
  - **Signalé par :** `Observation-Claude-sonnet-4.5.md`

- [ ] **OBS-022 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 5 (section 5.11)
  - **Problème :** Les KPI concrets ne sont pas listés explicitement.
  - **Action :** Lister les KPI réels côté élève et côté professeur.
  - **Proposition de correction :** « Côté élève : progression globale (%), moyenne (/20), cours terminés, exercices en attente. Côté professeur : nombre de classes, nombre d'élèves, nombre de cours créés, messages non lus. »
  - **Preuves / références :** `src/types/index.ts` (StudentStats, TeacherStats)
  - **Signalé par :** `Observation-Claude-sonnet-4.5.md`

---

### Transversal

- [ ] **OBS-023 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitres 3, 4
  - **Problème :** L'exposé mentionne "Claude Opus 4.5" pour le développement, mais certains prompts/archives font référence à "Claude 3.5 Sonnet".
  - **Action :** Harmoniser les références aux modèles IA utilisés selon les phases réelles.
  - **Proposition de correction :** « Pour le développement, j'ai principalement utilisé Claude (modèle Sonnet pour le code, Opus pour les tâches complexes), en complément de ChatGPT pour la planification. »
  - **Preuves / références :** `todo-prompts/INDEX.md` mentionne Claude 3.5 Sonnet
  - **Signalé par :** `Observation-Gemini-3pro.md`

- [ ] **OBS-024 — Priorité: Basse — Type: Clarté**
  - **Localisation exposé :** Chapitre 5
  - **Problème :** Les versions très récentes de la stack (React 19, Tailwind v4) ne sont pas explicitement mentionnées.
  - **Action :** Ajouter un tableau de versions techniques au début du chapitre 5.
  - **Proposition de correction :** Ajouter un encadré : « **Stack technique** : Next.js 16.1.1 | React 19 | TypeScript 5.x (strict) | Tailwind CSS v4 | Prisma 6.x | NextAuth v5 | Gemini 2.0 Flash »
  - **Preuves / références :** `package.json`
  - **Signalé par :** `Observation-Claude-Opus-4.5.md`

- [ ] **OBS-025 — Priorité: Moyenne — Type: Chronologie**
  - **Localisation exposé :** Chapitre 5 (découpage global)
  - **Problème :** Le chapitre 5 s'arrête avant de couvrir les phases avancées (IA, stabilisation), alors que le code final montre une implémentation plus complète (scoring, badges, coaching).
  - **Action :** Accélérer la narration du chapitre 5 ou prévoir un chapitre 6 dédié à la logique IA complexe.
  - **Proposition de correction :** Non fourni — décision éditoriale.
  - **Preuves / références :** `prisma/schema.prisma` (AIActivityScore, badges), `todo/archive/`
  - **Signalé par :** `Observation-Gemini-3pro.md`

---

## 4) Conflits / Divergences entre LLM (à vérifier)

- [ ] **OBS-C01 — Priorité: Moyenne — Type: CONFLIT**
  - **Localisation exposé :** Chapitre 5 (section 5.1)
  - **Position A :** Next.js 15 est une erreur, le code utilise Next.js 16.1.1 (signalé par `Observation-ChatGPT-5.2-Codex.md`, `Observation-Claude-Opus-4.5.md`)
  - **Position B :** Next.js 15 est confirmé (signalé par `Observation-Gemini-3pro.md`)
  - **À vérifier :** Ouvrir `package.json` dans BlaizBot-V1 et lire la version exacte de `next`.

- [ ] **OBS-C02 — Priorité: Basse — Type: CONFLIT**
  - **Localisation exposé :** Chapitre 5 (section 5.4)
  - **Position A :** Le modèle Prisma contient ~22 tables (signalé par `Observation-Claude-sonnet-4.5.md`)
  - **Position B :** Le modèle Prisma contient ~35 modèles (signalé par `Observation-Claude-Opus-4.5.md`)
  - **À vérifier :** Compter les modèles dans `prisma/schema.prisma` (hors enums).

---

## 5) Résumé exécutif

**Sources analysées :** 4 fichiers d'observations (ChatGPT-5.2-Codex, Claude-Opus-4.5, Claude-Sonnet-4.5, Gemini-3pro)  
**Observations brutes estimées :** ~50+  
**Tâches consolidées :** 25 (+ 2 conflits)

### Top 5 des priorités

1. **OBS-008** — Corriger la version Next.js (15 → 16.1.1) — **Haute**
2. **OBS-014** — Corriger la description du mode indice/réponse IA (n'existe pas comme décrit) — **Haute**
3. **OBS-016** — Retirer la couleur/icône des matières (non implémenté) — **Haute**
4. **OBS-017** — Corriger l'affirmation "pas d'état brouillon" (isDraft existe) — **Moyenne**
5. **OBS-010/012/013** — Compléter la description du modèle de données et du système de cartes — **Moyenne**
