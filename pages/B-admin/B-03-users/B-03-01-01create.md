# Créer un Utilisateur

> **Chemin de navigation** : Login → Dashboard Admin → Utilisateurs → **+ Ajouter**  
> **Route** : `/admin/users` (modale)  
> **Rôle** : ADMIN  
> **Composant source** : `src/components/features/users/CreateUserModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar → Utilisateurs
   └── liste.md

4. Clic sur "+ Ajouter"
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel - Modale Nouvel Utilisateur

```
┌───────────────────────────────────────────────────────────────┐
│  Nouvel utilisateur                                     [×]   │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  Prénom                            Nom                        │
│  ┌──────────────────────┐  ┌──────────────────────────────┐  │
│  │                      │  │                              │  │
│  └──────────────────────┘  └──────────────────────────────┘  │
│                                                               │
│  Email                                                        │
│  ┌──────────────────────────────────────────────────────────┐│
│  │                                                          ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Mot de passe                                                 │
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
│  │ Sélectionner une classe                              ▼  ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Informations de contact (optionnel)                          │
│                                                               │
│  Téléphone                                                    │
│  ┌──────────────────────────────────────────────────────────┐│
│  │ 06 12 34 56 78                                           ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Adresse                                                      │
│  ┌──────────────────────────────────────────────────────────┐│
│  │ 12 rue des Lilas                                         ││
│  └──────────────────────────────────────────────────────────┘│
│                                                               │
│  Code postal                       Ville                      │
│  ┌──────────────────────┐  ┌──────────────────────────────┐  │
│  │ 75001                │  │ Paris                        │  │
│  └──────────────────────┘  └──────────────────────────────┘  │
│                                                               │
│                  [Annuler]            [Créer]                 │
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
| `POST` | `/api/admin/users` | Créer un utilisateur | `CreateUserFormData` |
| `GET` | `/api/admin/classes` | Liste des classes disponibles | - |

---

## 💾 Types & Interfaces

```typescript
interface CreateUserFormData {
  // Obligatoires
  firstName: string;
  lastName: string;
  email: string;
  password: string;
  role: 'STUDENT' | 'TEACHER' | 'ADMIN';
  
  // Conditionnel
  classId?: string;        // Obligatoire si role = STUDENT
  subjectIds?: string[];   // Optionnel si role = TEACHER
  
  // Optionnels
  phone?: string;
  address?: string;
  postalCode?: string;
  city?: string;
}

interface CreateUserResponse {
  success: boolean;
  data?: {
    id: string;
    email: string;
    temporaryPassword: string;  // Envoyé par email
  };
  error?: string;
}
```

---

## 📋 Champs du Formulaire

### Obligatoires

| Champ | Type | Validation | Description |
|-------|------|------------|-------------|
| **Prénom** | Texte | Min 2 caractères | Prénom de l'utilisateur |
| **Nom** | Texte | Min 2 caractères | Nom de famille (affiché en majuscules) |
| **Email** | Email | Format email + unique | Adresse email (@blaizbot.edu) |
| **Mot de passe** | Password | Min 8 caractères, 1 majuscule, 1 chiffre | Mot de passe temporaire |
| **Rôle** | Select | Requis | STUDENT / TEACHER / ADMIN |

### Conditionnels

| Champ | Condition | Description |
|-------|-----------|-------------|
| **Classe*** | Si rôle = STUDENT | Obligatoire pour les élèves |
| **Matières** | Si rôle = TEACHER | Optionnel pour les professeurs |

### Optionnels (Contact)

| Champ | Type | Format |
|-------|------|--------|
| **Téléphone** | Texte | 06 12 34 56 78 |
| **Adresse** | Texte | Libre |
| **Code postal** | Texte | 75001 |
| **Ville** | Texte | Libre |

---

## 🎯 Règles de Validation

### Email
- Format valide : `prenom.nom@blaizbot.edu`
- Unique dans la base de données
- Message d'erreur si déjà utilisé

### Mot de passe
```
✓ Au moins 8 caractères
✓ Au moins 1 majuscule
✓ Au moins 1 chiffre
✓ Au moins 1 caractère spécial (recommandé)
```

### Rôle & Classe
| Rôle | Règle |
|------|-------|
| **STUDENT** | Champ "Classe" devient obligatoire (*) |
| **TEACHER** | Champ "Matières" apparaît (multi-select) |
| **ADMIN** | Pas de champs supplémentaires |

---

## 🔄 Comportements Dynamiques

### Sélection du Rôle

```typescript
// Si rôle = "Élève"
<Select name="classId" required>
  <option>Sélectionner une classe</option>
  <option value="1">1A</option>
  <option value="2">11H-A</option>
  <option value="3">10H-B</option>
  ...
</Select>

// Si rôle = "Professeur"
<MultiSelect name="subjectIds">
  <option value="1">Mathématiques</option>
  <option value="2">Français</option>
  <option value="3">Histoire</option>
  ...
</MultiSelect>

// Si rôle = "Admin"
// Pas de champs supplémentaires
```

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Remplir le formulaire** | Validation en temps réel (affichage erreurs sous les champs) |
| **Changer le rôle** | Affiche/masque les champs conditionnels (Classe/Matières) |
| **Cliquer "Créer"** | Valide le formulaire → Appel API → Toast succès → Retour à la liste |
| **Cliquer "Annuler"** | Ferme la modale sans enregistrer |
| **Fermer [×]** | Ferme la modale sans enregistrer |

---

## ✅ Workflow de Création

```
1. Admin clique "+ Ajouter" sur liste.md
   ↓
2. Modale s'ouvre avec formulaire vide
   ↓
3. Admin saisit les informations
   ├─ Prénom, Nom, Email
   ├─ Mot de passe temporaire
   ├─ Sélectionne le rôle
   └─ (Si élève) Sélectionne la classe
   ↓
4. Admin clique "Créer"
   ├─ Validation côté client
   ├─ Si erreurs : affichage sous les champs
   └─ Si OK : appel API POST /api/admin/users
   ↓
5. Serveur valide et crée l'utilisateur
   ├─ Enregistrement en base
   ├─ Génération d'un token d'activation
   └─ Envoi d'un email à l'utilisateur
   ↓
6. Réponse succès
   ├─ Toast : "Utilisateur créé avec succès"
   ├─ Fermeture de la modale
   └─ Rafraîchissement de la liste
```

---

## 📧 Email d'Activation

Après création, l'utilisateur reçoit un email :

```
Objet : Bienvenue sur BlaizBot !

Bonjour [Prénom],

Votre compte BlaizBot a été créé avec succès.

Email : [email]
Mot de passe temporaire : [password]
Rôle : [role]

Cliquez sur le lien ci-dessous pour activer votre compte et définir un nouveau mot de passe :
[Lien d'activation]

Ce lien expire dans 24 heures.

L'équipe BlaizBot
```

---

## ⚠️ Gestion des Erreurs

### Validation côté client
```
Prénom : "Le prénom doit contenir au moins 2 caractères"
Email : "Format d'email invalide"
Mot de passe : "Le mot de passe doit contenir au moins 8 caractères"
Classe : "Veuillez sélectionner une classe" (si élève)
```

### Erreurs serveur
```
Email déjà utilisé : "Cet email est déjà associé à un compte"
Classe inexistante : "La classe sélectionnée n'existe pas"
Erreur réseau : "Impossible de créer l'utilisateur. Veuillez réessayer."
```

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Annuler / [×] | Retour à [liste.md](liste.md) |
| Succès | Toast + retour à [liste.md](liste.md) |

---

## 📝 Notes

> **Génération automatique** :
> - Email suggéré : `prenom.nom@blaizbot.edu` (auto-rempli)
> - Mot de passe temporaire : généré si vide (min 12 caractères)

> **Sécurité** :
> - Mot de passe haché (bcrypt) avant stockage
> - Email d'activation avec token unique
> - Expiration du token : 24h

> **UX** :
> - Validation en temps réel
> - Indicateurs visuels (✓ vert / ✗ rouge)
> - Champs conditionnels selon le rôle

---

**Navigation** :
- ← [Liste utilisateurs](liste.md)

*Documentation générée par rétro-ingénierie de BlaizBot-V1*  
*Date : 13 décembre 2025*

