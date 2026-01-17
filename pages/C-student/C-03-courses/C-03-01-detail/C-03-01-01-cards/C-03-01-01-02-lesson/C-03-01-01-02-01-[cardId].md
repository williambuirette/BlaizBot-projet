# Carte Leçon - Vue Élève (Modale Lecture)

> **Chemin de navigation** : Login → Dashboard Student → Mes cours → [Cours] → Onglet Cours → Clic carte Leçon → **Modale**  
> **Route** : `/student/courses/[id]?tab=cours` (modale ouverte)  
> **Rôle** : STUDENT  
> **Mode** : 👁️ Lecture seule (modale)  
> **Composant source** : `src/components/features/cards/LessonCardModal.tsx`

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
   └── Clic sur carte Leçon
   └── MODALE OUVERTE (VOUS ÊTES ICI)
```

---

## 📸 Aperçu Visuel

### Modale (vide)

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│  📄 [Titre de la leçon]                                  ↗   ×  │
│  ┌───────┐                                                      │
│  │ Leçon │                                                      │
│  └───────┘                                                      │
│                                                                 │
│  Aucun contenu disponible.                                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Modale (avec contenu)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│  📄 [Titre de la leçon]                                              ↗   ×  │
│  ┌───────┐                                                                  │
│  │ Leçon │                                                                  │
│  └───────┘                                                                  │
│                                                                             │
│  [Titre principal]                                                          │
│  [Paragraphe d'introduction avec contexte et accroche...]                   │
│                                                                             │
│  [Sous-titre question] ?                                                    │
│  [Définition et explication du concept...]                                  │
│                                                                             │
│  1. [Sous-titre section 1] (bleu)                                           │
│  [Description de la première partie...]                                     │
│  [Terme en gras] : [Explication détaillée du point]                         │
│  [Autre terme] : [Suite des explications]                                   │
│  Exemple : [Illustration concrète pour comprendre]                          │
│                                                                             │
│  2. [Sous-titre section 2] (bleu)                                           │
│  [Contenu de la deuxième partie...]                                         │
│  [Point clé] : [Détails importants]                                         │
│                                                                             │
│  [Titre formule/équation]                                                   │
│                    [Formule ou équation centrée]                            │
│                                                                             │
│  [Facteurs / Points importants]                                             │
│  [Point 1] : [Description]                                                  │
│  [Point 2] : [Description]                                                  │
│  [Point 3] : [Description]                                                  │
│                                                                             │
│  Points Clés à Retenir                                                      │
│  [Résumé des informations essentielles à mémoriser]                         │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

> ✅ **Fonctionnalité** : Le contenu est **rendu et formaté** (titres en bleu, gras stylé, paragraphes séparés). Généré par le professeur ou par IA.

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `DialogHeader` | `@/components/ui/dialog` | Header avec titre + badge |
| `DialogContent` | `@/components/ui/dialog` | Zone contenu |
| `Badge` | `@/components/ui/badge` | "Leçon" (bleu) |
| `Button` | `@/components/ui/button` | × fermer, ↗ plein écran |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/courses/[id]/cards/[cardId]` | Détail carte leçon | - |

---

## 💾 Types & Interfaces

```typescript
interface LessonCardModal {
  id: string;
  type: 'LESSON';
  title: string;
  content: string | null;    // Contenu Markdown (peut être vide)
  source: 'COURSE' | 'SUPPLEMENT';
}
```

---

## 📋 Structure de la Modale

### Header Modale
| Élément | Description |
|---------|-------------|
| **📄 Icône** | Icône document (bleu) |
| **Titre** | Nom de la carte (ex: "Carte leçon") |
| **↗ Bouton** | Ouvrir en plein écran |
| **× Bouton** | Fermer la modale |

### Badge (sous le titre)
| Badge | Couleur | Description |
|-------|---------|-------------|
| **Leçon** | Bleu | Type de carte |

### Contenu
| État | Affichage |
|------|-----------|
| **Vide** | "Aucun contenu disponible." (texte gris) |
| **Avec contenu** | Texte formaté (titres en bleu, gras stylé, paragraphes) |

---

## 🔄 Comportements

### Ouverture modale
1. Clic sur une carte Leçon dans la liste
2. Modale s'ouvre avec animation fade-in
3. Background page devient grisé

### Lecture contenu
- Si contenu : Markdown affiché en texte brut
- Si vide : Message "Aucun contenu disponible."
- Pas d'édition possible (lecture seule)

### Plein écran
1. Clic sur ↗
2. Modale s'agrandit en plein écran
3. Plus de place pour lire le contenu

### Fermeture modale
1. Clic sur × (coin supérieur droit)
2. OU clic en dehors de la modale
3. OU touche Escape

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Cliquer ↗** | Passe en mode plein écran |
| **Cliquer × ou backdrop** | Ferme la modale |
| **Touche Escape** | Ferme la modale |
| **Scroll** | Parcourir le contenu si long |

---

## 📊 Récapitulatif Technique

**Type** : Modale de consultation leçon  
**Layout** : Header (icône + titre + badge + boutons) + Contenu texte  
**Mode** : 👁️ Lecture seule  
**Overlay** : Background grisé semi-transparent  
**Plein écran** : Bouton ↗ disponible  
**Contenu** : Markdown brut (non rendu) ou message vide  

---

**Navigation** :
- ← Fermer → Retour à [Détail cours](../../[id].md) (onglet Cours)

---

*Fichier créé le 13 Décembre 2025*