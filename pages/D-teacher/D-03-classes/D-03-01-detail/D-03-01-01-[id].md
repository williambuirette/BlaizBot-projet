# Détail Classe - 11H-A

> **Chemin de navigation** : Login → Dashboard Teacher → Mes classes → **11H-A**  
> **Route** : `/teacher/classes/class-11h-a` (dynamique : `/teacher/classes/[id]`)  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/classes/[id]/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes classes
   └── teacher/classes/liste.md

4. Clic sur carte "11H-A" ou bouton "Voir la classe"
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Détail Classe 11H-A

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  ← 11H-A                                                        │
│            │     Classe : 11H-A                                              │
│ 🏫 Mes     │                                                                 │
│   classes  │  ℹ️ Assignes un cours ou un chapitre à cette classe pour        │
│            │    activer l'analyse IA (Cockpit Pédagogique).                 │
│ 👥 Mes     │                                                                 │
│   élèves   │  📊 Vue d'ensemble                                              │
│            │  ┌──────────┐ ┌──────────┐ ┌────────────────────────────────┐  │
│ 📚 Mes     │  │ 👥 3     │ │ ● Active │ │ Score IA Moyen                 │  │
│   cours    │  │ Élèves   │ │ Statut   │ │ ─────────                      │  │
│            │  └──────────┘ └──────────┘ │ 0 élève(s) évalué(s)           │  │
│ 📅 Agendas │                             └────────────────────────────────┘  │
│   et       │                                                                 │
│   Assigna. │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ 🤖                                                        │ │
│ 💬 Messag. │  │                                                           │ │
│            │  │    Aucune activité IA enregistrée pour cette classe       │ │
│            │  │                                                           │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │                                                                 │
│            │  Liste des élèves (3)                                           │
│            │                                                                 │
│            │  🔍 Rechercher un élève par nom ou email...                     │
│            │                                                                 │
│            │  ┌─────────────────────────────────────────────────────────┐   │
│            │  │ ☐  Nom              Score IA    Sessions IA    Actions  │   │
│            │  ├─────────────────────────────────────────────────────────┤   │
│            │  │ ☐  Julien DUBOIS      N/A           0            ...    │   │
│            │  │    julien.dubois@                                       │   │
│            │  │    blaizbot.edu                                         │   │
│            │  ├─────────────────────────────────────────────────────────┤   │
│            │  │ ☐  Louis MERCIER      N/A           0            ...    │   │
│            │  │    louis.mercier@                                       │   │
│            │  │    blaizbot.edu                                         │   │
│            │  ├─────────────────────────────────────────────────────────┤   │
│            │  │ ☐  Louise VAUCHER     N/A           0            ...    │   │
│            │  │    louise.vaucher@                                      │   │
│            │  │    blaizbot.edu                                         │   │
│            │  └─────────────────────────────────────────────────────────┘   │
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
| `Button` | `@/components/ui/button` | Bouton retour |
| `Card` | `@/components/ui/card` | Cartes vue d'ensemble |
| `Badge` | `@/components/ui/badge` | Badge "Active" |
| `Alert` | `@/components/ui/alert` | Info cockpit IA |
| `Progress` | `@/components/ui/progress` | Barre Score IA |
| `Input` | `@/components/ui/input` | Recherche élève |
| `Table` | `@/components/ui/table` | Liste élèves |
| `Checkbox` | `@/components/ui/checkbox` | Sélection élèves |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions |

---

## 📊 Structure de la Page

### En-tête
- Bouton **←** : Retour à la liste
- Titre : Code de la classe (ex: "11H-A")
- Sous-titre : "Classe : 11H-A"

### Bannière Info (Conditionnelle)

| Condition | Affichage |
|-----------|-----------|
| Aucun cours/chapitre assigné | ℹ️ "Assignes un cours ou un chapitre à cette classe pour activer l'analyse IA (Cockpit Pédagogique)." |
| Cours assignés | Bannière masquée |

### Vue d'ensemble (3 cartes)

| Carte | Contenu | Description |
|-------|---------|-------------|
| **Élèves** | 👥 Nombre | Total d'élèves dans la classe |
| **Statut** | Badge noir "Active" | État de la classe (Active/Archivée) |
| **Score IA Moyen** | Barre violette + texte | Score IA global + "X élève(s) évalué(s)" |

### Zone Activité IA (Conditionnelle)

| État | Affichage |
|------|-----------|
| Aucune activité | 🤖 "Aucune activité IA enregistrée pour cette classe" (zone vide) |
| Activité détectée | **Bouton "Cockpit Pédagogique"** (lien vers analyse IA) |

> **Note** : Le bouton "Cockpit Pédagogique" apparaît uniquement quand :
> - Un cours/chapitre est assigné
> - ET au moins 1 élève a interagi avec l'IA

### Liste des Élèves

| Élément | Description |
|---------|-------------|
| **Titre** | "Liste des élèves (X)" |
| **Recherche** | Input texte (nom ou email) |
| **Tableau** | Colonnes : ☐ Nom, Score IA, Sessions IA, Actions |

#### Colonnes du Tableau

| Colonne | Contenu |
|---------|---------|
| **Checkbox** | Sélection multiple |
| **Nom** | Prénom NOM + email en dessous |
| **Score IA** | Score moyen (0-100) ou "N/A" |
| **Sessions IA** | Nombre total de sessions ou 0 |
| **Actions** | Menu ••• (Voir profil, Modifier, Retirer de la classe) |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/teacher/classes/[id]` | Détails de la classe | - |
| `GET` | `/api/teacher/classes/[id]/students` | Liste élèves | `?search=...` |
| `GET` | `/api/teacher/classes/[id]/ai-stats` | Statistiques IA | - |
| `DELETE` | `/api/teacher/classes/[id]/students/[studentId]` | Retirer élève | - |

---

## 💾 Types & Interfaces

```typescript
interface ClassDetail {
  id: string;
  code: string;              // "11H-A"
  status: "ACTIVE" | "ARCHIVED";
  studentCount: number;
  averageAiScore?: number;   // 0-100 ou null
  evaluatedStudents: number; // Nombre d'élèves avec score IA
  hasAssignedContent: boolean; // Cours/chapitre assigné ?
  hasAiActivity: boolean;     // Activité IA enregistrée ?
}

interface ClassStudent {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  aiScore?: number;          // 0-100 ou null
  aiSessionCount: number;    // Nombre de sessions IA
}

interface ClassAiStats {
  totalSessions: number;
  averageScore: number;
  evaluatedCount: number;
  lastActivityDate?: Date;
}
```

---

## 🎯 Comportements

### Bannière Info IA
- Visible si `hasAssignedContent === false`
- Lien cliquable vers la page d'assignation (à documenter)
- Auto-masquée quand un cours est assigné

### Zone Activité IA
- **État 1 (vide)** : "Aucune activité IA enregistrée"
- **État 2 (avec activité)** : Bouton "Cockpit Pédagogique" apparaît
- Clic sur bouton → Navigation vers analyse IA détaillée

### Liste des Élèves
- **Recherche** : Filtre en temps réel (debounce 300ms)
- **Tri** : Clic sur en-têtes de colonnes
- **Sélection** : Cases à cocher pour actions groupées
- **Hover** : Effet de survol sur lignes

### Menu Actions (•••)

| Action | Comportement |
|--------|--------------|
| **Voir profil** | Navigation vers profil élève |
| **Modifier** | Ouvre modale d'édition (à documenter) |
| **Retirer de la classe** | Dialogue de confirmation + suppression |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton **←** | [../liste.md](../liste.md) |
| Clic sur élève (ligne) | Profil élève (à documenter) |
| "Voir profil" (menu) | Profil élève (à documenter) |
| "Cockpit Pédagogique" | Analyse IA (à documenter) |
| ← Sidebar Mes classes | [../liste.md](../liste.md) |

---

## 📝 Notes

> **Exemple de données (11H-A)** :
> - Classe : 11H-A
> - Statut : Active
> - Élèves : 3 (Julien DUBOIS, Louis MERCIER, Louise VAUCHER)
> - Score IA : N/A (aucune activité)
> - Sessions IA : 0 pour tous

> **Conditions d'activation du Cockpit IA** :
> 1. Au moins 1 cours ou chapitre assigné à la classe
> 2. Au moins 1 élève a interagi avec l'IA (session > 0)
> → Le bouton "Cockpit Pédagogique" apparaît dans la zone activité

> **États possibles** :
> - **Aucun contenu** : Bannière info visible + Zone IA vide
> - **Contenu assigné, pas d'activité** : Bannière masquée + Zone IA vide
> - **Activité IA détectée** : Bannière masquée + Bouton Cockpit visible

> **Performance** :
> - Cache des statistiques (5 minutes)
> - Pagination côté serveur si > 50 élèves
> - Skeleton loaders pendant le chargement

---

**Navigation** :
- ← [Liste des classes](../liste.md)
- → [Profil élève](../../students/detail/[id].md) *(à documenter)*
- → [Cockpit Pédagogique IA](ai-cockpit.md) *(à documenter)*

*Date : 13 décembre 2025*
