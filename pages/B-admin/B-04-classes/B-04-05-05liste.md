    # Liste des Classes

> **Chemin de navigation** : Login → Dashboard Admin → Sidebar → **Classes**  
> **Route** : `/admin/classes`  
> **Rôle** : ADMIN  
> **Composant source** : `src/app/(dashboard)/admin/classes/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Sidebar Navigation
   ├── Dashboard
   ├── Utilisateurs
   ├── Classes ← VOUS ÊTES ICI
   └── Matières
```

---

## 📸 Aperçu Visuel - Liste des Classes

```
┌──────────────────────────────────────────────────────────────────┐
│ Dashboard                                    🔍 Rechercher...     │
│                                                                   │
│ Gestion des classes                                  [+ Ajouter] │
│ 8 classes                                                         │
├──────────────────────────────────────────────────────────────────┤
│                                                                   │
│ ┌────────────────────────────────────────────────────────────┐  │
│ │ Nom de la classe              Élèves              Actions  │  │
│ ├────────────────────────────────────────────────────────────┤  │
│ │ 10H-A                         👥 6                ...      │  │
│ │ 10H-B                         👥 6                ...      │  │
│ │ 11H-A                         👥 3                ...      │  │
│ │ 11H-B                         👥 0                ...      │  │
│ │ 1A                            👥 6                ...      │  │
│ │ 23                            👥 0                ...      │  │
│ │ 9H-A                          👥 3                ...      │  │
│ │ 9H-B                          👥 6                ...      │  │
│ └────────────────────────────────────────────────────────────┘  │
│                                                                   │
└──────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DataTable` | `@/components/ui/data-table` | Tableau avec tri |
| `Input` | `@/components/ui/input` | Barre de recherche |
| `Button` | `@/components/ui/button` | Bouton "Ajouter" |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions (...) |
| `Badge` | `@/components/ui/badge` | Badge avec nombre d'élèves |

---

## 📊 Structure du Tableau

### Colonnes

| Colonne | Type | Description | Tri |
|---------|------|-------------|-----|
| **Nom de la classe** | Texte | Code de la classe (ex: 10H-A, 1A, 23) | ✅ Alphabétique |
| **Élèves** | Badge | Nombre d'élèves inscrits avec icône 👥 | ✅ Numérique |
| **Actions** | Menu | Menu déroulant (...) | ❌ |

### Actions disponibles (menu ...)

```
┌─────────────────────────┐
│ 👁️  Voir détails        │
│ ✏️  Éditer              │
│ 🗑️  Supprimer           │
│ 👥 Gérer les élèves     │
└─────────────────────────┘
```

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/admin/classes` | Liste toutes les classes | `?search=...` |
| `POST` | `/api/admin/classes` | Créer une classe | `{ name, description }` |
| `GET` | `/api/admin/classes/:id` | Détails d'une classe | - |
| `PATCH` | `/api/admin/classes/:id` | Modifier une classe | `{ name, description }` |
| `DELETE` | `/api/admin/classes/:id` | Supprimer une classe | - |
| `GET` | `/api/admin/classes/:id/students` | Liste des élèves de la classe | - |

---

## 💾 Types & Interfaces

```typescript
interface Class {
  id: string;
  name: string;              // Ex: "10H-A", "1A"
  description?: string;      // Description optionnelle
  studentCount: number;      // Nombre d'élèves
  students?: Student[];      // Liste des élèves (si détails)
  createdAt: Date;
  updatedAt: Date;
}

interface ClassesListResponse {
  success: boolean;
  data?: {
    classes: Class[];
    total: number;
  };
  error?: string;
}
```

---

## 🔍 Fonctionnalités

### Barre de Recherche
- Recherche en temps réel (debounce 300ms)
- Filtre sur : Nom de la classe
- Icône 🔍

### Tri
- Clic sur les en-têtes de colonne
- Par défaut : Nom A→Z
- Tri par nombre d'élèves : décroissant (classes pleines en premier)

### Affichage du compteur
- Total : "8 classes"
- Mise à jour en temps réel

---

## 🎯 Actions Utilisateur

### Bouton "Ajouter"
- Ouvre une modale de création
- Champs : Nom de la classe, Description (optionnel)

### Menu Actions (...)

| Action | Comportement |
|--------|--------------|
| **Voir détails** | Affiche modale avec liste des élèves, horaires, matières |
| **Éditer** | Modale d'édition (nom, description) |
| **Supprimer** | Modale de confirmation → suppression |
| **Gérer les élèves** | Affiche interface d'ajout/retrait d'élèves |

---

## ⚠️ Confirmations & Alertes

### Suppression d'une classe

```
┌──────────────────────────────────────────┐
│  ⚠️ Supprimer cette classe ?             │
│                                          │
│  Nom : 11H-B                             │
│  Élèves inscrits : 0                     │
│                                          │
│  Cette action est irréversible.          │
│                                          │
│       [Annuler]    [Supprimer]           │
│                    (rouge)               │
└──────────────────────────────────────────┘
```

### Si classe contient des élèves

```
┌──────────────────────────────────────────┐
│  ⚠️ Impossible de supprimer              │
│                                          │
│  La classe "10H-A" contient 6 élèves.    │
│                                          │
│  Veuillez d'abord réaffecter ou          │
│  supprimer les élèves.                   │
│                                          │
│                 [OK]                     │
└──────────────────────────────────────────┘
```

---

## � Navigation

| Action | Destination |
|--------|-------------|
| + Ajouter | [create.md](create.md) |
| Éditer (menu ...) | [edit.md](edit.md) |
| ← Sidebar Dashboard | [00-dashboard.md](../00-dashboard.md) |
| Sidebar Utilisateurs | [../users/liste.md](../users/liste.md) |
| Sidebar Matières | [../subjects/liste.md](../subjects/liste.md) |

---

## 📝 Notes

> **Nommage des classes** :
> - Format libre (ex: "10H-A", "1A", "23")
> - Pas de format imposé pour permettre différents systèmes scolaires
> - Unicité obligatoire

> **Protection** :
> - Impossible de supprimer une classe contenant des élèves
> - Réaffectation nécessaire avant suppression
> - Logs d'audit pour toutes les actions

> **Performance** :
> - Liste complète chargée (pas de pagination car peu de classes)
> - Compteur d'élèves mis à jour en temps réel
> - Cache des résultats

---

**Navigation** :
- ← [Dashboard Admin](../00-dashboard.md)
- → [Créer une classe](create.md)
- → [Éditer une classe](edit.md)

*Date : 13 décembre 2025*

