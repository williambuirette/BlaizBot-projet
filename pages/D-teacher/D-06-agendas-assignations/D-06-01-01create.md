# Nouvelle Assignation

> **Chemin de navigation** : Login → Dashboard Teacher → Agendas et Assignations → **+ Nouvelle assignation**  
> **Route** : `/teacher/agendas-assignations` (modale)  
> **Rôle** : TEACHER  
> **Composant source** : `src/components/features/assignments/CreateAssignmentModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Agendas et Assignations
   └── teacher/agendas-assignations/liste.md

4. Clic sur "+ Nouvelle assignation"
   └── VOUS ÊTES ICI (modale multi-étapes - 7 pages)
```

---

## 📸 Aperçu Visuel - Modale Nouvelle Assignation

> **Note** : Modale à 7 étapes/pages

### Page 1/7 : Matières

```
┌─────────────────────────────────────────────────────────────────┐
│  Nouvelle Assignation                                     [×]   │
│  ● 1    ○ 2    ○ 3    ○ 4    ○ 5    ○ 6    ○ 7                │
│  Étape 1 : Matières                                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Sélectionnez les matières                                     │
│  Filtrez les cours par matière (optionnel - passez à l'étape   │
│  suivante pour voir tous les cours)                            │
│                                                                 │
│  Matières                                                       │
│  ┌───────────────────────────────────────────────┐             │
│  │ Sélectionner des matières...               ▼ │             │
│  └───────────────────────────────────────────────┘             │
│                                                                 │
│                                                                 │
│                          [Annuler]    [Suivant →]              │
└─────────────────────────────────────────────────────────────────┘
```

### Page 2/7 : Cours

```
┌───────────────────────────────────────────────────────────────┐
│  Nouvelle Assignation                                     [×]   │
│  ✓ ───● 2    ○ 3    ○ 4    ○ 5    ○ 6    ○ 7                  │
│                 Étape 2 : Cours                                │
├───────────────────────────────────────────────────────────────┤
│                                                                 │
│  Sélectionnez les cours                                        │
│  Cours filtrés selon les matières sélectionnées                │
│                                                                 │
│  Cours                                  1 sélection(s)         │
│  ┌───────────────────────────────────────────────┐             │
│  │ 1 sélection(s)                             ▼ │             │
│  └───────────────────────────────────────────────┘             │
│                                                                 │
│  1 élément(s)          [Tout sélectionner]  [Effacer]          │
│  ☑ La photosynthèse (SVT)                          ✓           │
│                                                                 │
│                                                                 │
│              [Annuler]  [← Précédent]  [Suivant →]             │
└───────────────────────────────────────────────────────────────┘
```

### Page 3/7 : Contenus

```
┌───────────────────────────────────────────────────────────────┐
│  Nouvelle Assignation                                     [×]   │
│  ✓ ── ✓ ──● 3    ○ 4    ○ 5    ○ 6    ○ 7                     │
│                 Étape 3 : Contenus                             │
├───────────────────────────────────────────────────────────────┤
│                                                                 │
│  Sélectionnez les contenus                                     │
│  Choisissez les sections à assigner aux élèves                 │
│                                                                 │
│  📂 Introduction                                                │
│                                                                 │
│    ☑ 📊 Introduction                             Leçon         │
│    ☑ 🎬 Vidéo photosynthèse                      Vidéo         │
│    ☐ 📊 Carte leçon                              Leçon         │
│    ☐ ✏️ Carte exercice                          Exercice       │
│    ☐ 📝 Carte quiz                               Quiz          │
│    ...                                                          │
│                                                                 │
│              [Annuler]  [← Précédent]  [Suivant →]             │
└───────────────────────────────────────────────────────────────┘
```

### Page 4/7 : Classes

```
┌───────────────────────────────────────────────────────────────┐
│  Nouvelle Assignation                                     [×]   │
│  ✓ ── ✓ ── ✓ ──● 4    ○ 5    ○ 6    ○ 7                       │
│                 Étape 4 : Classes                              │
├───────────────────────────────────────────────────────────────┤
│                                                                 │
│  Sélectionnez les classes                                      │
│  Choisissez les classes dont les élèves recevront              │
│  l'assignation                                                  │
│                                                                 │
│  Classes                                1 sélection(s)         │
│  ┌───────────────────────────────────────────────┐             │
│  │ 1 sélection(s)                             ▼ │             │
│  └───────────────────────────────────────────────┘             │
│                                                                 │
│  2 élément(s)          [Tout sélectionner]  [Effacer]          │
│  ☐ TH4-A                                                        │
│  ☑ 1A                                                  ✓        │
│                                                                 │
│              [Annuler]  [← Précédent]  [Suivant →]             │
└───────────────────────────────────────────────────────────────┘
```

### Page 5/7 : Élèves

```
┌───────────────────────────────────────────────────────────────┐
│  Nouvelle Assignation                                     [×]   │
│  ✓ ── ✓ ── ✓ ── ✓ ──● 5    ○ 6    ○ 7                         │
│                 Étape 5 : Élèves                               │
├───────────────────────────────────────────────────────────────┤
│                                                                 │
│  Sélectionnez les élèves                                       │
│  Choisissez les élèves qui recevront l'assignation             │
│                                                                 │
│  🎓 1A     6 élève(s)                   [Tout sélectionner]    │
│                                                                 │
│  ☑ Lucas MARTIN          Baptiste CURTY                        │
│  ☑ Eva SANDOZ            Emma DURAND                           │
│  ☐ Antoine MORET         Margot PERROUD                        │
│                                                                 │
│  2 élève(s) sélectionné(s)                                     │
│                                                                 │
│              [Annuler]  [← Précédent]  [Suivant →]             │
└───────────────────────────────────────────────────────────────┘
```

### Page 6/7 : Deadline

```
┌───────────────────────────────────────────────────────────────┐
│  Nouvelle Assignation                                     [×]   │
│  ✓ ── ✓ ── ✓ ── ✓ ── ✓ ──● 6    ○ 7                           │
│                 Étape 6 : Deadline                             │
├───────────────────────────────────────────────────────────────┤
│                                                                 │
│  Définissez la deadline                                        │
│  Choisissez la date limite, l'heure et la priorité de          │
│  l'assignation                                                  │
│                                                                 │
│  Date limite *                                                 │
│  ┌───────────────────────────────────────────────┐             │
│  │ 📅  samedi 24 janvier 2026                    │             │
│  └───────────────────────────────────────────────┘             │
│                                                                 │
│  Heure (optionnel)                                             │
│  ┌───────────────────────────────────────────────┐             │
│  │ 🕐  --:--                                  ⊙  │             │
│  └───────────────────────────────────────────────┘             │
│  Si non renseignée, l'assignation sera due à 23:59             │
│                                                                 │
│  Priorité                                                      │
│  [Haute]  [Moyenne]  [Basse]                                   │
│                                                                 │
│  Instructions (optionnel)                                      │
│  ┌───────────────────────────────────────────────┐             │
│  │ Ajoutez des instructions pour les élèves...   │             │
│  │                                               │             │
│  └───────────────────────────────────────────────┘             │
│                                                                 │
│              [Annuler]  [← Précédent]  [Suivant →]             │
└───────────────────────────────────────────────────────────────┘
```

### Page 7/7 : Validation

```
┌───────────────────────────────────────────────────────────────┐
│  Nouvelle Assignation                                     [×]   │
│  ✓ ── ✓ ── ✓ ── ✓ ── ✓ ── ✓ ──● 7                             │
│                 Étape 7 : Validation                           │
├───────────────────────────────────────────────────────────────┤
│                                                                 │
│  Vérifiez votre assignation                                    │
│  Confirmez les détails avant de créer l'assignation            │
│                                                                 │
│  ┌─ 📚 Matières & Cours ──────────────────────────────┐       │
│  │                                                      │       │
│  │  SVT                                                 │       │
│  │  La photosynthèse                                    │       │
│  │                                                      │       │
│  └──────────────────────────────────────────────────────┘       │
│                                                                 │
│  ┌─ 📄 Contenus (2) ────────────────────────────────┐         │
│  │                                                      │       │
│  │  📊 Introduction    🎬 Vidéo photosynthèse           │       │
│  │                                                      │       │
│  └──────────────────────────────────────────────────────┘       │
│                                                                 │
│  ┌─ 🎓 Classes (1) ──────────────────────────────────┐         │
│  │                                                      │       │
│  │  1A                                                  │       │
│  │                                                      │       │
│  └──────────────────────────────────────────────────────┘       │
│                                                                 │
│  ┌─ 👥 Élèves (2) ──────────────────────────────────┐          │
│  │                                                      │       │
│  │  Lucas MARTIN    Eva SANDOZ                          │       │
│  │                                                      │       │
│  └──────────────────────────────────────────────────────┘       │
│                                                                 │
│  ┌─ 📅 Deadline & Priorité ────────────────────────┐           │
│  │                                                      │       │
│  │  📅 samedi 24 janvier 2026                           │       │
│  │  [Priorité Moyenne]                                  │       │
│  │                                                      │       │
│  └──────────────────────────────────────────────────────┘       │
│                                                                 │
│  2 assignation(s) seront créées                                │
│  1 cours + 2 élève(s)                                          │
│  (2 sections sélectionnées)                                    │
│                                                                 │
│          [Annuler]  [← Précédent]  [Créer les assignations]   │
└───────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `Stepper` | `@/components/ui/stepper` | Indicateur d'étapes (● actif, ✓ validé, ○ à venir) |
| `Select` | `@/components/ui/select` | Dropdown multi-sélection (Pages 1-2) |
| `Checkbox` | `@/components/ui/checkbox` | Sélection items (matières, cours, contenus) |
| `Button` | `@/components/ui/button` | Navigation (Annuler, Précédent, Suivant) |
| `Accordion` | `@/components/ui/accordion` | Sections repliables (Page 3 - Introduction) |
| `Badge` | `@/components/ui/badge` | Type de contenu (Leçon, Vidéo, Exercice, Quiz) + Badge classe (Page 5) |
| `DatePicker` | `@/components/ui/date-picker` | Sélection de date (Page 6) |
| `TimePicker` | `@/components/ui/time-picker` | Sélection d'heure optionnelle (Page 6) |
| `ToggleGroup` | `@/components/ui/toggle-group` | Boutons priorité (Haute/Moyenne/Basse - Page 6) |
| `Textarea` | `@/components/ui/textarea` | Champ instructions (Page 6) |
| `Card` | `@/components/ui/card` | Sections récapitulatif (Page 7) |
| `Separator` | `@/components/ui/separator` | Séparation visuelle entre sections (Page 7) |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `POST` | `/api/teacher/assignments` | Créer une assignation | `CreateAssignmentFormData` (voir Types) |

---

## 💾 Types & Interfaces

```typescript
interface CreateAssignmentFormData {
  // Page 1/7 - Matières
  subjectIds?: string[]; // Optionnel - filtre les cours par matière
  
  // Page 2/7 - Cours
  courseIds: string[]; // Requis - au moins 1 cours
  
  // Page 3/7 - Contenus
  contentIds: string[]; // Requis - sections/cartes à assigner
  
  // Page 4/7 - Classes
  classIds: string[]; // Requis - au moins 1 classe
  
  // Page 5/7 - Élèves
  studentIds: string[]; // Requis - au moins 1 élève
  
  // Page 6/7 - Deadline
  dueDate: Date; // Requis - date limite
  dueTime?: string; // Optionnel - heure (défaut: 23:59)
  priority: 'HIGH' | 'MEDIUM' | 'LOW'; // Requis
  instructions?: string; // Optionnel - consignes
  
  // Page 7/7 - Validation (récapitulatif uniquement, pas de nouveaux champs)
}

interface CreateAssignmentResponse {
  success: boolean;
  data?: {
    id: string;
    // [À compléter]
  };
  error?: string;
}
```

---

## 📋 Workflow Multi-Étapes

### Navigation entre les étapes

```
Page 1 → [Suivant] → Page 2 → [Suivant] → ... → Page 7 → [Créer les assignations]
  ↓                    ↓                             ↓
[Annuler]          [Précédent]                  [Annuler]
```

**Règles** :
- Validation à chaque étape avant de passer à la suivante
- Possibilité de revenir en arrière (bouton Précédent)
- Annulation possible à tout moment
- Page 7 = Récapitulatif lecture seule
- Création finale avec bouton "Créer les assignations"

---

## 🎯 Règles de Validation

### Validation par étape

**Page 1/7 - Matières** :
```typescript
// Aucune validation - champ optionnel
// Permet de passer directement à l'étape 2
```

**Page 2/7 - Cours** :
```typescript
if (courseIds.length === 0) {
  return "Veuillez sélectionner au moins un cours";
}
```

**Page 3/7 - Contenus** :
```typescript
if (contentIds.length === 0) {
  return "Veuillez sélectionner au moins un contenu";
}
```

**Page 4/7 - Classes** :
```typescript
if (classIds.length === 0) {
  return "Veuillez sélectionner au moins une classe";
}
```

**Page 5/7 - Élèves** :
```typescript
if (studentIds.length === 0) {
  return "Veuillez sélectionner au moins un élève";
}
```

**Page 6/7 - Deadline** :
```typescript
if (!dueDate || dueDate < new Date()) {
  return "Date limite invalide ou dans le passé";
}
if (!priority) {
  return "Veuillez sélectionner une priorité";
}
```

**Page 7/7 - Validation** :
```typescript
// Aucune validation sur cette page (récapitulatif uniquement)
// Toutes les validations ont été faites aux étapes 1-6
// Bouton "Créer" déclenche la soumission finale
```

---

## 🔄 Comportements

### Affichage initial (Page 1/7)
- Modale ouverte avec indicateur "Étape 1/7"
- Champs vides
- Bouton "Suivant" désactivé si formulaire invalide

### Navigation entre étapes
- Clic "Suivant" → Validation + passage à l'étape suivante
- Clic "Précédent" → Retour étape précédente (sans validation)
- Données conservées entre les étapes

### Page finale (7/7)
- Récapitulatif de toutes les données
- Bouton "Créer" (au lieu de "Suivant")
- Soumission finale → API POST

### Annulation
- Clic "Annuler" ou [×] → Confirmation si données saisies
- Fermeture → Retour à la liste

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Ouvrir modale** | Affiche page 1/7 |
| **Remplir champs** | Validation en temps réel |
| **Cliquer "Suivant"** | Validation → Étape suivante |
| **Cliquer "Précédent"** | Retour sans validation |
| **Cliquer "Annuler"** | Confirmation → Fermeture |
| **Cliquer [×]** | Idem Annuler |
| **Page 7/7 : "Créer les assignations"** | Validation complète → API POST → X assignations créées → Toast → Fermeture → Refresh liste |

---

## 📝 Détails des 7 Pages

### 📄 Page 1/7 : Matières

**Titre de l'étape** : "Étape 1 : Matières"

**Description** :  
"Sélectionnez les matières"  
"Filtrez les cours par matière (optionnel - passez à l'étape suivante pour voir tous les cours)"

**Champs** :

| Champ | Type | Requis | Description |
|-------|------|--------|-------------|
| **Matières** | Multi-select | ❌ Non | Dropdown de sélection de matières (optionnel) |

**Composants UI** :
- `Select` avec placeholder "Sélectionner des matières..."
- Multi-sélection possible
- Si vide → affiche tous les cours à l'étape suivante

**Validation** :
```typescript
// Aucune validation requise - champ optionnel
// Permet de passer à l'étape suivante sans sélection
```

**Comportement** :
- Sélection optionnelle de matières
- Bouton "Suivant" toujours actif (pas de validation bloquante)
- Si matières sélectionnées → filtre les cours à l'étape 2
- Si vide → affiche tous les cours à l'étape 2

---

### 📄 Page 2/7 : Cours

**Titre de l'étape** : "Étape 2 : Cours"

**Description** :  
"Sélectionnez les cours"  
"Cours filtrés selon les matières sélectionnées"

**Champs** :

| Champ | Type | Requis | Description |
|-------|------|--------|-------------|
| **Cours** | Multi-select | ✅ Oui | Dropdown de sélection des cours (filtré par Page 1) |

**Composants UI** :
- `Select` avec affichage "X sélection(s)"
- Liste avec checkboxes : Nom du cours (Matière)
- Boutons : "Tout sélectionner" et "Effacer"
- Compteur : "X élément(s)"

**Validation** :
```typescript
// Au moins 1 cours doit être sélectionné
if (courseIds.length === 0) {
  return "Veuillez sélectionner au moins un cours";
}
```

**Comportement** :
- Affiche les cours selon matières sélectionnées (Page 1)
- Si Page 1 vide → affiche tous les cours disponibles
- Sélection multiple obligatoire (min 1)
- Bouton "Suivant" désactivé si aucun cours sélectionné
- Bouton "Précédent" retourne à Page 1 (données conservées)

---

### 📄 Page 3/7 : Contenus

**Titre de l'étape** : "Étape 3 : Contenus"

**Description** :  
"Sélectionnez les contenus"  
"Choisissez les sections à assigner aux élèves"

**Champs** :

| Champ | Type | Requis | Description |
|-------|------|--------|-------------|
| **Contenus** | Checkbox list | ✅ Oui | Sélection des sections/cartes à assigner |

**Structure UI** :
- Sections repliables (Accordéon) : "Introduction", etc.
- Liste de contenus avec icônes et types :
  - 📊 Leçon
  - 🎬 Vidéo
  - ✏️ Exercice
  - 📝 Quiz
- Checkbox par item
- Badge type de contenu (Leçon, Vidéo, Exercice, Quiz)

**Validation** :
```typescript
// Au moins 1 contenu doit être sélectionné
if (contentIds.length === 0) {
  return "Veuillez sélectionner au moins un contenu";
}
```

**Comportement** :
- Affiche les contenus des cours sélectionnés (Page 2)
- Sections organisées par thème (Introduction, etc.)
- Sélection multiple obligatoire (min 1)
- Bouton "Suivant" désactivé si aucun contenu
- Scroll vertical si nombreux contenus

---

### 📄 Page 4/7 : Classes

**Titre de l'étape** : "Étape 4 : Classes"

**Description** :  
"Sélectionnez les classes"  
"Choisissez les classes dont les élèves recevront l'assignation"

**Champs** :

| Champ | Type | Requis | Description |
|-------|------|--------|-------------|
| **Classes** | Multi-select | ✅ Oui | Dropdown de sélection des classes |

**Composants UI** :
- `Select` avec affichage "X sélection(s)"
- Liste avec checkboxes : Nom de la classe
- Boutons : "Tout sélectionner" et "Effacer"
- Compteur : "X élément(s)"

**Validation** :
```typescript
// Au moins 1 classe doit être sélectionnée
if (classIds.length === 0) {
  return "Veuillez sélectionner au moins une classe";
}
```

**Comportement** :
- Affiche toutes les classes du professeur
- Sélection multiple obligatoire (min 1)
- Bouton "Suivant" désactivé si aucune classe
- Filtre les élèves à l'étape 5 selon classes sélectionnées

---

### 📄 Page 5/7 : Élèves

**Titre de l'étape** : "Étape 5 : Élèves"

**Description** :  
"Sélectionnez les élèves"  
"Choisissez les élèves qui recevront l'assignation"

**Champs** :

| Champ | Type | Requis | Description |
|-------|------|--------|-------------|
| **Élèves** | Checkbox list | ✅ Oui | Sélection des élèves par classe |

**Structure UI** :
- Badge classe : "🎓 [Nom Classe]" avec compteur "X élève(s)"
- Bouton "Tout sélectionner" (sélectionne tous les élèves de la classe)
- Liste 2 colonnes avec checkboxes : Prénom NOM
- Compteur en bas : "X élève(s) sélectionné(s)"

**Validation** :
```typescript
// Au moins 1 élève doit être sélectionné
if (studentIds.length === 0) {
  return "Veuillez sélectionner au moins un élève";
}
```

**Comportement** :
- Affiche les élèves des classes sélectionnées (Page 4)
- Si plusieurs classes → sections séparées par classe
- Sélection multiple obligatoire (min 1)
- Bouton "Suivant" désactivé si aucun élève
- "Tout sélectionner" coche tous les élèves visibles

---

### 📄 Page 6/7 : Deadline

**Titre de l'étape** : "Étape 6 : Deadline"

**Description** :  
"Définissez la deadline"  
"Choisissez la date limite, l'heure et la priorité de l'assignation"

**Champs** :

| Champ | Type | Requis | Description |
|-------|------|--------|-------------|
| **Date limite** | DatePicker | ✅ Oui | Date d'échéance (icône 📅) |
| **Heure** | TimePicker | ❌ Non | Heure limite (icône 🕐, défaut 23:59) |
| **Priorité** | Toggle buttons | ✅ Oui | Haute / Moyenne / Basse |
| **Instructions** | Textarea | ❌ Non | Consignes pour les élèves |

**Composants UI** :
- `DatePicker` : Calendrier avec affichage "jour date mois année"
- `TimePicker` : Sélecteur heure format "--:--" (optionnel)
- `ToggleGroup` : 3 boutons (Haute/rouge, Moyenne/noir, Basse/vert)
- `Textarea` : Champ libre multiligne
- Info text : "Si non renseignée, l'assignation sera due à 23:59"

**Validation** :
```typescript
// Date limite obligatoire et dans le futur
if (!dueDate) {
  return "Veuillez sélectionner une date limite";
}
if (dueDate < new Date()) {
  return "La date limite doit être dans le futur";
}

// Priorité obligatoire
if (!priority) {
  return "Veuillez sélectionner une priorité";
}
```

**Comportement** :
- DatePicker ouvre un calendrier au clic
- TimePicker optionnel (si vide → 23:59 par défaut)
- Priorité : un seul bouton actif (Moyenne par défaut)
- Instructions : textarea extensible
- Bouton "Suivant" désactivé si date ou priorité manquante

---

### 📄 Page 7/7 : Validation

**Titre de l'étape** : "Étape 7 : Validation"

**Description** :  
"Vérifiez votre assignation"  
"Confirmez les détails avant de créer l'assignation"

**Type de page** : Récapitulatif (lecture seule)

**Sections affichées** :

#### 📚 Matières & Cours
- Affichage des matières sélectionnées (Page 1)
- Liste des cours sélectionnés (Page 2)
- Format : Nom matière + Nom cours (indentation)

#### 📄 Contenus (X)
- Compteur entre parenthèses
- Liste horizontale avec icônes : 📊 Introduction, 🎬 Vidéo photosynthèse
- Format : Icône + Nom du contenu

#### 🎓 Classes (X)
- Compteur entre parenthèses
- Liste des classes : "1A", "TH4-A", etc.
- Format simple : Nom classe

#### 👥 Élèves (X)
- Compteur entre parenthèses
- Liste 2 colonnes : Prénom NOM
- Format : Liste horizontale

#### 📅 Deadline & Priorité
- 📅 Date formatée : "jour date mois année"
- Badge priorité : "Priorité [Haute/Moyenne/Basse]" avec couleur
- Si instructions → affichées ici

**Message de confirmation** :
```
X assignation(s) seront créées
Y cours + Z élève(s)
(W sections sélectionnées)
```

**Calcul** :
- Nombre d'assignations = Nombre de cours × Nombre d'élèves
- Exemple : 1 cours × 2 élèves = 2 assignations

**Composants UI** :
- Sections repliables/expandables (Accordion ou Collapsible)
- Icônes par section (📚, 📄, 🎓, 👥, 📅)
- Badge priorité avec couleur (Haute=rouge, Moyenne=orange, Basse=vert)
- Texte de confirmation en gras
- Bouton final : "Créer les assignations" (variante primary)

**Validation** :
```typescript
// Aucune nouvelle validation - page de récapitulatif
// Tous les champs ont déjà été validés aux étapes précédentes
```

**Comportement** :
- Page lecture seule (aucun champ modifiable)
- Affiche le résumé de toutes les sélections
- Calcul automatique du nombre d'assignations
- Clic "Précédent" → retour à Page 6 (édition possible)
- Clic "Créer les assignations" → Soumission finale

**Actions après soumission** :
1. Validation complète du formulaire
2. POST `/api/teacher/assignments`
3. Création de X assignations (1 par élève × cours)
4. Toast de succès : "X assignation(s) créée(s)"
5. Fermeture modale
6. Refresh de la liste
7. Redirection vers l'onglet approprié (Calendrier ou Liste)

---

## 📊 Récapitulatif Technique

**Type de composant** : Modale multi-étapes (stepper)  
**Nombre d'étapes** : 7  
**Persistance** : Données en mémoire entre les étapes  
**Validation** : Progressive (par étape)  
**Soumission** : Finale (étape 7/7)

---

*Fichier créé le 13 décembre 2025 - Complété progressivement avec captures d'écran*