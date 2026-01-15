# TODO - Amélioration de l'Exposé BlaizBot

> Plan d'action pour factualiser, corriger et compléter l'exposé académique

---

## 📋 Principes de Rédaction

- **Style** : Académique mais accessible, humanisé, première personne du pluriel
- **Ton** : Concis, factuel, chronologique
- **Interdits** : Émojis, langage trop familier, sections > 2 pages
- **Format** : Préparation pour export LaTeX

---

## ✅ CHAPITRE 1 - Introduction au Vibe Coding

### Vérifications à faire
- [x] 1.1 Mise en contexte - Vérifier définition vibe coding (tweet Karpathy février 2025)
- [x] 1.2 Principe de fonctionnement - LLM mentionnés (GPT, Claude, Gemini) OK
- [x] 1.3 Avantages/limites - Cohérent avec AGENTS.md

### Corrections nécessaires
- [ ] Aucune correction majeure - Chapitre théorique correct

---

## ✅ CHAPITRE 2 - BlaizBot : Contexte du Projet

### Vérifications à faire
- [x] 2.1 Présentation - 3 interfaces OK
- [x] 2.2 Motivations - Cohérent
- [x] 2.3 Objectifs et périmètre - MVP bien défini

### Corrections nécessaires
- [ ] Aucune correction majeure

---

## ⚠️ CHAPITRE 3 - Pré-projet

### Vérifications à faire
- [x] 3.1 Brainstorming - OK
- [x] 3.2 Organisation projet ChatGPT - Mentionner projets ChatGPT
- [x] 3.3 Outils et workflow - VS Code, GitHub, Vercel, Word OK
- [x] 3.4 Pipeline de travail - Cohérent
- [x] 3.5 Règles qualité - ESLint, Prettier, .env OK
- [x] 3.6 TODO v0 - Première liste
- [x] 3.7 Agents IA - **INCOMPLET**
- [x] 3.8 Wireframe Markdown - OK
- [x] 3.9 Analyse wireframe par IA - OK
- [x] 3.10 Prompt kickoff wireframe - OK
- [x] 3.11 Sortie de phase - OK

### Corrections nécessaires
- [ ] **3.7 - Ajouter liste complète des 7 agents** :
  ```
  - @Orchestrateur : Triage et redirection
  - @PM : Gestion TODO.md, priorisation
  - @Standards : Garde-fous (≤350 lignes, secrets, conventions)
  - @Refactor : Découpage/nettoyage sans changer comportement
  - @Docs : Synchronisation README/docs
  - @Review : Validation finale GO/NO-GO
  - @Controleur : Audit complet en fin de séance
  ```
- [ ] **Ajouter mention du dépôt Vibe-Coding** (hub de configuration VS Code)

---

## ⚠️ CHAPITRE 4 - Wireframe Codé et Verrouillage du Plan

### Vérifications à faire
- [x] 4.1 Exécution kickoff - ChatGPT + Claude Opus 4.5 OK
- [x] 4.2 Design system - shadcn/ui OK
- [x] 4.3 Écrans Élève/Prof/Admin - **INCOMPLET**
- [x] 4.4 Modules et composants - OK
- [x] 4.5 Itérations et corrections - OK
- [x] 4.6 Comparatif Markdown vs codé - OK
- [x] 4.7 Ajustement du plan - OK
- [x] 4.8 Refonte TODO backlog - OK
- [x] 4.9 Gabarits de prompts - OK
- [x] 4.10 Prompt kickoff app - **Mentionner GEMINI_API_KEY**
- [x] 4.11 Sortie de phase - OK

### Corrections nécessaires
- [ ] **4.3 - Préciser nombre de pages** :
  - Admin : 5 pages (dashboard, users, classes, subjects, settings)
  - Professeur : 5 pages (dashboard, courses, assignments, classes, messages)
  - Élève : 6 pages (dashboard, agenda, courses, revisions, messages, ai)
  - **Total : 16 pages principales + auth**
  
- [ ] **4.10 - Ajouter mention variables d'environnement** :
  ```
  Variables clés :
  - DATABASE_URL (Neon Postgres)
  - AUTH_SECRET (NextAuth)
  - GEMINI_API_KEY (Google AI Studio)
  - BLOB_READ_WRITE_TOKEN (Vercel Blob - optionnel)
  ```

---

## ⚠️ CHAPITRE 5 - Développement de l'Application

### Vérifications à faire
- [x] 5.1 Initialisation dépôt - Next.js 15 OK
- [x] 5.2 Traduction wireframe en routes - App Router OK
- [x] 5.3 Composants UI partagés - shadcn/ui OK
- [x] 5.4 Modèle de données - Prisma + PostgreSQL OK
- [x] 5.5 Authentification - NextAuth v5 OK
- [x] 5.6 Développement par phases - **INCOMPLET**
- [x] 5.7 Espace Admin - OK
- [x] 5.8 Espace Professeur - OK
- [x] 5.9 Espace Élève - OK
- [x] 5.10 Intégration chat IA - Gemini 2.0 Flash OK
- [x] 5.11 KPI et confidentialité - OK
- [x] 5.12 Stabilisation démo - OK
- [x] 5.13 Bilan MVP - OK

### Corrections nécessaires

#### **5.4 - Préciser schéma Prisma (15 modèles)**
```
Modèles principaux :
- User, Class, Subject, Level
- Course, Chapter, Section, Resource
- Assignment, Progress
- Exercise, Question, Answer, Result
- Message, Conversation
```

#### **5.6 - Ajouter tableau des 11 phases réelles**
```
| Phase | Nom | Heures | Complexité | Description |
|:------|:----|-------:|:----------:|:------------|
| Phase 0 | PRD | - | Préparation | Spécifications |
| Phase 1 | Init Next.js | 2h | ⭐ | Setup projet |
| Phase 2 | UI shadcn | 4h | ⭐ | Composants |
| Phase 3 | Layout | 6h | ⭐⭐ | Navigation |
| Phase 4 | Database | 6h | ⭐⭐ | Prisma schema |
| Phase 5 | Auth | 6h | ⭐⭐ | NextAuth v5 |
| Phase 6 | Admin | 10h | ⭐⭐⭐ | CRUD |
| Phase 7 | Professeur | 14h | ⭐⭐⭐⭐ | Cours, assignations |
| Phase 8 | Élève | 14h | ⭐⭐⭐⭐ | Dashboard, révisions |
| Phase 9 | IA Gemini | 12h | ⭐⭐⭐⭐ | Chat, génération |
| Phase 10 | Démo | 4h | ⭐⭐ | Stabilisation |
| Phase 11 | Finitions | 2h | ⭐ | Corrections bugs |
| **TOTAL** | | **80h** | | |
```

#### **Ajouter section 5.14 - Métriques Finales**
```
5.14 Métriques du Projet

Au terme du développement, le projet BlaizBot présente les indicateurs suivants :

**Indicateurs Techniques**
- Lignes de code générées : ~63 000
- Fichiers TypeScript/React : 495+
- Composants React : 85+
- Routes API : 40+
- Modèles Prisma : 15

**Répartition du Temps (180h)**
- Préparation & Conception : 40h (22%)
  - Recherche & veille : 8h
  - Définition du projet : 6h
  - PRD : 10h
  - Wireframe interactif : 12h
  - Architecture technique : 4h

- Développement : 80h (44%)
  - [Tableau des 11 phases ci-dessus]

- Documentation & Exposé : 60h (34%)
  - Rédaction chapitres : 30h
  - Captures & diagrammes : 10h
  - Guide vibecoding : 8h
  - Relecture & corrections : 8h
  - Export final : 4h

**Timeline**
- Début : 01 septembre 2025
- Fin : 15 janvier 2026
- Durée totale : 4.5 mois
```

#### **Ajouter section 5.15 - Guide Vibecoding (25 prompts optimaux)**
```
5.15 Création du Guide de Reproduction

À la fin du développement, j'ai créé un guide complet permettant de reproduire 
l'application de zéro. Ce guide, stocké dans le dossier vibecoding-guide/, 
contient 25 fichiers de prompts optimaux, répartis en phases :

- 00-PREREQUIS.md : Configuration environnement
- 01-INIT-NEXTJS.md à 11-TEACHER-ASSIGNMENTS.md : Développement progressif
- 18-AI-SETUP-GEMINI.md à 22-AI-ARTIFACTS.md : Intégration IA
- 23-RESPONSIVE-POLISH.md : Optimisations finales
- 24-DEPLOYMENT.md : Mise en production

Chaque fichier documente le prompt exact utilisé, le contexte nécessaire et le 
résultat attendu. L'ensemble représente 152 tâches documentées, permettant à 
une autre personne de reconstruire BlaizBot en suivant la même méthode, avec 
une estimation de ~55h de développement pur.

Ce guide constitue une contribution importante du projet : il transforme 
l'expérience en méthode reproductible et démontre que le vibe coding peut 
être enseigné et transmis.
```

---

## 📚 CHAPITRES À AJOUTER (6-12)

### CHAPITRE 6 - Organisation et Traçabilité du Projet

**Objectif** : Démontrer la rigueur méthodologique et la reproductibilité du vibe coding

**Sections proposées :**

#### 6.1 Nettoyage et Structuration du Dépôt
- Audit de fin de projet (CLEANUP-2026-01-15.md)
- Suppression des fichiers obsolètes (AUDIT-TODO, BACKLOG-TEMP)
- Correction des dates incohérentes (2024→2025 dans DEVLOG)
- Structure finale claire et navigable

#### 6.2 Archivage des TODO et Prompts (todo/archive/)
- Problématique : 127 fichiers TODO/PROMPT dispersés
- Solution : Numérotation alternée (1-TODO, 2-PROMPT, 3-TODO...)
- Avantage : Chronologie visible, correspondance directe
- Exemple : `42-teacher-courses-TODO.md` → `43-teacher-courses-PROMPT.md`

**Extrait de code (convention de nommage) :**
```
todo/archive/
├── 001-init-nextjs-TODO.md
├── 002-init-nextjs-PROMPT.md
├── 003-ui-shadcn-TODO.md
├── 004-ui-shadcn-PROMPT.md
...
├── 125-audit-phase-6-TODO.md
├── 126-messages-student-alignment-TODO.md
└── 127-backlog-temp-TODO.md
```

#### 6.3 Création du Guide de Reproduction (vibecoding-guide/)
- Objectif : Permettre à un tiers de reconstruire l'application
- Méthode : Extraction des "prompts optimaux" depuis l'historique
- Contenu : 25 fichiers, 152 tâches documentées, ~55h estimées
- Format : Markdown structuré (contexte → prompt → résultat attendu)

**Structure du guide :**
```
vibecoding-guide/
├── README.md              # Vue d'ensemble
├── 00-PREREQUIS.md        # Configuration environnement
├── 01-INIT-NEXTJS.md      # Phase 1 (2h)
├── 02-UI-SHADCN.md        # Phase 2 (4h)
...
├── 09-TEACHER-DASHBOARD.md
├── 10-TEACHER-COURSES.md
...
├── 18-AI-SETUP-GEMINI.md  # Intégration IA
├── 19-AI-CHAT-BACKEND.md
├── 20-AI-CHAT-FRONTEND.md
├── 21-AI-GENERATION.md
├── 22-AI-ARTIFACTS.md
├── 23-RESPONSIVE-POLISH.md
└── 24-DEPLOYMENT.md
```

#### 6.4 Rétro-ingénierie et Reproductibilité
- Concept : Transformer l'expérience vécue en méthode transmissible
- Processus :
  1. Relecture de l'historique Git (commits)
  2. Extraction des prompts qui ont fonctionné
  3. Documentation du contexte nécessaire
  4. Reformulation pour clarté et autonomie

**Exemple de prompt optimal (extrait 10-TEACHER-COURSES.md) :**
```markdown
## Contexte
L'interface professeur doit permettre de créer et gérer des cours.
Schéma Prisma : Course (id, title, subjectId, teacherId, description, content)

## Prompt
Crée la page /teacher/courses avec :
- Liste des cours (DataTable avec colonnes : titre, matière, date)
- Bouton "Nouveau cours" ouvrant une modal
- Formulaire : titre (requis), matière (select), description (textarea)
- API POST /api/teacher/courses pour création
- Validation côté serveur (Zod schema)
- Toast de confirmation après création

## Fichiers concernés
- src/app/(dashboard)/teacher/courses/page.tsx
- src/app/api/teacher/courses/route.ts
- src/components/features/teacher/CourseForm.tsx

## Résultat attendu
Page fonctionnelle, cours enregistré en BDD, liste mise à jour automatiquement.
```

#### 6.5 Validation de la Reproductibilité
- Test : Suivre le guide vibecoding-guide/ étape par étape
- Résultat attendu : Application fonctionnelle équivalente
- Écarts acceptables : Détails UI, noms de variables
- Invariants : Architecture, fonctionnalités, modèle de données

#### 6.6 Apport Méthodologique
- Différence avec un "tutoriel classique" :
  - Pas de code copier-coller
  - Focus sur les prompts et le raisonnement
  - Adaptabilité (changement de stack possible)
- Transmission de la démarche, pas seulement du résultat
- Preuve de la maîtrise du vibe coding

---

### CHAPITRE 7 - Difficultés Rencontrées et Solutions

**Sections proposées :**

#### 6.1 Difficultés Techniques
- Problèmes d'encodage (UTF-8, Windows)
- Conflits de versions (Next.js 15, Tailwind v4)
- Gestion asynchrone (API Gemini, streaming)

#### 6.2 Difficultés Méthodologiques
- Cadrage du périmètre (éviter le scope creep)
- Gestion des hallucinations IA
- Validation des propositions de code

#### 6.3 Solutions Apportées
- Cycle test rapide (détection immédiate des bugs)
- Prompts structurés (gabarits par type de tâche)
- Agents spécialisés (séparation des rôles)

#### 6.4 Leçons Apprises
- Importance du contexte (Context Engineering)
- Rôle central de l'humain (l'IA accélère, n'invente pas)
- Valeur de la documentation continue

---

### CHAPITRE 7 - Analyse Critique du Vibe Coding

**Sections proposées :**

#### 7.1 Ce qui a Bien Fonctionné
- Gain de temps significatif sur les tâches répétitives
- Prototype fonctionnel en 4.5 mois (1 personne)
- Qualité du code satisfaisante (typage, structure)

#### 7.2 Limites Observées
- Dépendance à la qualité des prompts
- Nécessité de tests manuels constants
- Risque de dette technique si vigilance insuffisante

#### 7.3 Compétences Développées
- Prompt engineering (formulation, contexte)
- Architecture logicielle (découpage, organisation)
- Gestion de projet (backlog, priorisation)

#### 7.4 Comparaison avec le Développement Classique
- Tableau comparatif : temps, compétences requises, qualité finale
- Scénarios où le vibe coding est pertinent vs classique

---

### CHAPITRE 8 - Résultats et Démonstration

**Sections proposées :**

#### 8.1 Parcours Utilisateur Complet
- Scénario élève : connexion → cours → exercice → chat IA
- Scénario professeur : création cours → assignation → suivi
- Scénario admin : gestion utilisateurs → classes → matières

#### 8.2 Captures d'Écran de l'Application
- Interface élève (dashboard, chat IA)
- Interface professeur (cours, assignations)
- Interface admin (utilisateurs, paramètres)

#### 8.3 Performance et Stabilité
- Temps de chargement (Lighthouse score)
- Responsive design (mobile, tablette, desktop)
- Déploiement continu (Vercel)

#### 8.4 Retours et Tests
- Auto-tests (utilisateur fictif)
- Points d'amélioration identifiés

---

### CHAPITRE 9 - Perspectives et Évolutions

**Sections proposées :**

#### 9.1 Améliorations Identifiées (V2)
- Fonctionnalités repoussées (notifications, mode hors-ligne)
- Optimisations UX (streaming IA, animations)
- Analyses avancées (recommandations personnalisées)

#### 9.2 Intégration d'Autres Modèles IA
- Comparaison Gemini vs GPT vs Claude
- Multimodalité (images, audio)

#### 9.3 Évolution du Vibe Coding
- Outils émergents (Cursor Composer, Aider, v0.dev)
- Impact sur le métier de développeur

#### 9.4 Application à d'Autres Domaines
- Vibe coding en data science, design, rédaction
- Limites sectorielles (sécurité critique, médical)

---

### CHAPITRE 10 - Conclusion

**Sections proposées :**

#### 10.1 Synthèse du Travail
- Objectifs atteints (MVP fonctionnel, exposé complet)
- Méthode validée (vibe coding applicable)

#### 10.2 Réflexion Personnelle
- Compétences acquises
- Difficultés surmontées
- Satisfaction et fierté

#### 10.3 Message Final
- Le vibe coding comme outil de démocratisation de la programmation
- Responsabilité de l'humain dans l'usage de l'IA
- Appel à l'esprit critique et à la rigueur

---

### ANNEXES

**A - Glossaire**
- Termes techniques (LLM, RAG, ORM, etc.)
- Acronymes (MVP, KPI, CRUD, API, etc.)

**B - Extraits de Code**
- Exemple de schéma Prisma
- Exemple de route API
- Exemple de prompt système

**C - Captures d'Écran Complètes**
- Index des 50 captures d'écran

**D - Références**
- Tweet Andrej Karpathy (vibe coding)
- Documentation Next.js, Prisma, NextAuth
- Articles sur le prompt engineering

**E - Guide de Reproduction**
- Lien vers vibecoding-guide/
- Instructions d'installation

---

## 🎯 PLAN D'ACTION

### Étape 1 : Corrections Chapitres 1-5
- [ ] Chapitre 3 : Compléter section 3.7 (agents)
- [ ] Chapitre 4 : Compléter 4.3 (nombre de pages) et 4.10 (variables env)
- [ ] Chapitre 5 : Ajouter 5.14 (métriques) et 5.15 (guide vibecoding - référence au chapitre 6)
- [ ] Chapitre 5 : Compléter 5.6 (tableau 11 phases)

### Étape 2 : Rédaction Nouveau Chapitre 6 (Organisation & Reproductibilité)
- [ ] Section 6.1 : Nettoyage et structuration du dépôt
- [ ] Section 6.2 : Archivage TODO/PROMPT alternés (127 fichiers)
- [ ] Section 6.3 : Création vibecoding-guide/ (25 fichiers)
- [ ] Section 6.4 : Rétro-ingénierie et prompts optimaux
- [ ] Section 6.5 : Validation de la reproductibilité
- [ ] Section 6.6 : Apport méthodologique

### Étape 3 : Rédaction Chapitres 7-11
- [ ] Chapitre 7 : Difficultés et solutions (4 sections)
- [ ] Chapitre 8 : Analyse critique (4 sections)
- [ ] Chapitre 9 : Résultats et démo (4 sections)
- [ ] Chapitre 10 : Perspectives (4 sections)
- [ ] Chapitre 11 : Conclusion (3 sections)

### Étape 4 : Annexes
- [ ] Annexe A : Glossaire
- [ ] Annexe B : Extraits de code
- [ ] Annexe C : Index captures
- [ ] Annexe D : Références
- [ ] Annexe E : Guide reproduction

### Étape 4 : Intégration Captures d'Écran
- [ ] Placer captures dans assets/by-chapter/
- [ ] Remplacer placeholders [image] par vrais chemins
- [ ] Vérifier légendes

### Étape 5 : Relecture Finale
- [ ] Cohérence globale (pas de répétitions)
- [ ] Style académique uniforme
- [ ] Chronologie correcte
- [ ] Chiffres exacts (heures, lignes, dates)

### Étape 6 : Préparation LaTeX
- [ ] Structurer en sections/subsections
- [ ] Références bibliographiques
- [ ] Table des matières
- [ ] Liste des figures/tableaux

---

## 📊 ESTIMATION

| Étape | Temps estimé |
|:------|:-------------|
| Corrections chapitres 1-5 | 2h |
| **Rédaction chapitre 6 (Organisation)** | **3h** |
| Rédaction chapitres 7-11 | 8h |
| Annexes | 2h |
| Captures d'écran | 3h |
| Relecture finale | 2h |
| **TOTAL** | **20h** |

---

*Dernière mise à jour : 15 janvier 2026*
