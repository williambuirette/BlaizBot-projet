# Messages

> **Chemin de navigation** : Login → Dashboard Teacher → Sidebar → **Messages**  
> **Route** : `/teacher/messages`  
> **Rôle** : TEACHER  
> **Composant source** : `src/app/(dashboard)/teacher/messages/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Sidebar → Messages
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel

### Layout global (2 colonnes)

```
┌─────────────────────────────────────────────────────────────────────────┐
│ [Sidebar]  │  Panneau Conversations    │  Panneau Message              │
├────────────┼───────────────────────────┼───────────────────────────────┤
│            │                           │                               │
│ Dashboard  │  💬 Messages              │  [État vide ou conversation]  │
│ Classes    │  + Nouvelle conversation  │                               │
│ Élèves     │                           │                               │
│ Cours      │  🔍 Filtres:              │                               │
│ Agendas    │  - Date (du/au)           │                               │
│ Messages ● │  - Matières               │                               │
│            │  - Cours                  │                               │
│            │  - Recherche              │                               │
│            │                           │                               │
│            │  👤 Conversations privées │                               │
│            │  - La photosynthèse (2)   │                               │
│            │  - autre                  │                               │
│            │                           │                               │
│            │  👥 Conversations classe  │                               │
│            │  - La photosynthèse (3)   │                               │
│            │  ...                      │                               │
│            │                           │                               │
└────────────┴───────────────────────────┴───────────────────────────────┘
```

### État vide (aucune conversation sélectionnée)

```
┌───────────────────────────────────────────────────────────┐
│                                                           │
│                          💬                               │
│                                                           │
│              Sélectionnez une conversation                │
│   Choisissez une conversation dans la liste ou           │
│              démarrez-en une nouvelle                     │
│                                                           │
└───────────────────────────────────────────────────────────┘
```

### État actif (conversation ouverte)

```
┌───────────────────────────────────────────────────────────┐
│  ← [Retour]  SVT                          👤 2 participants│
│              Personel                                      │
│              Conversation créée le 14/01/2026 16:19        │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  👤 Test de message interaction professeur élève         │
│     Lucas MARTIN  Il y a 3 jours                          │
│                                                           │
│                                                           │
│                                                           │
│                                                           │
├───────────────────────────────────────────────────────────┤
│  ✏️  Écrivez votre message...                        [→]  │
└───────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `ResizablePanels` | `@/components/ui/resizable` | Layout 2 colonnes redimensionnables |
| `Button` | `@/components/ui/button` | Bouton "+ Nouvelle conversation" |
| `Accordion` | `@/components/ui/accordion` | Section "Conversations" expandable |
| `DatePicker` | `@/components/ui/date-picker` | Filtres date (du/au) |
| `Select` | `@/components/ui/select` | Filtres matières et cours |
| `Input` | `@/components/ui/input` | Barre de recherche + input message |
| `Avatar` | `@/components/ui/avatar` | Icônes conversations (👤 privé, 👥 groupe) |
| `Badge` | `@/components/ui/badge` | Compteur participants, tag type |
| `ScrollArea` | `@/components/ui/scroll-area` | Zone messages scrollable |
| `Separator` | `@/components/ui/separator` | Séparation entre messages |
| `EmptyState` | Custom | État vide avec icône 💬 |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/teacher/conversations` | Récupérer toutes les conversations | Query params : filters |
| `GET` | `/api/teacher/conversations/[id]` | Récupérer une conversation + messages | - |
| `POST` | `/api/teacher/conversations` | Créer nouvelle conversation | `{ participants, type, subject? }` |
| `POST` | `/api/teacher/conversations/[id]/messages` | Envoyer un message | `{ content, attachments? }` |
| `PATCH` | `/api/teacher/conversations/[id]` | Marquer comme lu | `{ lastReadAt }` |

---

## 💾 Types & Interfaces

```typescript
interface Conversation {
  id: string;
  type: 'PRIVATE' | 'GROUP';
  title: string; // Nom du cours ou "Personel"
  participants: {
    id: string;
    name: string;
    role: 'TEACHER' | 'STUDENT';
    avatar?: string;
  }[];
  lastMessage?: {
    content: string;
    sender: string;
    sentAt: Date;
  };
  unreadCount: number;
  createdAt: Date;
  courseId?: string;
  subjectId?: string;
}

interface Message {
  id: string;
  conversationId: string;
  senderId: string;
  senderName: string;
  senderRole: 'TEACHER' | 'STUDENT';
  content: string;
  attachments?: {
    id: string;
    name: string;
    url: string;
    type: string;
  }[];
  sentAt: Date;
  readBy: string[];
}

interface ConversationFilters {
  dateFrom?: Date;
  dateTo?: Date;
  subjectId?: string;
  courseId?: string;
  searchQuery?: string;
}
```

---

## 📋 Structure de la Page

### Panneau Gauche : Liste des Conversations

**Header** :
- Titre : "Messages"
- Sous-titre : "Communiquez avec vos élèves"
- Bouton : "+ Nouvelle conversation" (top right)

**Filtres** :
- **Conversations** (Accordion expandable)
  - Conversations personnelles uniquement
  - Année scolaire : `2025-2026`
- **Filtre par date** : 2 DatePickers (Du / Au)
- **Toutes les matières** : Select dropdown
- **Tous les cours** : Select dropdown
- **Recherche** : Input avec icône 🔍

**Sections de conversations** :

1. **👤 Conversations privées** (X)
   - Liste des conversations 1-to-1 avec élèves
   - Format : Avatar, Nom conversation, Participants, Preview message, Timestamp
   - Actions : Pin, Delete (icônes)

2. **👥 Conversations de classe** (X)
   - Conversations de groupe liées à un cours
   - Format : Avatar groupe, Nom cours, X élèves, Preview, Timestamp
   - Badge : Tag matière

**Item de conversation** :
```
┌─────────────────────────────────────────────────┐
│ 👤  La photosynthèse                        📌 🗑│
│     👤 Personel  📚 La photosynthèse            │
│     Test de message interaction professeur...  │
│     Créée le 14/01/2026 16:10                   │
└─────────────────────────────────────────────────┘
```

### Panneau Droit : Zone de Message

#### État vide
- Icône : 💬 (grande taille)
- Titre : "Sélectionnez une conversation"
- Sous-titre : "Choisissez une conversation dans la liste ou démarrez-en une nouvelle"

#### État actif (conversation sélectionnée)

**Header** :
- Bouton retour : `←`
- Titre : Nom du cours ou "SVT"
- Type : "Personel" ou "Groupe"
- Info : "Conversation créée le [date]"
- Compteur participants : 👤 X participants

**Zone messages** :
- ScrollArea avec messages
- Format message :
  - Avatar expéditeur
  - Nom + Rôle
  - Contenu
  - Timestamp relatif (Il y a X jours)
- Messages regroupés par jour

**Input** :
- Textarea : "Écrivez votre message..."
- Bouton attachment : 📎 (optionnel)
- Bouton envoyer : → (actif si texte non vide)

---

## 🔄 Comportements

### Affichage initial
- Panneau conversations visible
- Panneau message : état vide
- Filtres par défaut : Année en cours, toutes matières/cours
- Tri : Dernière activité (DESC)

### Sélection conversation
- Clic sur item → Charge les messages
- Marque comme lu automatiquement
- Affiche header conversation + messages + input
- Scroll automatique vers dernier message

### Envoi message
1. Saisie texte dans input
2. Bouton → activé
3. Clic → POST API
4. Message ajouté en bas
5. Scroll automatique
6. Input vidé

### Filtrage
- Changement filtre → Recharge liste conversations
- Recherche : debounce 300ms
- Date : filtre sur `lastMessage.sentAt`
- Matières/Cours : filtre sur `subjectId`/`courseId`

### Nouvelle conversation
- Clic "+ Nouvelle conversation"
- Modale : Sélection participants (élèves/classes)
- Choix type : Privé ou Groupe
- Lien cours optionnel
- Création → Ouvre conversation

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Cliquer conversation** | Charge messages, marque comme lu |
| **Écrire message** | Active bouton envoyer |
| **Envoyer message** | POST API → Ajout message → Scroll → Clear input |
| **Filtrer par date** | Recharge liste filtrée |
| **Rechercher** | Filtre conversations par nom/contenu |
| **Nouvelle conversation** | Ouvre modale création |
| **Pin conversation** | Épingle en haut de liste |
| **Supprimer conversation** | Confirmation → Suppression |
| **Joindre fichier** | Upload → Preview → Envoi avec message |

---

## 🎯 Règles de Validation

### Envoi message
```typescript
if (!content.trim()) {
  return "Le message ne peut pas être vide";
}

if (content.length > 5000) {
  return "Message trop long (max 5000 caractères)";
}
```

### Nouvelle conversation
```typescript
if (participants.length === 0) {
  return "Sélectionnez au moins un participant";
}

if (type === 'GROUP' && participants.length < 2) {
  return "Une conversation de groupe nécessite au moins 2 participants";
}
```

---

## 📊 Récapitulatif Technique

**Type de page** : Messagerie temps réel (polling ou WebSocket)  
**Layout** : 2 colonnes redimensionnables (ResizablePanels)  
**États** : Vide | Liste | Conversation active  
**Filtres** : Date, Matières, Cours, Recherche  
**Temps réel** : Polling toutes les 10s ou WebSocket pour nouveaux messages  

**Performance** :
- Pagination conversations : 20 par page
- Chargement messages : 50 derniers initialement
- Infinite scroll pour historique

---

*Fichier créé le 13 décembre 2025*

