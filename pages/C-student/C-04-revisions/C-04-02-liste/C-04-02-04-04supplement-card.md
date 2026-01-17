# Carte Supplément - Affichage

> **Composant** : `SupplementCard`  
> **Emplacement** : Grille dans [liste.md](liste.md)  
> **Rôle** : STUDENT  
> **Chemin source** : `src/components/features/student/revisions/SupplementCard.tsx`

---

## 📸 Aperçu Fonctionnel

```
┌──────────────────────────────────────────────┐
│  [Icône] Titre du supplément            [⋮] │
│                                              │
│  🔗 Cours lié (si applicable)               │
│                                              │
│  + Lier à un cours   (si non lié)           │
│                                              │
│  📚 X chap.  🎴 X cartes                    │
│  🕐 Modifié il y a N jours                  │
│                                              │
└──────────────────────────────────────────────┘
```

---

## ⚙️ Logique Fonctionnelle

### 1. Affichage Visuel
- **Icône** : Représente le type (📄 pour supplément personnel, 📚 pour lié)
- **Titre** : Nom du supplément créé par l'élève
- **Tag Cours** : Affichage du cours lié (si applicable) avec nom du professeur
- **Lien Rapide** : Bouton "+ Lier à un cours" visible si le supplément est personnel

### 2. Métadonnées
- **Compteurs** : Nombre de chapitres et cartes (indicateurs de volume)
- **Date** : Affichage au format "Modifié il y a X jours"
- **Status Visuel** : Icône pour distinguer les suppléments personnels vs liés

### 3. Menu Contextuel (⋮)
Le menu d'actions offre les options suivantes :
- **Éditer** : Redirection vers [detail/[id].md](detail/[id].md)
- **Lier à un cours** : Ouvre la modale [liaison-cours.md](liaison-cours.md)
- **Supprimer** : Avec confirmation utilisateur

### 4. Interactions
- **Clic sur la carte** : Navigation vers [detail/[id].md](detail/[id].md)
- **Clic sur "+ Lier à un cours"** : Ouvre la modale [liaison-cours.md](liaison-cours.md)
- **Clic sur le menu ⋮** : Affichage des actions contextuelles

---

## 🧩 Composants Utilisés

| Composant | Chemin | Rôle |
|-----------|--------|------|
| `Card` | `shadcn/ui` | Container visuel de la carte |
| `Button` | `shadcn/ui` | Actions (Lier, menu) |
| `DropdownMenu` | `shadcn/ui` | Menu contextuel |
| `Badge` | `shadcn/ui` | Affichage des stats |

---

## 💾 Propriétés

```typescript
interface SupplementCardProps {
  supplement: {
    id: string;
    title: string;
    courseIds: string[];        // Détermine si "lié" ou "personnel"
    course?: {
      title: string;
      teacher: string | null;
    };
    chapterCount: number;
    cardCount: number;
    updatedAt: Date;
  };
  onEdit?: () => void;          // Callback édition
  onLinkCourse?: () => void;    // Callback liaison
  onDelete?: () => void;        // Callback suppression
}
```

---

## 🔄 Flux Utilisateur

1. **Visualisation** : L'élève voit une grille de cartes dans [liste.md](liste.md)
2. **Sélection d'Action** : Clic sur la carte ou sur le menu ⋮
3. **Redirection** : Selon l'action, navigation vers détail, modale, ou suppression

---

## ✅ Checklist Fonctionnelle

- [x] Affichage du titre et de l'icône
- [x] Tag de cours lié (si applicable)
- [x] Bouton "+ Lier à un cours" (si personnel)
- [x] Affichage des compteurs (chapitres, cartes)
- [x] Date de modification au format lisible
- [x] Menu contextuel avec 3 actions
- [x] Navigation vers détail au clic
- [x] Responsive grid layout
