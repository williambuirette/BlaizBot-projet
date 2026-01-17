# Nouvelle Conversation

> **Chemin de navigation** : Login → Dashboard Teacher → Messages → **+ Nouvelle conversation**  
> **Route** : `/teacher/messages` (modale)  
> **Rôle** : TEACHER  
> **Composant source** : `src/components/features/messages/CreateConversationModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Messages
   └── teacher/messages/page.md

4. Clic sur "+ Nouvelle conversation"
   └── VOUS ÊTES ICI (modale 3 types)
```

---

## 📸 Aperçu Visuel - Modale Nouvelle Conversation

> **Note** : Modale avec 3 onglets (types de conversation)

### Onglet 1 : Un élève (Message privé)

```
┌─────────────────────────────────────────────────────────────────┐
│  Nouvelle conversation                                      [×]   │
│  Envoyez un message à un élève, un groupe ou une classe          │
│  entière.                                                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Type de message                                                 │
│  ┌───────────────┐  ┌───────────────┐  ┌───────────────┐        │
│  │   👤          │  │   👥          │  │   🏫          │        │
│  │  Un élève     │  │ Plusieurs     │  │ Classe        │        │
│  │ Message privé │  │   élèves      │  │  entière      │        │
│  │               │  │ Groupe perso  │  │ Tous les      │        │
│  │               │  │               │  │  élèves       │        │
│  └───────────────┘  └───────────────┘  └───────────────┘        │
│       [ACTIF]                                                    │
│                                                                  │
│  🎓 Classe *                                                     │
│  ┌────────────────────────────────────────────────┐             │
│  │ 1A - (6 élèves)                             ▼ │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  👤 Élève *                                                      │
│  ┌────────────────────────────────────────────────┐             │
│  │ CURRY Baptiste                                  │             │
│  │ baptiste.curry@blaizbot.edu                     │             │
│  ├────────────────────────────────────────────────┤             │
│  │ DURAND Emma                                     │             │
│  │ emma.durand@blaizbot.edu                        │             │
│  ├────────────────────────────────────────────────┤             │
│  │ MARTIN Lucas                                    │             │
│  │ lucas.martin@blaizbot.edu                       │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  🔗 Contexte (optionnel)                                         │
│  📚 Lié au cours                                                 │
│  ┌────────────────────────────────────────────────┐             │
│  │ La photosynthèse                            ▼ │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  🏷️ Thématique / Sujet                                          │
│  ┌────────────────────────────────────────────────┐             │
│  │ Ex: Rappel devoirs, Questions sur le cours,    │             │
│  │ Sortie scolaire...                              │             │
│  └────────────────────────────────────────────────┘             │
│  Aide à organiser vos conversations par thème               │
│                                                                  │
│  ✉️ Message *                                                    │
│  ┌────────────────────────────────────────────────┐             │
│  │ Écrivez votre message...                        │             │
│  │                                                  │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│                              [Annuler]    [Envoyer]             │
└─────────────────────────────────────────────────────────────────┘
```

### Onglet 2 : Plusieurs élèves (Groupe personnalisé)

```
┌─────────────────────────────────────────────────────────────────┐
│  Nouvelle conversation                                      [×]   │
│  Envoyez un message à un élève, un groupe ou une classe          │
│  entière.                                                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Type de message                                                 │
│  ┌───────────────┐  ┌───────────────┐  ┌───────────────┐        │
│  │   👤          │  │   👥          │  │   🏫          │        │
│  │  Un élève     │  │ Plusieurs     │  │ Classe        │        │
│  │ Message privé │  │   élèves      │  │  entière      │        │
│  │               │  │ Groupe perso  │  │ Tous les      │        │
│  │               │  │               │  │  élèves       │        │
│  └───────────────┘  └───────────────┘  └───────────────┘        │
│                        [ACTIF]                                   │
│                                                                  │
│  🎓 Classe *                                                     │
│  ┌────────────────────────────────────────────────┐             │
│  │ 1A - (6 élèves)                             ▼ │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  👤 Élèves * (2 sélectionné(s))                                 │
│  [Tout sélectionner]  [Désélectionner]                          │
│  ┌────────────────────────────────────────────────┐             │
│  │ ☑ CURRY Baptiste                                │             │
│  │   baptiste.curry@blaizbot.edu                   │             │
│  ├────────────────────────────────────────────────┤             │
│  │ ☑ DURAND Emma                                   │             │
│  │   emma.durand@blaizbot.edu                      │             │
│  ├────────────────────────────────────────────────┤             │
│  │ ☐ MARTIN Lucas                                  │             │
│  │   lucas.martin@blaizbot.edu                     │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  🔗 Contexte (optionnel)                                         │
│  📚 Lié au cours                                                 │
│  ┌────────────────────────────────────────────────┐             │
│  │ La photosynthèse                            ▼ │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  🏷️ Thématique / Sujet                                          │
│  ┌────────────────────────────────────────────────┐             │
│  │ Ex: Rappel devoirs, Questions sur le cours...  │             │
│  └────────────────────────────────────────────────┘             │
│  Aide à organiser vos conversations par thème               │
│                                                                  │
│  ✉️ Message *                                                    │
│  ┌────────────────────────────────────────────────┐             │
│  │ Écrivez votre message...                        │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│                              [Annuler]    [Envoyer]             │
└─────────────────────────────────────────────────────────────────┘
```

### Onglet 3 : Classe entière (Tous les élèves)

```
┌─────────────────────────────────────────────────────────────────┐
│  Nouvelle conversation                                      [×]   │
│  Envoyez un message à un élève, un groupe ou une classe          │
│  entière.                                                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Type de message                                                 │
│  ┌───────────────┐  ┌───────────────┐  ┌───────────────┐        │
│  │   👤          │  │   👥          │  │   🏫          │        │
│  │  Un élève     │  │ Plusieurs     │  │ Classe        │        │
│  │ Message privé │  │   élèves      │  │  entière      │        │
│  │               │  │ Groupe perso  │  │ Tous les      │        │
│  │               │  │               │  │  élèves       │        │
│  └───────────────┘  └───────────────┘  └───────────────┘        │
│                                           [ACTIF]                │
│                                                                  │
│  🎓 Classe *                                                     │
│  ┌────────────────────────────────────────────────┐             │
│  │ 1A - (6 élèves)                             ▼ │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  ┌────────────────────────────────────────────────┐             │
│  │ 📢 Message à toute la classe                    │             │
│  │ 6 élèves recevront ce message                   │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  🔗 Contexte (optionnel)                                         │
│  📚 Lié au cours                                                 │
│  ┌────────────────────────────────────────────────┐             │
│  │ La photosynthèse                            ▼ │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│  🏷️ Thématique / Sujet                                          │
│  ┌────────────────────────────────────────────────┐             │
│  │ Ex: Rappel devoirs, Questions sur le cours...  │             │
│  └────────────────────────────────────────────────┘             │
│  Aide à organiser vos conversations par thème               │
│                                                                  │
│  ✉️ Message *                                                    │
│  ┌────────────────────────────────────────────────┐             │
│  │ Écrivez votre message...                        │             │
│  └────────────────────────────────────────────────┘             │
│                                                                  │
│                              [Annuler]    [Envoyer] ↗           │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `Tabs` | `@/components/ui/tabs` | Navigation 3 types de message |
| `Select` | `@/components/ui/select` | Sélection classe et cours |
| `RadioGroup` | `@/components/ui/radio-group` | Liste élèves (Onglet 1) |
| `Checkbox` | `@/components/ui/checkbox` | Multi-sélection élèves (Onglet 2) |
| `Button` | `@/components/ui/button` | Tout sélectionner, Désélectionner, Annuler, Envoyer |
| `Input` | `@/components/ui/input` | Thématique/Sujet |
| `Textarea` | `@/components/ui/textarea` | Message |
| `Alert` | `@/components/ui/alert` | Info "X élèves recevront ce message" (Onglet 3) |
| `ScrollArea` | `@/components/ui/scroll-area` | Liste élèves scrollable |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/teacher/classes` | Récupérer les classes du professeur | - |
| `GET` | `/api/teacher/classes/[id]/students` | Récupérer élèves d'une classe | - |
| `GET` | `/api/teacher/courses` | Récupérer cours du professeur | Query: classId |
| `POST` | `/api/teacher/conversations` | Créer conversation + envoyer message | `CreateConversationData` |

---

## 💾 Types & Interfaces

```typescript
interface CreateConversationData {
  type: 'PRIVATE' | 'GROUP' | 'CLASS';
  classId: string;
  studentIds: string[]; // 1 élève (PRIVATE), plusieurs (GROUP), tous (CLASS)
  courseId?: string; // Optionnel - lien au cours
  subject?: string; // Optionnel - thématique
  initialMessage: string; // Message initial
}

interface ClassOption {
  id: string;
  name: string; // Ex: "1A"
  studentCount: number;
}

interface StudentOption {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  classId: string;
}

interface CourseOption {
  id: string;
  name: string; // Ex: "La photosynthèse"
  subjectId: string;
}
```

---

## 📋 Workflow de Création

### Étape 1 : Sélection du type

3 onglets disponibles :
- **👤 Un élève** : Conversation privée 1-to-1
- **👥 Plusieurs élèves** : Groupe personnalisé
- **🏫 Classe entière** : Message à tous les élèves

### Étape 2 : Sélection classe

- Dropdown obligatoire
- Format : "Nom classe - (X élèves)"
- Change dynamiquement la liste d'élèves

### Étape 3 : Sélection élève(s)

#### Onglet 1 : Un élève
- RadioGroup (sélection unique)
- Format : Prénom NOM + Email
- 1 élève maximum

#### Onglet 2 : Plusieurs élèves
- Checkboxes (multi-sélection)
- Boutons : "Tout sélectionner" / "Désélectionner"
- Compteur : "X sélectionné(s)"
- Minimum 2 élèves

#### Onglet 3 : Classe entière
- Aucune sélection (tous les élèves auto-sélectionnés)
- Alert bleu : "📢 Message à toute la classe - X élèves recevront ce message"

### Étape 4 : Contexte (optionnel)

- **Lié au cours** : Dropdown des cours de la classe
- **Thématique/Sujet** : Input libre
- Aide-texte : "Aide à organiser vos conversations par thème"
- Placeholder : "Ex: Rappel devoirs, Questions sur le cours, Sortie scolaire..."

### Étape 5 : Message initial

- Textarea obligatoire
- Placeholder : "Écrivez votre message..."
- Multilignes

### Étape 6 : Envoi

- Bouton "Envoyer" (avec icône ↗ sur onglet 3)
- Validation → Création conversation + envoi message
- Toast succès
- Fermeture modale
- Ouverture conversation créée

---

## 🎯 Règles de Validation

### Onglet 1 : Un élève

```typescript
if (!classId) {
  return "Veuillez sélectionner une classe";
}

if (studentIds.length !== 1) {
  return "Veuillez sélectionner un élève";
}

if (!initialMessage.trim()) {
  return "Veuillez écrire un message";
}
```

### Onglet 2 : Plusieurs élèves

```typescript
if (!classId) {
  return "Veuillez sélectionner une classe";
}

if (studentIds.length < 2) {
  return "Veuillez sélectionner au moins 2 élèves";
}

if (!initialMessage.trim()) {
  return "Veuillez écrire un message";
}
```

### Onglet 3 : Classe entière

```typescript
if (!classId) {
  return "Veuillez sélectionner une classe";
}

// studentIds auto-rempli avec tous les élèves de la classe

if (!initialMessage.trim()) {
  return "Veuillez écrire un message";
}
```

---

## 🔄 Comportements

### Changement de classe
- Recharge la liste des élèves
- Réinitialise la sélection élèves
- Met à jour le dropdown "Lié au cours" (cours de cette classe)

### Onglet 1 : Un élève
- RadioGroup : 1 seul élève sélectionnable
- Clic sur un item → Sélection exclusive

### Onglet 2 : Plusieurs élèves
- Checkboxes indépendantes
- "Tout sélectionner" → Coche tous les élèves
- "Désélectionner" → Décoche tous
- Compteur temps réel : "X sélectionné(s)"

### Onglet 3 : Classe entière
- Sélection automatique de tous les élèves
- Pas d'interaction utilisateur sur la liste
- Alert info dynamique : "X élèves recevront ce message"

### Bouton Envoyer
- Désactivé si validation échoue
- Actif si tous les champs requis remplis
- Clic → Spinner + API POST
- Succès → Toast + Fermeture + Ouverture conversation
- Erreur → Toast erreur

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Cliquer onglet** | Change le type de conversation |
| **Sélectionner classe** | Charge élèves + cours de la classe |
| **Sélectionner élève(s)** | Active bouton Envoyer si valide |
| **Tout sélectionner** | Coche tous les élèves (Onglet 2) |
| **Désélectionner** | Décoche tous (Onglet 2) |
| **Lier au cours** | Associe conversation au cours (optionnel) |
| **Écrire thématique** | Tag la conversation (optionnel) |
| **Écrire message** | Active bouton Envoyer |
| **Cliquer Envoyer** | Validation → POST → Toast → Fermeture → Ouverture conversation |
| **Cliquer Annuler** | Ferme modale sans sauvegarder |
| **Cliquer [×]** | Idem Annuler |

---

## 📊 Récapitulatif Technique

**Type de composant** : Modale avec onglets (Tabs)  
**Nombre d'onglets** : 3 (Un élève, Plusieurs élèves, Classe entière)  
**Validation** : Par type (différente pour chaque onglet)  
**Soumission** : Unique API POST (payload adapté au type)  

**Logique de sélection** :
- Onglet 1 : `studentIds = [selectedStudent]`
- Onglet 2 : `studentIds = checkedStudents`
- Onglet 3 : `studentIds = allClassStudents`

**Type de conversation** :
- Onglet 1 → `type: 'PRIVATE'`
- Onglet 2 → `type: 'GROUP'`
- Onglet 3 → `type: 'CLASS'`

---

*Fichier créé le 13 décembre 2025*
