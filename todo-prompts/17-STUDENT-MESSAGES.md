# Phase 17 — Student : Messagerie

> Messagerie élève avec conversations privées, groupes et fil de messages

---

## Vue d'ensemble

Cette phase implémente le système de messagerie pour l'élève :
- **Conversations** : Privées (1:1), Groupes (plusieurs élèves), avec professeurs
- **Filtres** : Par année scolaire, matière, cours, type (personnel/groupe)
- **Nouvelle conversation** : Vers professeur, camarade, ou groupe
- **Layout responsive** : Panneaux redimensionnables desktop, stack mobile
- **Composants partagés** : Réutilisation MessageThread, ConversationsList

**Modèles Prisma existants :**
```
Conversation (id, type, participantIds[], topicName, subjectId, courseId, creatorId, schoolYear)
Message (id, conversationId, senderId, content, attachments[])
MessageReadStatus (id, messageId, userId, readAt)
```

**Fichiers créés :**
```
src/app/(dashboard)/student/messages/page.tsx
src/app/api/student/messages/route.ts
src/app/api/student/messages/[id]/route.ts
src/app/api/student/messages/[id]/files/route.ts
src/components/features/messages/student-new-conversation/
  - StudentNewConversationDialog.tsx
  - ConversationTypeSelector.tsx
  - TeacherSection.tsx
  - StudentSection.tsx
  - GroupSection.tsx
  - MessageSection.tsx
  - hooks.ts
  - types.ts
```

**Composants partagés réutilisés :**
```
src/components/features/messages/ConversationsList.tsx
src/components/features/messages/ConversationItem.tsx
src/components/features/messages/ResizablePanelLayout.tsx
src/components/features/shared/MessageThread.tsx
```

---

## Tâche 17.1 — API GET liste conversations élève

### Contexte
L'élève voit les conversations où il est participant. Retourne les conversations avec dernier message et nombre de non-lus.

### Description
Créer `src/app/api/student/messages/route.ts` avec GET.

### Prompt
```
Crée src/app/api/student/messages/route.ts - API GET liste conversations élève.

Vérifications :
- Auth + role STUDENT

Query Prisma :
const conversations = await prisma.conversation.findMany({
  where: { participantIds: { has: userId } },
  include: {
    Subject: { select: { id, name } },
    Course: { select: { id, title, Subject: { select: { id, name } } } },
    Message: {
      orderBy: { createdAt: 'desc' },
      take: 1,
      include: { User: { select: { id, firstName, lastName } } }
    }
  },
  orderBy: { updatedAt: 'desc' }
});

Enrichissement :
1. Récupérer infos des autres participants (User.findMany)
2. Compter unread par conversation :
   MessageReadStatus.count({ where: { userId, readAt: null, Message: { conversationId, senderId: { not: userId } } } })
3. Mapper creatorId pour permettre suppression

Retour :
{
  conversations: [{
    id, type, topicName, createdAt, updatedAt, schoolYear,
    subject: { id, name } | null,
    course: { id, title, Subject } | null,
    participants: [{ id, firstName, lastName, role }],
    lastMessage: { id, content, senderId, senderName, createdAt } | null,
    creatorId: string | null,
    unreadCount: number
  }]
}
```

---

## Tâche 17.2 — API POST créer conversation élève

### Contexte
L'élève peut créer des conversations avec professeurs ou camarades de classe.

### Description
Ajouter POST dans `src/app/api/student/messages/route.ts`.

### Prompt
```
Ajoute POST dans src/app/api/student/messages/route.ts - Créer conversation.

Schema Zod :
const createConversationSchema = z.object({
  recipientIds: z.array(z.string()).min(1),
  content: z.string().min(1),
  subjectId: z.string().optional(),
  courseIds: z.array(z.string()).optional(),
  topicName: z.string().optional(),
  type: z.enum(['PRIVATE', 'GROUP']).default('PRIVATE')
});

Logique :
1. Validation body
2. Si courseId fourni mais pas subjectId → récupérer subjectId du cours
3. Vérifier destinataires existent
4. Construire participantIds = [userId, ...recipientIds]

5. Vérifier conversation existante :
   - Si PRIVATE + 1 destinataire → chercher conversation avec mêmes participants
   - Si trouvée → utiliser existante (évite doublons)

6. Sinon créer nouvelle :
   const conversationType = type === 'GROUP' || recipientIds.length > 1 
     ? 'CLASS_TOPIC' : 'PRIVATE';
   
   await prisma.conversation.create({
     data: {
       id: randomUUID(),
       type: conversationType,
       participantIds: allParticipantIds,
       topicName, subjectId, courseId,
       schoolYear: getCurrentSchoolYear(),
       creatorId: userId
     }
   });

7. Créer le premier message
8. Créer MessageReadStatus pour tous les destinataires
9. Mettre à jour conversation.updatedAt

Retour : { success: true, data: { conversationId, message } }

Helper getCurrentSchoolYear() : 
- Si mois >= 9 → "YYYY-(YYYY+1)"
- Sinon → "(YYYY-1)-YYYY"
```

---

## Tâche 17.3 — API GET/POST/DELETE messages conversation

### Contexte
API pour récupérer les messages d'une conversation, en envoyer un nouveau, ou supprimer la conversation.

### Description
Créer `src/app/api/student/messages/[id]/route.ts`.

### Prompt
```
Crée src/app/api/student/messages/[id]/route.ts - Messages d'une conversation.

Type params : { params: Promise<{ id: string }> }

=== GET - Messages ===
1. Vérifier participation : conversation.participantIds.has(userId)
2. Récupérer messages avec User (firstName, lastName)
3. Marquer comme lus : MessageReadStatus.updateMany({ readAt: new Date() })
4. Retourner messages avec attachments

=== POST - Envoyer message ===
1. Vérifier participation
2. Parser FormData (content + attachments[])
3. Créer message avec attachments JSON si fichiers
4. Créer MessageReadStatus pour autres participants
5. Mettre à jour conversation.updatedAt

Support fichiers :
const formData = await request.formData();
const content = formData.get('content') as string;
const attachmentFiles = formData.getAll('attachments') as File[];

// TODO: Upload vers stockage (local ou cloud)
const attachments = files.map(f => ({
  filename: f.name,
  size: f.size,
  url: `/uploads/${conversationId}/${Date.now()}_${f.name}`
}));

=== DELETE - Supprimer conversation ===
1. Vérifier creatorId === userId (seul le créateur peut supprimer)
2. Delete cascade via Prisma (Messages + ReadStatus)
3. Retourner { success: true }

Si non créateur : 403 "Seul le créateur peut supprimer"
```

---

## Tâche 17.4 — Types messagerie partagés

### Contexte
Interfaces et helpers partagés entre ConversationsList et ConversationItem.

### Description
Créer `src/components/features/messages/types.ts`.

### Prompt
```
Crée src/components/features/messages/types.ts - Types partagés messagerie.

=== Interfaces ===
interface Participant {
  id: string;
  firstName: string;
  lastName: string;
  role: string;
  isCurrentUser?: boolean;
}

interface LastMessage {
  id: string;
  content: string;
  senderId: string;
  senderName: string;
  createdAt: string;
}

interface CourseRef {
  id: string;
  title: string;
  Subject?: { id: string; name: string } | null;
}

interface Conversation {
  id: string;
  type: 'PRIVATE' | 'CLASS_GENERAL' | 'CLASS_TOPIC';
  topicName: string | null;
  subject: { id: string; name: string } | null;
  course?: CourseRef | null;
  participants: Participant[];
  lastMessage: LastMessage | null;
  createdAt: string;
  updatedAt: string;
  schoolYear?: string;
  unreadCount?: number;
  creatorId?: string | null;
}

type Category = 'private' | 'group' | 'class';

=== Helpers ===
function getConversationCategory(conv: Conversation): Category {
  const studentCount = conv.participants.filter(p => !p.isCurrentUser && p.role === 'STUDENT').length;
  if (studentCount === 1) return 'private';
  if (conv.type === 'CLASS_GENERAL' || conv.type === 'CLASS_TOPIC') return 'class';
  return 'group';
}

function getCurrentSchoolYear(): string {
  const now = new Date();
  const year = now.getFullYear();
  const month = now.getMonth();
  return month >= 8 ? `${year}-${year+1}` : `${year-1}-${year}`;
}

=== Config catégories ===
const categoryConfig: Record<Category, CategoryConfig> = {
  private: { label: 'Privées', icon: User, color: 'text-blue-600', bgColor: 'bg-blue-100' },
  group: { label: 'Groupes', icon: Users, color: 'text-green-600', bgColor: 'bg-green-100' },
  class: { label: 'Classe', icon: School, color: 'text-purple-600', bgColor: 'bg-purple-100' },
};
```

---

## Tâche 17.5 — Composant ConversationsList

### Contexte
Liste des conversations avec filtres (année, matière, cours, type) et catégorisation.

### Description
Créer `src/components/features/messages/ConversationsList.tsx`.

### Prompt
```
Crée src/components/features/messages/ConversationsList.tsx - Liste avec filtres.

Interface props :
interface ConversationsListProps {
  conversations: Conversation[];
  selectedId: string | null;
  onSelect: (conversation: Conversation) => void;
  currentUserId: string;
  onDelete?: (conversationId: string) => Promise<void>;
  availableSubjects?: SubjectOption[];
  availableCourses?: CourseOption[];
}

State :
- search: string
- selectedYear: string (default getCurrentSchoolYear())
- selectedSubjectId: 'all' | string
- selectedCourseId: 'all' | string (reset si matière change)
- showPersonalOnly: boolean
- filtersCollapsed: boolean
- openCategories: Record<Category, boolean>

Filtres collapsibles :
<Collapsible open={!filtersCollapsed}>
  <CollapsibleTrigger>Filtres <ChevronDown /></CollapsibleTrigger>
  <CollapsibleContent>
    - Select année scolaire
    - Select matière (cascade vers cours)
    - Select cours (filtré par matière)
    - Checkbox "Personnel uniquement"
  </CollapsibleContent>
</Collapsible>

Filtrage useMemo :
const filteredConversations = useMemo(() => {
  return conversations.filter(conv => {
    if (showPersonalOnly && getConversationCategory(conv) !== 'private') return false;
    if (selectedYear !== 'all' && conv.schoolYear !== selectedYear) return false;
    if (selectedSubjectId !== 'all' && selectedCourseId === 'all') {
      const convSubjectId = conv.subject?.id || conv.course?.Subject?.id;
      if (convSubjectId !== selectedSubjectId) return false;
    }
    if (selectedCourseId !== 'all' && conv.course?.id !== selectedCourseId) return false;
    if (search) {
      // Recherche dans participants, topicName, subject, course
    }
    return true;
  });
}, [conversations, filters...]);

Groupement par catégorie :
{(['private', 'group', 'class'] as Category[]).map(cat => {
  const convs = filteredConversations.filter(c => getConversationCategory(c) === cat);
  return (
    <Collapsible open={openCategories[cat]}>
      <CollapsibleTrigger>{categoryConfig[cat].label} ({convs.length})</CollapsibleTrigger>
      <CollapsibleContent>
        {convs.map(conv => <ConversationItem ... />)}
      </CollapsibleContent>
    </Collapsible>
  );
})}
```

---

## Tâche 17.6 — Composant ConversationItem

### Contexte
Item individuel affichant une conversation avec badge unread, timestamp compact, et bouton supprimer.

### Description
Créer `src/components/features/messages/ConversationItem.tsx`.

### Prompt
```
Crée src/components/features/messages/ConversationItem.tsx - Item conversation.

Interface props :
interface ConversationItemProps {
  conversation: Conversation;
  category: Category;
  isSelected: boolean;
  currentUserId: string;
  onClick: () => void;
  onDelete?: (conversationId: string) => Promise<void>;
}

Helpers :
- getConversationTitle(conv) : cours > subject > topicName nettoyé > participants
- extractCleanTitle(title) : supprime préfixes "Groupe - X élèves - "
- getShortTimeAgo(date) : "à l'instant" | "5 min" | "2h" | "3j" | "12 janv."
- getStudentCount(conv) : nombre d'élèves (excluant current user)

Structure :
<button onClick={onClick} className={cn(isSelected && 'bg-accent ring-2')}>
  <div className="flex items-start gap-3">
    {/* Avatar avec icône catégorie + badge unread */}
    <div className={cn('rounded-full', config.bgColor)}>
      <config.icon className={config.color} />
      {hasUnread && <span className="absolute -top-1 bg-red-500 text-white">{count}</span>}
    </div>
    
    <div className="flex-1 space-y-0.5">
      {/* Ligne 1: Titre + timestamp */}
      <div className="flex justify-between">
        <span className={cn(hasUnread && 'font-semibold')}>{title}</span>
        <span className="text-xs text-muted-foreground">{timeAgo}</span>
      </div>
      
      {/* Ligne 2: Type (groupe/personnel) + badge cours */}
      <div className="flex items-center gap-1.5 text-xs">
        {isGroup ? <><Users /> Groupe - {studentCount} élèves</> : <><User /> Personnel</>}
        {conv.course && <Badge><BookOpen /> {conv.course.title}</Badge>}
      </div>
      
      {/* Ligne 3: Dernier message (truncate) */}
      {lastMessage && <p className="text-xs text-muted-foreground truncate">{content}</p>}
    </div>
    
    {/* Bouton supprimer (créateur only) */}
    {isCreator && onDelete && (
      <Button variant="ghost" size="icon" onClick={e => { e.stopPropagation(); onDelete(conv.id); }}>
        <Trash2 className="text-destructive" />
      </Button>
    )}
  </div>
</button>
```

---

## Tâche 17.7 — Composant ResizablePanelLayout

### Contexte
Layout desktop avec panneau latéral redimensionnable par drag.

### Description
Créer `src/components/features/messages/ResizablePanelLayout.tsx`.

### Prompt
```
Crée src/components/features/messages/ResizablePanelLayout.tsx - Layout redimensionnable.

Interface props :
interface ResizablePanelLayoutProps {
  sidebar: React.ReactNode;
  content: React.ReactNode;
  defaultSidebarSize?: number; // % (default 35)
  minSidebarSize?: number;     // % (default 20)
  maxSidebarSize?: number;     // % (default 45)
  isMobile?: boolean;
  isCollapsed?: boolean;
  onCollapsedChange?: (collapsed: boolean) => void;
}

State :
- sidebarWidth: number (pourcentage)
- isResizing: boolean

Mode mobile : stack vertical simple
if (isMobile) return <div className="flex flex-col gap-4">{sidebar}{content}</div>;

Mode collapsed : bouton pour réouvrir
if (isCollapsed) return (
  <div className="h-full flex">
    <Button onClick={handleReopen}><ChevronRight /></Button>
    <div className="flex-1">{content}</div>
  </div>
);

Mode normal : resize par drag
<div ref={containerRef} className="h-full flex">
  <div style={{ width: `${sidebarWidth}%` }}>{sidebar}</div>
  
  <div 
    className="w-1.5 cursor-col-resize bg-border hover:bg-primary/30"
    onMouseDown={handleMouseDown}
  >
    <GripVertical /> {/* visible au hover */}
  </div>
  
  <div className="flex-1">{content}</div>
</div>

useEffect pour mouseMove/mouseUp :
- Calcul newWidth en % depuis position souris
- Clamp entre min et max
- setSidebarWidth
- Cleanup cursor styles
```

---

## Tâche 17.8 — Composant MessageThread partagé

### Contexte
Fil de messages style chat réutilisé par student et teacher.

### Description
Le composant existe dans `src/components/features/shared/MessageThread.tsx`. Documenter son interface pour réutilisation.

### Prompt
```
Documente l'interface de src/components/features/shared/MessageThread.tsx.

Interface props :
interface MessageThreadProps {
  conversationId: string;
  conversationTitle: string;
  participants: Participant[];
  subject?: { id: string; name: string } | null;
  course?: CourseRef | null;
  currentUserId: string;
  creatorId?: string | null;
  createdAt?: string;
  apiBaseUrl: string; // Ex: "/api/student/messages"
  onBack?: () => void;
  onMarkAsRead?: () => void;
  onSendMessage?: (content: string) => Promise<void>;
  onDelete?: () => Promise<void>;
}

Comportement :
1. Fetch messages au mount : GET {apiBaseUrl}/{conversationId}
2. Auto-scroll vers le bas
3. Mark as read via callback onMarkAsRead
4. Envoi message avec attachments via FormData
5. Download fichier : GET {apiBaseUrl}/{conversationId}/files/{messageId}/{filename}
6. Delete conversation : appel onDelete puis recharge

Sous-composants extraits :
- MessageBubble : bulle avec avatar, contenu, timestamp, attachments
- ParticipantsList : dialog listant tous les participants
- formatFileSize : helper pour taille fichiers

Header :
- Bouton retour (mobile)
- Titre conversation
- Badge matière/cours
- Liste participants
- Bouton supprimer (si créateur)

Body (ScrollArea) :
- Messages groupés par date
- MessageBubble pour chaque message
- Distinction sent/received (align right/left)

Footer :
- Input message
- Bouton attachement (file input hidden)
- Preview attachments avant envoi
- Bouton envoyer

Note : apiBaseUrl permet de réutiliser pour student et teacher sans dupliquer le code.
```

---

## Tâche 17.9 — Types nouvelle conversation élève

### Contexte
Interfaces pour le dialog de création de conversation côté élève.

### Description
Créer `src/components/features/messages/student-new-conversation/types.ts`.

### Prompt
```
Crée src/components/features/messages/student-new-conversation/types.ts.

=== Types principaux ===
type ConversationType = 'teacher' | 'student' | 'group';

interface Teacher {
  id: string;      // teacherProfileId
  userId: string;  // pour envoyer messages
  firstName: string;
  lastName: string;
  email: string;
  subjects: Array<{ id: string; name: string }>;
  classes: Array<{ id: string; name: string }>;
}

interface Classmate {
  id: string; // userId
  firstName: string;
  lastName: string;
  email: string;
}

interface Course {
  id: string;
  title: string;
  subjectId?: string;
  subjectName?: string;
  teacherId?: string;
  teacherName?: string;
}

interface Subject {
  id: string;
  name: string;
}

interface StudentNewConversationDialogProps {
  onConversationCreated?: (conversationId: string) => void;
}

=== Pour MultiSelectPopover ===
interface MultiSelectItem {
  id: string;
  label: string;
  sublabel?: string;
}
```

---

## Tâche 17.10 — Hooks données nouvelle conversation

### Contexte
Hooks pour récupérer les données nécessaires au formulaire de création.

### Description
Créer `src/components/features/messages/student-new-conversation/hooks.ts`.

### Prompt
```
Crée src/components/features/messages/student-new-conversation/hooks.ts.

=== useStudentTeachers ===
Fetch les professeurs de la classe de l'élève.
const { teachers, loading } = useStudentTeachers(open: boolean);

useEffect si open :
- GET /api/student/teachers
- Retourne Teacher[] avec subjects et classes

=== useStudentClassmates ===
Fetch les camarades de classe.
const { classmates } = useStudentClassmates(open: boolean);

useEffect si open :
- GET /api/student/classmates
- Retourne Classmate[] (userId, firstName, lastName)

=== useStudentCourses ===
Fetch les cours de l'élève.
const { courses } = useStudentCourses(open: boolean);

useEffect si open :
- GET /api/student/courses
- Map vers Course[] avec subjectId, teacherId

=== useAllSubjects ===
Dérive toutes les matières depuis les professeurs.
const allSubjects = useAllSubjects(teachers: Teacher[]);

useMemo : extraire et dédupliquer subjects de tous les teachers.

Pattern :
export function useStudentTeachers(open: boolean) {
  const [teachers, setTeachers] = useState<Teacher[]>([]);
  const [loading, setLoading] = useState(false);
  
  useEffect(() => {
    if (!open) return;
    setLoading(true);
    fetch('/api/student/teachers')
      .then(res => res.json())
      .then(data => setTeachers(data.teachers || []))
      .finally(() => setLoading(false));
  }, [open]);
  
  return { teachers, loading };
}
```

---

## Tâche 17.11 — StudentNewConversationDialog principal

### Contexte
Dialog orchestrant les différentes sections selon le type de conversation choisi.

### Description
Créer `src/components/features/messages/student-new-conversation/StudentNewConversationDialog.tsx`.

### Prompt
```
Crée StudentNewConversationDialog.tsx - Dialog principal nouvelle conversation.

State :
- open: boolean
- conversationType: 'teacher' | 'student' | 'group'
- selectedTeacher, selectedStudent: string
- selectedStudents, selectedGroupTeachers: string[]
- selectedSubject, selectedCourse: string
- topicName, message: string
- submitting: boolean

Hooks :
const { teachers, loading } = useStudentTeachers(open);
const { classmates } = useStudentClassmates(open);
const { courses } = useStudentCourses(open);
const allSubjects = useAllSubjects(teachers);

handleSubmit :
1. Valider message non vide
2. Construire recipientIds selon conversationType :
   - teacher → teacherData.userId
   - student → selectedStudent
   - group → [...selectedStudents, ...teacherUserIds]
3. POST /api/student/messages
4. Reset + close + callback onConversationCreated

Structure Dialog :
<Dialog open={open} onOpenChange={setOpen}>
  <DialogTrigger><Button><Plus /> Nouvelle conversation</Button></DialogTrigger>
  <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
    <DialogHeader>
      <DialogTitle>Nouvelle conversation</DialogTitle>
      <DialogDescription>Créez une conversation avec un professeur ou des camarades</DialogDescription>
    </DialogHeader>
    
    <ConversationTypeSelector value={conversationType} onChange={setConversationType} />
    
    {conversationType === 'teacher' && <TeacherSection ... />}
    {conversationType === 'student' && <StudentSection ... />}
    {conversationType === 'group' && <GroupSection ... />}
    
    <MessageSection message={message} setMessage={setMessage} submitting={submitting} onSubmit={handleSubmit} />
  </DialogContent>
</Dialog>
```

---

## Tâche 17.12 — Sous-composants sections formulaire

### Contexte
Composants pour chaque section du formulaire de création.

### Description
Créer les composants TeacherSection, StudentSection, GroupSection, MessageSection.

### Prompt
```
Crée les sous-composants du formulaire nouvelle conversation.

=== ConversationTypeSelector.tsx ===
RadioGroup avec 3 options :
- teacher : "👨‍🏫 Professeur"
- student : "👤 Camarade" 
- group : "👥 Groupe"

<RadioGroup value={value} onValueChange={onChange}>
  {options.map(opt => (
    <div className="flex items-center space-x-2 p-3 border rounded-lg">
      <RadioGroupItem value={opt.value} />
      <Label>{opt.icon} {opt.label}</Label>
    </div>
  ))}
</RadioGroup>

=== TeacherSection.tsx ===
Props : teachers, courses, selectedTeacher, selectedSubject, selectedCourse, topicName + setters, loading

1. Select professeur (Combobox searchable)
2. Si prof sélectionné → Select matière (filtrée par profs.subjects)
3. Si matière → Select cours (filtré par teacherId + subjectId)
4. Input topicName optionnel

=== StudentSection.tsx ===
Props : classmates, courses, allSubjects, selectedStudent, selectedSubject, selectedCourse, topicName + setters

1. Select camarade (Combobox searchable)
2. Select matière (depuis allSubjects)
3. Select cours
4. Input topicName

=== GroupSection.tsx ===
Props : classmates, teachers, courses, allSubjects, selectedStudents, selectedGroupTeachers, selectedSubject, selectedCourse, topicName + setters

1. MultiSelectPopover pour élèves
2. MultiSelectPopover pour professeurs (optionnel)
3. Select matière
4. Select cours
5. Input topicName (obligatoire pour groupe)

=== MessageSection.tsx ===
Props : message, setMessage, submitting, onSubmit

<div className="space-y-4 border-t pt-4">
  <Label>Message</Label>
  <Textarea value={message} onChange={...} placeholder="Votre message..." rows={4} />
  <Button onClick={onSubmit} disabled={submitting || !message.trim()}>
    {submitting ? <Loader2 className="animate-spin" /> : <Send />}
    Envoyer
  </Button>
</div>
```

---

## Tâche 17.13 — Page messagerie élève

### Contexte
Page principale avec layout responsive et état conversation sélectionnée.

### Description
Créer `src/app/(dashboard)/student/messages/page.tsx`.

### Prompt
```
Crée src/app/(dashboard)/student/messages/page.tsx - Page messagerie élève.

"use client" car nombreuses interactions.

State :
- conversations: Conversation[]
- selectedConversation: Conversation | null
- loading: boolean
- currentUserId: string
- isPanelCollapsed: boolean
- availableSubjects: SubjectOption[]
- availableCourses: CourseOption[]

Fetch au mount (useEffect + useCallback) :
- fetchConversations() → GET /api/student/messages
- fetchCurrentUser() → GET /api/auth/session
- fetchSubjects() → GET /api/student/subjects
- fetchCourses() → GET /api/student/courses

Handlers :
- handleSendMessage(content) → POST /api/student/messages/{id} + refresh
- handleDeleteConversation() → DELETE /api/student/messages/{id} + refresh
- handleConversationCreated(id) → refresh + select new

Structure Desktop (hidden md:block) :
<div>
  <header className="flex justify-between mb-4">
    <Button onClick={togglePanel}>{isPanelCollapsed ? <PanelLeftOpen /> : <PanelLeftClose />}</Button>
    <h1>Messages</h1>
    <StudentNewConversationDialog onConversationCreated={...} />
  </header>
  
  <ResizablePanelLayout
    isCollapsed={isPanelCollapsed}
    sidebar={<ConversationsList ... />}
    content={selectedConversation ? <MessageThread ... /> : <EmptyState />}
  />
</div>

Structure Mobile (md:hidden) :
<div>
  <header>
    <h1>Messages</h1>
    <StudentNewConversationDialog ... />
  </header>
  
  {selectedConversation ? (
    <MessageThread onBack={() => setSelectedConversation(null)} ... />
  ) : (
    <ConversationsList ... />
  )}
</div>

EmptyState :
<Card className="h-full flex items-center justify-center">
  <MessageSquare className="h-12 w-12 text-muted-foreground" />
  <h3>Sélectionnez une conversation</h3>
  <p>Choisissez une conversation ou écrivez à un professeur</p>
</Card>
```

---

## Tâche 17.14 — API fichiers attachés

### Contexte
API pour télécharger les fichiers attachés aux messages.

### Description
Créer `src/app/api/student/messages/[id]/files/route.ts`.

### Prompt
```
Crée src/app/api/student/messages/[id]/files/route.ts - Download fichiers.

Route dynamique : [id]/files/[messageId]/[filename]

Cependant, Next.js ne supporte pas les catch-all imbriqués facilement.
Alternative : utiliser query params ou route avec messageId/filename encodés.

Option simple : GET /api/student/messages/[id]/files?messageId=xxx&filename=yyy

Logique :
1. Auth + vérifier participation à la conversation
2. Récupérer le message
3. Vérifier que le fichier existe dans message.attachments
4. Lire le fichier depuis le stockage (local ou cloud)
5. Retourner avec headers appropriés :
   - Content-Type : mime type du fichier
   - Content-Disposition : attachment; filename="xxx"

Si fichier non trouvé : 404
Si pas autorisé : 403

Note : L'implémentation dépend du système de stockage choisi (local, S3, etc.).
Pour POC : stocker dans /public/uploads/ et servir directement.
```

---

## Résumé des fichiers

| Fichier | Rôle |
|---------|------|
| `api/student/messages/route.ts` | GET liste + POST créer conversation |
| `api/student/messages/[id]/route.ts` | GET/POST/DELETE messages |
| `student/messages/page.tsx` | Page principale responsive |
| `messages/types.ts` | Interfaces et helpers partagés |
| `messages/ConversationsList.tsx` | Liste avec filtres et catégories |
| `messages/ConversationItem.tsx` | Item conversation individuel |
| `messages/ResizablePanelLayout.tsx` | Layout desktop redimensionnable |
| `shared/MessageThread.tsx` | Fil de messages réutilisable |
| `student-new-conversation/*.tsx` | Dialog création conversation élève |

---

## Validation

```bash
# Lint
npm run lint

# Tester manuellement
# 1. /student/messages → voir liste conversations
# 2. Créer conversation avec professeur
# 3. Créer conversation avec camarade
# 4. Créer groupe avec plusieurs élèves
# 5. Envoyer messages avec attachements
# 6. Filtrer par matière/cours
# 7. Supprimer conversation (créateur only)
# 8. Tester responsive mobile
```

---

## Points d'attention

1. **Réutilisation composants** : MessageThread, ConversationsList partagés avec teacher
2. **Layout responsive** : ResizablePanelLayout desktop vs stack mobile
3. **Filtres cascade** : Cours filtrés par matière sélectionnée
4. **Unread count** : Calculé via MessageReadStatus
5. **Créateur only** : Seul le créateur peut supprimer une conversation
6. **Conversation existante** : Éviter doublons pour conversations privées 1:1
7. **Attachments** : Support fichiers via FormData (implémentation stockage à définir)
