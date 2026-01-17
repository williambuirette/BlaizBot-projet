# Attribution aux Cours - Modale

> **Déclenchement** : Menu contextuel (`⋮`) sur une card → **"Lier à un cours"**  
> **Type** : Modale de sélection multi-cours  
> **Rôle** : STUDENT  
> **Composant source** : `src/components/features/student/revisions/CourseAttributionDialog.tsx`

---

## 📸 Aperçu Fonctionnel

```
┌─────────────────────────────────────────────────────────────────────┐
│  ⊗ Attribution aux cours                               [X]           │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  Sélectionnez les cours auxquels lier "test".                      │
│  Vous pouvez en choisir plusieurs ou aucun.                        │
│                                                                     │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │  [✓] 📚 La photosynthèse                                       │ │
│  │      SVT • Marc DUPONT                                         │ │
│  │                                                                │ │
│  │  [ ] 📚 [Autre cours]                                          │ │
│  │      [Matière] • [Professeur]                                 │ │
│  │                                                                │ │
│  │  [ ] 📚 [Autre cours]                                          │ │
│  │      [Matière] • [Professeur]                                 │ │
│  │                                                                │ │
│  │  ──────────────────────────────────────────────────────────── │ │
│  │  Aucun cours sélectionné (cours personnel)                    │ │
│  │                                                                │ │
│  └───────────────────────────────────────────────────────────────┘ │
│                                                                     │
│                                    [Annuler]  [✓ Appliquer]         │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## ⚙️ Logique Fonctionnelle

### 1. Chargement Initial
- **SSR ou Client Fetch** : À l'ouverture de la modale, appel `GET /api/student/available-courses`.
- **Affichage** : Liste des cours assignés à la classe de l'élève.
- **État de chargement** : Spinner pendant le fetch. Si aucun cours, message informatif.

### 2. Sélection Multi-Cours
- **Mode** : Checkboxes permettant une sélection multiple (les suppléments peuvent être liés à plusieurs cours).
- **Interaction** :
  - Clic sur la ligne pour cocher/décocher.
  - Clic sur le checkbox pour action rapide.
  - Highlight visuel de la ligne quand sélectionnée.
- **État par défaut** : Les cours actuellement liés au supplément sont pré-cochés.

### 3. Résumé Dynamique
- **Bottom Feedback** : Affichage du nombre de cours sélectionnés ou "Aucun cours sélectionné (cours personnel)".
- **Mise à jour en temps réel** : Le résumé change au fur et à mesure des sélections.

### 4. Validation et Sauvegarde
- **Bouton "Appliquer"** :
  - Désactivé si aucune modification (`hasChanged === false`).
  - Désactivé pendant le chargement ou la sauvegarde.
  - Affiche un spinner et "Enregistrement..." pendant `PUT`.
- **Payload** : `{ courseIds: [...] }` envoyé à `PUT /api/student/supplements/:id`.
- **Succès** : Fermeture de la modale + rechargement des données.
- **Erreur** : Affichage d'un message d'erreur en rouge.

---

## 🧩 Composants Utilisés

| Composant | Chemin | Rôle |
|-----------|--------|------|
| `Dialog` | `shadcn/ui` | Container modal. |
| `Checkbox` | `shadcn/ui` | Sélection de cours. |
| `ScrollArea` | `shadcn/ui` | Scrolling si liste longue. |
| `Button` | `shadcn/ui` | Actions (Annuler, Appliquer). |
| `BookOpen` | `lucide-react` | Icône des cours. |

---

## 🔗 Endpoints & Flux de Données

| Action | Méthode | Endpoint | Payload |
|--------|---------|----------|---------|
| Charger cours | `GET` | `/api/student/available-courses` | - |
| Sauvegarder | `PUT` | `/api/student/supplements/:id` | `{ courseIds: string[] }` |

---

## 💾 Modèle de Données

```typescript
interface Course {
  id: string;
  title: string;
  subject: string;
  teacher: string | null;
}

interface CourseAttributionDialogProps {
  open: boolean;                          // Contrôle d'ouverture
  onOpenChange: (open: boolean) => void; // Callback de fermeture
  supplementId: string;                   // ID du supplément à modifier
  supplementTitle: string;                // Titre pour le contexte
  currentCourseIds: string[];            // Cours actuellement liés
}
```

---

## 🔄 Flux Utilisateur (User Flow)

1. **Ouverture** : Clic sur "Lier à un cours" → Modale s'ouvre et charge les cours disponibles.
2. **Parcours** : L'élève parcourt la liste et coche les cours auxquels il veut lier son supplément.
3. **Consultation** : Le résumé en bas indique son choix (X cours sélectionnés ou "Cours personnel").
4. **Validation** : Clic sur "Appliquer" pour sauvegarder.
5. **Retour** : Après succès, fermeture automatique et refresh de la page parent.

---

## ✅ Checklist Fonctionnelle

- [x] Chargement async des cours disponibles
- [x] Sélection multi-cours avec checkboxes
- [x] Pré-cochage des cours actuellement liés
- [x] Feedback visuel (highlight de ligne, état de checkbox)
- [x] Résumé dynamique du nombre de sélections
- [x] Validation (bouton actif seulement si modification)
- [x] Gestion des états (loading, saving, error)
- [x] Message informatif si aucun cours disponible
- [x] Appel API PUT avec refresh après succès
- [x] Gestion des erreurs réseau
