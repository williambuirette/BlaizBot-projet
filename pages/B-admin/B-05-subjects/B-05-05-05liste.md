# Liste des Matières

> **Chemin de navigation** : Login → Dashboard Admin → Sidebar → **Matières**  
> **Route** : `/admin/subjects`  
> **Rôle** : ADMIN  
> **Composant source** : `src/app/(dashboard)/admin/subjects/page.tsx`

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
   ├── Classes
   └── Matières ← VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Liste des Matières

```
┌──────────────────────────────────────────────────────────────────────┐
│ Dashboard                                    🔍 Rechercher...         │
│                                                                       │
│ Gestion des matières                                     [+ Ajouter] │
│ 7 matières                                                            │
├──────────────────────────────────────────────────────────────────────┤
│                                                                       │
│ ┌────────────────────────────────────────────────────────────────┐  │
│ │ Matière                   Cours    Professeurs       Actions   │  │
│ ├────────────────────────────────────────────────────────────────┤  │
│ │ 🔴 Anglais                📚 0     👥 1              ...       │  │
│ │ 🔴 Français               📚 0     👥 1              ...       │  │
│ │ ⚫ Histoire-Géographie    📚 0     👥 1              ...       │  │
│ │ 🔵 Mathématiques          📚 0     👥 1              ...       │  │
│ │ ⚫ Physique-Chimie        📚 0     👥 0              ...       │  │
│ │ 🟢 SVT                    📚 1     👥 1              ...       │  │
│ │ ⚫ math                   📚 0     👥 0              ...       │  │
│ └────────────────────────────────────────────────────────────────┘  │
│                                                                       │
└──────────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DataTable` | `@/components/ui/data-table` | Tableau avec tri |
| `Input` | `@/components/ui/input` | Barre de recherche |
| `Button` | `@/components/ui/button` | Bouton "Ajouter" |
| `Badge` | `@/components/ui/badge` | Indicateur de couleur |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions (...) |

---

## 📊 Structure du Tableau

### Colonnes

| Colonne | Type | Description | Tri |
|---------|------|-------------|-----|
| **Matière** | Texte + Couleur | Nom de la matière avec pastille de couleur | ✅ Alphabétique |
| **Cours** | Badge | Nombre de cours créés avec icône 📚 | ✅ Numérique |
| **Professeurs** | Badge | Nombre de professeurs assignés avec icône 👥 | ✅ Numérique |
| **Actions** | Menu | Menu déroulant (...) | ❌ |

### Couleurs des matières

| Couleur | Exemples | Code hex |
|---------|----------|----------|
| 🔴 Rose/Rouge | Anglais, Français | #FF1744, #E91E63 |
| 🔵 Bleu | Mathématiques | #2196F3 |
| 🟢 Vert | SVT, Biologie | #4CAF50 |
| ⚫ Gris | Histoire-Géographie, Physique-Chimie, math | #9E9E9E |
| 🟡 Jaune | - | #FFC107 |
| 🟣 Violet | - | #9C27B0 |

> Les couleurs sont assignées lors de la création et peuvent être modifiées

### Actions disponibles (menu ...)

```
┌─────────────────────────┐
│ 👁️  Voir détails        │
│ ✏️  Éditer              │
│ 🗑️  Supprimer           │
│ 👥 Gérer les profs      │
└─────────────────────────┘
```

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/admin/subjects` | Liste toutes les matières | `?search=...` |
| `POST` | `/api/admin/subjects` | Créer une matière | `{ name, color, description }` |
| `GET` | `/api/admin/subjects/:id` | Détails d'une matière | - |
| `PATCH` | `/api/admin/subjects/:id` | Modifier une matière | `{ name, color, description }` |
| `DELETE` | `/api/admin/subjects/:id` | Supprimer une matière | - |
| `GET` | `/api/admin/subjects/:id/teachers` | Liste des professeurs de la matière | - |

---

## 💾 Types & Interfaces

```typescript
interface Subject {
  id: string;
  name: string;              // Ex: "Mathématiques", "Français"
  color: string;             // Code hex: "#2196F3"
  description?: string;      // Description optionnelle
  courseCount: number;       // Nombre de cours
  teacherCount: number;      // Nombre de professeurs
  teachers?: Teacher[];      // Liste des professeurs (si détails)
  createdAt: Date;
  updatedAt: Date;
}

interface SubjectsListResponse {
  success: boolean;
  data?: {
    subjects: Subject[];
    total: number;
  };
  error?: string;
}
```

---

## 🔍 Fonctionnalités

### Barre de Recherche
- Recherche en temps réel (debounce 300ms)
- Filtre sur : Nom de la matière
- Icône 🔍

### Tri
- Clic sur les en-têtes de colonne
- Par défaut : Nom A→Z
- Tri par nombre de cours/professeurs : décroissant

### Affichage du compteur
- Total : "7 matières"
- Mise à jour en temps réel

---

## 🎯 Actions Utilisateur

### Bouton "Ajouter"
- Ouvre une modale de création
- Champs : Nom, Couleur (picker), Description (optionnel)

### Menu Actions (...)

| Action | Comportement |
|--------|--------------|
| **Voir détails** | Affiche modale avec liste des cours, professeurs, statistiques |
| **Éditer** | Modale d'édition (nom, couleur, description) |
| **Supprimer** | Modale de confirmation → suppression |
| **Gérer les profs** | Interface d'ajout/retrait de professeurs |

---

## ⚠️ Confirmations & Alertes

### Suppression d'une matière

```
┌──────────────────────────────────────────┐
│  ⚠️ Supprimer cette matière ?            │
│                                          │
│  Nom : Physique-Chimie                   │
│  Cours : 0                               │
│  Professeurs : 0                         │
│                                          │
│  Cette action est irréversible.          │
│                                          │
│       [Annuler]    [Supprimer]           │
│                    (rouge)               │
└──────────────────────────────────────────┘
```

### Si matière contient des cours

```
┌──────────────────────────────────────────┐
│  ⚠️ Impossible de supprimer              │
│                                          │
│  La matière "SVT" contient 1 cours.      │
│                                          │
│  Veuillez d'abord supprimer les cours    │
│  associés.                               │
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
| Sidebar Classes | [../classes/liste.md](../classes/liste.md) |

---

## 📝 Notes

> **Couleurs des matières** :
> - Utilisées pour différencier visuellement les matières
> - Apparaissent dans le calendrier, les cours, les devoirs
> - Palette prédéfinie mais personnalisable

> **Nommage** :
> - Format libre (ex: "Mathématiques", "SVT", "Histoire-Géographie")
> - Unicité obligatoire
> - Attention : "math" et "Mathématiques" sont deux matières différentes

> **Protection** :
> - Impossible de supprimer une matière contenant des cours
> - Suppression des cours nécessaire avant suppression de la matière
> - Logs d'audit pour toutes les actions

> **Performance** :
> - Liste complète chargée (pas de pagination car peu de matières)
> - Compteurs mis à jour en temps réel
> - Cache des résultats

---

**Navigation** :
- ← [Dashboard Admin](../00-dashboard.md)
- → [Créer une matière](create.md)
- → [Éditer une matière](edit.md)

*Date : 13 décembre 2025*

