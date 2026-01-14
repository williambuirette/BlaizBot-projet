# Guide de Développement BlaizBot - Index

> **Rétro-ingénierie du projet BlaizBot V1**  
> Guide reproductible pour recoder l'application from scratch

---

## 📋 Structure des Phases

| Phase | Fichier | Description | Durée estimée |
|:------|:--------|:------------|:--------------|
| 00 | [00-PREREQUIS.md](00-PREREQUIS.md) | Stack, outils, environnement | 30 min |
| 01 | [01-INIT-NEXTJS.md](01-INIT-NEXTJS.md) | Création projet Next.js + config | 1h |
| 02 | [02-UI-SHADCN.md](02-UI-SHADCN.md) | Installation shadcn/ui + composants de base | 1h |
| 03 | [03-LAYOUT-NAVIGATION.md](03-LAYOUT-NAVIGATION.md) | Sidebar, Header, structure pages | 2h |
| 04 | [04-DATABASE-PRISMA.md](04-DATABASE-PRISMA.md) | Schéma Prisma + Neon + Seed | 3h |
| 05 | [05-AUTH-NEXTAUTH.md](05-AUTH-NEXTAUTH.md) | Authentification NextAuth v5 | 2h |
| 06 | [06-TYPES-HOOKS.md](06-TYPES-HOOKS.md) | Types TypeScript + Hooks partagés | 1h |
| 07 | [07-ADMIN-USERS.md](07-ADMIN-USERS.md) | Gestion utilisateurs (CRUD) | 3h |
| 08 | [08-ADMIN-CLASSES-SUBJECTS.md](08-ADMIN-CLASSES-SUBJECTS.md) | Classes, matières, niveaux | 2h |
| 09 | [09-TEACHER-DASHBOARD.md](09-TEACHER-DASHBOARD.md) | Dashboard professeur + KPIs | 2h |
| 10 | [10-TEACHER-COURSES.md](10-TEACHER-COURSES.md) | Création/édition cours | 4h |
| 11 | [11-TEACHER-ASSIGNMENTS.md](11-TEACHER-ASSIGNMENTS.md) | Système d'assignations | 3h |
| 12 | [12-TEACHER-MESSAGES.md](12-TEACHER-MESSAGES.md) | Messagerie professeur | 2h |
| 13 | [13-STUDENT-DASHBOARD.md](13-STUDENT-DASHBOARD.md) | Dashboard élève + KPIs | 2h |
| 14 | [14-STUDENT-AGENDA.md](14-STUDENT-AGENDA.md) | Agenda et calendrier | 2h |
| 15 | [15-STUDENT-COURSES.md](15-STUDENT-COURSES.md) | Accès aux cours assignés | 2h |
| 16 | [16-STUDENT-REVISIONS.md](16-STUDENT-REVISIONS.md) | Système de flashcards | 3h |
| 17 | [17-STUDENT-MESSAGES.md](17-STUDENT-MESSAGES.md) | Messagerie élève | 2h |
| 18 | [18-AI-SETUP-GEMINI.md](18-AI-SETUP-GEMINI.md) | Configuration Gemini API + services IA | 2h |
| 19 | [19-AI-CHAT-BACKEND.md](19-AI-CHAT-BACKEND.md) | API conversations + messages IA | 3h |
| 20 | [20-AI-CHAT-FRONTEND.md](20-AI-CHAT-FRONTEND.md) | Interface chat IA complète | 4h |
| 21 | [21-AI-GENERATION.md](21-AI-GENERATION.md) | Génération contenu (quiz/exercices/cours) | 3h |
| 22 | [22-AI-ARTIFACTS.md](22-AI-ARTIFACTS.md) | Artefacts interactifs dans le chat | 3h |
| 23 | [23-RESPONSIVE-POLISH.md](23-RESPONSIVE-POLISH.md) | Responsive mobile + polish UX | 2h |
| 24 | [24-DEPLOYMENT.md](24-DEPLOYMENT.md) | Déploiement Vercel + Neon + Blob | 2h |

---

## 📊 Résumé Global

- **Total phases** : 25 (00-24)
- **Tâches documentées** : **152 tâches** avec prompts complets
- **Durée totale estimée** : ~55h de développement
- **Lignes de code totales** : ~28 000 lignes
- **Fichiers créés** : ~180 fichiers (components, pages, API routes, types)

### Répartition par catégorie

| Catégorie | Phases | Tâches | Durée |
|:----------|:-------|:-------|:------|
| **Setup & Infrastructure** | 00-06 | 42 | ~10h |
| **Admin & Enseignants** | 07-12 | 48 | ~18h |
| **Interface Élève** | 13-17 | 32 | ~13h |
| **Assistant IA** | 18-22 | 51 | ~15h |
| **Finitions & Déploiement** | 23-24 | 14 | ~4h |

### Technologies couvertes

**Frontend**
- ✅ Next.js 15 (App Router, Server Components, Server Actions)
- ✅ React 19 (Hooks, Context, Suspense)
- ✅ TypeScript 5 (Types stricts, génériques, utilitaires)
- ✅ Tailwind CSS (Utility-first, responsive, dark mode)
- ✅ shadcn/ui (35+ composants Radix UI)

**Backend**
- ✅ Prisma ORM (Schema de 853 lignes, 15 modèles)
- ✅ NextAuth.js v5 (Authentification multi-rôles)
- ✅ Neon PostgreSQL (Base serverless)
- ✅ Vercel Blob (Stockage fichiers)

**Intelligence Artificielle**
- ✅ Google Gemini 2.0 Flash (Chat, génération, multimodal)
- ✅ Anthropic Claude 3.5 Sonnet (Correction exercices)
- ✅ Streaming SSE (Server-Sent Events)
- ✅ RAG (Retrieval Augmented Generation)
- ✅ Artifacts interactifs (Quiz, exercices, leçons)

**Outils & Qualité**
- ✅ ESLint + Prettier (Formatage automatique)
- ✅ Jest + React Testing Library (Tests unitaires)
- ✅ Zod (Validation runtime)
- ✅ date-fns (Manipulation dates i18n)
- ✅ React Hook Form (Formulaires performants)

---

## 🎯 Comment utiliser ce guide

### Pour recoder from scratch

1. **Suivre les phases dans l'ordre** (dépendances entre phases)
2. **Lire le contexte** de chaque tâche avant de coder
3. **Copier le prompt** et l'utiliser avec l'IA (Claude, ChatGPT, Copilot)
4. **Valider la tâche** avec les critères d'acceptation
5. **Passer à la tâche suivante** seulement si la précédente fonctionne

### Structure d'une phase

```markdown
# Phase XX — Titre

> Description courte

## Vue d'ensemble
- Tableau récapitulatif des fichiers
- Architecture de la phase

## Tâche XX.1 — Nom de la tâche
### Contexte
Pourquoi cette tâche ? Quelle est sa place dans l'architecture ?

### Description
Quoi créer/modifier ?

### Prompt
```
Code complet à générer avec l'IA
Imports, types, fonctions, exports
Explications inline
```

NOTES :
- Points d'attention
- Alternatives possibles
- Commandes à exécuter
```

### Workflow recommandé

```bash
# 1. Créer un nouveau repo
git init blaizbot-rebuild
cd blaizbot-rebuild

# 2. Suivre Phase 00 (Prérequis)
# Installer Node.js 20+, PostgreSQL, VS Code

# 3. Phase 01-06 (Fondations)
# Setup Next.js → UI → Layout → Database → Auth → Types
# Validation : Login fonctionne, BDD seeded

# 4. Phase 07-12 (Admin & Professeurs)
# CRUD utilisateurs → Cours → Assignations → Messages
# Validation : Prof peut créer cours et assigner aux élèves

# 5. Phase 13-17 (Interface Élève)
# Dashboard → Agenda → Cours → Révisions → Messages
# Validation : Élève voit ses cours et peut réviser

# 6. Phase 18-22 (Assistant IA)
# Gemini Setup → Chat Backend → Chat Frontend → Génération → Artifacts
# Validation : Chat IA génère quiz interactifs

# 7. Phase 23-24 (Production)
# Responsive → Déploiement Vercel
# Validation : App en ligne et fonctionnelle
```

### Utilisation avec différentes IA

**GitHub Copilot** (recommandé)
- Copier le prompt dans le chat
- Demander de créer le fichier complet
- Vérifier avec `npm run lint`

**Claude (Anthropic)**
- Nouveau projet "BlaizBot Rebuild"
- Ajouter le fichier de phase en contexte
- Demander tâche par tâche

**ChatGPT (OpenAI)**
- Mode Code Interpreter
- Copier prompt + préciser "Next.js 15 App Router"
- Télécharger les fichiers générés

**Cursor IDE**
- Ouvrir le dossier du projet
- Cmd+K → Coller le prompt
- L'IA modifie directement les fichiers

### Personnalisation

Vous pouvez adapter :
- **Modèle IA** : Remplacer Gemini par Claude/OpenAI/Mistral
- **Base de données** : Remplacer Neon par Supabase/PlanetScale/Railway
- **Stockage fichiers** : Remplacer Vercel Blob par S3/Cloudinary
- **Authentification** : Ajouter OAuth (Google, GitHub)
- **UI** : Remplacer shadcn/ui par Material-UI/Chakra
- **Langue** : Adapter les textes (actuellement français)

---

## 📚 Documentation complémentaire

- **Architecture globale** : [docs/02-ARCHITECTURE_GLOBALE.md](../BlaizBot-V1/docs/02-ARCHITECTURE_GLOBALE.md)
- **Modèle de données** : [docs/04-MODELE_DONNEES.md](../BlaizBot-V1/docs/04-MODELE_DONNEES.md)
- **API Endpoints** : [docs/05-API_ENDPOINTS.md](../BlaizBot-V1/docs/05-API_ENDPOINTS.md)
- **Wireframe de référence** : [blaizbot-wireframe/](../blaizbot-wireframe/)

---

## ✅ Checklist de validation finale

Avant de considérer le projet terminé :

**Fonctionnel**
- [ ] Login admin/teacher/student fonctionne
- [ ] Admin peut créer utilisateurs, classes, matières
- [ ] Professeur peut créer cours et assigner aux élèves
- [ ] Élève voit ses cours assignés et peut réviser
- [ ] Messagerie fonctionne (élève ↔ prof)
- [ ] Chat IA génère quiz/exercices interactifs
- [ ] Upload de fichiers fonctionne (images, PDF)
- [ ] Responsive mobile (sidebar, calendrier)

**Technique**
- [ ] `npm run build` passe sans erreur
- [ ] `npm run lint` passe sans erreur
- [ ] Tests unitaires passent (si implémentés)
- [ ] Aucune erreur console en production
- [ ] Variables d'environnement documentées (.env.example)
- [ ] Base de données seedée avec données démo
- [ ] Logs déploiement Vercel sans erreur

**Performance**
- [ ] Page load < 3s (LCP)
- [ ] API responses < 500ms (moyenne)
- [ ] Images optimisées (WebP, lazy loading)
- [ ] Code splitting (dynamic imports)
- [ ] Cache configuré (ISR, CDN)

**Sécurité**
- [ ] Pas de secrets dans le code
- [ ] Routes API protégées (auth check)
- [ ] CORS configuré
- [ ] CSRF protection (NextAuth)
- [ ] Sanitization inputs (Zod)
- [ ] Rate limiting (Vercel)

---

## 🎓 Apprentissages clés

Ce guide vous apprendra à :

1. **Architecturer** une app Next.js complexe (App Router, Server Components)
2. **Modéliser** une BDD relationnelle avec Prisma (15 modèles interconnectés)
3. **Implémenter** une authentification multi-rôles (Admin/Teacher/Student)
4. **Intégrer** des IA modernes (Gemini, Claude) avec streaming
5. **Gérer** l'upload de fichiers (Vercel Blob, multipart)
6. **Créer** des composants UI réutilisables (shadcn/ui)
7. **Optimiser** le responsive mobile (Tailwind breakpoints)
8. **Déployer** en production (Vercel, Neon, CI/CD)

---

## 📞 Support & Contributions

- **Questions** : Ouvrir une issue sur GitHub
- **Améliorations** : Pull requests bienvenues
- **Bugs** : Signaler dans Issues avec contexte (phase, tâche, erreur)

---

*Guide généré par rétro-ingénierie de BlaizBot V1*  
*Projet académique — Vibecoding avec IA — Janvier 2026*
