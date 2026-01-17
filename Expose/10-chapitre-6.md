# Chapitre 6 — Fonctionnement de l'application

> **À rédiger** : Ce chapitre doit présenter le fonctionnement final de l'application BlaizBot

---

## 6.1 Architecture technique globale

[**À rédiger** : Diagramme et explication de l'architecture technique]

- Frontend : Next.js App Router + React + Tailwind
- Backend : API Routes Next.js
- Base de données : PostgreSQL via Prisma
- Authentification : NextAuth v5
- IA : Gemini 2.0 Flash API
- Déploiement : Vercel

---

## 6.2 Parcours utilisateur : l'administrateur

[**À rédiger** : Description détaillée du parcours admin avec captures d'écran]

- Connexion et redirection vers `/admin/dashboard`
- Gestion des utilisateurs (CRUD)
- Gestion des classes
- Gestion des matières
- Vue d'ensemble de la plateforme

---

## 6.3 Parcours utilisateur : le professeur

[**À rédiger** : Description détaillée du parcours professeur]

- Dashboard avec KPI
- Création et organisation de cours
- Gestion des exercices et quiz
- Assignations aux élèves/classes
- Suivi des résultats
- Messagerie

---

## 6.4 Parcours utilisateur : l'élève

[**À rédiger** : Description détaillée du parcours élève]

- Dashboard personnalisé
- Consultation des cours
- Révisions et exercices
- Assistant IA (chat pédagogique)
- Agenda et organisation
- Suivi de progression

---

## 6.5 Fonctionnement de l'assistant IA

[**À rédiger** : Explication technique du chat IA]

- Architecture du prompt stack
- RAG (Retrieval-Augmented Generation)
- Règles pédagogiques
- Contexte de conversation
- Streaming des réponses
- Confidentialité

---

## 6.6 Flux de données et interactions entre modules

[**À rédiger** : Diagramme de flux de données]

- Cycle de création de contenu (Prof → DB → Élève)
- Gestion des assignations
- Enregistrement des résultats
- Calcul des KPI
- Interactions IA

---

## 6.7 Scénario de démonstration complet

[**À rédiger** : Scénario pas à pas avec captures]

**Scénario type** :
1. L'admin crée un compte professeur et élève
2. Le professeur crée un cours avec chapitres
3. Le professeur assigne le cours à l'élève
4. L'élève consulte le cours et pose une question à l'IA
5. L'élève fait un quiz
6. Le professeur consulte les résultats et KPI

---

**Pages estimées** : 8-10 pages  
**Temps de lecture** : 12-15 minutes  
**Mots-clés** : Architecture, Parcours utilisateur, UX, Démo, Fonctionnalités
