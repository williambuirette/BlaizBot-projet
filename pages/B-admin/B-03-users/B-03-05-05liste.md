# Liste des Utilisateurs

> **Chemin de navigation** : Login → Dashboard Admin → Sidebar → **Utilisateurs**  
> **Route** : `/admin/users`  
> **Rôle** : ADMIN  
> **Composant source** : `src/app/(dashboard)/admin/users/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar Navigation
   ├── Dashboard
   ├── Utilisateurs ← VOUS ÊTES ICI
   ├── Classes
   └── Matières
```

---

## 📸 Aperçu Visuel - Liste des Utilisateurs

```
┌──────────────────────────────────────────────────────────────────────┐
│ Dashboard                                    🔍 Rechercher...         │
│                                                                       │
│ Gestion des utilisateurs                              [+ Ajouter]    │
│ 41 utilisateurs                                                       │
├──────────────────────────────────────────────────────────────────────┤
│                                                                       │
│ ┌────────────────────────────────────────────────────────────────┐  │
│ │ Nom              Email                 Rôle    Classes/    ... │  │
│ │                                                 Matières         │  │
│ ├────────────────────────────────────────────────────────────────┤  │
│ │ Margot PERROUD   margot.perroud@...   Élève   1A           ... │  │
│ │                                       (vert)                    │  │
│ │ Baptiste CURTY   baptiste.curty@...   Élève   1A           ... │  │
│ │ Eva SANDOZ       eva.sandoz@...       Élève   1A           ... │  │
│ │ Julien DUBOIS    julien.dubois@...    Élève   11H-A        ... │  │
│ │ Louise VAUCHER   louise.vaucher@...   Élève   11H-A        ... │  │
│ │ Louis MERCIER    louis.mercier@...    Élève   11H-A        ... │  │
│ │ Elisa CARDINAUX  elisa.cardinaux@...  Élève   10H-B        ... │  │
│ │ Vincent CHAPPUIS vincent.chappuis@... Élève   10H-B        ... │  │
│ │ Marine PYTHON    marine.python@...    Élève   10H-B        ... │  │
│ │ Adrien ZAUGG     adrien.zaugg@...     Élève   10H-B        ... │  │
│ │ Sarah GAILLARD   sarah.gaillard@...   Élève   10H-B        ... │  │
│ │ Hugo ROBERT      hugo.robert@...      Élève   10H-B        ... │  │
│ │ Romain MERMOUD   romain.mermoud@...   Élève   10H-A        ... │  │
│ │ ...                                                             │  │
│ └────────────────────────────────────────────────────────────────┘  │
│                                                                       │
│                    [← Précédent] Page 1/3 [Suivant →]                │
│                                                                       │
└──────────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DataTable` | `@/components/ui/data-table` | Tableau avec tri et pagination |
| `Input` | `@/components/ui/input` | Barre de recherche |
| `Button` | `@/components/ui/button` | Bouton "Ajouter" |
| `Badge` | `@/components/ui/badge` | Badge de rôle (Élève, Professeur, Admin) |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions (...) |

---

## 📊 Structure du Tableau

### Colonnes

| Colonne | Type | Description | Tri |
|---------|------|-------------|-----|
| **Nom** | Texte | Nom complet (NOM Prénom) | ✅ Alphabétique |
| **Email** | Email | Adresse email | ✅ Alphabétique |
| **Rôle** | Badge | STUDENT (vert), TEACHER (bleu), ADMIN (violet) | ✅ Par rôle |
| **Classes/Matières** | Texte | Liste des classes (élèves) ou matières (profs) | ❌ |
| **Actions** | Menu | Menu déroulant (...) | ❌ |

### Actions disponibles (menu ...)

```
┌─────────────────────────┐
│ ✏️  Éditer              │
│ 🗑️  Supprimer           │
│ 🔄 Réinitialiser MDP    │
│ 📧 Renvoyer email       │
└─────────────────────────┘
```

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/admin/users` | Liste tous les utilisateurs | `?page=1&limit=20&search=...&role=...` |
| `DELETE` | `/api/admin/users/:id` | Supprimer un utilisateur | - |
| `POST` | `/api/admin/users/:id/reset-password` | Réinitialiser le mot de passe | - |
| `POST` | `/api/admin/users/:id/resend-email` | Renvoyer l'email d'activation | - |

---

## 💾 Types & Interfaces

```typescript
interface User {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  role: 'STUDENT' | 'TEACHER' | 'ADMIN';
  classes?: string[];      // Pour les élèves
  subjects?: string[];     // Pour les professeurs
  createdAt: Date;
  lastLogin?: Date;
}

interface UsersListResponse {
  success: boolean;
  data?: {
    users: User[];
    total: number;
    page: number;
    totalPages: number;
  };
  error?: string;
}
```

---

## 🔍 Fonctionnalités

### Barre de Recherche
- Recherche en temps réel (debounce 300ms)
- Filtre sur : Nom, Email, Classes, Matières
- Icône 🔍

### Filtres
| Filtre | Options |
|--------|---------|
| **Rôle** | Tous, Élève, Professeur, Admin |
| **Classe** | Liste déroulante des classes |
| **Matière** | Liste déroulante des matières |

### Tri
- Clic sur les en-têtes de colonne
- Indicateurs ▲ (ascendant) ▼ (descendant)
- Par défaut : Nom A→Z

### Pagination
- 20 utilisateurs par page
- Navigation : [← Précédent] Page X/Y [Suivant →]
- Affichage total : "41 utilisateurs"

---

## 🎯 Actions Utilisateur

### Bouton "Ajouter"
- Redirige vers [create.md](create.md)
- Ouvre le formulaire de création

### Menu Actions (...)

| Action | Comportement |
|--------|--------------|
| **Éditer** | Redirige vers [edit.md](edit.md?id=...) |
| **Supprimer** | Modale de confirmation → suppression définitive |
| **Réinitialiser MDP** | Génère un nouveau MDP temporaire + email |
| **Renvoyer email** | Renvoie l'email d'activation |

---

## ⚠️ Confirmations & Alertes

### Suppression d'un utilisateur
```
┌──────────────────────────────────────────┐
│  ⚠️ Supprimer cet utilisateur ?          │
│                                          │
│  Nom : Baptiste CURTY                    │
│  Email : baptiste.curty@blaizbot.edu     │
│                                          │
│  Cette action est irréversible.          │
│  Toutes les données associées seront    │
│  perdues (devoirs, notes, etc.).         │
│                                          │
│       [Annuler]    [Supprimer]           │
│                    (rouge)               │
└──────────────────────────────────────────┘
```

### Réinitialisation MDP
```
Toast : "Mot de passe réinitialisé. Email envoyé à baptiste.curty@blaizbot.edu"
```

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| + Ajouter | [create.md](create.md) |
| Éditer (menu ...) | [edit.md](edit.md) |
| ← Sidebar Dashboard | [00-dashboard.md](../00-dashboard.md) |
| Sidebar Classes | [../classes/liste.md](../classes/liste.md) |
| Sidebar Matières | [../subjects/liste.md](../subjects/liste.md) |

---

## 📝 Notes

> **Gestion des rôles** :
> - **STUDENT** : Badge vert, affiche les classes (ex: "1A", "11H-A")
> - **TEACHER** : Badge bleu, affiche les matières enseignées
> - **ADMIN** : Badge violet, pas de classes/matières

> **Protection** : 
> - Impossible de supprimer son propre compte
> - Confirmation obligatoire avant suppression
> - Logs d'audit pour toutes les actions

> **Performance** :
> - Pagination server-side (20 par page)
> - Recherche debounced (300ms)
> - Cache des résultats

---

**Navigation** :
- ← [Dashboard Admin](../00-dashboard.md)
- → [Créer un utilisateur](create.md)
- → [Éditer un utilisateur](edit.md)

*Date : 13 décembre 2025*

