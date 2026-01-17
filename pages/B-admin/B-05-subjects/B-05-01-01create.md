# Créer une Matière

> **Chemin de navigation** : Login → Dashboard Admin → Matières → **+ Ajouter**  
> **Route** : `/admin/subjects` (modale)  
> **Rôle** : ADMIN  
> **Composant source** : `src/components/features/subjects/CreateSubjectModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar → Matières
   └── liste.md

4. Clic sur "+ Ajouter"
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel - Modale Nouvelle Matière

```
┌───────────────────────────────────────────────────────────┐
│  Nouvelle matière                                   [×]   │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  Nom de la matière                                        │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ ex: Mathématiques                                   │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                           │
│                         [Annuler]    [Créer]              │
│                                      (noir)               │
└───────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `Input` | `@/components/ui/input` | Champ de saisie |
| `Button` | `@/components/ui/button` | Boutons d'action |
| `Label` | `@/components/ui/label` | Label du champ |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `POST` | `/api/admin/subjects` | Créer une matière | `{ name: string, color?: string }` |

---

## 💾 Types & Interfaces

```typescript
interface CreateSubjectFormData {
  name: string;     // Nom de la matière (obligatoire)
  color?: string;   // Couleur hex (auto-générée si non fournie)
}

interface CreateSubjectResponse {
  success: boolean;
  data?: {
    id: string;
    name: string;
    color: string;
    courseCount: 0;
    teacherCount: 0;
  };
  error?: string;
}
```

---

## 📋 Champs du Formulaire

### Obligatoire

| Champ | Type | Validation | Description |
|-------|------|------------|-------------|
| **Nom de la matière** | Texte | Obligatoire, unique, 2-100 caractères | Nom de la matière |

### Placeholder
- Exemple affiché : `ex: Mathématiques`
- Aide à comprendre le format attendu

---

## 🎯 Règles de Validation

### Nom de la matière

```typescript
// Validation
✓ Obligatoire
✓ Unique (pas de doublons, insensible à la casse)
✓ Entre 2 et 100 caractères
✓ Peut contenir : lettres, chiffres, espaces, tirets
✓ Formats acceptés : "Mathématiques", "SVT", "Histoire-Géographie"

// Erreurs
❌ Vide → "Le nom de la matière est obligatoire"
❌ Doublon → "Cette matière existe déjà"
❌ Trop court → "Le nom doit contenir au moins 2 caractères"
❌ Trop long → "Le nom ne peut pas dépasser 100 caractères"
```

---

## 🔄 Comportements

### Affichage initial
- Champ vide avec placeholder
- Bouton "Créer" désactivé (gris)

### Pendant la saisie
- Validation en temps réel
- Bouton "Créer" activé (noir) si valide
- Message d'erreur sous le champ si invalide

### Couleur automatique
> La couleur de la matière est assignée automatiquement par le système
- Couleur aléatoire parmi la palette prédéfinie
- Peut être modifiée ultérieurement via l'édition

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Ouvrir modale** | Champ vide, focus automatique sur l'input |
| **Taper du texte** | Validation en temps réel |
| **Champ valide** | Bouton "Créer" devient actif |
| **Champ invalide** | Message d'erreur + bouton désactivé |
| **Cliquer "Créer"** | Validation → API POST → Toast succès → Retour liste |
| **Cliquer "Annuler"** | Ferme sans enregistrer |
| **Fermer [×]** | Ferme sans enregistrer |
| **Appuyer Entrée** | Soumission du formulaire (si valide) |

---

## ✅ Workflow de Création

```
1. Admin clique "+ Ajouter" sur liste.md
   ↓
2. Modale s'ouvre avec champ vide
   ├─ Focus automatique sur l'input
   └─ Bouton "Créer" désactivé
   ↓
3. Admin saisit le nom de la matière
   ├─ Ex: "Géographie"
   ├─ Validation en temps réel
   └─ Bouton "Créer" s'active si valide
   ↓
4. Admin clique "Créer"
   ├─ Validation finale côté client
   ├─ Si erreur : affichage sous le champ
   └─ Si OK : appel API POST /api/admin/subjects
   ↓
5. Serveur valide et crée la matière
   ├─ Vérification unicité du nom
   ├─ Génération automatique d'une couleur
   ├─ Création en base de données
   └─ Retour { id, name, color, courseCount: 0, teacherCount: 0 }
   ↓
6. Réponse succès
   ├─ Toast : "Matière créée avec succès"
   ├─ Fermeture de la modale
   └─ Rafraîchissement de la liste (nouvelle matière apparaît avec sa couleur)
```

---

## 🎨 Attribution de Couleur

### Palette prédéfinie

```typescript
const SUBJECT_COLORS = [
  '#E91E63',  // Rose (Anglais)
  '#FF1744',  // Rouge (Français)
  '#2196F3',  // Bleu (Mathématiques)
  '#4CAF50',  // Vert (SVT)
  '#FFC107',  // Jaune
  '#9C27B0',  // Violet
  '#9E9E9E',  // Gris (Histoire-Géographie)
  '#FF5722',  // Orange
];

// Sélection aléatoire lors de la création
const randomColor = SUBJECT_COLORS[Math.floor(Math.random() * SUBJECT_COLORS.length)];
```

---

## ⚠️ Gestion des Erreurs

### Validation côté client
```
Champ vide :
  "Le nom de la matière est obligatoire"

Nom trop court :
  "Le nom doit contenir au moins 2 caractères"

Nom trop long :
  "Le nom ne peut pas dépasser 100 caractères"
```

### Erreurs serveur
```
Doublon :
  "Une matière avec ce nom existe déjà"
  → Note : La comparaison est insensible à la casse
  → "Mathématiques" = "mathématiques" = "MATHÉMATIQUES"

Erreur réseau :
  "Impossible de créer la matière. Veuillez réessayer."
```

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Annuler / [×] | Retour à [liste.md](liste.md) |
| Succès | Toast + retour à [liste.md](liste.md) |

---

## 📝 Notes

> **Simplicité** : 
> - Un seul champ pour créer rapidement des matières
> - Couleur assignée automatiquement
> - Description peut être ajoutée via l'édition si nécessaire

> **Unicité** :
> - Vérification insensible à la casse
> - "Math" et "math" sont considérés comme doublons
> - Empêche la création de matières en double

> **État initial** :
> - Matière créée avec 0 cours
> - Matière créée avec 0 professeur
> - Les professeurs sont ajoutés via "Gérer les profs" ou lors de la création/édition d'utilisateurs

> **Couleur automatique** :
> - Assignée aléatoirement parmi 8 couleurs prédéfinies
> - Évite les conflits visuels
> - Modifiable via l'édition

> **UX** :
> - Focus automatique sur le champ
> - Validation en temps réel
> - Soumission possible avec Entrée
> - Placeholder informatif

---

**Navigation** :
- ← [Liste des matières](liste.md)

*Date : 13 décembre 2025*

