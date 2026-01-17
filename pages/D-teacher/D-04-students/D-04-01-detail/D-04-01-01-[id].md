# Profil Élève - Baptiste CURTY

> **Chemin de navigation** : Login → Dashboard Teacher → Mes élèves → **Baptiste CURTY**  
> **Route** : `/teacher/students/user-student-curty` (dynamique : `/teacher/students/[id]`)  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/students/[id]/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Mes élèves
   └── teacher/students/liste.md

4. Clic sur carte "CURTY Baptiste" ou flèche →
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Profil Élève

### Vue d'ensemble (Onglet : Scores par cours)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │                                                                 │
│ 🏠 Dashb.  │  ←  Baptiste CURTY                      ⟳ Actualiser  ✉ Contacter│
│            │     1A (1A) • baptiste.curty@blaizbot.edu                       │
│ 🏫 Mes     │                                                                 │
│   classes  │  📊 Vue d'ensemble                                              │
│            │  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌────────┐ │
│ 👥 Mes     │  │ 📈 0%        │ │ 🤖 —         │ │ 📝 —         │ │ 🏆 —   │ │
│   élèves   │  │ Évaluation   │ │ Compréhens.  │ │ Moyenne      │ │ Note   │ │
│            │  │ Continue     │ │ IA           │ │ Examens      │ │ Finale │ │
│ 📚 Mes     │  └──────────────┘ └──────────────┘ │ (0/0)        │ └────────┘ │
│   cours    │                                     └──────────────┘            │
│            │                                                                 │
│ 📅 Agendas │  📑 Scores par cours  📋 Assignations  🤖 Activités IA          │
│   et       │  ─────────────────                                              │
│   Assigna. │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │                                                           │ │
│ 💬 Messag. │  │   Aucun score enregistré pour cet élève.                 │ │
│            │  │                                                           │ │
│            │  └───────────────────────────────────────────────────────────┘ │
│            │                                                                 │
└────────────┴─────────────────────────────────────────────────────────────────┘
```

### Onglet : Assignations

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                           🔍 Rechercher...    🔔  [MD] Marc DUPONT │
├────────────┬─────────────────────────────────────────────────────────────────┤
│            │  ←  Baptiste CURTY                      ⟳ Actualiser  ✉ Contacter│
│            │     1A (1A) • baptiste.curty@blaizbot.edu                       │
│            │                                                                 │
│            │  [4 cartes statistiques...]                                     │
│            │                                                                 │
│            │  📑 Scores par cours  📋 Assignations  🤖 Activités IA          │
│            │                       ─────────────                             │
│            │  ┌───────────────────────────────────────────────────────────┐ │
│            │  │ 📅 vendredi 23 janvier                    1 assignation   │ │
│            │  ├───────────────────────────────────────────────────────────┤ │
│            │  │ 🌿 La photosynthèse                                       │ │
│            │  │ 🧬 1A  👤 Baptiste CURTY                                  │ │
│            │  │                                         🕐 23 p.m.  ...   │ │
│            │  │                                         Moyenne            │ │
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
| `Button` | `@/components/ui/button` | Boutons Actualiser, Contacter, Retour |
| `Card` | `@/components/ui/card` | Cartes statistiques |
| `Tabs` | `@/components/ui/tabs` | Onglets (Scores, Assignations, Activités IA) |
| `Badge` | `@/components/ui/badge` | Badges classe, matière, statut |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu actions (•••) |
| `Progress` | `@/components/ui/progress` | Barre Évaluation Continue |

---

## 📊 Structure de la Page

### En-tête

| Élément | Description |
|---------|-------------|
| **← Bouton** | Retour à la liste des élèves |
| **Nom** | Prénom NOM (ex: "Baptiste CURTY") |
| **Classe** | Code classe + niveau (ex: "1A (1A)") |
| **Email** | Email de l'élève |
| **⟳ Actualiser** | Recharger les données |
| **✉ Contacter** | Ouvrir modal de messagerie |

### Vue d'ensemble (4 cartes)

| Carte | Icône | Contenu | Description |
|-------|-------|---------|-------------|
| **Évaluation Continue** | 📈 | Pourcentage (ex: 0%) | Moyenne des contrôles continus |
| **Compréhension IA** | 🤖 | Score ou "—" | Score d'interaction IA (0-100) |
| **Moyenne Examens** | 📝 | Note ou "—" + (X/Y) | Moyenne des examens + nb examens passés |
| **Note Finale** | 🏆 | Note ou "—" | Note finale globale |

### Onglets (3)

| Onglet | Contenu |
|--------|---------|
| **📑 Scores par cours** | Affiche les notes par cours/matière |
| **📋 Assignations** | Liste des devoirs/chapitres assignés |
| **🤖 Activités IA** | Historique des sessions IA |

---

## 📑 Onglet : Scores par cours

### État Vide

```
┌────────────────────────────────────────┐
│                                        │
│  Aucun score enregistré pour cet      │
│  élève.                                │
│                                        │
└────────────────────────────────────────┘
```

### État avec Données (à documenter)

*Affichera une liste de cours avec notes par matière*

---

## 📋 Onglet : Assignations

### Structure

| Élément | Description |
|---------|-------------|
| **Date** | 📅 Date de l'assignation (ex: "vendredi 23 janvier") |
| **Compteur** | "X assignation(s)" |
| **Liste** | Cartes d'assignations |

### Carte d'Assignation

| Élément | Description | Exemple |
|---------|-------------|---------|
| **Icône** | Icône de la matière | 🌿 |
| **Titre** | Nom du chapitre/devoir | "La photosynthèse" |
| **Badge Classe** | Code classe | 🧬 1A |
| **Badge Élève** | Nom de l'élève | 👤 Baptiste CURTY |
| **Heure** | Heure de rendu | 🕐 23 p.m. |
| **Statut** | Badge de statut | "Moyenne" (jaune) |
| **Menu ••• ** | Actions (Voir, Modifier, Supprimer) |

### Statuts Possibles

| Statut | Couleur | Description |
|--------|---------|-------------|
| **En attente** | Gris | Non commencé |
| **En cours** | Bleu | En progression |
| **Moyenne** | Jaune/Orange | Note moyenne |
| **Terminé** | Vert | Complété |
| **En retard** | Rouge | Dépassement délai |

---

## 🤖 Onglet : Activités IA

### État Vide (à documenter)

*Affichera "Aucune activité IA enregistrée"*

### État avec Données (à documenter)

*Liste des sessions IA avec dates, sujets, durées*

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Params |
|---------|----------|-------------|--------|
| `GET` | `/api/teacher/students/[id]` | Profil complet de l'élève | - |
| `GET` | `/api/teacher/students/[id]/scores` | Notes par cours | - |
| `GET` | `/api/teacher/students/[id]/assignments` | Assignations | `?date=...` |
| `GET` | `/api/teacher/students/[id]/ai-activities` | Activités IA | - |
| `POST` | `/api/teacher/students/[id]/refresh` | Actualiser les données | - |
| `POST` | `/api/teacher/messages` | Contacter l'élève | `{ studentId, message }` |

---

## 💾 Types & Interfaces

```typescript
interface StudentProfile {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  class: {
    id: string;
    code: string;          // "1A"
    level: string;         // "1A"
  };
  stats: {
    continuousEval: number;    // 0-100 (pourcentage)
    aiComprehension?: number;  // 0-100 ou null
    examAverage?: number;      // 0-20 ou null
    examCount: number;         // Nombre d'examens passés
    totalExams: number;        // Nombre total d'examens
    finalGrade?: number;       // 0-20 ou null
  };
}

interface StudentAssignment {
  id: string;
  title: string;
  subject: {
    id: string;
    name: string;
    icon: string;          // Emoji ou code icône
    color: string;
  };
  class: {
    code: string;
  };
  student: {
    name: string;
  };
  dueDate: Date;
  dueTime: string;           // "23 p.m."
  status: "PENDING" | "IN_PROGRESS" | "AVERAGE" | "COMPLETED" | "LATE";
  grade?: number;
}

interface StudentAiActivity {
  id: string;
  date: Date;
  subject: string;
  duration: number;          // En minutes
  score?: number;            // 0-100
}
```

---

## 🎯 Comportements

### Actualisation
- Bouton **⟳ Actualiser** : Recharge toutes les données (stats + onglet actif)
- Loader pendant le chargement
- Toast de confirmation

### Contact
- Bouton **✉ Contacter** : Ouvre modal de messagerie
- Pre-rempli avec l'email de l'élève
- Envoi direct vers la messagerie (à documenter)

### Onglets
- Navigation par clic
- État actif souligné
- Chargement paresseux du contenu
- URL synchronisée (ex: `?tab=assignations`)

### Assignations
- Groupées par date
- Tri chronologique (plus récent en haut)
- Badge de statut avec couleur conditionnelle
- Menu actions (•••) : Voir détail, Modifier, Supprimer

### États Vides
- Message informatif si aucune donnée
- Suggestions d'actions (ex: "Créer une assignation")

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| Bouton **←** | [../liste.md](../liste.md) |
| Clic sur assignation | Détail assignation (à documenter) |
| Clic sur cours (Scores) | [courses/[courseId].md](courses/[courseId].md) |
| ← Sidebar Mes élèves | [../liste.md](../liste.md) |

---

## 📝 Notes

> **Exemple de données (Baptiste CURTY)** :
> - Nom : Baptiste CURTY
> - Classe : 1A (Niveau 1A)
> - Email : baptiste.curty@blaizbot.edu
> - Évaluation Continue : 0%
> - Compréhension IA : — (aucune donnée)
> - Moyenne Examens : — (0/0 examens)
> - Note Finale : — (aucune note)
> - Assignations : 1 (La photosynthèse, vendredi 23 janvier, 23 p.m., statut Moyenne)

> **États possibles des cartes** :
> - **Valeur numérique** : Affiche le score/note
> - **"—"** : Aucune donnée disponible
> - **Pourcentage** : Pour Évaluation Continue (barre de progression)
> - **X/Y** : Pour Moyenne Examens (nb examens passés / total)

> **Onglets** :
> - **Scores par cours** : État vide par défaut ("Aucun score enregistré")
> - **Assignations** : Liste chronologique des devoirs
> - **Activités IA** : Historique des sessions IA (à documenter)

> **Statut des assignations** :
> - **Moyenne** (jaune/orange) : Note moyenne obtenue
> - Autres statuts : En attente, En cours, Terminé, En retard

> **Performance** :
> - Cache des statistiques (2 minutes)
> - Lazy loading des onglets
> - Skeleton loaders pendant le chargement
> - Refresh incrémental (pas de rechargement complet)

> **Permissions** :
> - Professeur voit uniquement SES élèves (classes assignées)
> - Accès en lecture seule (sauf contact et assignations)

---

**Navigation** :
- ← [Liste des élèves](../liste.md)
- → [Cours de l'élève](courses/[courseId].md)
- ← [Dashboard Teacher](../../dashboard.md)

*Documentation générée par rétro-ingénierie de BlaizBot-V1*  
*Date : 13 décembre 2025*
