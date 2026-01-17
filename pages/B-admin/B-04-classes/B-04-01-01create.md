# Créer une Classe

> **Chemin de navigation** : Login → Dashboard Admin → Classes → **+ Ajouter**  
> **Route** : `/admin/classes` (modale)  
> **Rôle** : ADMIN  
> **Composant source** : `src/components/features/classes/CreateClassModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar → Classes
   └── liste.md

4. Clic sur "+ Ajouter"
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel - Modale Nouvelle Classe

```
┌───────────────────────────────────────────────────────────┐
│  Nouvelle classe                                    [×]   │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  Nom de la classe                                         │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ Ex: 9H-A, 10H-B, Terminale S1                       │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                           │
│  Le nom peut être modifié à tout moment.                  │
│                                                           │
│                         [Annuler]    [Créer]              │
│                                      (gris)               │
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
| `POST` | `/api/admin/classes` | Créer une classe | `{ name: string }` |

---

## 💾 Types & Interfaces

```typescript
interface CreateClassFormData {
  name: string;  // Nom de la classe (obligatoire)
}

interface CreateClassResponse {
  success: boolean;
  data?: {
    id: string;
    name: string;
    studentCount: 0;
  };
  error?: string;
}
```

---

## 📋 Champs du Formulaire

### Obligatoire

| Champ | Type | Validation | Description |
|-------|------|------------|-------------|
| **Nom de la classe** | Texte | Obligatoire, unique, 1-50 caractères | Code ou nom de la classe |

### Placeholder
- Exemple affiché : `Ex: 9H-A, 10H-B, Terminale S1`
- Aide à comprendre les formats acceptés

---

## 🎯 Règles de Validation

### Nom de la classe

```typescript
// Validation
✓ Obligatoire
✓ Unique (pas de doublons)
✓ Entre 1 et 50 caractères
✓ Peut contenir : lettres, chiffres, espaces, tirets, underscore
✓ Formats acceptés : "9H-A", "10H-B", "1A", "Terminale S1", "23"

// Erreurs
❌ Vide → "Le nom de la classe est obligatoire"
❌ Doublon → "Cette classe existe déjà"
❌ Trop long → "Le nom ne peut pas dépasser 50 caractères"
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

### Note informative
> "Le nom peut être modifié à tout moment."
- Rassure l'utilisateur qu'il peut corriger plus tard

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
3. Admin saisit le nom de la classe
   ├─ Ex: "12H-A"
   ├─ Validation en temps réel
   └─ Bouton "Créer" s'active si valide
   ↓
4. Admin clique "Créer"
   ├─ Validation finale côté client
   ├─ Si erreur : affichage sous le champ
   └─ Si OK : appel API POST /api/admin/classes
   ↓
5. Serveur valide et crée la classe
   ├─ Vérification unicité du nom
   ├─ Création en base de données
   └─ Retour { id, name, studentCount: 0 }
   ↓
6. Réponse succès
   ├─ Toast : "Classe créée avec succès"
   ├─ Fermeture de la modale
   └─ Rafraîchissement de la liste (nouvelle classe apparaît)
```

---

## ⚠️ Gestion des Erreurs

### Validation côté client
```
Champ vide :
  "Le nom de la classe est obligatoire"

Nom trop long :
  "Le nom ne peut pas dépasser 50 caractères"
```

### Erreurs serveur
```
Doublon :
  "Une classe avec ce nom existe déjà"
  → Suggestion : "Utilisez un nom différent (ex: 12H-B)"

Erreur réseau :
  "Impossible de créer la classe. Veuillez réessayer."
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
> - Un seul champ pour créer rapidement des classes
> - Description peut être ajoutée via l'édition si nécessaire

> **Format libre** :
> - Accepte différents systèmes de nommage (9H-A, 1A, Terminale S1, etc.)
> - Adapté aux différents systèmes scolaires francophones

> **État initial** :
> - Classe créée avec 0 élève
> - Les élèves sont ajoutés via "Gérer les élèves" ou lors de la création/édition d'utilisateurs

> **UX** :
> - Focus automatique sur le champ
> - Validation en temps réel
> - Soumission possible avec Entrée
> - Message rassurant : "Le nom peut être modifié à tout moment"

---

**Navigation** :
- ← [Liste des classes](liste.md)

*Date : 13 décembre 2025*

