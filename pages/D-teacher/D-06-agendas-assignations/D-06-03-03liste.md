# Agendas et Assignations

> **Chemin de navigation** : Login → Dashboard Teacher → Sidebar → **Agendas et Assignations**  
> **Route** : `/teacher/agendas-assignations`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/agendas-assignations/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Agendas et Assignations
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Agendas et Assignations

### Onglet : Vue Calendrier

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  Agendas et Assignations      📅 Calendrier  📋 Liste  🔄      │
│            │  Gérez vos assignations de cours et exercices  + Nouvelle      │
│ 🏫 Mes     │                                                  assignation   │
│   classes  │  🔽 Filtres                                                     │
│            │  ┌────────────────────────────────────────────────────────────┐│
│ 👥 Mes     │  │ Matières ▼  Cours ▼  Classes ▼  Priorité ▼  📅 Période ▼ ││
│   élèves   │  └────────────────────────────────────────────────────────────┘│
│            │                                                                 │
│ 📚 Mes     │  Vue Calendrier                          4 assignations        │
│   cours    │  Jan à Avr   12-01                                              │
│            │                                                                 │
│ 📅 Agendas │  Précédent        Janvier 2026         Suivant                 │
│   et       │                                                                 │
│   Assigna. │  Mois   Semaine   Jour   Agenda                                │
│   (actif)  │  ────                                                           │
│            │  ┌────────┬────────┬────────┬────────┬────────┬────────┬─────┐│
│ 💬 Messag. │  │  Lun.  │  Mar.  │  Mer.  │  Jeu.  │  Ven.  │  Sam.  │ Dim ││
│            │  ├────────┼────────┼────────┼────────┼────────┼────────┼─────┤│
│            │  │   29   │   30   │   31   │   01   │   02   │   03   │  04 ││
│            │  ├────────┼────────┼────────┼────────┼────────┼────────┼─────┤│
│            │  │   05   │   06   │   07   │   08   │   09   │   10   │  11 ││
│            │  ├────────┼────────┼────────┼────────┼────────┼────────┼─────┤│
│            │  │   12   │   13   │   14   │   15   │   16   │   17   │  18 ││
│            │  ├────────┼────────┼────────┼────────┼────────┼────────┼─────┤│
│            │  │   19   │   20   │   21   │   22   │   23   │   24   │  25 ││
│            │  │        │        │        │  🔵 La │  🔵 La │        │     ││
│            │  │        │        │        │  photo.│  photo.│        │     ││
│            │  │        │        │        │  🔵 La │  🔵 La │        │     ││
│            │  │        │        │        │  photo.│        │        │     ││
│            │  │        │        │        │  🔵 La │        │        │     ││
│            │  │        │        │        │  photo.│        │        │     ││
│            │  ├────────┼────────┼────────┼────────┼────────┼────────┼─────┤│
│            │  │   26   │   27   │   28   │   29   │   30   │   31   │  01 ││
│            │  │        │        │        │        │  🔵 La │        │     ││
│            │  │        │        │        │        │  photo.│        │     ││
│            │  └────────┴────────┴────────┴────────┴────────┴────────┴─────┘│
│            │                                                                 │
└────────────┴─────────────────────────────────────────────────────────────────┘
```

### Onglet : Vue Liste

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │  Agendas et Assignations      📅 Calendrier  📋 Liste  🔄      │
│            │  Gérez vos assignations de cours et exercices  + Nouvelle      │
│            │                                                  assignation   │
│            │  🔽 Filtres                                                     │
│            │  ┌────────────────────────────────────────────────────────────┐│
│            │  │ Matières ▼  Cours ▼  Classes ▼  Priorité ▼  📅 Période ▼ ││
│            │  └────────────────────────────────────────────────────────────┘│
│            │                                                                 │
│            │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌────────┐│
│            │  │ ☑ 4          │ │ ⚠ 0          │ │ 🕐 0         │ │ 📅 4   ││
│            │  │ Total        │ │ En retard    │ │ Aujourd'hui  │ │ À venir││
│            │  └──────────────┘ └──────────────┘ └──────────────┘ └────────┘│
│            │                                                                 │
│            │  📅 vendredi 23 janvier                        3 assignations  │
│            │                                                                 │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ 📚  La photosynthèse                       ⏰ 23 janv.    │ │
│            │  │     📄 La photosynthèse  [S.T.N]            🟠 Moyenne    │ │
│            │  │     👤 Emma DURAND                                     ... │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ 📚  La photosynthèse                       ⏰ 23 janv.    │ │
│            │  │     📄 La photosynthèse  [S.T.N]            🟠 Moyenne    │ │
│            │  │     👤 Baptiste CURRY                                  ... │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ 📚  La photosynthèse                       ⏰ 23 janv.    │ │
│            │  │     📄 La photosynthèse  [S.T.N]            🟠 Moyenne    │ │
│            │  │     👤 Lucas MARTIN                                    ... │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │                                                                 │
│            │  📅 samedi 31 janvier                          1 assignation   │
│            │                                                                 │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ 📚  La photosynthèse                       ⏰ 31 janv.    │ │
│            │  │     📄 La photosynthèse  [S.T.N]            🟢 Basse      │ │
│            │  │     👤 Lucas MARTIN                                    ... │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │                                                                 │
└────────────┴─────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DashboardShell` | `@/components/layout/DashboardShell` | Layout avec sidebar |
| `Header` | `@/components/layout/Header` | Barre supérieure |
| `Sidebar` | `@/components/layout/Sidebar` | Navigation professeur |
| `Button` | `@/components/ui/button` | Boutons Nouvelle assignation, Actualiser |
| `Tabs` | `@/components/ui/tabs` | Onglets (Calendrier, Liste) |
| `Calendar` | `@/components/ui/calendar` | Grille calendrier mensuelle |
| `Select` | `@/components/ui/select` | Filtres (Matières, Cours, Classes, Priorité) |
| `DateRangePicker` | `@/components/ui/date-range-picker` | Filtre Période |
| `Card` | `@/components/ui/card` | Cartes stats et assignations |
| `Badge` | `@/components/ui/badge` | Badges priorité, matière |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions (•••) |
| `Collapsible` | `@/components/ui/collapsible` | Section filtres repliable |

---

## 📊 Structure de la Page

### En-tête

| Élément | Description |
|---------|-------------|
| **Titre** | "Agendas et Assignations" |
| **Sous-titre** | "Gérez vos assignations de cours et exercices" |
| **Onglets** | 📅 Calendrier / 📋 Liste |
| **Bouton 🔄** | Actualiser les données |
| **Bouton + Nouvelle assignation** | Ouvre modal de création |

### Filtres Communs (Repliables)

| Filtre | Type | Options |
|--------|------|---------|
| **Matières** | Multi-select | Liste des matières du professeur |
| **Cours** | Multi-select | Liste des cours (dépend des matières) |
| **Classes** | Multi-select | Liste des classes du professeur |
| **Priorité** | Single-select | Toutes / Haute / Moyenne / Basse |
| **Période** | Date range | Sélecteur de plage de dates |

**Comportement** :
- Section repliable (🔽 Filtres)
- Filtres cumulatifs (ET logique)
- Persist lors du changement d'onglet
- Bouton "Réinitialiser" si filtres actifs

---

## 📅 Onglet 1 : Vue Calendrier

### En-tête Vue Calendrier

| Élément | Description |
|---------|-------------|
| **Titre** | "Vue Calendrier" |
| **Compteur** | "X assignations" (selon filtres) |
| **Quick filters** | "Jan à Avr" • "12-01" (raccourcis période) |

### Navigation Calendrier

| Élément | Description |
|---------|-------------|
| **←  Suivant** | Navigation mois précédent/suivant |
| **Mois/Année** | "Janvier 2026" (centre) |
| **Modes vue** | Mois (actif) / Semaine / Jour / Agenda |

### Grille Calendrier (Mode Mois)

**Structure** :
- En-tête : Lun. → Dim.
- Cellules : Numéro jour + barres assignations
- Jours hors mois : Grisés

**Assignations** :
- Barres bleues (🔵)
- Texte tronqué ("La photo...")
- Max 3 visibles par jour
- Si > 3 : "+ X autres"

---

## 📋 Onglet 2 : Vue Liste

### Cartes Statistiques (4 cartes)

| Carte | Icône | Valeur |
|-------|-------|--------|
| **Total** | ☑ (bleu) | Nombre total d'assignations |
| **En retard** | ⚠ (rouge) | Assignations passées non faites |
| **Aujourd'hui** | 🕐 (orange) | Assignations du jour |
| **À venir** | 📅 (vert) | Assignations futures |

### Liste Groupée par Date

**Header groupe** :
- 📅 Date formatée (ex: "vendredi 23 janvier")
- Compteur (ex: "3 assignations")

**Carte assignation** :

| Section | Contenu |
|---------|---------|
| **Icône type** | 📚 Lesson / ▶️ Video / ✏️ Exercise / ❓ Quiz |
| **Titre** | Titre assignation |
| **Ligne 2** | 📄 Nom cours + Badge matière |
| **Ligne 3** | 👤 Nom élève(s) |
| **Droite haut** | ⏰ Date échéance |
| **Droite milieu** | Badge priorité (🔴/🟠/🟢) |
| **Droite bas** | Menu ••• (actions) |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/teacher/assignments` | Liste assignations | `?subject=...&class=...&period=...` |
| `GET` | `/api/teacher/assignments/stats` | Statistiques globales | - |
| `POST` | `/api/teacher/assignments` | Créer assignation | Body: AssignmentData |
| `PUT` | `/api/teacher/assignments/[id]` | Modifier assignation | Body: Partial<AssignmentData> |
| `DELETE` | `/api/teacher/assignments/[id]` | Supprimer assignation | - |

---

## 💾 Types & Interfaces

```typescript
interface Assignment {
  id: string;
  title: string;
  type: "LESSON" | "VIDEO" | "EXERCISE" | "QUIZ";
  course: {
    id: string;
    name: string;
    subject: {
      id: string;
      name: string;
      color: string;
    };
  };
  classes: {
    id: string;
    code: string;
    studentCount: number;
  }[];
  dueDate: Date;
  priority: "HIGH" | "MEDIUM" | "LOW";
  description?: string;
  attachments?: string[];
  stats?: {
    submitted: number;
    total: number;
    averageScore?: number;
    averageTime?: number;
  };
}

interface AssignmentStats {
  total: number;
  overdue: number;
  today: number;
  upcoming: number;
}

interface AssignmentFilters {
  subjects?: string[];
  courses?: string[];
  classes?: string[];
  priority?: "HIGH" | "MEDIUM" | "LOW";
  period?: {
    start: Date;
    end: Date;
  };
}
```

---

## 🎯 Comportements

### Filtres
- **Recherche** : Filtrage temps réel (debounce 300ms)
- **Multi-select** : Cases à cocher multiples
- **Date range** : Sélection période personnalisée
- **Réinitialiser** : Efface tous les filtres

### Vue Calendrier
- **Navigation** : Flèches ou clavier (← →)
- **Modes** : Mois (par défaut) / Semaine / Jour / Agenda
- **Clic barre** : Ouvre modal détail
- **Quick filters** : Raccourcis période ("Jan à Avr")

### Vue Liste
- **Groupement** : Par date (ordre chronologique)
- **Clic carte** : Ouvre modal détail
- **Menu •••** : Modifier / Dupliquer / Supprimer
- **Scroll** : Infinite scroll si > 50 items

### Modales
- **Nouvelle assignation** : Formulaire création
- **Détail** : Vue complète + stats + actions
- **Validation** : Champs obligatoires marqués *
- **Fermeture** : ESC ou bouton ✖

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| ← Sidebar Dashboard | [../dashboard.md](../dashboard.md) |
| Sidebar Mes classes | [../classes/liste.md](../classes/liste.md) |
| Sidebar Mes élèves | [../students/liste.md](../students/liste.md) |
| Sidebar Mes cours | [../courses/liste.md](../courses/liste.md) |

---

## 📝 Notes

> **Exemple de données** :
> - 4 assignations totales
> - Cours : "La photosynthèse" (Biologie)
> - Élèves : Emma DURAND, Baptiste CURRY, Lucas MARTIN
> - Dates : 22, 23, 30, 31 janvier 2026
> - Priorités : Moyenne (3) + Basse (1)

> **États** :
> - Si aucune assignation : Message vide
> - Si filtres sans résultat : "Aucune assignation trouvée"
> - Loading : Skeleton loaders

> **Performance** :
> - Cache 5 minutes pour statistiques
> - Pagination côté serveur (20 items/page)
> - Optimistic updates pour actions

> **Responsive** :
> - Mobile : Vue liste uniquement
> - Tablet : Calendrier mode semaine
> - Desktop : Tous les modes disponibles

---

**Navigation** :
- ← [Dashboard Teacher](../dashboard.md)
- Sidebar → [Mes classes](../classes/liste.md)

*Date : 16 janvier 2026*
