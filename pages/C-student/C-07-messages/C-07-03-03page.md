# 💬 Messages - Élève

> **Chemin de navigation** : Login → Dashboard Student → Sidebar → **Messages**  
> **Route** : `/student/messages`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/messages/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Sidebar → Messages
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel - Structure Générale

### Layout 2 colonnes

```
┌──────────────────────────────────────────────────────────────────────────────┐
│ Dashboard                                   🔍 Rechercher...    👤 Lucas MARTIN│
├────────────────────────────────┬─────────────────────────────────────────────┤
│                                │                                             │
│  💬 Messages          [+ Nouvelle conversation]                              │
│                                │                                             │
├────────────────────────────────┤                                             │
│                                │                                             │
│  🗨️ Conversations         [∧] │              💬                              │
│                                │                                             │
│  ☐ Conversations personnelles │     Sélectionnez une conversation            │
│     uniquement                 │                                             │
│                                │  Choisissez une conversation dans la        │
│  ┌──────────────────────────┐  │  liste ou écrivez à un professeur           │
│  │ 2025-2026            ▼   │  │                                             │
│  └──────────────────────────┘  │                                             │
│                                │                                             │
│  Filtrer par date              │                                             │
│  ┌───────────┐ ┌───────────┐   │                                             │
│  │jj.mm.aaaa📅│ │jj.mm.aaaa📅│  │                                             │
│  └───────────┘ └───────────┘   │                                             │
│                                │                                             │
│  ┌──────────────────────────┐  │                                             │
│  │ Toutes les matières  ▼   │  │                                             │
│  └──────────────────────────┘  │                                             │
│                                │                                             │
│  ┌──────────────────────────┐  │                                             │
│  │ Tous les cours       ▼   │  │                                             │
│  └──────────────────────────┘  │                                             │
│                                │                                             │
│  ┌──────────────────────────┐  │                                             │
│  │ 🔍 Rechercher...         │  │                                             │
│  └──────────────────────────┘  │                                             │
│                                │                                             │
│  ─────────────────────────────│                                             │
│                                │                                             │
│  ∨ 👥 Conversations privées  2 │                                             │
│                                │                                             │
│  ┌──────────────────────────┐  │                                             │
│  │ 👤 [Titre conversation]   │ 5j│                                            │
│  │ 0  👤 Personnel 📚 [Cours] │  │                                             │
│  │    [Dernier message...]   │  │                                             │
│  │    Créée le jj/mm/aaaa    │  │                                             │
│  └──────────────────────────┘  │                                             │
│                                │                                             │
└────────────────────────────────┴─────────────────────────────────────────────┘

Légende :
├─ Colonne gauche  → Liste des conversations + Filtres
├─ Colonne droite  → Zone de chat (vide ou conversation active)
├─ [∧]             → Collapsible section filtres
├─ 5j              → Ancienneté du dernier message
└─ 👤0             → Avatar avec indicateur non-lu
```

---

## 📸 État : Aucune Conversation Sélectionnée

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│                                                                              │
│                                                                              │
│                              💬                                              │
│                                                                              │
│                 Sélectionnez une conversation                                │
│                                                                              │
│          Choisissez une conversation dans la liste                           │
│                  ou écrivez à un professeur                                  │
│                                                                              │
│                                                                              │
│                                                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📸 État : Conversation Ouverte

```
┌─────────────────────────────────────────────────────────────────────────────┐
│ ←  👤  [Titre conversation]       📚 Lié au cours                           │
│        Personnel                                                             │
│        Conversation créée le jj/mm/aaaa hh:mm                                │
│        👥 X participants  ∨                                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                              │
│                                                                              │
│  👤 ┌────────────────────────────────────────────────────────────────────┐  │
│     │ [Contenu du message]                                               │  │
│     └────────────────────────────────────────────────────────────────────┘  │
│     [Nom Expéditeur]  il y a X jours                                        │
│                                                                              │
│                                                                              │
│                                               ┌────────────────────┐  👤    │
│                                               │ [Réponse utilisateur]│       │
│                                               └────────────────────┘        │
│                                                           Moi  il y a X min │
│                                                                              │
│                                                                              │
├─────────────────────────────────────────────────────────────────────────────┤
│ 📎 │ Écrivez votre message...                                          │ ➤ │
└─────────────────────────────────────────────────────────────────────────────┘

Légende :
├─ ←           → Bouton retour (ferme la conversation)
├─ 👤          → Avatar participant
├─ 📚 Lié au cours → Badge si conversation liée à un cours
├─ Personnel   → Badge type (Personnel / Groupe)
├─ 👥 X participants → Liste déroulante des participants
├─ 📎          → Joindre un fichier
└─ ➤          → Envoyer le message
```

---

## 📸 Colonne Conversations (détail)

```
┌──────────────────────────────────┐
│ 🗨️ Conversations            [∧] │
├──────────────────────────────────┤
│                                  │
│ ☐ Conversations personnelles     │
│   uniquement                     │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ 2025-2026                 ▼  │ │
│ └──────────────────────────────┘ │
│                                  │
│ Filtrer par date                 │
│ ┌────────────┐ ┌────────────┐   │
│ │jj.mm.aaaa 📅│ │jj.mm.aaaa 📅│  │
│ └────────────┘ └────────────┘   │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ Toutes les matières      ▼  │ │
│ └──────────────────────────────┘ │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ Tous les cours           ▼  │ │
│ └──────────────────────────────┘ │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ 🔍 Rechercher...             │ │
│ └──────────────────────────────┘ │
│                                  │
│ ────────────────────────────────│
│                                  │
│ ∨ 👥 Conversations privées    2 │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ 👤 [Titre]                 5j │ │
│ │ 0  👤 Personnel 📚 [Cours]   │ │
│ │    [Aperçu dernier msg]      │ │
│ │    Créée le jj/mm/aaaa hh:mm │ │
│ └──────────────────────────────┘ │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ 👤 [Titre]                 5j │ │
│ │ 0  👤 Personnel              │ │
│ │    [Aperçu dernier msg]      │ │
│ │    Créée le jj/mm/aaaa hh:mm │ │
│ └──────────────────────────────┘ │
│                                  │
└──────────────────────────────────┘

Légende carte conversation :
├─ 👤0         → Avatar + compteur non-lus
├─ [Titre]     → Titre de la conversation
├─ 5j          → Ancienneté (jours/heures/minutes)
├─ Personnel   → Badge type
├─ 📚 [Cours]  → Badge cours lié (si applicable)
├─ [Aperçu]    → Début du dernier message (tronqué)
└─ Créée le... → Date de création
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Card` | `@/components/ui/card` | Cartes conversation |
| `Button` | `@/components/ui/button` | Actions (Nouvelle conversation, Envoyer) |
| `Input` | `@/components/ui/input` | Zone de saisie message, Recherche |
| `Checkbox` | `@/components/ui/checkbox` | Filtre "Personnelles uniquement" |
| `Select` | `@/components/ui/select` | Filtres (Année, Matière, Cours) |
| `DatePicker` | `@/components/ui/date-picker` | Filtrer par date (début/fin) |
| `ScrollArea` | `@/components/ui/scroll-area` | Zone scrollable messages |
| `Avatar` | `@/components/ui/avatar` | Avatars participants |
| `Badge` | `@/components/ui/badge` | Personnel, Lié au cours |
| `Collapsible` | `@/components/ui/collapsible` | Section filtres pliable |
| `Tooltip` | `@/components/ui/tooltip` | Infobulles |

---

## 🔍 Filtres Conversations

| Filtre | Type | Description |
|--------|------|-------------|
| **Personnelles uniquement** | `Checkbox` | Masque les conversations de groupe |
| **Année scolaire** | `Select` | 2024-2025, 2025-2026, etc. |
| **Filtrer par date** | `DatePicker` x2 | Plage de dates (début - fin) |
| **Toutes les matières** | `Select` | Filtrer par matière |
| **Tous les cours** | `Select` | Filtrer par cours lié |
| **Rechercher** | `Input` | Recherche textuelle (titre, contenu) |

---

## 📊 Groupes de Conversations

| Groupe | Icône | Description |
|--------|-------|-------------|
| **Conversations privées** | 👥 | Échanges 1-à-1 ou petits groupes |
| **Conversations de cours** | 📚 | Liées à un cours spécifique |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| `GET` | `/api/student/messages/conversations` | Liste des conversations |
| `GET` | `/api/student/messages/conversations/:id` | Messages d'une conversation |
| `POST` | `/api/student/messages/conversations` | Créer une conversation |
| `POST` | `/api/student/messages/conversations/:id/messages` | Envoyer un message |
| `PUT` | `/api/student/messages/conversations/:id/read` | Marquer comme lu |
| `POST` | `/api/student/messages/conversations/:id/files` | Envoyer fichier |

---

## 🔄 Comportements

### Liste des conversations
- Groupement par type (Privées, Cours)
- Compteur de non-lus sur chaque carte
- Tri par date de dernier message (récent en haut)
- Filtrage multi-critères
- Recherche dans titre et contenu

### Zone de chat
- Messages alternés (autres à gauche, moi à droite)
- Scroll automatique vers le dernier message
- Affichage de l'heure relative (il y a X jours/heures/min)
- Liste des participants déroulante
- Badge "Lié au cours" si applicable

### Barre d'input
- Envoi : Entrée ou clic ➤
- Attachement fichier (📎)
- Placeholder : "Écrivez votre message..."

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Clic [+ Nouvelle conversation]** | Ouvre modale création |
| **Clic sur conversation** | Charge le fil de messages |
| **Clic [←]** | Ferme la conversation (retour état vide) |
| **Clic [👥 X participants]** | Déroule la liste des participants |
| **Entrée dans input** | Envoie le message |
| **Clic [📎]** | Ouvre sélecteur de fichier |
| **Modification filtre** | Actualise la liste |

---

## 🔑 Points Clés

- ✅ **Layout 2 colonnes** : Liste conversations + Zone chat
- ✅ **État vide** : Message invitant à sélectionner ou créer
- ✅ **Filtres avancés** : Année, dates, matière, cours, recherche
- ✅ **Badges visuels** : Personnel, Lié au cours
- ✅ **Participants** : Liste déroulante dans l'en-tête
- ✅ **Non-lus** : Compteur sur chaque carte conversation

---

## 📂 Fichiers Liés

| Fichier | Description |
|---------|-------------|
| [create-conversation.md](create-conversation.md) | Modale : Nouvelle conversation |

---

**Navigation** :
- ← [Dashboard](../dashboard.md)
- ↔ [Mes Cours](../courses/liste.md)
- ↔ [Assistant IA](../ai/page.md)

---

**Mots-clés** : Messages, Conversations, Chat, Élève, Professeur, Communication  
**Temps de lecture** : 5 minutes  
**Pages estimées** : 3

