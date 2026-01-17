# Éditer un Utilisateur

> **Chemin de navigation** : Login → Dashboard Admin → Utilisateurs → Menu (...) → **Éditer**  
> **Route** : `/admin/users` (modale)  
> **Rôle** : ADMIN  
> **Composant source** : `src/components/features/users/EditUserModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar → Utilisateurs
   └── liste.md

4. Menu actions (...) → Éditer
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel - Modale Modifier l'Utilisateur

```
┌───────────────────────────────────────────────────────────────┐
│  Modifier l'utilisateur                                 [×]   │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  Prénom                            Nom                        │
│  ┌──────────────────────┐  ┌──────────────────────────────┐  │
│  │ Margot               │  │ PERROUD                      │  │
│  └──────────────────────┘  └──────────────────────────────┘  │
│                                                               │
│  Email                                                        │
│  ┌──────────────────────────────────────────────────────────┐│
│  │ margot.perroud@blaizbot.edu                              ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Mot de passe (laisser vide pour ne pas changer)             │
│  ┌──────────────────────────────────────────────────────────┐│
│  │                                                          ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Rôle                                                         │
│  ┌──────────────────────────────────────────────────────────┐│
│  │ Élève                                                 ▼  ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Classe *                                                     │
│  ┌──────────────────────────────────────────────────────────┐│
│  │ 1A                                                    ▼  ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Informations de contact (optionnel)                          │
│                                                               │
│  Téléphone                                                    │
│  ┌──────────────────────────────────────────────────────────┐│
│  │ 079 170 70 80                                            ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Adresse                                                      │
│  ┌──────────────────────────────────────────────────────────┐│
│  │ 6 quai Gustave-Ador                                      ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Code postal                       Ville                      │
│  ┌──────────────────────┐  ┌──────────────────────────────┐  │
│  │ 1207                 │  │ Genève                       │  │
│  └──────────────────────┘  └──────────────────────────────┘  │
│                                                               │
│                  [Annuler]            [Modifier]              │
│                                       (noir)                  │
└───────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `Input` | `@/components/ui/input` | Champs de saisie |
| `Select` | `@/components/ui/select` | Dropdowns (rôle, classe) |
| `Button` | `@/components/ui/button` | Boutons d'action |
| `Label` | `@/components/ui/label` | Labels des champs |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/admin/users/:id` | Récupérer les données de l'utilisateur | - |
| `PATCH` | `/api/admin/users/:id` | Mettre à jour l'utilisateur | `UpdateUserFormData` |
| `GET` | `/api/admin/classes` | Liste des classes disponibles | - |

---

## 💾 Types & Interfaces

```typescript
interface UpdateUserFormData {
  // Obligatoires
  firstName: string;
  lastName: string;
  email: string;
  role: 'STUDENT' | 'TEACHER' | 'ADMIN';
  
  // Conditionnel
  classId?: string;        // Obligatoire si role = STUDENT
  subjectIds?: string[];   // Optionnel si role = TEACHER
  
  // Optionnel (changement de mot de passe)
  password?: string;       // Si vide = pas de changement
  
  // Optionnels (contact)
  phone?: string;
  address?: string;
  postalCode?: string;
  city?: string;
}

interface UpdateUserResponse {
  success: boolean;
  data?: {
    id: string;
    email: string;
    updatedFields: string[];  // Liste des champs modifiés
  };
  error?: string;
}
```

---

## 📋 Champs du Formulaire

### Pré-remplis avec les données existantes

| Champ | Valeur initiale | Éditable |
|-------|----------------|----------|
| **Prénom** | Données actuelles | ✅ |
| **Nom** | Données actuelles | ✅ |
| **Email** | Données actuelles | ✅ (vérifié unique) |
| **Rôle** | Rôle actuel | ✅ |
| **Classe** | Classe actuelle | ✅ (si élève) |
| **Téléphone** | Téléphone actuel | ✅ |
| **Adresse** | Adresse actuelle | ✅ |
| **Code postal** | Code postal actuel | ✅ |
| **Ville** | Ville actuelle | ✅ |

### Champ spécial

| Champ | Comportement |
|-------|--------------|
| **Mot de passe** | Vide par défaut. Ne se met à jour QUE si rempli |

---

## 🎯 Différences avec create.md

| Aspect | Création | Édition |
|--------|----------|---------|
| **Titre** | "Nouvel utilisateur" | "Modifier l'utilisateur" |
| **Champs** | Vides | Pré-remplis |
| **Mot de passe** | Obligatoire | Optionnel (vide = pas de changement) |
| **Label MDP** | "Mot de passe" | "Mot de passe (laisser vide pour ne pas changer)" |
| **Bouton** | "Créer" | "Modifier" |
| **API** | `POST /api/admin/users` | `PATCH /api/admin/users/:id` |

---

## 🔄 Comportements Dynamiques

### Changement de Rôle

Si l'admin change le rôle de l'utilisateur :

```typescript
// Si passage à "Élève" (STUDENT)
→ Champ "Classe" devient obligatoire
→ Champ "Matières" disparaît

// Si passage à "Professeur" (TEACHER)
→ Champ "Classe" disparaît
→ Champ "Matières" apparaît (multi-select)

// Si passage à "Admin" (ADMIN)
→ Champs "Classe" et "Matières" disparaissent
```

### Validation du Mot de Passe

```typescript
if (password === '') {
  // Pas de changement, ne pas envoyer ce champ
  payload.password = undefined;
} else {
  // Validation : min 8 caractères, 1 majuscule, 1 chiffre
  if (!validatePassword(password)) {
    throw new Error('Le mot de passe ne respecte pas les critères');
  }
  payload.password = password;
}
```

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Ouverture modale** | Appel `GET /api/admin/users/:id` → pré-remplissage des champs |
| **Modifier champs** | Validation en temps réel |
| **Changer rôle** | Affiche/masque champs conditionnels |
| **Remplir mot de passe** | Active la validation MDP |
| **Laisser MDP vide** | Pas de changement de mot de passe |
| **Cliquer "Modifier"** | Validation → API PATCH → Toast succès → Fermeture |
| **Cliquer "Annuler"** | Ferme sans enregistrer |
| **Fermer [×]** | Ferme sans enregistrer |

---

## ✅ Workflow de Modification

```
1. Admin clique "..." → "Éditer" sur liste.md
   ↓
2. Appel GET /api/admin/users/:id
   ├─ Récupération des données actuelles
   └─ Pré-remplissage de la modale
   ↓
3. Admin modifie les champs souhaités
   ├─ Change le prénom (ex: Margot → Marguerite)
   ├─ Ajoute un téléphone
   └─ (Optionnel) Change le mot de passe
   ↓
4. Admin clique "Modifier"
   ├─ Validation côté client
   ├─ Calcul des champs modifiés (diff)
   └─ Appel PATCH /api/admin/users/:id
   ↓
5. Serveur met à jour UNIQUEMENT les champs modifiés
   ├─ Si mot de passe fourni : hashage + update
   ├─ Si email changé : vérification unicité
   └─ Update en base de données
   ↓
6. Réponse succès
   ├─ Toast : "Utilisateur mis à jour avec succès"
   ├─ Fermeture de la modale
   └─ Rafraîchissement de la liste
```

---

## 📧 Notifications Email

### Si changement d'email
```
Objet : Votre adresse email a été modifiée

Bonjour [Prénom],

Votre adresse email BlaizBot a été modifiée :
Ancienne : margot.perroud@blaizbot.edu
Nouvelle : marguerite.perroud@blaizbot.edu

Si vous n'êtes pas à l'origine de ce changement, contactez immédiatement l'administration.

L'équipe BlaizBot
```

### Si changement de mot de passe
```
Objet : Votre mot de passe a été réinitialisé

Bonjour [Prénom],

Votre mot de passe BlaizBot a été réinitialisé par un administrateur.

Nouveau mot de passe temporaire : [password]

Cliquez sur le lien ci-dessous pour définir un nouveau mot de passe :
[Lien de réinitialisation]

Ce lien expire dans 24 heures.

L'équipe BlaizBot
```

---

## ⚠️ Gestion des Erreurs

### Validation côté client
```
Email : "Cet email est déjà utilisé par un autre utilisateur"
Mot de passe : "Le mot de passe doit contenir au moins 8 caractères"
Classe : "Veuillez sélectionner une classe" (si élève)
```

### Erreurs serveur
```
Email en doublon : "Cet email est déjà associé à un autre compte"
Classe inexistante : "La classe sélectionnée n'existe plus"
Utilisateur supprimé : "Cet utilisateur n'existe plus"
Permission refusée : "Vous ne pouvez pas modifier cet utilisateur"
```

---

## 🔒 Restrictions de Sécurité

| Règle | Description |
|-------|-------------|
| **Auto-modification** | Un admin ne peut pas se retirer le rôle ADMIN |
| **Dernier admin** | Impossible de supprimer ou dégrader le dernier admin |
| **Email unique** | Vérification que le nouvel email n'existe pas déjà |
| **Logs d'audit** | Toutes les modifications sont tracées |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Annuler / [×] | Retour à [liste.md](liste.md) |
| Succès | Toast + retour à [liste.md](liste.md) |

---

## 📝 Notes

> **Optimisation** : Seuls les champs modifiés sont envoyés au serveur (PATCH partiel)

> **Mot de passe** : 
> - Si vide → pas de changement
> - Si rempli → validation + hashage + email de notification

> **Changement de rôle** :
> - Si STUDENT → TEACHER : les classes sont supprimées, les matières peuvent être ajoutées
> - Si TEACHER → STUDENT : les matières sont supprimées, une classe doit être assignée

> **Historique** : Chaque modification est enregistrée dans une table d'audit avec :
> - Date/heure
> - Admin qui a effectué la modification
> - Champs modifiés (avant/après)

---

**Navigation** :
- ← [Liste utilisateurs](liste.md)

*Documentation générée par rétro-ingénierie de BlaizBot-V1*  
*Date : 13 décembre 2025*

