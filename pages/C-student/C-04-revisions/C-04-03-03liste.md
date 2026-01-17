# Mes Révisions - Liste

> **Chemin de navigation** : Login → Dashboard Élève → **Mes révisions**  
> **Route** : `/student/revisions`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/revisions/page.tsx`

---

## � Aperçu Fonctionnel (Structure)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  [Header : Dashboard | Recherche | Profil]                                  │
├──────────────┬──────────────────────────────────────────────────────────────┤
│              │  [Titre : Mes Révisions]                      [Bouton : +]   │
│  [Sidebar]   │                                                              │
│              │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐       │
│              │  │ [Stats]  │ │ [Stats]  │ │ [Stats]  │ │ [Stats]  │       │
│              │  └──────────┘ └──────────┘ └──────────┘ └──────────┘       │
│              │                                                              │
│              │  ┌─ [Onglet 1] ─┬─ [Onglet 2] ─┬─ [Onglet 3] ─┐            │
│              │  │                                            │            │
│              │  │  [ Grille de Cards : Suppléments ]         │            │
│              │  │  (Chaque card a un menu ⋮ d'actions)       │            │
│              │  │                                            │            │
│              │  └────────────────────────────────────────────┘            │
└──────────────┴──────────────────────────────────────────────────────────────┘
```

---

## ⚙️ Logique Fonctionnelle

### 1. Gestion des États (Data Fetching)
- **Chargement** : Affichage d'un `Skeleton` (grille de 3 placeholders).
- **Initialisation** : Appel serveur `getStudentSupplements(userId)` via Prisma.
- **Synchronisation** : Re-validation des données après chaque action CRUD (Mutation).

### 2. Filtrage Dynamique (Client-side)
La liste est filtrée selon l'onglet actif :
- **Tous** : `supplements` (complet)
- **Liés aux cours** : `supplements.filter(s => s.courseIds.length > 0)`
- **Cours perso** : `supplements.filter(s => s.courseIds.length === 0)`

### 3. Système d'Actions (Menu ⋮)
Chaque élément de la liste supporte les actions suivantes :
- **Édition** : Ouvre la page de détail en mode édition (`/student/revisions/[id]`).
- **Lier à un cours** : Ouvre la modale [liaison-cours.md](liaison-cours.md) pour sélectionner des cours.
- **Suppression** : Confirmation utilisateur puis appel `DELETE`.
- **Navigation** : Clic sur la card → redirection vers le détail (`[id].md`).

---

## 🧩 Architecture des Composants

| Composant | Rôle Fonctionnel |
|-----------|------------------|
| `RevisionsHeader` | Agrégation des statistiques et point d'entrée création. |
| `RevisionsTabs` | Moteur de filtrage et conteneur de liste. |
| `SupplementCard` | Unité d'affichage et déclencheur d'actions contextuelles. |
| `CourseAttribution` | Logique métier de liaison Many-to-Many avec les cours existants. |

---

## 🔗 Endpoints & Flux de Données

| Action | Méthode | Impact BDD |
|--------|---------|------------|
| Lister | `GET` | Lecture `StudentSupplement` + `Include(Courses, Chapters)` |
| Créer | `POST` | Insertion `StudentSupplement` + mapping optionnel |
| Lier/Délier | `POST/PUT` | Mise à jour table de jonction `StudentSupplementCourses` |
| Supprimer | `DELETE` | Suppression (Cascade sur relations privées) |

---

## 💾 Modèle de Données (Fonctionnel)

```typescript
// Structure simplifiée pour la logique de l'UI
interface SupplementFunctional {
  id: string;
  title: string;
  courseIds: string[];         // Détermine l'onglet (Llié vs Perso)
  chapterCount: number;        // Indicateur de volume
  cardCount: number;           // Indicateur de volume
  updatedAt: Date;            // Logique de tri (plus récent en haut)
}
```

---

## 🔄 Flux Utilisateur (User Flow)

1. **Entrée** : L'utilisateur arrive sur la page, les stats se chargent.
2. **Exploration** : L'utilisateur change d'onglet, la liste est filtrée instantanément sans rechargement.
3. **Action Rapide** : Depuis le menu ⋮, il peut supprimer, éditer ou lier un cours à la volée.
4. **Approfondissement** : Clic sur une card pour entrer dans la gestion des chapitres/cartes.

---

## 🔗 Liens Relatifs

| Lien | Description |
|------|-------------|
| [create.md](create.md) | Page de création d'un supplément |
| [detail/[id].md](detail/[id].md) | Page de détail d'un supplément |
| [liaison-cours.md](liaison-cours.md) | Modale d'attribution aux cours |
| [../dashboard.md](../dashboard.md) | Dashboard élève |
