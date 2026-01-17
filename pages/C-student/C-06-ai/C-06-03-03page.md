# 🤖 Assistant IA - Blaiz'bot Studio

> **Chemin de navigation** : Login → Dashboard Student → Sidebar → **Assistant IA**  
> **Route** : `/student/ai`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/ai/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Sidebar → Assistant IA
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Structure Générale

### Layout 2 colonnes

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                                   🔍 Rechercher...    👤 [Utilisateur]│
├────────────────────────────────┬─────────────────────────────────────────────┤
│                                │                                             │
│  Conversations            [📋] │  Blaiz'bot Studio                           │
│                                │  Assistant pédagogique                      │
│  ┌──────────────────────────┐  │                                             │
│  │   + Nouvelle conversation │  │                                             │
│  └──────────────────────────┘  │                                             │
│                                │                                             │
│  🔽 Filtres               [∨] │                                             │
│                                │                                             │
│  [Période]                     │              💬                             │
│  ┌──────────────────────────┐  │                                             │
│  │ ☐ [Titre conversation]   │  │     Bienvenue dans Blaiz'bot Studio         │
│  │   [Aperçu message...]  ⋯ │  │                                             │
│  └──────────────────────────┘  │  Sélectionne une conversation existante     │
│                                │  ou crée-en une nouvelle pour commencer     │
│  ┌──────────────────────────┐  │  à discuter avec ton assistant pédagogique. │
│  │ ☐ [Titre conversation]   │  │                                             │
│  │   [Aperçu message...]  ⋯ │  │  💡 Clique sur "Nouvelle conversation"      │
│  └──────────────────────────┘  │     dans la barre latérale                  │
│                                │                                             │
│                                │                                             │
│                                │                                             │
└────────────────────────────────┴─────────────────────────────────────────────┘

Légende :
├─ Colonne gauche  → Liste des conversations
├─ Colonne droite  → Zone de chat (vide ou conversation active)
├─ [📋]            → Actions sur les conversations
├─ ⋯               → Menu contextuel (renommer, supprimer)
└─ ☐               → Checkbox sélection
```

---

## 📸 État : Aucune Conversation Sélectionnée

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│  Blaiz'bot Studio                                                            │
│  Assistant pédagogique                                                       │
│                                                                              │
│                                                                              │
│                                                                              │
│                              💬                                              │
│                                                                              │
│                 Bienvenue dans Blaiz'bot Studio                              │
│                                                                              │
│          Sélectionne une conversation existante ou crée-en une               │
│          nouvelle pour commencer à discuter avec ton assistant               │
│                          pédagogique.                                        │
│                                                                              │
│           💡 Clique sur "Nouvelle conversation" dans la barre latérale       │
│                                                                              │
│                                                                              │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📸 État : Conversation Active

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ [Titre conversation]                        ⚙️ Configurer    × Fermer       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                                               ┌────────────────────┐  👤    │
│                                               │ [Suggestion rapide]│        │
│                                               └────────────────────┘        │
│                                                                              │
│  🤖 ┌────────────────────────────────────────────────────────────────────┐  │
│     │ [Message de l'assistant IA]                                        │  │
│     │                                                                    │  │
│     │ Contenu formaté avec mise en forme Markdown :                      │  │
│     │ • Listes                                                           │  │
│     │ • **Gras**, *italique*                                             │  │
│     │ • Code inline                                                      │  │
│     │                                                                    │  │
│     └────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
│                                               ┌────────────────────┐  👤    │
│                                               │ [Message utilisateur]      │
│                                               └────────────────────┘        │
│                                                                              │
│  🤖 ┌────────────────────────────────────────────────────────────────────┐  │
│     │ [Réponse de l'assistant...]                                        │  │
│     └────────────────────────────────────────────────────────────────────┘  │
│                                                                              │
├─────────────────────────────────────────────────────────────────────────────┤
│ 📎 🎤 │ Pose ta question...                                         │ ⚡ ➤ │
│       └──────────────────────────────────────────────────────────────────   │
│            Entrée pour envoyer · Shift+Entrée pour nouvelle ligne           │
└─────────────────────────────────────────────────────────────────────────────┘

Légende :
├─ 🤖        → Avatar assistant IA (violet)
├─ 👤        → Avatar utilisateur
├─ ⚙️        → Bouton Configurer (paramètres conversation)
├─ × Fermer  → Fermer la conversation (retour état vide)
├─ 📎        → Joindre un fichier
├─ 🎤        → Entrée vocale
├─ ⚡        → Actions rapides / suggestions
└─ ➤        → Envoyer le message
```

---

## 📸 Colonne Conversations (détail)

```
┌──────────────────────────────────┐
│ Conversations               [📋] │
├──────────────────────────────────┤
│                                  │
│ ┌──────────────────────────────┐ │
│ │   + Nouvelle conversation    │ │
│ └──────────────────────────────┘ │
│                                  │
│ 🔽 Filtres                  [∨]  │
│                                  │
│ [Période - ex: 7 derniers jours] │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ ☐ [Titre]                    │ │
│ │   🤖 [Aperçu dernier msg] ⋯  │ │
│ └──────────────────────────────┘ │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ ☑ [Titre] ← sélectionnée     │ │
│ │   🤖 [Aperçu dernier msg] ⋯  │ │
│ └──────────────────────────────┘ │
│                                  │
└──────────────────────────────────┘

Légende carte conversation :
├─ ☐/☑     → Checkbox sélection
├─ Titre   → Nom de la conversation
├─ 🤖      → Icône IA + aperçu dernier message
└─ ⋯       → Menu (Renommer, Supprimer)
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Card` | `@/components/ui/card` | Cartes conversations |
| `Button` | `@/components/ui/button` | Actions (Nouvelle, Configurer, Fermer) |
| `Input` | `@/components/ui/input` | Zone de saisie message |
| `Checkbox` | `@/components/ui/checkbox` | Sélection conversations |
| `ScrollArea` | `@/components/ui/scroll-area` | Zone scrollable messages |
| `Avatar` | `@/components/ui/avatar` | Avatars IA et utilisateur |
| `DropdownMenu` | `@/components/ui/dropdown-menu` | Menu contextuel (⋯) |
| `Collapsible` | `@/components/ui/collapsible` | Section filtres pliable |
| `Tooltip` | `@/components/ui/tooltip` | Infobulles actions |

---

## 🔍 Filtres Conversations

| Filtre | Description |
|--------|-------------|
| **Période** | Groupement par date (Aujourd'hui, 7 derniers jours, Ce mois, Plus ancien) |
| **Type** | Conversation libre / Liée à un cours |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| `GET` | `/api/student/ai/conversations` | Liste des conversations |
| `GET` | `/api/student/ai/conversations/:id` | Messages d'une conversation |
| `POST` | `/api/student/ai/conversations` | Créer une conversation |
| `POST` | `/api/student/ai/conversations/:id/messages` | Envoyer un message |
| `PUT` | `/api/student/ai/conversations/:id` | Renommer |
| `DELETE` | `/api/student/ai/conversations/:id` | Supprimer |

---

## 🔄 Comportements

### Liste des conversations
- Groupement par période temporelle
- Aperçu du dernier message (tronqué)
- Menu contextuel (⋯) : Renommer, Supprimer
- Clic → Ouvre la conversation dans la zone droite

### Zone de chat
- Messages alternés (IA à gauche, User à droite)
- Scroll automatique vers le dernier message
- Formatage Markdown dans les réponses IA
- Suggestions rapides en haut à droite

### Barre d'input
- Envoi : Entrée ou clic ➤
- Nouvelle ligne : Shift+Entrée
- Attachement fichier (📎)
- Entrée vocale (🎤)
- Actions rapides (⚡)

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Clic [+ Nouvelle conversation]** | Ouvre modale création |
| **Clic sur conversation** | Charge le fil de messages |
| **Clic [Configurer]** | Ouvre paramètres conversation |
| **Clic [Fermer]** | Retour à l'état vide |
| **Clic [⋯]** | Menu (Renommer, Supprimer) |
| **Entrée dans input** | Envoie le message |
| **Clic [📎]** | Joindre un fichier |

---

## 🔑 Points Clés

- ✅ **Layout 2 colonnes** : Liste conversations + Zone chat
- ✅ **État vide** : Message de bienvenue avec CTA
- ✅ **Chat interactif** : Messages formatés Markdown
- ✅ **Suggestions rapides** : Aide contextuelle
- ✅ **Actions fichier/vocal** : Attachement et dictée
- ✅ **Groupement temporel** : Organisation des conversations

---

## 📂 Fichiers Liés

| Fichier | Description |
|---------|-------------|
| [create-conversation.md](create-conversation.md) | Modale : Nouvelle conversation |

---

**Navigation** :
- ← [Dashboard](../dashboard.md)
- ↔ [Mes Cours](../courses/liste.md)
- ↔ [Messages](../messages/page.md)

---

**Mots-clés** : Assistant IA, Chat, Blaiz'bot Studio, Conversations, Pédagogie  
**Temps de lecture** : 4 minutes  
**Pages estimées** : 2

