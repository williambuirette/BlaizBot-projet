# Modifier une Matière

> **Chemin de navigation** : Login → Dashboard Admin → Matières → Menu (...) → **Modifier**  
> **Route** : `/admin/subjects` (modale)  
> **Rôle** : ADMIN  
> **Composant source** : `src/components/features/subjects/EditSubjectModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar → Matières
   └── liste.md

4. Menu actions (...) → Modifier
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel - Modale Modifier la Matière

```
┌───────────────────────────────────────────────────────────┐
│  Modifier la matière                                [×]   │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  Nom de la matière                                        │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ Anglais                                             │  │
│  └─────────────────────────────────────────────────────┘  │
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
| `GET` | `/api/admin/subjects/:id` | Récupérer les données de la matière | - |
| `PATCH` | `/api/admin/subjects/:id` | Mettre à jour la matière | `{ name: string, color?: string }` |

---

## 💾 Types & Interfaces

```typescript
interface UpdateSubjectFormData {
  name: string;     // Nom de la matière
  color?: string;   // Couleur hex (optionnel)
}

interface UpdateSubjectResponse {
  success: boolean;
  data?: {
    id: string;
    name: string;
    color: string;
    courseCount: number;
    teacherCount: number;
  };
  error?: string;
}
```

---

## 📋 Champs du Formulaire

### Pré-rempli avec les données existantes

| Champ | Valeur initiale | Éditable |
|-------|----------------|----------|
| **Nom de la matière** | Nom actuel (ex: "Anglais") | ✅ |

---

## 🎯 Différences avec create.md

| Aspect | Création | Édition |
|--------|----------|---------|
| **Titre** | "Nouvelle matière" | "Modifier la matière" |
| **Champ** | Vide avec placeholder | Pré-rempli avec nom actuel |
| **Bouton** | "Créer" (noir) | "Modifier" (noir) |
| **API** | `POST /api/admin/subjects` | `PATCH /api/admin/subjects/:id` |
| **Focus** | Focus automatique | Texte sélectionné pour remplacement rapide |
| **Couleur** | Générée automatiquement | Conservée (modifiable via autre interface) |

---

## 🔄 Comportements

### Ouverture de la modale
1. Appel `GET /api/admin/subjects/:id`
2. Récupération du nom et de la couleur actuels
3. Pré-remplissage du champ
4. Focus sur le champ avec texte sélectionné

### Pendant la saisie
- Validation en temps réel
- Vérification d'unicité (si changement)
- Bouton "Modifier" actif si valide

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
2. Appel GET /api/admin/subjects/:id
   ├─ Récupération du nom actuel (ex: "Anglais")
   ├─ Récupération de la couleur actuelle (ex: "#E91E63")
   └─ Pré-remplissage de la modale
   ↓
3. Admin modifie le nom
   ├─ Ex: "Anglais" → "English"
   ├─ Validation en temps réel
   └─ Vérification qu'il n'existe pas déjà
   ↓
4. Admin clique "Modifier"
   ├─ Validation finale côté client
   ├─ Si pas de changement : fermeture sans appel API
   └─ Si changement : appel PATCH /api/admin/subjects/:id
   ↓
5. Serveur met à jour le nom
   ├─ Vérification unicité (insensible à la casse)
   ├─ Update en base de données
   └─ Retour { id, name, color, courseCount, teacherCount }
   ↓
6. Réponse succès
   ├─ Toast : "Matière modifiée avec succès"
   ├─ Fermeture de la modale
   └─ Rafraîchissement de la liste (nom mis à jour)
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

Aucun changement :
  → Fermeture directe sans appel API
```

### Erreurs serveur
```
Doublon :
  "Une matière avec ce nom existe déjà"
  → Note : La comparaison est insensible à la casse
  
Matière supprimée :
  "Cette matière n'existe plus"
  
Matière avec cours :
  → Modification du nom possible (pas de restriction)
  
Erreur réseau :
  "Impossible de modifier la matière. Veuillez réessayer."
```

---

## 🔒 Restrictions

| Règle | Description |
|-------|-------------|
| **Unicité** | Le nouveau nom ne doit pas exister déjà (insensible à la casse) |
| **Matière avec cours** | Modification possible même avec des cours existants |
| **Matière avec profs** | Modification possible même avec des professeurs assignés |
| **Logs d'audit** | Modification tracée (ancien nom → nouveau nom) |

---

## 🎨 Couleur de la Matière

> **Note importante** : Cette modale ne permet pas de modifier la couleur
- La couleur est conservée lors de la modification du nom
- Pour changer la couleur, utiliser l'interface "Voir détails" ou une modale dédiée
- La couleur reste associée à la matière même si le nom change

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
> - Pas de restriction liée aux cours ou professeurs

> **Impact** :
> - La modification du nom se répercute automatiquement partout dans l'application
> - Les cours et professeurs associés restent liés (pas de perte de données)
> - La couleur est conservée
> - Historique des modifications conservé dans les logs d'audit

> **Cas d'usage** :
> - Correction de typo : "Anglais" → "Anglaise"
> - Changement de langue : "Mathématiques" → "Mathematics"
> - Précision : "SVT" → "Sciences de la Vie et de la Terre"
> - Renommage : "math" → "Mathématiques"

> **Attention** :
> - "Math" et "Mathématiques" sont considérés différents (pas de normalisation)
> - Vérifier l'absence de doublons avant modification

---

**Navigation** :
- ← [Liste des matières](liste.md)

*Date : 13 décembre 2025*

