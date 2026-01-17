# Modifier une Classe

> **Chemin de navigation** : Login → Dashboard Admin → Classes → Menu (...) → **Modifier**  
> **Route** : `/admin/classes` (modale)  
> **Rôle** : ADMIN  
> **Composant source** : `src/components/features/classes/EditClassModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar → Classes
   └── liste.md

4. Menu actions (...) → Modifier
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel - Modale Modifier la Classe

```
┌───────────────────────────────────────────────────────────┐
│  Modifier la classe                                 [×]   │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  Nom de la classe                                         │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ 10H-A                                               │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                           │
│  Le nom peut être modifié à tout moment.                  │
│                                                           │
│                         [Annuler]    [Modifier]           │
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
| `GET` | `/api/admin/classes/:id` | Récupérer les données de la classe | - |
| `PATCH` | `/api/admin/classes/:id` | Mettre à jour la classe | `{ name: string }` |

---

## 💾 Types & Interfaces

```typescript
interface UpdateClassFormData {
  name: string;  // Nom de la classe
}

interface UpdateClassResponse {
  success: boolean;
  data?: {
    id: string;
    name: string;
    studentCount: number;
  };
  error?: string;
}
```

---

## 📋 Champs du Formulaire

### Pré-rempli avec les données existantes

| Champ | Valeur initiale | Éditable |
|-------|----------------|----------|
| **Nom de la classe** | Nom actuel (ex: "10H-A") | ✅ |

---

## 🎯 Différences avec create.md

| Aspect | Création | Édition |
|--------|----------|---------|
| **Titre** | "Nouvelle classe" | "Modifier la classe" |
| **Champ** | Vide avec placeholder | Pré-rempli avec nom actuel |
| **Bouton** | "Créer" (gris) | "Modifier" (noir) |
| **API** | `POST /api/admin/classes` | `PATCH /api/admin/classes/:id` |
| **Focus** | Focus automatique | Texte sélectionné pour remplacement rapide |

---

## 🔄 Comportements

### Ouverture de la modale
1. Appel `GET /api/admin/classes/:id`
2. Récupération du nom actuel
3. Pré-remplissage du champ
4. Focus sur le champ avec texte sélectionné

### Pendant la saisie
- Validation en temps réel
- Vérification d'unicité (si changement)
- Bouton "Modifier" actif si valide

### Note informative
> "Le nom peut être modifié à tout moment."

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Ouvrir modale** | GET données → pré-remplissage + sélection du texte |
| **Modifier texte** | Validation en temps réel |
| **Champ valide** | Bouton "Modifier" reste actif |
| **Champ invalide** | Message d'erreur + bouton désactivé |
| **Cliquer "Modifier"** | Validation → API PATCH → Toast succès → Retour liste |
| **Cliquer "Annuler"** | Ferme sans enregistrer |
| **Fermer [×]** | Ferme sans enregistrer |
| **Appuyer Entrée** | Soumission du formulaire (si valide) |

---

## ✅ Workflow de Modification

```
1. Admin clique "..." → "Modifier" sur liste.md
   ↓
2. Appel GET /api/admin/classes/:id
   ├─ Récupération du nom actuel (ex: "10H-A")
   └─ Pré-remplissage de la modale
   ↓
3. Admin modifie le nom
   ├─ Ex: "10H-A" → "10H-A (Sciences)"
   ├─ Validation en temps réel
   └─ Vérification qu'il n'existe pas déjà
   ↓
4. Admin clique "Modifier"
   ├─ Validation finale côté client
   ├─ Si pas de changement : fermeture sans appel API
   └─ Si changement : appel PATCH /api/admin/classes/:id
   ↓
5. Serveur met à jour le nom
   ├─ Vérification unicité
   ├─ Update en base de données
   └─ Retour { id, name, studentCount }
   ↓
6. Réponse succès
   ├─ Toast : "Classe modifiée avec succès"
   ├─ Fermeture de la modale
   └─ Rafraîchissement de la liste (nom mis à jour)
```

---

## ⚠️ Gestion des Erreurs

### Validation côté client
```
Champ vide :
  "Le nom de la classe est obligatoire"

Nom trop long :
  "Le nom ne peut pas dépasser 50 caractères"

Aucun changement :
  → Fermeture directe sans appel API
```

### Erreurs serveur
```
Doublon :
  "Une classe avec ce nom existe déjà"
  
Classe supprimée :
  "Cette classe n'existe plus"
  
Erreur réseau :
  "Impossible de modifier la classe. Veuillez réessayer."
```

---

## 🔒 Restrictions

| Règle | Description |
|-------|-------------|
| **Unicité** | Le nouveau nom ne doit pas exister déjà |
| **Classe avec élèves** | Modification du nom possible même avec élèves |
| **Logs d'audit** | Modification tracée (ancien nom → nouveau nom) |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Annuler / [×] | Retour à [liste.md](liste.md) |
| Succès | Toast + retour à [liste.md](liste.md) |

---

## 📝 Notes

> **Optimisation** : 
> - Si aucun changement détecté, la modale se ferme sans appel API
> - Économise les requêtes inutiles

> **UX** :
> - Texte pré-sélectionné au focus pour remplacement rapide
> - Validation en temps réel
> - Message rassurant identique à la création

> **Impact** :
> - La modification du nom de classe se répercute automatiquement partout dans l'application
> - Les élèves assignés restent dans la classe (pas de perte de données)
> - Historique des modifications conservé dans les logs d'audit

> **Cas d'usage** :
> - Correction de typo : "10H-A" → "10H-A"
> - Ajout de précision : "1A" → "1A (Bilingue)"
> - Renommage complet : "23" → "Terminale S1"

---

**Navigation** :
- ← [Liste des classes](liste.md)

*Date : 13 décembre 2025*

