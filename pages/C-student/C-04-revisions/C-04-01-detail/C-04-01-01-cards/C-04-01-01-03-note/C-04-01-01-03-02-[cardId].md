# 📝 Carte Note - Révisions Élève

> **Chemin de navigation** : Dashboard Student → Mes Révisions → Supplément → Chapitre → **Carte Note**  
> **Route** : `/student/revisions/[id]/cards/note/[cardId]`  
> **Rôle** : STUDENT  
> **Composant source** : `src/components/features/student/revisions/StudentCardEditor.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Sidebar → Mes Révisions
   └── student/revisions/liste.md

4. Clic sur supplément
   └── student/revisions/detail/[id].md

5. Clic sur carte Note 📝 ou "+ Ajouter une carte" → Note
   └── VOUS ÊTES ICI
```

---

## 🔑 Contexte Clé

**Type de carte** : Note créée DE ZÉRO par l'élève (NON une modification de carte prof)

| ✅ Autorisé | ❌ Interdit |
|-------------|-------------|
| Créer ses propres Notes dans Révisions | Modifier les Notes du prof |
| Lier ses Notes à un cours du prof | Accéder en édition aux contenus prof |
| Édition complète de SES cartes | Dupliquer les cartes du prof |

---

## 📸 Aperçu Visuel - Carte Note

### En-tête de la carte (modal plein écran)

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ ≡ 📝 Ma note personnelle                  Note  Brouillon  🖊  🗑  👁 Aperçu │
└──────────────────────────────────────────────────────────────────────────────┘

Légende :
├─ ≡         → Menu burger (options carte)
├─ 📝        → Icône type carte (Note)
├─ "Ma note..." → Titre de la carte (éditable)
├─ Note      → Badge type
├─ Brouillon → Badge statut (Brouillon | Publié)
├─ 🖊        → Bouton renommer
├─ 🗑        → Bouton supprimer
└─ 👁 Aperçu → Prévisualisation
```

---

### Onglet : Contenu

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                                                                               │
│  ╔═══════════════════════════════════════════════════════════════════════╗   │
│  ║                           ÉDITEUR RICH TEXT                           ║   │
│  ╠═══════════════════════════════════════════════════════════════════════╣   │
│  ║                                                                       ║   │
│  ║  ┌─────────────────────────────────────────────────────────────────┐  ║   │
│  ║  │ ↶ ↷ │ B  I  U  S  A │ H₁ H₂ H₃ │ ≡ ≣ │ "" <> - │ ≡ ≡ ≡ │ 🔗 📷│  ║   │
│  ║  └─────────────────────────────────────────────────────────────────┘  ║   │
│  ║                                                                       ║   │
│  ║  ┌─────────────────────────────────────────────────────────────────┐  ║   │
│  ║  │                                                                 │  ║   │
│  ║  │                                                                 │  ║   │
│  ║  │                                                                 │  ║   │
│  ║  │       Écrivez vos notes personnelles ici...                     │  ║   │
│  ║  │       Formatez avec les outils ci-dessus (gras, italique...)    │  ║   │
│  ║  │                                                                 │  ║   │
│  ║  │                                                                 │  ║   │
│  ║  │                                                                 │  ║   │
│  ║  │                                                                 │  ║   │
│  ║  └─────────────────────────────────────────────────────────────────┘  ║   │
│  ║                                                                       ║   │
│  ║  ~0 min de lecture                                                    ║   │
│  ║                                                                       ║   │
│  ╚═══════════════════════════════════════════════════════════════════════╝   │
│                                                                               │
│                                                                               │
├──────────────────────────────────────────────────────────────────────────────┤
│ ×  Annuler                                                    💾 Enregistrer │
└──────────────────────────────────────────────────────────────────────────────┘
```

---

### Barre d'outils de l'éditeur (détail)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ ↶ ↷ │ B  I  U  S  A │ H₁ H₂ H₃ │ ≡ ≣ │ "" <> - │ ≡ ≡ ≡ │ 🔗 📷           │
└─────────────────────────────────────────────────────────────────────────────┘

Groupes d'outils :
├─ ↶ ↷           → Undo / Redo
├─ B I U S A     → Gras, Italique, Souligné, Barré, Surligné
├─ H₁ H₂ H₃     → Titres niveaux 1, 2, 3
├─ ≡ ≣          → Liste à puces, Liste numérotée
├─ "" <> -      → Citation, Code inline, Séparateur
├─ ≡ ≡ ≡        → Alignement gauche, centre, droite
└─ 🔗 📷        → Lien, Image
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Modal conteneur plein écran |
| `Button` | `@/components/ui/button` | Boutons Enregistrer, Annuler |
| `Input` | `@/components/ui/input` | Titre de la note |
| `Badge` | `@/components/ui/badge` | Type carte, Statut |
| `RichTextEditor` | `@/components/features/cards/RichTextEditor.tsx` | Éditeur Tiptap |
| `Tooltip` | `@/components/ui/tooltip` | Infobulles outils |

---

## 📋 Champs du Formulaire

| Champ | Type | Validation | Description |
|-------|------|------------|-------------|
| **Titre** | `Input` | Obligatoire, min 3 caractères | Nom de la note (header) |
| **Contenu** | `RichTextEditor` | Optionnel | Texte formaté (gras, listes, code...) |
| **Statut** | `Badge` | Auto | Brouillon → Publié |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `POST` | `/api/student/cards` | Créer une carte Note | `{ chapterId, title, content, cardType: "NOTE" }` |
| `PUT` | `/api/student/cards/:id` | Mettre à jour | `{ title, content }` |
| `DELETE` | `/api/student/cards/:id` | Supprimer | - |

---

## 🔄 Comportements

### ✨ Création (nouvelle carte)
- Champs vides
- Titre en focus automatique
- Bouton "Enregistrer" désactivé si titre < 3 caractères
- Statut = "Brouillon"

### 📝 Édition (carte existante)
- Champs pré-remplis avec contenu existant
- Indicateur "~X min de lecture" calculé en temps réel
- Changements non sauvegardés → alerte à la fermeture

### 💾 Sauvegarde
- `POST` (création) ou `PUT` (édition)
- Loading spinner pendant la requête
- Toast succès : "Note enregistrée"
- Toast erreur si échec
- Fermeture automatique de la modal

### 🗑️ Suppression
- Dialog de confirmation : "Supprimer cette note ?"
- `DELETE` vers l'API
- Retour à la liste des cartes du chapitre

---

## 🎨 États Visuels

| État | Apparence |
|------|-----------|
| **Vide** | Placeholder grisé dans l'éditeur |
| **En édition** | Texte normal, barre d'outils active |
| **Sauvegarde** | Bouton avec spinner, inputs désactivés |
| **Erreur** | Toast rouge, boutons réactivés |

---

## 🔑 Points Clés

- ✅ **Création perso** : L'élève crée ses propres Notes de zéro
- ✅ **Éditeur complet** : Accès à tous les outils de formatage
- ❌ **Pas d'accès aux notes du prof** : Lecture seule dans "Mes Cours"
- 🔗 **Liaison optionnelle** : Peut lier ses Notes à un cours du prof
- 🔓 **Isolation totale** : Ses Notes perso sont complètement séparées

---

**Mots-clés** : Éditeur, Note personnelle, Rich text, Tiptap, Révisions élève  
**Temps de lecture** : 4 minutes  
**Pages estimées** : 2
