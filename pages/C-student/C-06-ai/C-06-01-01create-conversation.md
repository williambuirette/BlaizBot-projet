# ➕ Modale : Nouvelle Conversation

> **Chemin de navigation** : Dashboard Student → Assistant IA → **[+ Nouvelle conversation]**  
> **Route** : `/student/ai` (modale)  
> **Rôle** : STUDENT  
> **Composant source** : `src/components/features/student/ai/CreateConversationModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Dashboard Student
   └── student/dashboard.md

2. Sidebar → Assistant IA
   └── student/ai/page.md

3. Clic [+ Nouvelle conversation]
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel

```
┌──────────────────────────────────────────────────────────────┐
│ Nouvelle conversation                                     ×  │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  Créez une conversation libre ou liée à un cours pour un    │
│  contexte personnalisé.                                      │
│                                                              │
│  Titre (optionnel)                                           │
│  ┌────────────────────────────────────────────────────────┐  │
│  │ Ex: Révision chapitre 3...                             │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                              │
│  Type de conversation                                        │
│  ┌────────────────────────────────────────────────────────┐  │
│  │ 💬 Conversation libre                              ▼   │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                              │
│                              ┌─────────┐  ┌─────────────┐   │
│                              │ Annuler │  │    Créer    │   │
│                              └─────────┘  └─────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `DialogHeader` | `@/components/ui/dialog` | En-tête avec titre |
| `DialogDescription` | `@/components/ui/dialog` | Sous-titre explicatif |
| `DialogContent` | `@/components/ui/dialog` | Corps du formulaire |
| `DialogFooter` | `@/components/ui/dialog` | Boutons Annuler/Créer |
| `Input` | `@/components/ui/input` | Champ titre |
| `Select` | `@/components/ui/select` | Type de conversation |
| `Button` | `@/components/ui/button` | Actions |

---

## 📋 Champs du Formulaire

| Champ | Type | Obligatoire | Validation | Description |
|-------|------|-------------|------------|-------------|
| **Titre** | `Input` | Non | Max 100 caractères | Nom de la conversation (auto-généré si vide) |
| **Type de conversation** | `Select` | ✅ Oui | - | Libre ou Lié à un cours |

---

## 📋 Types de Conversation

| Type | Icône | Description |
|------|-------|-------------|
| **Conversation libre** | 💬 | Discussion générale sans contexte spécifique |
| **Liée à un cours** | 📚 | Contexte basé sur le contenu d'un cours |

### Sélection "Liée à un cours"

```
┌────────────────────────────────────────────────────────────┐
│ Type de conversation                                       │
│ ┌────────────────────────────────────────────────────────┐ │
│ │ 📚 Liée à un cours                                 ▼   │ │
│ └────────────────────────────────────────────────────────┘ │
│                                                            │
│ Cours associé *                                            │
│ ┌────────────────────────────────────────────────────────┐ │
│ │ Sélectionner un cours...                           ▼   │ │
│ └────────────────────────────────────────────────────────┘ │
│                                                            │
│ 💡 L'IA utilisera le contenu du cours pour contextualiser  │
│    ses réponses.                                           │
└────────────────────────────────────────────────────────────┘
```

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `POST` | `/api/student/ai/conversations` | Créer conversation | `{ title?, type, courseId? }` |
| `GET` | `/api/student/courses` | Liste des cours (pour select) | - |

---

## 🔄 Comportements

### Affichage initial
- Titre vide (optionnel)
- Type par défaut : "Conversation libre"
- Bouton [Créer] activé

### Validation
- Titre optionnel (auto-généré si vide : "Nouvelle conversation [date]")
- Si "Liée à un cours" : Sélection cours obligatoire

### Actions

| Action | Résultat |
|--------|----------|
| **Clic [Créer]** | POST API → Toast succès → Fermeture modale → Ouverture conversation |
| **Clic [Annuler]** | Fermeture modale sans création |
| **Clic [×]** | Fermeture modale sans création |
| **Type = "Liée à un cours"** | Affiche select cours |

---

## 🎨 États Visuels

| État | Apparence |
|------|-----------|
| **Type libre** | 2 champs (Titre + Type) |
| **Type lié** | 3 champs (Titre + Type + Cours) |
| **Cours non sélectionné** | Bouton [Créer] désactivé |
| **Soumission** | Spinner dans bouton, champs désactivés |

---

## 🔑 Points Clés

- ✅ **2 types** : Conversation libre OU liée à un cours
- ✅ **Titre optionnel** : Auto-généré si non renseigné
- ✅ **Contexte cours** : IA utilise le contenu pour répondre
- ✅ **Création rapide** : Minimum de champs requis

---

**Navigation** :
- ← [Assistant IA](page.md) (page parente)

---

**Mots-clés** : Modale, Conversation, Création, Assistant IA, Contexte cours  
**Temps de lecture** : 2 minutes  
**Pages estimées** : 1
