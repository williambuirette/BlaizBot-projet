# Annexes

> Documents complémentaires et pièces justificatives

---

## Sommaire des annexes

| Annexe | Titre | Page |
|--------|-------|------|
| A | Captures d'écran de l'application | 93 |
| B | Extraits de code significatifs | 97 |
| C | Schéma complet de la base de données (46 modèles Prisma) | 101 |
| D | Exemples de prompts utilisés avec l'IA | 105 |
| E | Historique des commits Git (résumé) | 109 |
| F | Fiches des agents IA spécialisés | 111 |
| G | Wireframe Markdown original (extrait) | 113 |

---

## Annexe A — Captures d'écran de l'application

> **À compléter** : Captures d'écran de l'application en fonctionnement

### A.1 Interface Administrateur
- Dashboard admin
- Gestion des utilisateurs
- Gestion des classes
- Gestion des matières

### A.2 Interface Professeur
- Dashboard professeur
- Création de cours
- Gestion des exercices
- Assignations
- Suivi des résultats

### A.3 Interface Élève
- Dashboard élève
- Consultation de cours
- Chat IA
- Révisions et quiz
- Agenda

### A.4 Écrans transversaux
- Page de connexion
- Messagerie
- Profil utilisateur

---

## Annexe B — Extraits de code significatifs

> **À compléter** : Extraits de code commentés et expliqués

### B.1 Configuration Prisma Schema
```prisma
// Extrait du schéma Prisma (46 modèles)
model User {
  id            String   @id @default(cuid())
  name          String?
  email         String   @unique
  emailVerified DateTime?
  image         String?
  role          Role     @default(STUDENT)
  ...
}
```

### B.2 Middleware d'authentification
```typescript
// src/middleware.ts
// Protection des routes par rôle (RBAC)
```

### B.3 Intégration IA (Gemini)
```typescript
// src/app/api/ai/chat/route.ts
// Appel à l'API Gemini avec prompt stack
```

### B.4 Composant réutilisable
```typescript
// src/components/ui/button.tsx
// Exemple de composant shadcn/ui
```

---

## Annexe C — Schéma complet de la base de données

> **À compléter** : Diagramme ERD (Entity-Relationship Diagram)

### Structure des 46 modèles Prisma

**Authentification et utilisateurs (5 modèles)** :
- User, Account, Session, VerificationToken, PasswordResetToken

**Profils et rôles (3 modèles)** :
- StudentProfile, TeacherProfile, AdminProfile

**Structure académique (4 modèles)** :
- Class, Subject, TeacherSubject, ClassEnrollment

**Contenus pédagogiques (10 modèles)** :
- Course, Chapter, Section, Card, Resource, Exercise, Quiz, Question, QuizAttempt, QuizAnswer

**Assignations et suivi (5 modèles)** :
- Assignment, StudentAssignment, Progress, Achievement, Badge

**Révisions personnelles (3 modèles)** :
- Supplement, SupplementCard, StudySession

**IA et interactions (4 modèles)** :
- Conversation, Message, AIScore, CoachMetrics

**Communication (4 modèles)** :
- MessageThread, MessageParticipant, DirectMessage, MessageAttachment

**Calendrier (3 modèles)** :
- CalendarEvent, EventParticipant, Notification

**Système (5 modèles)** :
- Settings, AuditLog, SystemMetrics, ApiUsage, RateLimitLog

---

## Annexe D — Exemples de prompts utilisés avec l'IA

> **À compléter** : Prompts réels documentés

### D.1 Prompt de lancement du wireframe (kickoff)
```markdown
Contexte : Application éducative BlaizBot avec 3 rôles (Admin, Prof, Élève)
Objectif : Créer le prototype HTML/CSS/JS interactif
Stack : HTML5, CSS3, Vanilla JavaScript
...
```

### D.2 Prompt de création d'un composant React
```markdown
Crée un composant React TypeScript pour [fonctionnalité]
Props : [liste]
Comportement : [description]
Style : Tailwind CSS
...
```

### D.3 Prompt système pour l'IA pédagogique
```markdown
Tu es un tuteur pédagogique bienveillant...
Règles :
- Poser des questions plutôt que donner la réponse directement
- Guider la réflexion étape par étape
- Utiliser le contexte du cours [RAG]
...
```

### D.4 Prompt de refactoring
```markdown
Analyse ce fichier et propose un refactoring pour :
- Réduire la longueur (< 350 lignes)
- Améliorer la lisibilité
- Extraire les composants réutilisables
...
```

---

## Annexe E — Historique des commits Git (résumé)

> **À compléter** : Sélection des commits significatifs

| Date | Commit | Message | Impact |
|------|--------|---------|--------|
| 2025-XX-XX | `abc123` | `feat: Initialize Next.js project` | Setup initial |
| 2025-XX-XX | `def456` | `feat: Add Prisma schema (46 models)` | Base de données |
| 2025-XX-XX | `ghi789` | `feat: Implement NextAuth authentication` | Auth système |
| 2025-XX-XX | `jkl012` | `feat: Create admin dashboard` | Interface admin |
| ... | ... | ... | ... |

---

## Annexe F — Fiches des agents IA spécialisés

> **À compléter** : Documentation des agents utilisés

### F.1 Agent Orchestrateur
**Rôle** : Triage et redirection vers le bon expert  
**Prompt système** : [...]

### F.2 Agent PM (Gestion TODO)
**Rôle** : Maintenir le backlog et prioriser  
**Prompt système** : [...]

### F.3 Agent Standards
**Rôle** : Vérifier les règles qualité  
**Prompt système** : [...]

### F.4 Agent Refactor
**Rôle** : Améliorer le code existant  
**Prompt système** : [...]

### F.5 Agent Review
**Rôle** : Validation finale GO/NO-GO  
**Prompt système** : [...]

---

## Annexe G — Wireframe Markdown original (extrait)

> **À compléter** : Extrait du wireframe initial

```markdown
# BlaizBot Wireframe v1

## Espace Élève

### Dashboard
- Carte progression globale (%)
- Moyenne générale (/20)
- Objectifs de la semaine (liste)
- Cours en cours (liste avec avancement)
- Prochaines échéances (agenda résumé)

### Mes Cours
- Liste des cours assignés
- Pour chaque cours :
  - Titre, matière, professeur
  - Progression (% terminé)
  - Bouton "Continuer"
...
```

---

**Pages totales annexes estimées** : 20+ pages
