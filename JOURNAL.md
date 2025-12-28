# Journal de Bord - Exposé BlaizBot

> Historique chronologique de toutes les sessions de travail sur l'exposé.

---

## Mode d'emploi

Après chaque session de travail significative, ajouter une entrée avec :

```markdown
### [DATE] - [TITRE SESSION]

**Durée** : Xh
**Chapitres touchés** : XX, YY
**Résumé** : 1-2 lignes

**Réalisations** :
- Point 1
- Point 2

**Preuves ajoutées** :
- [ ] Capture X
- [ ] Capture Y

**Prochaines étapes** :
- À faire 1
- À faire 2
```

---

## Sessions

### 15.09.2025 - Brainstorming initial (RÉTRO)

**Durée** : 3h (estimé)
**Chapitres touchés** : 01-idee-problematique.md
**Résumé** : Définition de l'idée du projet et de la problématique

**Réalisations** :
- Identification du besoin : plateforme éducative avec IA
- Définition de la cible : collégiens et enseignants
- Ébauche des fonctionnalités principales

**Preuves ajoutées** :
- [ ] Notes de brainstorming à retrouver

**Prochaines étapes** :
- Créer le projet ChatGPT dédié
- Formaliser les spécifications

---

### 22.09.2025 - Organisation ChatGPT (RÉTRO)

**Durée** : 2h (estimé)
**Chapitres touchés** : 02-organisation-chatgpt.md
**Résumé** : Création du projet ChatGPT "Blaiz'bot" avec prompt système

**Réalisations** :
- Projet ChatGPT créé avec 7 conversations
- Prompt système défini
- Base de connaissance uploadée

**Preuves ajoutées** :
- [x] `Screenshot_projet_chatgpt.png` - Vue d'ensemble 7 conversations
- [x] `Screenshot_prompt_system.png` - Prompt système Vibe Coding

**Prochaines étapes** :
- Documenter les choix d'outils
- Commencer le PRD

---

### 05.10.2025 - Choix des outils (RÉTRO)

**Durée** : 4h (estimé)
**Chapitres touchés** : 03-choix-outils.md
**Résumé** : Recherche et sélection de la stack technique

**Réalisations** :
- Choix de Next.js 15 + TypeScript
- Sélection Vercel Postgres pour la BDD
- Définition du stack IA (OpenAI/Claude/Gemini, Vercel AI SDK)

**Preuves ajoutées** :
- [ ] Comparatifs à documenter

**Prochaines étapes** :
- Rédiger le PRD
- Créer le wireframe

---

### 20.10.2025 - Spécifications PRD (RÉTRO)

**Durée** : 5h (estimé)
**Chapitres touchés** : 04-specifications-prd.md
**Résumé** : Rédaction du PRD complet avec user stories

**Réalisations** :
- PRD structuré avec méthode MoSCoW
- User stories pour les 3 rôles
- Critères d'acceptation définis

**Preuves ajoutées** :
- [ ] PRD complet dans documentation

**Prochaines étapes** :
- Créer le wireframe interactif
- Valider l'UX

---

### 10.11.2025 - Création du wireframe (RÉTRO)

**Durée** : 11h (estimé)
**Chapitres touchés** : 05-wireframe-ux.md
**Résumé** : Wireframe complet créé avec Claude dans VS Code

**Réalisations** :
- 3 dashboards (élève, professeur, admin)
- Design system avec 25 composants
- 6,244 lignes de code (HTML/CSS/JS)
- Navigation fonctionnelle
- Données mockées

**Preuves ajoutées** :
- [x] Wireframe fonctionnel dans `blaizbot-wireframe/`
- [ ] Captures des 3 dashboards à faire

**Prochaines étapes** :
- Documenter le processus de création
- Définir l'architecture technique

---

### 25.11.2025 - Architecture et agents (RÉTRO)

**Durée** : 8h (estimé)
**Chapitres touchés** : 06-architecture.md, 07-prompts-agents.md
**Résumé** : Structure BlaizBot-V1 et système d'agents créés

**Réalisations** :
- Documentation architecture Next.js
- 8 agents IA spécialisés créés
- Schéma Prisma documenté
- Structure API définie

**Preuves ajoutées** :
- [x] `BlaizBot-V1/docs/` complet
- [x] `.github/agents/` avec 8 agents
- [ ] Captures VS Code à faire

**Prochaines étapes** :
- Commencer le développement
- Documenter le chapitre 08

---

### 15.12.2025 - Restructuration exposé

**Durée** : 2h
**Chapitres touchés** : Tous (00-12)
**Résumé** : Restructuration complète selon guide académique

**Réalisations** :
- Suppression ancienne structure (11 fichiers)
- Création nouvelle structure (13 chapitres + 4 annexes)
- Template journal de bord dans chaque chapitre
- Mise à jour progress.json v2.0.0
- Suppression limite 50 pages

**Preuves ajoutées** :
- [x] Tous les fichiers chapitres créés
- [x] 4 annexes (glossaire, code, screenshots, refs)
- [x] progress.json mis à jour

**Prochaines étapes** :
- Rétro-documenter chapitre 02 (ChatGPT)
- Prendre captures d'écran des étapes passées
- Continuer développement BlaizBot-V1

---

### 18.12.2025 - Documentation ChatGPT + Plan 10 phases

**Durée** : 1h30
**Chapitres touchés** : 02-organisation-chatgpt.md, README
**Résumé** : Rétro-documentation ChatGPT et structuration plan de développement

**Réalisations** :
- Chapitre 02 complété avec captures réelles du projet "Blaiz'bot"
- 5 screenshots déposés (`assets/screenshots/02-organisation/`)
- README enrichi : PRD, MVP, MoSCoW, Context Engineering, RAG
- TODO.md restructuré en 10 phases Vibe Coding
- Règle 350 lignes/fichier intégrée au plan
- Vertical Slice (Phase 3) ajoutée pour démo précoce
- Repos GitHub créés : BlaizBot-V1, BlaizBot-projet

**Preuves ajoutées** :
- [x] `Screenshot_projet_chatgpt.png` - Vue d'ensemble 7 conversations
- [x] `Screenshot_chemin_prompt_system_projet.png` - Menu instructions
- [x] `Screenshot_prompt_system.png` - Prompt système Vibe Coding
- [x] `Screenshot_base_de_connaissance.png` - 2 documents uploadés
- [x] `scrennshot_chemin_base_de_connaissance.png` - Chemin fichiers

**Décisions prises** :
- Plan 10 phases validé (fusion proposition Copilot + ChatGPT)
- Vertical Slice avant DB pour valider UX tôt
- Admin avant Prof/Élève (source de vérité données)

**Prochaines étapes** :
- Phase 1 : Initialisation projet Next.js
- Continuer rétro-documentation chapitres 00, 01, 03, 04

---

### 20.12.2025 - Restructuration TODO modulaire

**Durée** : 1h
**Chapitres touchés** : 08-developpement.md
**Résumé** : Transformation du TODO monolithique (926 lignes) en dossier modulaire

**Réalisations** :
- Création dossier `BlaizBot-V1/todo/` avec 13 fichiers
- INDEX.md comme point d'entrée pour l'IA
- RULES.md (contraintes 350 lignes, secrets, types)
- STRUCTURE.md (arborescence cible du projet)
- 10 fichiers de phases (~150-200 lignes chacun)
- TODO.md simplifié en pointeur vers le dossier
- Instructions contextuelles entre chaque tâche

**Structure créée** :
```
todo/
├── INDEX.md              # Navigation + progression
├── RULES.md              # Contraintes obligatoires
├── STRUCTURE.md          # Arborescence fichiers
├── phase-01-init.md      → phase-10-demo.md
```

**Avantages** :
- Respect règle 350 lignes (vs 926 avant)
- IA peut lire un fichier phase sans surcharge contexte
- Instructions spécifiques à chaque phase
- Progression trackée dans INDEX.md

**Preuves ajoutées** :
- [x] Commit `209922f` - "refactor(todo): restructurer en dossier modulaire"
- [x] 14 fichiers modifiés, +3249 lignes

**Prochaines étapes** :
- Commencer Phase 1 (Initialisation Next.js)
- Documenter méthode dans chapitre 08

---

### 28.12.2025 - Phase 6 Admin complète

**Durée** : ~7h (sessions cumulées 27-28.12)
**Chapitres touchés** : 08-developpement.md
**Résumé** : Interface Admin avec CRUD complet (Users, Classes, Subjects)

**Réalisations** :
- API `/api/admin/stats` avec 4 KPIs
- CRUD Users : API + UsersTable + UserFormModal + page
- CRUD Classes : API + ClassesTable + ClassFormModal + page
- CRUD Subjects : API + SubjectsTable + SubjectFormModal + page
- StatsCard component réutilisable
- 16 vérifications ADMIN sur toutes les routes

**Bugs corrigés** :
- Zod `.issues` vs `.errors` (API validation)
- Prisma schema : `name` → `firstName/lastName`, `password` → `passwordHash`
- Class sans `year`, Subject sans `color`

**Fichiers créés** (11 fichiers, ~1200 lignes) :
- `src/app/api/admin/stats/route.ts`
- `src/app/api/admin/users/route.ts` + `[id]/route.ts`
- `src/app/api/admin/classes/route.ts` + `[id]/route.ts`
- `src/app/api/admin/subjects/route.ts` + `[id]/route.ts`
- `src/components/features/admin/*.tsx` (7 composants)

**Preuves ajoutées** :
- [x] `admin-dashboard.png` - Dashboard avec 4 KPIs
- [x] `admin-users.png` - CRUD utilisateurs
- [x] `admin-classes.png` - CRUD classes
- [x] `admin-subjects.png` - CRUD matières

**Prochaines étapes** :
- Phase 7 : Interface Professeur
- Captures d'écran UI Admin

---

## À documenter (rétro-documentation)

Ces sessions passées doivent être documentées a posteriori :

| Date estimée | Session | Chapitre | Priorité | Statut |
| :--- | :--- | :--- | :--- | :--- |
| 15.09.2025 | Brainstorming initial | 01 | 🟡 Moyenne | ✅ Done |
| 22.09.2025 | Projet ChatGPT créé | 02 | 🔴 Haute | ✅ Done |
| 05.10.2025 | Choix de la stack | 03 | 🟡 Moyenne | ✅ Done |
| 20.10.2025 | User stories | 04 | 🟡 Moyenne | ✅ Done |

---

## Métriques cumulées

| Métrique | Valeur | Dernière MAJ |
| :--- | :--- | :--- |
| Heures totales | ~44.5h | 28.12.2025 |
| Lignes wireframe | 6,244 | 10.11.2025 |
| Lignes production | ~4,500 | 28.12.2025 |
| Chapitres complétés | 4/13 | 22.12.2025 |
| Captures réalisées | 9 | 28.12.2025 |
| Phases développement | 6/10 | 28.12.2025 |
| Fichiers todo/ | 13 | 22.12.2025 |
