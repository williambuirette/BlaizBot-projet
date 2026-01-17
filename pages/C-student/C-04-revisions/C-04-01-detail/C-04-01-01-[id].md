# Détail Supplément - [Titre]

> **Chemin de navigation** : Login → Dashboard Élève → Mes révisions → **[Nom du supplément]**  
> **Route** : `/student/revisions/[id]`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/revisions/[id]/page.tsx`

---

## 📸 Aperçu Fonctionnel (Structure)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  [Header : Dashboard | Recherche | Profil]                                  │
├──────────────┬──────────────────────────────────────────────────────────────┤
│              │                                                              │
│  [Sidebar]   │  ←  [📄] notes sur la photosynthèse                  [⚙️]   │
│              │     🔗 La photosynthèse (Marc DUPONT)                        │
│              │                                                              │
│              │  ┌── Chapitre ──────────────────────────────────────┬──────┐ │
│              │  │  ⠿  v  [Nom du chapitre]             5 cartes  🖊  🗑  │ │
│              │  ├──────────────────────────────────────────────────┴──────┤ │
│              │  │                                                        │ │
│              │  │  ⠿  [📄] Titre de la carte    [Leçon] [✓Contenu] 🖊 🗑 │ │
│              │  │  ⠿  [▶️] Titre de la carte    [Vidéo] [✓Contenu] 🖊 🗑 │ │
│              │  │  ⠿  [📝] Titre de la carte    [Note]  [✓Contenu] 🖊 🗑 │ │
│              │  │  ⠿  [✏️] Titre de la carte    [Exerc.] [Vide]    🖊 🗑 │ │
│              │  │  ⠿  [❓] Titre de la carte    [Quiz]   [Vide]    🖊 🗑 │ │
│              │  │                                                        │ │
│              │  │  + Ajouter une carte                                   │ │
│              │  └────────────────────────────────────────────────────────┘ │
│              │                                                             │
│              │  ┌───────────────────────────────────────────────┬────────┐ │
│              │  │ [ Input : Nouveau chapitre... ]               │ Ajouter│ │
│              │  └───────────────────────────────────────────────┴────────┘ │
│              │                                                             │
└──────────────┴─────────────────────────────────────────────────────────────┘
```

---

## ⚙️ Logique Fonctionnelle

### 1. Gestion de la Structure (Chapitres)
- **Affichage** : Liste ordonnée des chapitres (`orderIndex`).
- **Drag-and-Drop** : Possibilité de réordonner les chapitres via la poignée `⠿`.
- **Statut** : Affiche le nombre global de cartes dans le bandeau du chapitre.
- **Actions directes** : Renommer (`🖊`) ou supprimer (`🗑`) le chapitre sans quitter la page.
- **Extension** : Accordéon permettant de masquer/afficher le contenu du chapitre.

### 2. Gestion des Cartes (Flashcards/Contenu)
L'élève dispose d'un mini-outil de création pédagogique :
- **Ajout rapide** : Bouton "+ Ajouter une carte" ouvrant un sélecteur de type.
- **Indicateur de contenu** :
  - `✓ Contenu` (Noir) : La carte possède du texte ou des médias.
  - `Vide` (Gris) : La carte est créée mais n'a pas encore de contenu.
- **Typage visuel** : Badges de couleur pour identifier rapidement la nature du supplément (Leçon, Vidéo, Note, Exercice, Quiz).
- **Édition** : Clic sur `🖊` redirige vers l'éditeur spécifique au type de carte (ex: [cards/note/[cardId].md](cards/note/%5BcardId%5D.md)).

### 3. Paramètres du Supplément (Icône ⚙️)
Ouvre les options du supplément :
- Synchronisation ou désactivation du lien avec un cours professeur.
- Archivage ou suppression définitive du supplément.

---

## 🧩 Architecture des Composants

| Composant | Rôle Fonctionnel |
|-----------|------------------|
| `SupplementDetailHeader` | Affiche le titre, le type (icône) et les actions globales (retour, paramètres). |
| `StudentChapterManager` | Moteur principal de gestion de la structure. Gère la liste des chapitres. |
| `StudentChapterItem` | Unité d'un chapitre contenant les cartes et les actions d'édition de chapitre. |
| `StudentCardItem` | Affichage d'une carte individuelle avec ses métadonnées et actions. |

---

## 🔗 Endpoints & Flux de Données

| Action | Méthode | Impact BDD |
|--------|---------|------------|
| Charger détail | `GET` | Récupère `StudentSupplement` + `Chapters` + `Cards`. |
| Ajouter Chapitre | `POST` | Crée une entrée dans `StudentChapter` avec `supplementId`. |
| Réordonner | `PUT` | Met à jour `orderIndex` des chapitres ou cartes. |
| Supprimer | `DELETE` | Suppression en cascade du chapitre et de ses cartes. |

---

## 💾 Modèle de Données (Structure)

```typescript
// Structure de la donnée pour le rendu de la page
interface SupplementDetail {
  id: string;
  title: string;
  type: 'personal' | 'linked';
  chapters: {
    id: string;
    title: string;
    orderIndex: number;
    cards: {
      id: string;
      title: string;
      cardType: 'note' | 'lesson' | 'video' | 'exercise' | 'quiz';
      orderIndex: number;
    }[];
  }[];
}
```

---

## 🔄 Flux Utilisateur (User Flow)

1. **Atterrissage** : Si le supplément est nouveau, l'élève voit le message "Aucun chapitre".
2. **Structuration** : L'élève saisit le nom de son premier chapitre et clique sur "Ajouter".
3. **Enrichissement** : Une fois le chapitre créé, il commence à ajouter ses cartes de révision.
4. **Navigation** : Le bouton de retour (←) le ramène à la liste globale des révisions.
