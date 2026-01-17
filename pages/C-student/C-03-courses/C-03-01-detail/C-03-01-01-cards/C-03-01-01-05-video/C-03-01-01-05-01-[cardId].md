# Carte Vidéo - Vue Élève (Modale Lecture)

> **Chemin de navigation** : Login → Dashboard Student → Mes cours → [Cours] → Onglet Cours → Clic carte Vidéo → **Modale**  
> **Route** : `/student/courses/[id]?tab=cours` (modale ouverte)  
> **Rôle** : STUDENT  
> **Mode** : 👁️ Lecture seule (modale)  
> **Composant source** : `src/components/features/cards/VideoCardModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Sidebar → Mes cours
   └── student/courses/liste.md

4. Clic sur "Voir" (ligne du tableau)
   └── student/courses/detail/[id].md

5. Onglet "Cours" → Section "Contenu du cours"
   └── Clic sur carte Vidéo
   └── MODALE OUVERTE (VOUS ÊTES ICI)
```

---

## 📸 Aperçu Visuel

### Page en arrière-plan + Modale

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  ←  La photosynthèse   SVT                                                  │
│     Par Marc DUPONT                                                         │
│                                                                             │
│  Ma progression                                                    100%     │
│  ████████████████████████████████████████████████████████████████████       │
│  1 / 1 chapitres terminés                            6 sections au total    │
├─────────────────────────────────────────────────────────────────────────────┤
│           ⓘ Informations                    📚 Cours                        │
│                                             ───────                         │
├───────────────────────────────────────────┬─────────────────────────────────┤
│                                           │                                 │
│  📚 Contenu du cours                      │ ┌─────────────────────────────┐ │
│  Parcourez les chapitres et réalisez...   │ │  ▷ Vidéo photosynthèse   ×  │ │
│                                           │ │    ┌─────┐                  │ │
│  ┌───────────────────────────────────┐    │ │    │Vidéo│                  │ │
│  │  ✅  1.  Introduction   6 sections│    │ │    └─────┘                  │ │
│  │                          Terminé ▼│    │ │                             │ │
│  │  ┌───────────────────────────────┐│    │ │  ┌───────────────────────┐  │ │
│  │  │  📄 Introduction        Leçon ││    │ │  │ Photosynthèse - Part  │  │ │
│  │  │  ▷ Vidéo photosynthèse  Vidéo ││◄───│─│  │ ie 1 #TerminaleS #S.  │  │ │
│  │  │  📄 Carte leçon         Leçon ││    │ │  │  ┌─────────────────┐  │  │ │
│  │  │  ✏️ Carte exercice   Exercice ││    │ │  │  │                 │  │  │ │
│  │  │  ❓ Carte quiz           Quiz ││    │ │  │  │   ▶  (Play)     │  │  │ │
│  │  │  ▷ Carte vidéo         Vidéo ││    │ │  │  │                 │  │  │ │
│  │  └───────────────────────────────┘│    │ │  │  └─────────────────┘  │  │ │
│  └───────────────────────────────────┘    │ │  └───────────────────────┘  │ │
│                                           │ │                             │ │
│                                           │ └─────────────────────────────┘ │
│                                           │                                 │
└───────────────────────────────────────────┴─────────────────────────────────┘
```

### Modale seule (détail)

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│  ▷ [Titre de la vidéo]                                      ×   │
│  ┌───────┐                                                      │
│  │ Vidéo │                                                      │
│  └───────┘                                                      │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │  ┌─────────────────────────────────────────────────┐   │   │
│  │  │ [Titre vidéo YouTube]                        ⋮  │   │   │
│  │  └─────────────────────────────────────────────────┘   │   │
│  │                                                         │   │
│  │  ┌─────────────────────────────────────────────────┐   │   │
│  │  │                                                 │   │   │
│  │  │                                                 │   │   │
│  │  │              [Thumbnail]                        │   │   │
│  │  │                                                 │   │   │
│  │  │                  ▶                              │   │   │
│  │  │              (Play btn)                         │   │   │
│  │  │                                                 │   │   │
│  │  │                                                 │   │   │
│  │  └─────────────────────────────────────────────────┘   │   │
│  │                                                         │   │
│  └─────────────────────────────────────────────────────────┘   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> 📺 **Fonctionnalité** : Embed YouTube avec thumbnail et bouton Play. Le professeur renseigne l'URL YouTube lors de la création de la carte.

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `DialogHeader` | `@/components/ui/dialog` | Header avec titre + badge |
| `DialogContent` | `@/components/ui/dialog` | Zone contenu |
| `Badge` | `@/components/ui/badge` | "Vidéo" (rouge) |
| `Button` | `@/components/ui/button` | Bouton fermer (×) |
| `YouTubeEmbed` | Custom | Lecteur vidéo YouTube embarqué |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/courses/[id]/cards/[cardId]` | Détail carte vidéo | - |
| `POST` | `/api/student/courses/[id]/cards/[cardId]/complete` | Marquer terminé (auto) | - |

---

## 💾 Types & Interfaces

```typescript
interface VideoCardModal {
  id: string;
  type: 'VIDEO';
  title: string;
  videoUrl: string;        // URL YouTube (ex: https://youtube.com/watch?v=...)
  thumbnailUrl?: string;   // Thumbnail auto-générée
  duration?: string;       // Durée vidéo (ex: "12:34")
  source: 'COURSE' | 'SUPPLEMENT';
}
```

---

## 📋 Structure de la Modale

### Header Modale
| Élément | Description |
|---------|-------------|
| **▷ Icône** | Icône play (triangle) |
| **Titre** | Nom de la carte (ex: "Vidéo photosynthèse") |
| **× Bouton** | Fermer la modale (coin droit) |

### Badge (sous le titre)
| Badge | Couleur | Description |
|-------|---------|-------------|
| **Vidéo** | Rouge | Type de carte |

### Contenu
| Élément | Description |
|---------|-------------|
| **YouTube Embed** | Lecteur vidéo YouTube embarqué (iframe) |
| **Titre vidéo** | Titre récupéré depuis YouTube automatiquement |
| **Thumbnail** | Image de prévisualisation YouTube |
| **Bouton Play** | ▶ bouton Play YouTube au centre |
| **Menu** | ⋮ options YouTube (partager, etc.) |

---

## 🔄 Comportements

### Ouverture modale
1. Clic sur une carte Vidéo dans la liste
2. Modale s'ouvre avec animation fade-in
3. Background page devient grisé
4. Focus trap dans la modale

### Lecture vidéo
1. Clic sur le bouton ▶ Play
2. Vidéo YouTube démarre
3. Contrôles YouTube disponibles (pause, volume, plein écran)
4. Progression auto-trackée

### Fin de vidéo
- Carte automatiquement marquée "terminée"
- Progression du cours mise à jour

### Fermeture modale
1. Clic sur × (coin supérieur droit)
2. OU clic en dehors de la modale
3. OU touche Escape
4. Si vidéo en cours : pause automatique
5. Modale se ferme avec animation fade-out

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Cliquer ▶ Play** | Démarre la lecture vidéo |
| **Cliquer × ou backdrop** | Ferme la modale (pause vidéo) |
| **Touche Escape** | Ferme la modale |
| **Contrôles YouTube** | Pause, volume, plein écran, etc. |

---

## 📊 Récapitulatif Technique

**Type** : Modale de consultation vidéo  
**Layout** : Header (icône + titre + badge) + YouTube Embed  
**Mode** : 👁️ Lecture seule  
**Embed** : YouTube iframe (responsive)  
**Overlay** : Background grisé semi-transparent  
**Animation** : Fade in/out  
**Fermeture** : ×, backdrop click, Escape  
**Auto-complete** : Vidéo regardée → carte terminée  

---

**Navigation** :
- ← Fermer → Retour à [Détail cours](../../[id].md) (onglet Cours)

---

*Fichier créé le 16 janvier 2026*