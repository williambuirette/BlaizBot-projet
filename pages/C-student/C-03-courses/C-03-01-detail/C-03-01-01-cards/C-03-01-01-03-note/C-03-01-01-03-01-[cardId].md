# Carte Note - Vue Élève (Modale Lecture)

> **Chemin de navigation** : Login → Dashboard Student → Mes cours → [Cours] → Onglet Cours → Clic carte Note → **Modale**  
> **Route** : `/student/courses/[id]?tab=cours` (modale ouverte)  
> **Rôle** : STUDENT  
> **Mode** : 👁️ Lecture seule (modale)  
> **Composant source** : `src/components/features/cards/NoteCardModal.tsx`

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

5. Onglet "Cours" → Section "Contenu du cours" OU "Mes suppléments"
   └── Clic sur carte Note
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
│  1 / 1 chapitres terminés                            8 sections au total    │
├─────────────────────────────────────────────────────────────────────────────┤
│           ⓘ Informations                    📚 Cours                        │
│                                             ───────                         │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  📚 Contenu du cours                                                        │
│  Parcourez les chapitres et réalisez les exercices pour progresser          │
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │  ✅  1.  Introduction                      8 sections   Terminé  ▼  │   │
│  │  ┌─────────────────────────────────────────────────────────────┐    │   │
│  │  │  📄 Introduction                                     Leçon  │    │   │
│  │  │  🎬 Vidéo photosynthèse                              Vidéo  │    │   │
│  │  │  📄 Carte leçon                                      Leçon  │ ◄──│───── sélectionné (bleu)
│  │  │  ✏️ Carte exercice                                Exercice  │    │   │
│  │  │  ❓ Carte quiz                                        Quiz  │    │   │
│  │  │  🎬 Carte vidéo                                      Vidéo  │    │   │
│  │  └─────────────────────────────────────────────────────────────┘    │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
│  🎒 Mes suppléments                                              + Créer    │
│  Vos notes et ressources personnelles liées à ce cours                      │
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │  📚 1  notes sur la photosynthèse           5 cartes            ▼   │   │
│  │                                      Modifier ce supplément →       │   │
│  │  ┌─────────────────────────────────────────────────────────────┐    │   │
│  │  │  📄 Note de compréhension                              Note │    │   │
│  │  │  🎬 vidéo                                              Vidéo │    │   │
│  │  │  📄 test                                               Leçon │    │   │
│  │  │  ✏️ test                                            Exercice │    │   │
│  │  │  ❓ test                                                Quiz │    │   │
│  │  └─────────────────────────────────────────────────────────────┘    │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Modale seule (détail)

```
┌─────────────────────────────────────────────────────────────────┐
│                                                             ×   │
│  [Titre de la note]                                             │
│  ┌──────┐ ┌─────────────────────┐                               │
│  │ Note │ │ Supplément personnel│                               │
│  └──────┘ └─────────────────────┘                               │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │                                                           │ │
│  │  ## Titre niveau 2                                        │ │
│  │                                                           │ │
│  │  Paragraphe de texte avec **gras** et *italique*.         │ │
│  │                                                           │ │
│  │  ### Titre niveau 3                                       │ │
│  │                                                           │ │
│  │  * Liste à puces item 1                                   │ │
│  │  * Liste à puces item 2                                   │ │
│  │    * Sous-item                                            │ │
│  │  * Liste à puces item 3                                   │ │
│  │                                                           │ │
│  │  1. Liste numérotée item 1                                │ │
│  │  2. Liste numérotée item 2                                │ │
│  │  3. Liste numérotée item 3                                │ │
│  │                                                           │ │
│  │  > Citation en bloc                                       │ │
│  │                                                           │ │
│  │  [Contenu Markdown formaté]                               │ │
│  │                                                           │ │
│  │  ⋮                                                         │ │
│  │                                                           │ │
│  └───────────────────────────────────────────────────────────┘ │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> 📝 **Fonctionnalités clés** :
> - Affichage Markdown rendu en HTML (headings, bold, italic, listes, citations)
> - Zone scrollable si contenu long
> - Lecture seule (pas d'édition)
> - Badge indiquant la source (Cours ou Supplément personnel)

---

## 📝 Rendu Markdown

### Éléments Supportés

| Syntaxe Markdown | Rendu HTML | Description |
|------------------|------------|-------------|
| `# Titre 1` | `<h1>` | Titre principal |
| `## Titre 2` | `<h2>` | Titre section |
| `### Titre 3` | `<h3>` | Sous-titre |
| `**texte**` | `<strong>` | Texte en gras |
| `*texte*` | `<em>` | Texte en italique |
| `* item` | `<ul><li>` | Liste à puces |
| `1. item` | `<ol><li>` | Liste numérotée |
| `> citation` | `<blockquote>` | Citation |
| `` `code` `` | `<code>` | Code inline |
| ` ```code``` ` | `<pre><code>` | Bloc de code |
| `[lien](url)` | `<a>` | Lien hypertexte |

### Bibliothèque de Rendu

**Option recommandée** : `react-markdown` avec `remark-gfm`

```typescript
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';

<ReactMarkdown 
  remarkPlugins={[remarkGfm]}
  className="prose prose-sm max-w-none"
>
  {content}
</ReactMarkdown>
```

**Classes Tailwind CSS** : `prose` (typography plugin)

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `DialogHeader` | `@/components/ui/dialog` | Header avec titre + badges |
| `DialogContent` | `@/components/ui/dialog` | Zone contenu scrollable |
| `Badge` | `@/components/ui/badge` | "Note" (type) + "Supplément personnel" |
| `Button` | `@/components/ui/button` | Bouton fermer (×) |
| `Prose` | Custom | Rendu Markdown formaté |
| `ScrollArea` | `@/components/ui/scroll-area` | Zone scrollable si contenu long |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/courses/[id]/cards/[cardId]` | Détail carte note | - |

---

## 💾 Types & Interfaces

```typescript
interface NoteCardModal {
  id: string;
  type: 'NOTE';
  title: string;
  content: string;           // Contenu Markdown (lecture seule)
  source: 'COURSE' | 'SUPPLEMENT';  // Origine de la carte
  supplementTitle?: string;  // Si source = SUPPLEMENT
}
```

---

## 📋 Structure de la Modale

### Header Modale
| Élément | Description |
|---------|-------------|
| **📄 Icône** | Icône type note |
| **Titre** | Nom de la carte (ex: "Note de compréhension") |
| **× Bouton** | Fermer la modale |

### Badges (sous le titre)
| Badge | Description |
|-------|-------------|
| **Note** | Type de carte (orange) |
| **Supplément personnel** | Indique que c'est un supplément créé par l'élève |

### Contenu
| Élément | Description |
|---------|-------------|
| **Zone texte** | Markdown rendu en HTML |
| **Scroll** | ScrollArea si contenu dépasse |
| **Style** | Prose formatting (headings, lists, bold) |

---

## � Structure de Données (Exemple)

```json
{
  "id": "card-note-789",
  "type": "NOTE",
  "title": "[Titre de la note]",
  "content": "## Introduction\n\nCeci est un **exemple** de contenu Markdown.\n\n### Points clés\n\n* Point 1\n* Point 2\n* Point 3\n\n> Citation importante",
  "source": "SUPPLEMENT",
  "supplementTitle": "[Nom du supplément]"
}
```

**Points clés** :
- `content` : Chaîne Markdown brute (avec `\n` pour les sauts de ligne)
- `source` : `"COURSE"` (créé par prof) ou `"SUPPLEMENT"` (créé par élève)
- `supplementTitle` : Affiché uniquement si `source === "SUPPLEMENT"`

---

## �🔄 Comportements

### Ouverture modale
1. Clic sur une carte Note dans la liste
2. Modale s'ouvre avec animation fade-in
3. Background page devient grisé
4. Focus trap dans la modale

### Lecture contenu
- Markdown rendu en HTML formaté
- Pas d'édition possible
- Scroll si contenu long

### Fermeture modale
1. Clic sur × (coin supérieur droit)
2. OU clic en dehors de la modale
3. OU touche Escape
4. Modale se ferme avec animation fade-out

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Cliquer × ou backdrop** | Ferme la modale |
| **Touche Escape** | Ferme la modale |
| **Scroll** | Parcourir le contenu si long |
| **Sélectionner texte** | Copier possible |

---

## 📊 Récapitulatif Technique

**Type** : Modale de consultation  
**Layout** : Header (titre + badges) + Contenu Markdown  
**Mode** : 👁️ Lecture seule  
**Overlay** : Background grisé semi-transparent  
**Animation** : Fade in/out  
**Fermeture** : ×, backdrop click, Escape  

---

**Navigation** :
- ← Fermer → Retour à [Détail cours](../../[id].md) (onglet Cours)

---

*Fichier mis à jour le 16 janvier 2026*