# Phase 19 — AI : Chat Backend

> API pour conversations et messages IA avec streaming SSE et contexte RAG.

---

## Vue d'ensemble

| Fichiers | Rôle |
|----------|------|
| `prisma/schema.prisma` | Modèles AIConversation, AIMessage, StudentCoachSession |
| `src/app/api/ai/conversations/route.ts` | GET/POST conversations |
| `src/app/api/ai/conversations/[id]/route.ts` | GET/PATCH/DELETE conversation |
| `src/app/api/ai/chat/route.ts` | Chat non-streaming (legacy) |
| `src/app/api/ai/chat/stream/route.ts` | Chat streaming SSE |

**Architecture** : Conversation → Messages → Streaming SSE → Contexte RAG + Profil élève

---

## Tâche 19.1 — Modèle AIConversation (Prisma)

### Contexte
Une conversation regroupe les messages d'un élève avec l'IA. Elle peut être liée à plusieurs cours (pour le contexte RAG), épinglée, et avoir un prompt système personnalisé.

### Description
Créer le modèle Prisma AIConversation avec les relations vers User et AIMessage.

### Prompt
```
Crée le modèle Prisma AIConversation pour stocker les conversations IA.

FICHIER : prisma/schema.prisma

MODÈLE :

model AIConversation {
  id            String               @id @default(cuid())
  userId        String
  title         String?              // Titre personnalisé ou généré
  courseIds     String[]             // Cours associés pour RAG
  systemPrompt  String?              // Prompt système personnalisé
  isPinned      Boolean              @default(false)
  messageCount  Int                  @default(0)
  lastMessageAt DateTime?
  createdAt     DateTime             @default(now())
  updatedAt     DateTime             @updatedAt
  deletedAt     DateTime?            // Soft delete
  
  // Relations
  user          User                 @relation(fields: [userId], references: [id], onDelete: Cascade)
  messages      AIMessage[]
  coachSession  StudentCoachSession?

  @@index([userId, lastMessageAt(sort: Desc)])
  @@index([userId, deletedAt])
}

DANS LE MODÈLE User, AJOUTER :
conversations    AIConversation[]

EXÉCUTER :
npx prisma generate

NOTES :
- courseIds = array de String (plusieurs cours pour contexte)
- systemPrompt = instructions personnalisées de l'élève
- deletedAt = soft delete (conversation masquée mais pas supprimée)
- Index sur userId + lastMessageAt pour tri performant
```

---

## Tâche 19.2 — Modèle AIMessage (Prisma)

### Contexte
Chaque message dans une conversation a un rôle (user/assistant), un contenu, et peut contenir des attachments (images), des artifacts (code généré) ou des sources (RAG).

### Description
Créer le modèle Prisma AIMessage avec les champs JSON pour les données complexes.

### Prompt
```
Crée le modèle Prisma AIMessage pour les messages de conversation.

FICHIER : prisma/schema.prisma

MODÈLE :

model AIMessage {
  id             String         @id @default(cuid())
  conversationId String
  role           String         // 'user' ou 'assistant'
  content        String         // Contenu texte du message
  attachments    Json?          // Pièces jointes [{type, mimeType, url, name}]
  artifact       Json?          // Code/contenu généré {type, language, code}
  sources        Json?          // Sources RAG utilisées [{courseId, chapterId, excerpt}]
  createdAt      DateTime       @default(now())
  
  // Relation
  conversation   AIConversation @relation(fields: [conversationId], references: [id], onDelete: Cascade)

  @@index([conversationId, createdAt])
}

STRUCTURE attachments (exemple) :
[
  {
    "type": "image",
    "mimeType": "image/png",
    "url": "/uploads/xxx.png",
    "name": "screenshot.png",
    "size": 12345
  }
]

STRUCTURE artifact (exemple) :
{
  "type": "code",
  "language": "python",
  "code": "def hello():\n    print('Hello')"
}

NOTES :
- role = 'user' ou 'assistant' (pas 'model' pour cohérence)
- Json pour flexibilité des attachments/artifacts
- onDelete Cascade = suppression conversation → suppression messages
```

---

## Tâche 19.3 — Modèle StudentCoachSession (Prisma)

### Contexte
Le "coach IA" évalue la qualité des messages de l'élève (compréhension, autonomie, rigueur). Ces scores sont stockés par conversation et agrégés par jour.

### Description
Créer le modèle StudentCoachSession pour le tracking des scores coach par conversation.

### Prompt
```
Crée le modèle Prisma StudentCoachSession pour les scores coach.

FICHIER : prisma/schema.prisma

MODÈLE :

model StudentCoachSession {
  id                 String         @id @default(cuid())
  conversationId     String         @unique
  userId             String
  
  // Scores actuels (0-100)
  comprehension      Float          @default(50)
  autonomy           Float          @default(50)
  rigor              Float          @default(50)
  
  // Tendances (-1 à +1)
  comprehensionTrend Float          @default(0)
  autonomyTrend      Float          @default(0)
  rigorTrend         Float          @default(0)
  
  // Stats session
  messageCount       Int            @default(0)
  durationSeconds    Int            @default(0)
  lastAdvice         String?        // Dernier conseil du coach
  
  createdAt          DateTime       @default(now())
  updatedAt          DateTime       @updatedAt
  
  // Relations
  conversation       AIConversation @relation(fields: [conversationId], references: [id], onDelete: Cascade)
  user               User           @relation(fields: [userId], references: [id], onDelete: Cascade)

  @@index([userId, createdAt])
}

DANS LE MODÈLE User, AJOUTER :
coachSessions    StudentCoachSession[]

NOTES :
- @unique sur conversationId = 1 session par conversation
- Scores par défaut à 50 (milieu de l'échelle)
- Trends pour afficher ↑ ↓ → dans l'UI
- lastAdvice = conseil personnalisé du coach
```

---

## Tâche 19.4 — API GET /api/ai/conversations (liste)

### Contexte
L'interface élève affiche une sidebar avec la liste des conversations. L'API doit supporter la pagination, les filtres (courseId, isPinned, search) et retourner un aperçu du dernier message.

### Description
Créer l'endpoint GET pour lister les conversations avec filtres et pagination.

### Prompt
```
Crée l'API GET pour lister les conversations de l'utilisateur.

FICHIER : src/app/api/ai/conversations/route.ts

IMPORTS :
import { NextRequest, NextResponse } from 'next/server';
import { auth } from '@/lib/auth';
import { prisma } from '@/lib/prisma';
import { z } from 'zod';

SCHEMA DE VALIDATION :

const querySchema = z.object({
  courseId: z.string().optional(),
  search: z.string().optional(),
  isPinned: z.enum(['true', 'false']).optional(),
  limit: z.coerce.number().min(1).max(50).optional().default(20),
  offset: z.coerce.number().min(0).optional().default(0),
});

ENDPOINT GET :

export async function GET(request: NextRequest) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non autorisé' }, { status: 401 });
    }

    const { searchParams } = new URL(request.url);
    const params = querySchema.parse(Object.fromEntries(searchParams));

    // Construire le where
    const where: any = {
      userId: session.user.id,
      deletedAt: null,  // Exclure les conversations supprimées
    };

    if (params.courseId) {
      where.courseIds = { has: params.courseId };
    }

    if (params.search) {
      where.title = { contains: params.search, mode: 'insensitive' };
    }

    if (params.isPinned !== undefined) {
      where.isPinned = params.isPinned === 'true';
    }

    // Récupérer avec pagination
    const [conversations, total] = await Promise.all([
      prisma.aIConversation.findMany({
        where,
        orderBy: [
          { isPinned: 'desc' },      // Épinglées en premier
          { lastMessageAt: 'desc' }, // Puis par dernier message
          { createdAt: 'desc' },
        ],
        take: params.limit,
        skip: params.offset,
        include: {
          messages: {
            orderBy: { createdAt: 'desc' },
            take: 1,
            select: { content: true },
          },
        },
      }),
      prisma.aIConversation.count({ where }),
    ]);

    // Formatter la réponse
    const items = conversations.map((conv) => ({
      id: conv.id,
      title: conv.title,
      courseIds: conv.courseIds,
      isPinned: conv.isPinned,
      messageCount: conv.messageCount,
      lastMessageAt: conv.lastMessageAt?.toISOString() ?? null,
      createdAt: conv.createdAt.toISOString(),
      lastMessagePreview: conv.messages[0]?.content?.slice(0, 100) ?? null,
    }));

    return NextResponse.json({ items, total, limit: params.limit, offset: params.offset });
  } catch (error) {
    console.error('[API] GET /api/ai/conversations error:', error);
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 });
  }
}

NOTES :
- has: filtre sur array PostgreSQL (courseIds)
- mode: 'insensitive' pour recherche case-insensitive
- lastMessagePreview tronqué à 100 caractères
- Tri: épinglées > récentes > créées
```

---

## Tâche 19.5 — API POST /api/ai/conversations (création)

### Contexte
Créer une nouvelle conversation initialise une session vide avec les cours sélectionnés. Le titre peut être fourni ou sera généré automatiquement.

### Description
Créer l'endpoint POST pour créer une nouvelle conversation.

### Prompt
```
Ajoute l'endpoint POST pour créer une conversation.

FICHIER : src/app/api/ai/conversations/route.ts

SCHEMA DE VALIDATION :

const createSchema = z.object({
  courseIds: z.array(z.string()).optional().default([]),
  title: z.string().optional(),
});

ENDPOINT POST :

export async function POST(request: NextRequest) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json({ success: false, error: 'Non autorisé' }, { status: 401 });
    }

    const body = await request.json();
    const data = createSchema.parse(body);

    const conversation = await prisma.aIConversation.create({
      data: {
        userId: session.user.id,
        courseIds: data.courseIds,
        title: data.title,
      },
    });

    return NextResponse.json({
      success: true,
      data: {
        id: conversation.id,
        title: conversation.title,
        courseIds: conversation.courseIds,
        isPinned: conversation.isPinned,
        messageCount: 0,
        lastMessageAt: null,
        createdAt: conversation.createdAt.toISOString(),
      },
    }, { status: 201 });
  } catch (error) {
    console.error('[API] POST /api/ai/conversations error:', error);
    if (error instanceof z.ZodError) {
      return NextResponse.json(
        { success: false, error: 'Données invalides', details: error.issues },
        { status: 400 }
      );
    }
    return NextResponse.json({ success: false, error: 'Erreur serveur' }, { status: 500 });
  }
}

NOTES :
- courseIds optionnel = conversation sans contexte cours
- title optionnel = sera "Nouvelle conversation" par défaut
- Status 201 pour création réussie
```

---

## Tâche 19.6 — API GET /api/ai/conversations/[id] (détail)

### Contexte
L'ouverture d'une conversation charge tous ses messages avec leurs métadonnées (attachments, artifacts, sources) et les scores coach si disponibles.

### Description
Créer l'endpoint GET pour récupérer une conversation avec tous ses messages.

### Prompt
```
Crée l'API GET pour récupérer une conversation avec ses messages.

FICHIER : src/app/api/ai/conversations/[id]/route.ts

IMPORTS :
import { NextRequest, NextResponse } from 'next/server';
import { auth } from '@/lib/auth';
import { prisma } from '@/lib/prisma';
import { z } from 'zod';

interface RouteParams {
  params: Promise<{ id: string }>;
}

ENDPOINT GET :

export async function GET(
  request: NextRequest,
  { params }: RouteParams
) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non autorisé' }, { status: 401 });
    }

    const { id } = await params;

    const conversation = await prisma.aIConversation.findFirst({
      where: {
        id,
        userId: session.user.id,
        deletedAt: null,
      },
      include: {
        messages: {
          orderBy: { createdAt: 'asc' },  // Chronologique
        },
        coachSession: true,
      },
    });

    if (!conversation) {
      return NextResponse.json({ error: 'Conversation non trouvée' }, { status: 404 });
    }

    return NextResponse.json({
      id: conversation.id,
      title: conversation.title,
      courseIds: conversation.courseIds,
      systemPrompt: conversation.systemPrompt,
      isPinned: conversation.isPinned,
      messageCount: conversation.messageCount,
      createdAt: conversation.createdAt.toISOString(),
      updatedAt: conversation.updatedAt.toISOString(),
      messages: conversation.messages.map((msg) => ({
        id: msg.id,
        role: msg.role,
        content: msg.content,
        attachments: msg.attachments,
        artifact: msg.artifact,
        sources: msg.sources,
        createdAt: msg.createdAt.toISOString(),
      })),
      coachSession: conversation.coachSession ? {
        comprehension: conversation.coachSession.comprehension,
        autonomy: conversation.coachSession.autonomy,
        rigor: conversation.coachSession.rigor,
        comprehensionTrend: conversation.coachSession.comprehensionTrend,
        autonomyTrend: conversation.coachSession.autonomyTrend,
        rigorTrend: conversation.coachSession.rigorTrend,
        lastAdvice: conversation.coachSession.lastAdvice,
      } : null,
    });
  } catch (error) {
    console.error('[API] GET /api/ai/conversations/[id] error:', error);
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 });
  }
}

NOTES :
- Promise<{ id }> = convention Next.js 15+ pour params dynamiques
- Vérification userId + deletedAt = sécurité + soft delete
- Messages triés chronologiquement (asc)
- coachSession optionnel (null si pas de scores)
```

---

## Tâche 19.7 — API PATCH /api/ai/conversations/[id] (update)

### Contexte
L'utilisateur peut renommer une conversation, l'épingler, changer les cours associés, ou modifier le prompt système personnalisé.

### Description
Créer l'endpoint PATCH pour mettre à jour une conversation.

### Prompt
```
Ajoute l'endpoint PATCH pour modifier une conversation.

FICHIER : src/app/api/ai/conversations/[id]/route.ts

SCHEMA DE VALIDATION :

const updateSchema = z.object({
  title: z.string().optional(),
  isPinned: z.boolean().optional(),
  courseIds: z.array(z.string()).optional(),
  systemPrompt: z.string().max(2000).optional().nullable(),
});

ENDPOINT PATCH :

export async function PATCH(
  request: NextRequest,
  { params }: RouteParams
) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non autorisé' }, { status: 401 });
    }

    const { id } = await params;

    // Vérifier propriété
    const existing = await prisma.aIConversation.findFirst({
      where: {
        id,
        userId: session.user.id,
        deletedAt: null,
      },
    });

    if (!existing) {
      return NextResponse.json({ error: 'Conversation non trouvée' }, { status: 404 });
    }

    const body = await request.json();
    const data = updateSchema.parse(body);

    const updated = await prisma.aIConversation.update({
      where: { id },
      data: {
        ...(data.title !== undefined && { title: data.title }),
        ...(data.isPinned !== undefined && { isPinned: data.isPinned }),
        ...(data.courseIds !== undefined && { courseIds: data.courseIds }),
        ...(data.systemPrompt !== undefined && { systemPrompt: data.systemPrompt }),
      },
    });

    return NextResponse.json({
      id: updated.id,
      title: updated.title,
      isPinned: updated.isPinned,
      courseIds: updated.courseIds,
      systemPrompt: updated.systemPrompt,
    });
  } catch (error) {
    console.error('[API] PATCH /api/ai/conversations/[id] error:', error);
    if (error instanceof z.ZodError) {
      return NextResponse.json(
        { error: 'Données invalides', details: error.issues },
        { status: 400 }
      );
    }
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 });
  }
}

NOTES :
- Vérification propriété avant update (sécurité)
- Spread conditionnel = ne met à jour que les champs fournis
- systemPrompt nullable = permet de le supprimer
- Max 2000 caractères pour systemPrompt
```

---

## Tâche 19.8 — API DELETE /api/ai/conversations/[id] (soft delete)

### Contexte
La suppression d'une conversation est un soft delete (deletedAt) pour permettre la récupération. Les messages sont conservés pour audit.

### Description
Créer l'endpoint DELETE avec soft delete.

### Prompt
```
Ajoute l'endpoint DELETE avec soft delete.

FICHIER : src/app/api/ai/conversations/[id]/route.ts

ENDPOINT DELETE :

export async function DELETE(
  request: NextRequest,
  { params }: RouteParams
) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non autorisé' }, { status: 401 });
    }

    const { id } = await params;

    // Vérifier propriété
    const existing = await prisma.aIConversation.findFirst({
      where: {
        id,
        userId: session.user.id,
        deletedAt: null,  // Déjà supprimé = 404
      },
    });

    if (!existing) {
      return NextResponse.json({ error: 'Conversation non trouvée' }, { status: 404 });
    }

    // Soft delete
    await prisma.aIConversation.update({
      where: { id },
      data: { deletedAt: new Date() },
    });

    return new NextResponse(null, { status: 204 });
  } catch (error) {
    console.error('[API] DELETE /api/ai/conversations/[id] error:', error);
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 });
  }
}

NOTES :
- Status 204 No Content = suppression réussie
- Soft delete = deletedAt = new Date()
- Messages conservés (pas de cascade)
- Filtré dans les requêtes via deletedAt: null
```

---

## Tâche 19.9 — Helper getStudentContext (profil élève)

### Contexte
Le chat IA personnalise ses réponses selon le profil de l'élève : prénom, classe, cours suivis, devoirs à venir, notes récentes, scores coach. Ce contexte est injecté dans le system prompt.

### Description
Créer la fonction getStudentContext qui récupère et formate le contexte personnalisé de l'élève.

### Prompt
```
Crée le helper getStudentContext pour le contexte personnalisé élève.

FICHIER : src/app/api/ai/chat/stream/route.ts

FONCTION getStudentContext :

async function getStudentContext(userId: string): Promise<string> {
  try {
    // Récupérer le profil utilisateur avec sa classe
    const user = await prisma.user.findUnique({
      where: { id: userId },
      include: {
        StudentProfile: {
          include: {
            Class: { select: { name: true } },
            Subject: { select: { id: true, name: true } },
          },
        },
      },
    });

    if (!user) return '';

    let context = `\n\n--- INFORMATIONS SUR L'ÉLÈVE ---\n`;
    context += `Prénom: ${user.firstName}\n`;
    context += `Nom: ${user.lastName}\n`;

    // Info classe
    if (user.StudentProfile) {
      context += `Classe: ${user.StudentProfile.Class?.name ?? 'Non assigné'}\n`;
      
      // Matières suivies
      if (user.StudentProfile.Subject?.length > 0) {
        context += `Matières: ${user.StudentProfile.Subject.map(s => s.name).join(', ')}\n`;
      }
    }

    // Cours suivis avec progression (via StudentScore)
    const studentScores = await prisma.studentScore.findMany({
      where: { studentId: userId },
      include: {
        Course: {
          select: {
            id: true,
            title: true,
            Subject: { select: { name: true } },
          },
        },
      },
    });

    if (studentScores.length > 0) {
      context += `\nCours suivis avec progression:\n`;
      studentScores.forEach((score) => {
        const avg = score.continuousScore || 0;
        context += `- ${score.Course.title} (${score.Course.Subject?.name || 'Sans matière'}) - Moyenne: ${avg.toFixed(1)}/20\n`;
      });
    }

    // Devoirs à venir (7 prochains jours)
    const nextWeek = new Date();
    nextWeek.setDate(nextWeek.getDate() + 7);
    
    const classId = user.StudentProfile?.classId;
    const assignments = await prisma.courseAssignment.findMany({
      where: {
        OR: [
          { studentId: userId },
          ...(classId ? [{ classId }] : []),
        ],
        dueDate: { gte: new Date(), lte: nextWeek },
      },
      include: { Course: { select: { title: true } } },
      orderBy: { dueDate: 'asc' },
      take: 5,
    });

    if (assignments.length > 0) {
      context += `\nDevoirs à venir:\n`;
      assignments.forEach((a) => {
        const dueDate = a.dueDate ? new Date(a.dueDate).toLocaleDateString('fr-FR') : 'Non défini';
        context += `- ${a.title} (${a.Course?.title || 'Cours'}) - Pour le ${dueDate}\n`;
      });
    }

    // Scores coach si disponibles
    const coachSession = await prisma.studentCoachSession.findFirst({
      where: { userId },
      orderBy: { updatedAt: 'desc' },
    });

    if (coachSession) {
      context += `\nNiveau actuel (évalué par le coach IA):\n`;
      context += `- Compréhension: ${coachSession.comprehension}/100\n`;
      context += `- Autonomie: ${coachSession.autonomy}/100\n`;
      context += `- Rigueur: ${coachSession.rigor}/100\n`;
    }

    context += `--- FIN INFORMATIONS ÉLÈVE ---\n`;
    return context;
  } catch (error) {
    console.error('Erreur récupération contexte élève:', error);
    return '';
  }
}

NOTES :
- Profil complet = prénom, classe, matières
- Progression = moyenne par cours via StudentScore
- Devoirs = assignés à l'élève OU à sa classe
- Coach = dernier session pour les scores actuels
- Try/catch = retourne '' si erreur (graceful)
```

---

## Tâche 19.10 — Helper getRAGContext (contenu cours)

### Contexte
Le RAG (Retrieval Augmented Generation) injecte le contenu des cours sélectionnés dans le prompt. L'IA peut ainsi répondre avec les informations spécifiques du cours.

### Description
Créer la fonction getRAGContext qui récupère le contenu des cours pour l'injecter dans le prompt système.

### Prompt
```
Crée le helper getRAGContext pour le contexte RAG des cours.

FICHIER : src/app/api/ai/chat/stream/route.ts

FONCTION getRAGContext :

async function getRAGContext(courseIds: string[]): Promise<string> {
  if (!courseIds.length) return '';

  // Récupérer les cours avec leurs chapitres et sections
  const courses = await prisma.course.findMany({
    where: { id: { in: courseIds } },
    include: {
      Subject: { select: { name: true } },
      Chapter: {
        orderBy: { order: 'asc' },
        include: {
          Section: {
            orderBy: { order: 'asc' },
            where: { type: 'LESSON' },  // Seulement les leçons
            select: {
              title: true,
              content: true,
            },
          },
        },
      },
    },
  });

  if (!courses.length) return '';

  const context = courses.map(course => {
    let courseContext = `## Cours: ${course.title}\n`;
    courseContext += `Matière: ${course.Subject?.name || 'Non définie'}\n`;
    
    if (course.description) {
      courseContext += `Description: ${course.description}\n`;
    }
    
    if (course.objectives?.length > 0) {
      courseContext += `Objectifs: ${course.objectives.join(', ')}\n`;
    }
    
    if (course.content) {
      courseContext += `\n### Contenu du cours:\n${course.content}\n`;
    }
    
    // Ajouter les chapitres et sections
    if (course.Chapter?.length > 0) {
      courseContext += `\n### Chapitres:\n`;
      for (const chapter of course.Chapter) {
        courseContext += `\n#### ${chapter.title}\n`;
        if (chapter.description) {
          courseContext += `${chapter.description}\n`;
        }
        
        // Ajouter les sections de type LESSON
        for (const section of chapter.Section) {
          if (section.title) {
            courseContext += `\n##### ${section.title}\n`;
          }
          if (section.content) {
            // Limiter le contenu à 1000 caractères par section
            const truncated = section.content.length > 1000 
              ? section.content.substring(0, 1000) + '...' 
              : section.content;
            courseContext += `${truncated}\n`;
          }
        }
      }
    }
    
    return courseContext;
  }).join('\n---\n');

  return `\n\n---\nCONTEXTE DES COURS (utilise ces informations pour aider l'élève):\n${context}\n---\n`;
}

NOTES :
- Seulement type: 'LESSON' (pas les quiz/exercices)
- Contenu tronqué à 1000 caractères par section (token limit)
- Structure hiérarchique : Cours > Chapitres > Sections
- Séparateur --- entre les cours
```

---

## Tâche 19.11 — Helper dbMessagesToGemini (conversion)

### Contexte
Les messages stockés en BDD (AIMessage) doivent être convertis au format GeminiMessage avant l'appel API. Cette conversion gère les attachments (base64 ou URI).

### Description
Créer la fonction dbMessagesToGemini pour convertir les messages BDD en format Gemini.

### Prompt
```
Crée le helper de conversion des messages BDD vers format Gemini.

FICHIER : src/app/api/ai/chat/stream/route.ts

TYPES :

interface AttachmentInput {
  type: 'image' | 'audio' | 'video' | 'document';
  mimeType: string;
  url: string;
  name: string;
  size: number;
  base64?: string;
  geminiUri?: string;
}

FONCTION dbMessagesToGemini :

function dbMessagesToGemini(messages: AIMessage[]): GeminiMessage[] {
  return messages.map(msg => {
    const attachments: GeminiAttachment[] = [];
    
    if (msg.attachments && typeof msg.attachments === 'object') {
      const atts = msg.attachments as unknown as AttachmentInput[];
      for (const att of atts) {
        attachments.push({
          type: att.type,
          mimeType: att.mimeType,
          data: att.base64,      // Inline base64
          uri: att.geminiUri,    // File API URI
        });
      }
    }

    return {
      role: msg.role === 'user' ? 'user' as const : 'model' as const,
      content: msg.content,
      attachments: attachments.length > 0 ? attachments : undefined,
    };
  });
}

NOTES :
- AIMessage.attachments est Json (Prisma) → cast en AttachmentInput[]
- role mapping: 'assistant' (BDD) → 'model' (Gemini)
- attachments optionnel si vide
- base64 pour images inline, geminiUri pour fichiers uploadés
```

---

## Tâche 19.12 — Helper createSSEStream (streaming)

### Contexte
Server-Sent Events (SSE) permet d'envoyer la réponse IA au fur et à mesure de la génération. Ce helper encapsule la création du stream avec les méthodes send et close.

### Description
Créer la fonction createSSEStream pour encapsuler la logique SSE.

### Prompt
```
Crée le helper createSSEStream pour le streaming SSE.

FICHIER : src/app/api/ai/chat/stream/route.ts

FONCTION createSSEStream :

function createSSEStream() {
  const encoder = new TextEncoder();
  let controller: ReadableStreamDefaultController<Uint8Array>;

  const stream = new ReadableStream<Uint8Array>({
    start(c) {
      controller = c;
    },
  });

  const send = (event: string, data: unknown) => {
    const payload = `event: ${event}\ndata: ${JSON.stringify(data)}\n\n`;
    controller.enqueue(encoder.encode(payload));
  };

  const close = () => {
    controller.close();
  };

  return { stream, send, close };
}

ÉVÉNEMENTS SSE :
- chunk: { text: string, messageId: string }  // Portion de texte
- done: { messageId: string, content: string } // Fin avec réponse complète
- error: { message: string }                   // Erreur

FORMAT SSE :
event: chunk
data: {"text":"Bonjour","messageId":"xxx"}

event: done
data: {"messageId":"yyy","content":"Bonjour, comment puis-je t'aider ?"}

NOTES :
- TextEncoder pour convertir string → Uint8Array
- Format SSE standard : event:\ndata:\n\n
- JSON.stringify pour les données
- close() obligatoire pour terminer le stream
```

---

## Tâche 19.13 — API POST /api/ai/chat/stream (streaming)

### Contexte
L'endpoint principal de chat utilise le streaming SSE pour afficher la réponse en temps réel. Il sauvegarde le message user, appelle Gemini en streaming, sauvegarde la réponse, et met à jour la conversation.

### Description
Créer l'endpoint POST /api/ai/chat/stream avec streaming SSE complet.

### Prompt
```
Crée l'API POST streaming pour le chat IA.

FICHIER : src/app/api/ai/chat/stream/route.ts

IMPORTS :
import { NextRequest } from 'next/server';
import { auth } from '@/lib/auth';
import { prisma } from '@/lib/prisma';
import { streamGemini, SYSTEM_PROMPTS } from '@/lib/ai/gemini';
import type { GeminiMessage, GeminiAttachment } from '@/lib/ai/gemini';
import type { AIMessage } from '@prisma/client';

TYPES :

interface ChatRequest {
  conversationId: string;
  content: string;
  attachments?: AttachmentInput[];
}

ENDPOINT POST :

export async function POST(request: NextRequest) {
  try {
    // Auth
    const session = await auth();
    if (!session?.user?.id) {
      return new Response(JSON.stringify({ error: 'Non autorisé' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const userId = session.user.id;
    const body: ChatRequest = await request.json();
    const { conversationId, content, attachments } = body;

    // Validation
    if (!conversationId || !content?.trim()) {
      return new Response(JSON.stringify({ error: 'Données manquantes' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    // Vérifier propriété de la conversation
    const conversation = await prisma.aIConversation.findFirst({
      where: {
        id: conversationId,
        userId,
        deletedAt: null,
      },
      include: {
        messages: {
          orderBy: { createdAt: 'asc' },
          take: 50,  // Limiter l'historique
        },
      },
    });

    if (!conversation) {
      return new Response(JSON.stringify({ error: 'Conversation non trouvée' }), {
        status: 404,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    // Préparer les contextes
    const ragContext = await getRAGContext(conversation.courseIds);
    const studentContext = await getStudentContext(userId);

    // Construire le prompt système enrichi
    let systemPrompt = SYSTEM_PROMPTS.student;
    systemPrompt += studentContext;
    
    if (conversation.systemPrompt) {
      systemPrompt += `\n\n--- INSTRUCTIONS PERSONNALISÉES ---\n${conversation.systemPrompt}\n---`;
    }
    
    systemPrompt += ragContext;

    // Sauvegarder le message utilisateur
    const userMessage = await prisma.aIMessage.create({
      data: {
        conversationId,
        role: 'user',
        content,
        attachments: attachments ? JSON.parse(JSON.stringify(attachments)) : undefined,
      },
    });

    // Préparer les messages pour Gemini
    const historyMessages = dbMessagesToGemini(conversation.messages);
    const newUserMessage: GeminiMessage = {
      role: 'user',
      content,
      attachments: attachments?.map(att => ({
        type: att.type,
        mimeType: att.mimeType,
        data: att.base64,
        uri: att.geminiUri,
      })),
    };
    const allMessages = [...historyMessages, newUserMessage];

    // Créer le stream SSE
    const { stream, send, close } = createSSEStream();

    // Lancer le streaming en arrière-plan
    (async () => {
      let fullResponse = '';

      try {
        const streamResult = await streamGemini(allMessages, { systemPrompt });

        for await (const chunk of streamResult.stream) {
          const text = chunk.text();
          if (text) {
            fullResponse += text;
            send('chunk', { text, messageId: userMessage.id });
          }
        }

        // Sauvegarder la réponse complète
        const assistantMessage = await prisma.aIMessage.create({
          data: {
            conversationId,
            role: 'assistant',
            content: fullResponse,
          },
        });

        // Mettre à jour la conversation
        await prisma.aIConversation.update({
          where: { id: conversationId },
          data: { 
            updatedAt: new Date(),
            lastMessageAt: new Date(),
            messageCount: { increment: 2 },  // user + assistant
          },
        });

        // Envoyer l'événement de fin
        send('done', { messageId: assistantMessage.id, content: fullResponse });

      } catch (error) {
        console.error('Erreur streaming Gemini:', error);
        send('error', { message: 'Erreur lors de la génération' });
      } finally {
        close();
      }
    })();

    // Retourner le stream immédiatement
    return new Response(stream, {
      headers: {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive',
      },
    });

  } catch (error) {
    console.error('Erreur chat:', error);
    return new Response(JSON.stringify({ error: 'Erreur serveur' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
}

NOTES :
- Async IIFE pour streaming en arrière-plan
- Response retournée immédiatement (stream)
- Message user sauvegardé AVANT le streaming
- Message assistant sauvegardé APRÈS le streaming
- messageCount incrémenté de 2 (user + assistant)
- Headers SSE : text/event-stream, no-cache, keep-alive
```

---

## Tâche 19.14 — API POST /api/ai/chat (legacy non-streaming)

### Contexte
Pour certains cas d'usage (quiz, exercices), le streaming n'est pas nécessaire. L'API legacy retourne la réponse complète en une fois.

### Description
Maintenir l'API chat non-streaming pour la compatibilité.

### Prompt
```
Documente l'API chat non-streaming (legacy).

FICHIER : src/app/api/ai/chat/route.ts

USAGE :
- Génération quiz/exercices (réponse JSON complète)
- Tests manuels
- Clients ne supportant pas SSE

DIFFÉRENCES VS STREAMING :
| Aspect | /chat | /chat/stream |
|--------|-------|--------------|
| Réponse | JSON complet | SSE chunks |
| Latence perçue | Longue | Instantanée |
| Stockage messages | Dans la route | Dans la route |
| Usage | Quiz, exercices | Chat temps réel |

ENDPOINT POST (existant) :
- Reçoit messages[] + sessionId + courseId + contextType
- Récupère fichiers cours pour RAG
- Appelle Gemini (non-streaming)
- Sauvegarde dans AIChat (pas AIConversation)
- Retourne { message, sessionId, hasDocuments }

NOTES :
- AIChat = ancien modèle (JSON blob pour messages)
- AIConversation = nouveau modèle (messages séparés)
- À migrer vers streaming à terme
```

---

## Résumé Phase 19

| Tâche | Fichier | Fonction |
|-------|---------|----------|
| 19.1 | schema.prisma | AIConversation model |
| 19.2 | schema.prisma | AIMessage model |
| 19.3 | schema.prisma | StudentCoachSession model |
| 19.4 | conversations/route.ts | GET liste |
| 19.5 | conversations/route.ts | POST création |
| 19.6 | conversations/[id]/route.ts | GET détail |
| 19.7 | conversations/[id]/route.ts | PATCH update |
| 19.8 | conversations/[id]/route.ts | DELETE soft |
| 19.9 | chat/stream/route.ts | getStudentContext |
| 19.10 | chat/stream/route.ts | getRAGContext |
| 19.11 | chat/stream/route.ts | dbMessagesToGemini |
| 19.12 | chat/stream/route.ts | createSSEStream |
| 19.13 | chat/stream/route.ts | POST streaming |
| 19.14 | chat/route.ts | POST legacy |

**Total : 14 tâches**
