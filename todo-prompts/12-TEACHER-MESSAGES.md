# Phase 12 — Teacher : Messagerie

> Système complet de messagerie professeur ↔ élèves avec conversations privées, groupes et classes, pièces jointes, et filtrage par matière/cours.

---

## Vue d'ensemble

Cette phase implémente le système de messagerie pour le professeur :
- **3 types de conversations** : privée (1 élève), groupe (plusieurs élèves), classe entière
- **Layout responsive** avec panneau redimensionnable (desktop) ou stack (mobile)
- **Filtres avancés** par année scolaire, matière, cours, type
- **Pièces jointes** avec upload et téléchargement
- **Notifications** automatiques aux destinataires
- **Marquage lu/non-lu** via MessageReadStatus

---

## Tâche 12.1 — Types messages

### Contexte
Le module messages utilise des types spécifiques : Participant, LastMessage, CourseRef, Conversation. Les conversations sont catégorisées (private, group, class) avec des configs visuelles.

### Description
Créer types.ts avec tous les types partagés et les helpers de catégorisation.

### Prompt
```
Crée src/components/features/messages/types.ts :

INTERFACES :
Participant { id, firstName, lastName, role: string, isCurrentUser?: boolean }
LastMessage { id, content, senderId, senderName, createdAt: string }
CourseRef { id, title, Subject?: { id, name } | null }

Conversation {
  id, type: 'PRIVATE' | 'CLASS_GENERAL' | 'CLASS_TOPIC'
  topicName: string | null
  subject: { id, name } | null
  course?: CourseRef | null
  participants: Participant[]
  lastMessage: LastMessage | null
  createdAt, updatedAt: string
  schoolYear?: string
  unreadCount?: number
  creatorId?: string | null
}

type Category = 'private' | 'group' | 'class'

CONSTANTE categoryConfig: Record<Category, { label, icon: LucideIcon, color, bgColor }> :
- private: { label: 'Conversations privées', icon: User, color: 'text-blue-600', bgColor: 'bg-blue-100' }
- group: { label: 'Conversations de groupe', icon: Users, color: 'text-green-600', bgColor: 'bg-green-100' }
- class: { label: 'Conversations de classe', icon: School, color: 'text-purple-600', bgColor: 'bg-purple-100' }

HELPER getConversationCategory(conv: Conversation): Category :
- Compter students = participants.filter(p => !p.isCurrentUser && p.role === 'STUDENT')
- Si students.length === 1 → 'private'
- Si type === 'CLASS_GENERAL' ou 'CLASS_TOPIC' → 'class'
- Sinon → 'group'

HELPER getCurrentSchoolYear(): string :
- Si mois >= août → `${year}-${year+1}` sinon `${year-1}-${year}`

Exporter tous les types et helpers.
```

---

## Tâche 12.2 — Types nouvelle conversation

### Contexte
Le dialog de nouvelle conversation utilise des types spécifiques pour les options de sélection (classe, élève, cours) et le type de conversation.

### Description
Créer new-conversation/types.ts avec les types du dialog.

### Prompt
```
Crée src/components/features/messages/new-conversation/types.ts :

type ConversationType = 'individual' | 'group' | 'class'

interface ClassOption {
  id: string
  name: string
  level: string
  studentsCount: number
}

interface StudentOption {
  id: string
  userId: string  // ID du User (pour envoi message)
  firstName: string
  lastName: string
  email: string
}

interface CourseOption {
  id: string
  title: string
}

Exporter tous les types.
```

---

## Tâche 12.3 — Hooks nouvelle conversation

### Contexte
Le dialog charge dynamiquement les classes, élèves et cours du professeur via des hooks dédiés. Les élèves sont chargés en cascade quand une classe est sélectionnée.

### Description
Créer new-conversation/hooks.ts avec useClasses, useStudents, useCourses.

### Prompt
```
Crée src/components/features/messages/new-conversation/hooks.ts :

HOOK useClasses(open: boolean) :
- Si open → fetch /api/teacher/classes
- Retourne { classes: ClassOption[], loading: boolean }
- Toast.error si erreur

HOOK useStudents(classId: string) :
- Si classId → fetch /api/teacher/classes/${classId}/students
- Sinon → vider la liste
- Retourne { students: StudentOption[], loading: boolean }
- Toast.error si erreur

HOOK useCourses(open: boolean) :
- Si open → fetch /api/teacher/courses
- Parser response.data?.courses ou response.courses
- Mapper vers { id, title }
- Retourne { courses: CourseOption[], loading: boolean }

Utiliser setTimeout(fetch, 100) pour éviter les appels simultanés au mount.
```

---

## Tâche 12.4 — Sous-composants nouvelle conversation

### Contexte
Le dialog est décomposé en sous-composants réutilisables : TypeSelector (radio individual/group/class), StudentList (liste avec checkboxes), ContextSection (cours optionnel).

### Description
Créer TypeSelector.tsx, StudentList.tsx, ContextSection.tsx + barrel export.

### Prompt
```
Crée src/components/features/messages/new-conversation/ :

1. TypeSelector.tsx :
Props : value: ConversationType, onChange(type)
UI : RadioGroup horizontal avec 3 options :
- individual : "Un élève" (User icon)
- group : "Groupe" (Users icon)
- class : "Classe entière" (School icon)
Chaque option est une Card cliquable avec état selected

2. StudentList.tsx :
Props : students: StudentOption[], selectedIds: string[], onToggle(id), type: ConversationType, loading: boolean
UI :
- Si loading → Loader2 spinner
- Si type === 'class' → Badge "Tous les élèves ({count})"
- Sinon → ScrollArea avec liste checkboxes, checkbox "Tout sélectionner" en header

3. ContextSection.tsx :
Props : courses: CourseOption[], selectedCourse: string, onCourseChange(id), topicName: string, onTopicNameChange(name), loading: boolean
UI :
- Select "Lier à un cours (optionnel)" avec options courses + "Aucun"
- Input "Sujet / Titre de la conversation" (optionnel)

4. index.ts :
export * from './types'
export * from './hooks'
export { TypeSelector } from './TypeSelector'
export { StudentList } from './StudentList'
export { ContextSection } from './ContextSection'
```

---

## Tâche 12.5 — NewConversationDialog

### Contexte
Le dialog orchestre la création d'une nouvelle conversation : sélection type, classe, élèves, cours optionnel, message initial. À la soumission, POST vers l'API puis callback avec l'ID de la nouvelle conversation.

### Description
Créer NewConversationDialog.tsx avec le formulaire complet.

### Prompt
```
Crée src/components/features/messages/NewConversationDialog.tsx :

PROPS : onConversationCreated?(conversationId: string)

ÉTATS :
open: boolean, type: ConversationType = 'individual'
selectedClass: string, selectedCourse: string = 'none'
selectedStudents: string[], message: string, topicName: string
submitting: boolean

HOOKS :
useClasses(open), useStudents(selectedClass), useCourses(open)

EFFET : Reset selectedStudents quand type change

VALIDATION canSubmit :
- message.trim() non vide
- selectedClass non vide
- Si type !== 'class' → selectedStudents.length > 0

HANDLER handleStudentToggle(userId) :
- Si type === 'individual' → setSelectedStudents([userId]) (mono-sélection)
- Sinon → toggle dans le tableau

HANDLER handleSubmit() :
1. Valider message et destinataires
2. Calculer recipientIds :
   - Si type === 'class' → tous les students.map(s => s.userId)
   - Sinon → selectedStudents
3. Construire topicName final :
   - "Classe {name}" si class
   - "Groupe - X élèves" si group
   - Ajouter " - {courseName}" si cours sélectionné
4. POST /api/teacher/messages avec { receiverIds, content: message, topicName, courseId }
5. Toast success, fermer dialog, appeler onConversationCreated(conversationId)

UI Dialog :
- DialogTrigger : Button "Nouvelle conversation" avec Plus icon
- DialogContent max-w-2xl avec overflow scroll :
  - TypeSelector
  - Select "Classe" (required)
  - StudentList (si selectedClass)
  - ContextSection (cours + topicName)
  - Textarea "Message" (required)
- DialogFooter : Button "Envoyer" avec loading state
```

---

## Tâche 12.6 — ConversationItem

### Contexte
Chaque conversation dans la liste est affichée dans un item avec : avatar, nom, dernier message, date, badge non-lu, menu contextuel (supprimer si créateur).

### Description
Créer ConversationItem.tsx avec affichage et actions.

### Prompt
```
Crée src/components/features/messages/ConversationItem.tsx :

PROPS :
conversation: Conversation, isSelected: boolean, onClick()
currentUserId: string, onDelete?(id)

COMPUTED :
- displayName : topicName ou "Prénom Nom" du premier participant non-currentUser
- lastMessagePreview : truncate à 50 chars
- timeAgo : formatDistanceToNow(lastMessage.createdAt) en français
- canDelete : conversation.creatorId === currentUserId

UI Card (cliquable) :
- État selected : border-primary bg-primary/5
- Flex avec :
  - Avatar (initiales ou icône selon type)
  - Div flex-1 :
    - Ligne 1 : displayName (font-medium truncate) + timeAgo (text-xs text-muted)
    - Ligne 2 : lastMessagePreview (text-sm text-muted truncate)
  - Badge unreadCount si > 0 (bg-primary text-white rounded-full)
  - DropdownMenu (MoreHorizontal) si onDelete :
    - "Supprimer" (Trash2 icon, text-red) avec AlertDialog confirmation

AlertDialog :
- Titre : "Supprimer cette conversation ?"
- Description : "Cette action est irréversible."
- Actions : Annuler / Supprimer
```

---

## Tâche 12.7 — ConversationsList

### Contexte
La liste des conversations affiche les conversations groupées par catégorie (private/group/class), avec des filtres par recherche, année scolaire, matière, cours, et un toggle "personnel uniquement".

### Description
Créer ConversationsList.tsx avec filtres et groupement.

### Prompt
```
Crée src/components/features/messages/ConversationsList.tsx :

PROPS :
conversations: Conversation[], selectedId: string | null, onSelect(conv)
currentUserId: string, onDelete?(id)
availableSubjects?: SubjectOption[], availableCourses?: CourseOption[]

ÉTATS filtres :
search: string, selectedYear: string = getCurrentSchoolYear()
selectedSubjectId: string = 'all', selectedCourseId: string = 'all'
showPersonalOnly: boolean = false, filtersCollapsed: boolean = false
openCategories: Record<Category, boolean> = { private: true, group: true, class: true }

COMPUTED availableYears :
Extraire les années uniques des conversations + année courante, trier desc

COMPUTED availableSubjects/Courses :
Utiliser propSubjects/propCourses si fournis, sinon extraire des conversations
Filtrer courses par matière sélectionnée

COMPUTED filteredConversations :
Appliquer tous les filtres séquentiellement :
- showPersonalOnly → category === 'private'
- selectedYear → conv.schoolYear === selectedYear
- dateRange → createdAt dans la plage
- selectedSubjectId → conv.subject.id match
- selectedCourseId → conv.course.id match
- search → match dans participants names ou topicName

COMPUTED groupedByCategory :
Grouper filteredConversations par getConversationCategory()

UI Card :
- CardHeader avec titre "Conversations" + badge count
- Collapsible filtres :
  - Input recherche (Search icon)
  - Select année scolaire
  - Select matière (si availableSubjects)
  - Select cours (si availableCourses, filtré par matière)
  - Checkbox "Personnel uniquement"
- ScrollArea avec :
  - Pour chaque catégorie (private, group, class) :
    - Collapsible avec header (icône + label + count)
    - Liste ConversationItem
  - Message vide si aucune conversation
```

---

## Tâche 12.8 — ResizablePanelLayout

### Contexte
Sur desktop, la page messages utilise un layout avec panneau gauche (liste) redimensionnable et panneau droit (thread). Le panneau peut être collapsed.

### Description
Créer ResizablePanelLayout.tsx avec drag-to-resize et collapse.

### Prompt
```
Crée src/components/features/messages/ResizablePanelLayout.tsx :

PROPS :
sidebar: ReactNode, content: ReactNode
defaultSidebarSize?: number = 35 (%)
minSidebarSize?: number = 20, maxSidebarSize?: number = 45
isMobile?: boolean = false
isCollapsed?: boolean, onCollapsedChange?(collapsed)

ÉTATS :
sidebarWidth: number = defaultSidebarSize
isResizing: boolean = false

REF containerRef pour calculer les dimensions

LOGIQUE RESIZE :
- handleMouseDown : e.preventDefault(), setIsResizing(true)
- useEffect avec mousemove/mouseup listeners quand isResizing :
  - Calculer newWidth = ((e.clientX - containerRect.left) / containerRect.width) * 100
  - Clamper entre min et max
  - Cleanup : restore cursor et userSelect

UI MOBILE (isMobile) :
Flex column avec gap-4, sidebar puis content

UI COLLAPSED :
Flex avec bouton ChevronRight pour réouvrir, puis content pleine largeur

UI NORMAL :
Flex avec :
- Div sidebar avec width: sidebarWidth%
- Div handle (GripVertical) avec cursor: col-resize, onMouseDown
- Div content flex-1

Appliquer transition sur sidebarWidth sauf pendant resize.
```

---

## Tâche 12.9 — Types MessageThread partagé

### Contexte
Le composant MessageThread est partagé entre teacher et student. Il a ses propres types : Message (avec attachments), Participant, et les props du composant.

### Description
Créer shared/message-thread/types.ts avec tous les types.

### Prompt
```
Crée src/components/features/shared/message-thread/types.ts :

interface Attachment {
  name: string
  originalName: string
  size: number
  type: string
  path: string
}

interface Message {
  id: string
  content: string
  senderId: string
  senderName: string
  senderRole?: string
  createdAt: string
  attachments?: Attachment[]
}

interface Participant {
  id: string
  firstName: string
  lastName: string
  role: string
  isCurrentUser?: boolean
}

interface CourseRef {
  id: string
  title: string
}

interface MessageThreadProps {
  conversationId: string
  conversationTitle: string
  participants: Participant[]
  subject?: { id: string; name: string } | null
  course?: CourseRef | null
  currentUserId: string
  creatorId?: string | null
  createdAt?: string
  apiBaseUrl: string  // "/api/teacher/messages" ou "/api/student/messages"
  onBack?(): void
  onSendMessage?(content: string): Promise<void>
  onMarkAsRead?(): void
  onDelete?(): Promise<void>
}

Exporter tous les types.
```

---

## Tâche 12.10 — MessageBubble

### Contexte
Chaque message est affiché dans une bulle avec style différent selon l'expéditeur (own = droite bleu, other = gauche gris). Les pièces jointes sont affichées avec icône et téléchargeables.

### Description
Créer shared/message-thread/MessageBubble.tsx avec le rendu des messages.

### Prompt
```
Crée src/components/features/shared/message-thread/MessageBubble.tsx :

PROPS :
message: Message, isOwn: boolean, onDownloadFile(messageId, filename)

COMPUTED :
isTeacher = message.senderRole === 'TEACHER'

UI :
Flex avec gap-3, justify-end si isOwn

Si !isOwn : Avatar rond avec User icon à gauche

Div bulle avec classes conditionnelles :
- isOwn : bg-primary text-primary-foreground rounded-br-md
- !isOwn : bg-muted rounded-bl-md
- Commun : max-w-[70%] rounded-2xl px-4 py-2

Contenu :
- message.content dans <p> avec whitespace-pre-wrap

Si attachments :
- Div mt-2 space-y-1
- Pour chaque file : Badge cliquable avec :
  - Icône selon file.type (getFileIcon)
  - file.name (truncate)
  - formatFileSize(file.size)
  - onClick → onDownloadFile(message.id, file.name)

Footer bulle :
- senderName (font-medium text-xs)
- Badge "Prof" si isTeacher
- timeAgo via formatDistanceToNow en français

HELPERS à créer dans utils.ts :
- getFileIcon(mimeType): renvoie FileText, Image, Video, Music, ou File
- formatFileSize(bytes): renvoie "X KB" ou "X MB"
```

---

## Tâche 12.11 — ParticipantsList

### Contexte
Le header du thread affiche la liste des participants avec leur rôle (badge Prof pour les enseignants).

### Description
Créer shared/message-thread/ParticipantsList.tsx.

### Prompt
```
Crée src/components/features/shared/message-thread/ParticipantsList.tsx :

PROPS : participants: Participant[]

UI :
Flex wrap gap-2

Pour chaque participant :
- Badge variant="outline" avec :
  - "{firstName} {lastName}"
  - Si role === 'TEACHER' : sous-badge "Prof" (text-xs)
  - Si isCurrentUser : "(vous)" en italique

Si participants > 5 :
Afficher les 4 premiers + Badge "+{count} autres" avec Tooltip listant les autres
```

---

## Tâche 12.12 — MessageThread

### Contexte
Le composant MessageThread affiche le fil de discussion complet : header avec titre/participants, liste des messages scrollable, zone de saisie avec support pièces jointes, et bouton supprimer (si créateur).

### Description
Créer shared/MessageThread.tsx qui orchestre les sous-composants.

### Prompt
```
Crée src/components/features/shared/MessageThread.tsx :

Import des sous-composants depuis ./message-thread/

ÉTATS :
messages: Message[] = [], loading: boolean = true, sending: boolean = false
newMessage: string, attachments: File[] = []
deleting: boolean = false

REFS :
scrollAreaRef, inputRef, fileInputRef, hasMarkedAsRead

EFFET fetch messages :
Si conversationId → GET {apiBaseUrl}/{conversationId}
Parser response.messages, setLoading(false)

EFFET mark as read :
Si !loading && messages.length > 0 && !hasMarkedAsRead.current → onMarkAsRead?.()

EFFET scroll to bottom :
scrollAreaRef.scrollTop = scrollHeight après chaque changement de messages

HANDLER handleDownloadFile(messageId, filename) :
Fetch {apiBaseUrl}/{conversationId}/files/{messageId}/{filename}
Créer blob, déclencher download

HANDLER handleSend() :
Si !newMessage.trim() && !attachments.length → return
setSending(true)
FormData avec content + attachments
POST {apiBaseUrl}/{conversationId}
Ajouter message à la liste, reset newMessage et attachments

HANDLER handleKeyDown :
Enter sans Shift → handleSend()

UI Card h-full flex flex-col :

CardHeader border-b :
- Si onBack : Button ArrowLeft
- Avatar rond avec User icon
- Div flex-1 :
  - CardTitle avec extractCleanTitle(conversationTitle)
  - ParticipantsList
  - Si course : Badge BookOpen + course.title
  - Si createdAt : "Créée le {formatDate}"
- Si onDelete && currentUserId === creatorId :
  - Button Trash2 avec AlertDialog confirmation

CardContent flex-1 overflow-hidden :
ScrollArea ref={scrollAreaRef} :
- Loader2 si loading
- Pour chaque message : MessageBubble avec isOwn = senderId === currentUserId
- Message vide si pas de messages

Footer border-t p-4 :
- Si attachments.length > 0 : liste badges avec X pour supprimer
- Flex avec :
  - Button Paperclip pour ouvrir fileInputRef
  - Input hidden type="file" multiple
  - Input text pour newMessage, onKeyDown
  - Button Send avec Loader2 si sending
```

---

## Tâche 12.13 — API GET /api/teacher/messages

### Contexte
L'API GET retourne toutes les conversations du professeur avec le dernier message, les participants, et le compteur de non-lus.

### Description
Implémenter GET dans route.ts avec toutes les relations et le compteur unread.

### Prompt
```
Crée src/app/api/teacher/messages/route.ts (GET) :

AUTH : session, role TEACHER

QUERY Prisma :
conversations = prisma.conversation.findMany({
  where: { participantIds: { has: userId } }
  include: {
    Subject: true
    Course: { select: { id, title, Subject: { select: { id, name } } } }
    Message: {
      orderBy: { createdAt: 'desc' }, take: 1
      include: { User: { select: { id, firstName, lastName } } }
    }
  }
  orderBy: { updatedAt: 'desc' }
})

Récupérer tous les participants :
allParticipantIds = conversations.flatMap(c => c.participantIds)
participants = prisma.user.findMany({ where: { id: { in: allParticipantIds } } })

Compter les non-lus par conversation :
Pour chaque conv : prisma.messageReadStatus.count({
  where: { userId, readAt: null, Message: { conversationId: conv.id, senderId: { not: userId } } }
})

Transformer :
Pour chaque conv :
- participants : mapper avec isCurrentUser
- lastMessage : { id, content, senderId, senderName, createdAt }
- Ajouter creatorId, unreadCount

RESPONSE : { conversations: [...] }
```

---

## Tâche 12.14 — API POST /api/teacher/messages

### Contexte
L'API POST crée un nouveau message. Si conversationId fourni, ajoute au thread existant. Sinon, crée une nouvelle conversation avec les receiverIds. Génère des notifications pour tous les destinataires.

### Description
Implémenter POST dans route.ts avec création conversation et notifications.

### Prompt
```
Ajoute POST à src/app/api/teacher/messages/route.ts :

SCHEMA Zod :
{ conversationId?, receiverId?, receiverIds?: string[], content: string.min(1), subjectId?, courseId?, topicName? }

LOGIQUE receiverIds :
Utiliser receiverIds si fourni, sinon fallback sur [receiverId]

SI conversationId :
Vérifier que userId est participant, sinon 404

SINON (nouvelle conversation) :
- type = receiverIds.length > 1 ? 'CLASS_TOPIC' : 'PRIVATE'
- Si courseId → récupérer subjectId du cours
- prisma.conversation.create({
    data: { id: randomUUID(), type, participantIds: [userId, ...receiverIds],
      subjectId, courseId, topicName, schoolYear: getCurrentSchoolYear(), creatorId: userId }
  })

Créer le message :
prisma.message.create({
  data: { id: randomUUID(), conversationId, senderId: userId, content }
  include: { User: { select: { id, firstName, lastName, role } } }
})

Mettre à jour conversation.updatedAt

Créer notifications pour chaque autre participant :
prisma.notification.createMany({
  data: otherParticipantIds.map(pid => ({
    id: randomUUID(), userId: pid, type: 'MESSAGE',
    title: `Nouveau message de ${senderName}`,
    message: `Dans : ${topicName || 'Conversation'}`,
    link: role === 'STUDENT' ? `/student/messages?id=${convId}` : `/teacher/messages?id=${convId}`
  }))
})

RESPONSE : { message: { id, conversationId, content, senderId, senderName, createdAt } }
```

---

## Tâche 12.15 — API GET/POST /api/teacher/messages/[id]

### Contexte
GET récupère tous les messages d'une conversation et marque comme lus. POST ajoute un message avec support pièces jointes (FormData).

### Description
Créer route.ts dans [id]/ avec GET et POST.

### Prompt
```
Crée src/app/api/teacher/messages/[id]/route.ts :

--- GET ---
AUTH : session, vérifier participant

QUERY :
messages = prisma.message.findMany({
  where: { conversationId }
  include: { User: { select: { id, firstName, lastName, role } } }
  orderBy: { createdAt: 'asc' }
})

Marquer comme lus :
prisma.messageReadStatus.updateMany({
  where: { messageId: { in: messageIds }, userId, readAt: null }
  data: { readAt: new Date() }
})

RESPONSE : { messages: [{ id, content, senderId, senderName, senderRole, createdAt, attachments }] }

--- POST (avec fichiers) ---
AUTH : session, vérifier participant

FormData :
content = formData.get('content')
files = formData.getAll('attachments') as File[]

Si files.length > 0 :
- messageId = randomUUID() (générer avant pour le dossier)
- uploadDir = public/uploads/messages/{conversationId}/{messageId}
- fs.mkdir(uploadDir, recursive)
- Pour chaque file :
  - Buffer depuis arrayBuffer
  - sanitizedName = file.name.replace(/[^a-zA-Z0-9.-]/g, '_')
  - filename = `${Date.now()}-{index}-${sanitizedName}`
  - fs.writeFile
  - Ajouter { name, originalName, size, type, path } à attachmentsData

Créer message avec attachments :
prisma.message.create({
  data: { id: messageId, conversationId, senderId: userId, content, attachments: attachmentsData }
})

Mettre à jour conversation.updatedAt

Créer MessageReadStatus pour les autres participants :
prisma.messageReadStatus.createMany({
  data: otherParticipantIds.map(pid => ({ messageId, odpi, readAt: null }))
})

RESPONSE : { data: message }
```

---

## Tâche 12.16 — API DELETE /api/teacher/messages/[id]

### Contexte
Seul le créateur de la conversation peut la supprimer. La suppression efface la conversation, ses messages, et les fichiers uploadés.

### Description
Ajouter DELETE à route.ts dans [id]/.

### Prompt
```
Ajoute DELETE à src/app/api/teacher/messages/[id]/route.ts :

AUTH : session

Vérifier creatorId :
conversation = prisma.conversation.findUnique({ where: { id } })
Si conversation.creatorId !== userId → 403 "Seul le créateur peut supprimer"

Supprimer les fichiers uploadés :
uploadDir = public/uploads/messages/{conversationId}
fs.rm(uploadDir, { recursive: true, force: true })

Supprimer en cascade (dans transaction) :
1. prisma.messageReadStatus.deleteMany({ where: { Message: { conversationId } } })
2. prisma.message.deleteMany({ where: { conversationId } })
3. prisma.conversation.delete({ where: { id } })

RESPONSE : { success: true }
```

---

## Tâche 12.17 — API fichiers /api/teacher/messages/[id]/files

### Contexte
Les pièces jointes sont téléchargeables via une route dédiée qui vérifie les permissions avant de servir le fichier.

### Description
Créer route.ts dans [id]/files/[messageId]/[filename]/.

### Prompt
```
Crée src/app/api/teacher/messages/[id]/files/[messageId]/[filename]/route.ts :

PARAMS : id (conversationId), messageId, filename

AUTH : session, vérifier participant de la conversation

Vérifier que le message appartient à la conversation :
message = prisma.message.findFirst({ where: { id: messageId, conversationId } })
Si !message → 404

Construire le chemin :
filePath = path.join(process.cwd(), 'public', 'uploads', 'messages', id, messageId, filename)

Vérifier existence :
fs.access(filePath) catch → 404 "Fichier introuvable"

Lire et servir :
buffer = fs.readFile(filePath)
Détecter mimeType depuis extension ou 'application/octet-stream'

RESPONSE :
new Response(buffer, {
  headers: {
    'Content-Type': mimeType,
    'Content-Disposition': `attachment; filename="${filename}"`
  }
})
```

---

## Tâche 12.18 — Page teacher/messages

### Contexte
La page principale orchestre la liste des conversations et le thread de messages avec un layout responsive (panels redimensionnables desktop, stack mobile).

### Description
Créer page.tsx avec tous les composants et la logique.

### Prompt
```
Crée src/app/(dashboard)/teacher/messages/page.tsx :

ÉTATS :
conversations: Conversation[] = [], loading: boolean = true
selectedConversation: Conversation | null = null
currentUserId: string, isPanelCollapsed: boolean = false, isMobile: boolean = false
availableSubjects: SubjectOption[] = [], availableCourses: CourseOption[] = []

CALLBACKS (avec useCallback) :
fetchConversations() : GET /api/teacher/messages, setConversations, retourner la liste
fetchCurrentUser() : GET /api/auth/session, setCurrentUserId
fetchSubjects() : GET /api/teacher/subjects, setAvailableSubjects
fetchCourses() : GET /api/teacher/courses, mapper vers { id, title, subjectId }

handleConversationCreated(conversationId) :
- await fetchConversations()
- Trouver et sélectionner la nouvelle conversation

handleSendMessage(content) :
- POST /api/teacher/messages avec { conversationId, receiverId: participants[0].id, content }
- fetchConversations() pour rafraîchir lastMessage

handleDeleteConversation() :
- DELETE /api/teacher/messages/{id}
- setSelectedConversation(null), fetchConversations()

getConversationTitle(conv) :
- Si topicName → topicName
- Sinon → "Prénom Nom" du premier participant

EFFET mount : fetchConversations, fetchCurrentUser, fetchSubjects, fetchCourses

EFFET mobile : window.addEventListener('resize', checkMobile)

UI :
Header :
- Toggle panel button (desktop)
- Titre "Messages" + description
- NewConversationDialog avec onConversationCreated

Contenu h-[calc(100vh-200px)] :

Si isMobile :
- Si !selectedConversation → ConversationsList
- Si selectedConversation → MessageThread avec onBack

Sinon (desktop) :
ResizablePanelLayout avec :
- sidebar : ConversationsList
- content : MessageThread ou Card "Sélectionnez une conversation"
- isCollapsed, onCollapsedChange

Loader2 si loading
```

---

## Résumé Phase 12

| Fichier | Rôle |
|---------|------|
| `messages/types.ts` | Types Conversation, categoryConfig, helpers |
| `messages/new-conversation/*.ts` | Types, hooks, sous-composants dialog |
| `messages/NewConversationDialog.tsx` | Création nouvelle conversation |
| `messages/ConversationItem.tsx` | Item liste avec actions |
| `messages/ConversationsList.tsx` | Liste filtrée et groupée |
| `messages/ResizablePanelLayout.tsx` | Layout desktop redimensionnable |
| `shared/message-thread/*.tsx` | MessageBubble, ParticipantsList, utils |
| `shared/MessageThread.tsx` | Fil de discussion complet |
| `api/teacher/messages/route.ts` | GET conversations + POST message |
| `api/teacher/messages/[id]/route.ts` | GET/POST/DELETE conversation |
| `api/teacher/messages/[id]/files/` | Téléchargement pièces jointes |
| `teacher/messages/page.tsx` | Page principale |

---

*Phase 12 terminée — Le système de messagerie permet les conversations privées, groupes et classes avec pièces jointes et notifications.*
