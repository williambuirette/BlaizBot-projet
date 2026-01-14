# Phase 20 — AI : Chat Frontend

> Interface utilisateur du chat IA avec sidebar, zone de chat, input multimodal et responsive mobile.

---

## Vue d'ensemble

| Fichiers | Rôle |
|----------|------|
| `src/app/(dashboard)/student/ai/page.tsx` | Page principale chat IA |
| `src/components/features/ai-chat/ConversationSidebar.tsx` | Liste conversations avec filtres |
| `src/components/features/ai-chat/ChatZone.tsx` | Zone d'affichage messages |
| `src/components/features/ai-chat/ChatInput.tsx` | Input + attachments + audio |
| `src/components/features/ai-chat/ChatMessage.tsx` | Bulle message user/assistant |
| `src/components/features/ai-chat/ChatHeader.tsx` | Header avec titre + cours |
| `src/hooks/useAIChat.ts` | Hook gestion messages + streaming |
| `src/hooks/useConversations.ts` | Hook CRUD conversations |

**Architecture** : Page → ConversationSidebar + ChatZone + ChatInput → Hooks → API

---

## Tâche 20.1 — Hook useConversations (CRUD)

### Contexte
Le hook useConversations centralise la logique de chargement, création, suppression et renommage des conversations. Il utilise l'API `/api/ai/conversations` et gère l'état local.

### Description
Créer le hook useConversations avec fetchConversations, createConversation, deleteConversation, renameConversation.

### Prompt
```
Crée le hook useConversations pour gérer les conversations IA.

FICHIER : src/hooks/useConversations.ts

IMPORTS :
import { useState, useEffect, useCallback } from 'react';
import type { AIConversationWithPreview } from '@/types/ai-conversation';

TYPES :

interface UseConversationsOptions {
  filters?: {
    teacherId?: string;
    subject?: string;
    courseId?: string;
  };
}

interface UseConversationsReturn {
  conversations: AIConversationWithPreview[];
  isLoading: boolean;
  error: string | null;
  createConversation: (title?: string, courseIds?: string[]) => Promise<string>;
  deleteConversation: (id: string) => Promise<void>;
  renameConversation: (id: string, title: string) => Promise<void>;
  refetch: () => Promise<void>;
}

HOOK :

export function useConversations(
  options: UseConversationsOptions = {}
): UseConversationsReturn {
  const [conversations, setConversations] = useState<AIConversationWithPreview[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchConversations = useCallback(async () => {
    try {
      setIsLoading(true);
      setError(null);

      const params = new URLSearchParams();
      if (options.filters?.courseId) {
        params.set('courseId', options.filters.courseId);
      }

      const response = await fetch(`/api/ai/conversations?${params}`);
      const data = await response.json();

      if (data.error) {
        throw new Error(data.error);
      }

      setConversations(data.items || []);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Erreur inconnue');
    } finally {
      setIsLoading(false);
    }
  }, [options.filters?.courseId]);

  useEffect(() => {
    fetchConversations();
  }, [fetchConversations]);

  const createConversation = useCallback(async (
    title?: string,
    courseIds?: string[]
  ): Promise<string> => {
    const response = await fetch('/api/ai/conversations', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title, courseIds }),
    });

    const data = await response.json();
    if (!data.success) {
      throw new Error(data.error);
    }

    setConversations(prev => [data.data, ...prev]);
    return data.data.id;
  }, []);

  const deleteConversation = useCallback(async (id: string) => {
    const response = await fetch(`/api/ai/conversations/${id}`, {
      method: 'DELETE',
    });

    if (response.status === 204) {
      setConversations(prev => prev.filter(c => c.id !== id));
      return;
    }

    const data = await response.json();
    if (!response.ok) {
      throw new Error(data.error || 'Erreur de suppression');
    }

    setConversations(prev => prev.filter(c => c.id !== id));
  }, []);

  const renameConversation = useCallback(async (id: string, title: string) => {
    const response = await fetch(`/api/ai/conversations/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title }),
    });

    const data = await response.json();
    if (!response.ok) {
      throw new Error(data.error || 'Erreur de renommage');
    }

    setConversations(prev =>
      prev.map(c => (c.id === id ? { ...c, title: data.title || title } : c))
    );
  }, []);

  return {
    conversations,
    isLoading,
    error,
    createConversation,
    deleteConversation,
    renameConversation,
    refetch: fetchConversations,
  };
}

TYPE : src/types/ai-conversation.ts

export interface AIConversationWithPreview {
  id: string;
  title: string | null;
  courseIds: string[];
  isPinned: boolean;
  messageCount: number;
  lastMessageAt: string | null;
  createdAt: string;
  lastMessagePreview: string | null;
}

NOTES :
- Optimistic updates pour create/delete/rename
- Filtres optionnels (courseId, etc.)
- Status 204 = succès sans corps (DELETE)
```

---

## Tâche 20.2 — Hook useAIChat (messages + streaming)

### Contexte
Le hook useAIChat gère le chargement des messages d'une conversation, l'envoi de nouveaux messages avec streaming SSE, et la mise à jour en temps réel de la réponse IA.

### Description
Créer le hook useAIChat avec loadMessages, sendMessage (streaming SSE) et gestion des messages temporaires.

### Prompt
```
Crée le hook useAIChat pour gérer les messages et le streaming.

FICHIER : src/hooks/useAIChat.ts

TYPES :

export interface ChatMessage {
  id: string;
  role: 'user' | 'assistant';
  content: string;
  attachments?: UploadedFileInfo[];
  isStreaming?: boolean;
  createdAt: Date;
}

interface UseAIChatOptions {
  conversationId: string;
  onError?: (error: string) => void;
}

interface UseAIChatReturn {
  messages: ChatMessage[];
  isLoading: boolean;
  isLoadingMessages: boolean;
  error: string | null;
  sendMessage: (content: string, attachments?: UploadedFileInfo[]) => Promise<void>;
  setMessages: React.Dispatch<React.SetStateAction<ChatMessage[]>>;
}

HOOK :

export function useAIChat({ conversationId, onError }: UseAIChatOptions): UseAIChatReturn {
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const [isLoadingMessages, setIsLoadingMessages] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const abortControllerRef = useRef<AbortController | null>(null);

  // LOAD EXISTING MESSAGES
  useEffect(() => {
    if (!conversationId) {
      setMessages([]);
      return;
    }

    const loadMessages = async () => {
      setIsLoadingMessages(true);
      setError(null);

      try {
        const response = await fetch(`/api/ai/conversations/${conversationId}`);
        
        if (!response.ok) {
          if (response.status === 404) {
            setMessages([]);
            return;
          }
          throw new Error('Erreur chargement messages');
        }

        const data = await response.json();
        const loadedMessages: ChatMessage[] = (data.messages || []).map(msg => ({
          id: msg.id,
          role: msg.role,
          content: msg.content,
          attachments: msg.attachments,
          createdAt: new Date(msg.createdAt),
        }));

        setMessages(loadedMessages);
      } catch (err) {
        const errorMessage = err instanceof Error ? err.message : 'Erreur inconnue';
        setError(errorMessage);
        onError?.(errorMessage);
      } finally {
        setIsLoadingMessages(false);
      }
    };

    loadMessages();
  }, [conversationId, onError]);

  // SEND MESSAGE WITH STREAMING
  const sendMessage = useCallback(async (
    content: string, 
    attachments?: UploadedFileInfo[]
  ) => {
    if (!content.trim() || isLoading) return;

    // Annuler requête précédente si en cours
    if (abortControllerRef.current) {
      abortControllerRef.current.abort();
    }
    abortControllerRef.current = new AbortController();

    setIsLoading(true);
    setError(null);

    // Ajouter message utilisateur
    const userMessage: ChatMessage = {
      id: `temp_${Date.now()}`,
      role: 'user',
      content,
      attachments,
      createdAt: new Date(),
    };

    // Ajouter placeholder pour la réponse
    const assistantPlaceholder: ChatMessage = {
      id: `temp_assistant_${Date.now()}`,
      role: 'assistant',
      content: '',
      isStreaming: true,
      createdAt: new Date(),
    };

    setMessages(prev => [...prev, userMessage, assistantPlaceholder]);

    try {
      const response = await fetch('/api/ai/chat/stream', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          conversationId,
          content,
          attachments: attachments?.map(a => ({
            type: a.type,
            mimeType: a.mimeType,
            url: a.url,
            name: a.name,
            size: a.size,
            base64: a.base64,
            geminiUri: a.geminiUri,
          })),
        }),
        signal: abortControllerRef.current.signal,
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Erreur serveur');
      }

      // Lire le stream SSE
      const reader = response.body?.getReader();
      const decoder = new TextDecoder();

      if (!reader) {
        throw new Error('Impossible de lire la réponse');
      }

      let buffer = '';
      let fullContent = '';

      while (true) {
        const { done, value } = await reader.read();
        if (done) break;

        buffer += decoder.decode(value, { stream: true });

        // Parser les événements SSE
        const lines = buffer.split('\n');
        buffer = lines.pop() || '';

        for (const line of lines) {
          if (line.startsWith('data: ')) {
            try {
              const data = JSON.parse(line.slice(6));
              
              if (data.text) {
                fullContent += data.text;
                // Mettre à jour le message en streaming
                setMessages(prev => 
                  prev.map(msg => 
                    msg.isStreaming 
                      ? { ...msg, content: fullContent }
                      : msg
                  )
                );
              }
              
              if (data.messageId && !data.text) {
                // Message terminé
                setMessages(prev =>
                  prev.map(msg =>
                    msg.isStreaming
                      ? { ...msg, id: data.messageId, isStreaming: false }
                      : msg
                  )
                );
              }
            } catch {
              // Ignorer erreurs de parsing
            }
          }
        }
      }

    } catch (err) {
      if (err instanceof Error && err.name === 'AbortError') {
        return;
      }

      const errorMessage = err instanceof Error ? err.message : 'Erreur inconnue';
      setError(errorMessage);
      onError?.(errorMessage);

      // Retirer le placeholder en cas d'erreur
      setMessages(prev => prev.filter(m => !m.isStreaming));
    } finally {
      setIsLoading(false);
    }
  }, [conversationId, isLoading, onError]);

  return {
    messages,
    isLoading,
    isLoadingMessages,
    error,
    sendMessage,
    setMessages,
  };
}

NOTES :
- SSE parsing avec buffer pour gérer chunks incomplets
- Optimistic UI : message user ajouté immédiatement
- Placeholder avec isStreaming pour feedback UX
- AbortController pour annuler requêtes en cours
```

---

## Tâche 20.3 — Composant ConversationSidebar

### Contexte
La sidebar affiche la liste des conversations avec filtres, recherche, et actions (nouvelle conversation, renommer, supprimer). Elle supporte le collapse/expand pour gagner de l'espace.

### Description
Créer le composant ConversationSidebar avec liste groupée par date, filtres et actions.

### Prompt
```
Crée le composant ConversationSidebar pour la liste des conversations.

FICHIER : src/components/features/ai-chat/ConversationSidebar.tsx

IMPORTS :
'use client';
import { useState } from 'react';
import { cn } from '@/lib/utils';
import { Button } from '@/components/ui/button';
import { ScrollArea } from '@/components/ui/scroll-area';
import { Plus, PanelLeftClose, PanelLeft, Loader2 } from 'lucide-react';
import { useConversations } from '@/hooks/useConversations';
import { ConversationItem } from './ConversationItem';
import { ConversationFilters, type ConversationFilterValues } from './ConversationFilters';
import { NewConversationModal } from './NewConversationModal';
import { groupByDate, DATE_GROUP_LABELS, type DateGroup } from '@/lib/utils/date-groups';

PROPS :

interface ConversationSidebarProps {
  activeConversationId?: string;
  onSelectConversation: (id: string) => void;
  onNewConversation: (id: string) => void;
  className?: string;
  isCollapsed?: boolean;
  onCollapsedChange?: (collapsed: boolean) => void;
}

COMPOSANT :

export function ConversationSidebar({
  activeConversationId,
  onSelectConversation,
  onNewConversation,
  className,
  isCollapsed = false,
  onCollapsedChange,
}: ConversationSidebarProps) {
  const [localCollapsed, setLocalCollapsed] = useState(false);
  const actualCollapsed = onCollapsedChange ? isCollapsed : localCollapsed;
  const setCollapsed = onCollapsedChange || setLocalCollapsed;
  const [filters, setFilters] = useState<ConversationFilterValues>({});
  const [showNewModal, setShowNewModal] = useState(false);

  const {
    conversations,
    isLoading,
    createConversation,
    deleteConversation,
    renameConversation,
  } = useConversations({ filters });

  const groupedConversations = groupByDate(conversations);

  const handleNewConversation = async (title: string | undefined, courseIds: string[]) => {
    const id = await createConversation(title, courseIds);
    onNewConversation(id);
  };

  // MODE COLLAPSED
  if (actualCollapsed) {
    return (
      <div className="w-12 bg-background flex flex-col items-center py-4 gap-2 rounded-lg border">
        <Button variant="ghost" size="icon" onClick={() => setCollapsed(false)}>
          <PanelLeft className="h-5 w-5" />
        </Button>
        <Button variant="ghost" size="icon" onClick={() => setShowNewModal(true)}>
          <Plus className="h-5 w-5" />
        </Button>
        <NewConversationModal
          open={showNewModal}
          onOpenChange={setShowNewModal}
          onConfirm={handleNewConversation}
        />
      </div>
    );
  }

  // MODE NORMAL
  return (
    <div className={cn('w-full flex flex-col overflow-hidden', className)}>
      {/* Header */}
      <div className="p-4 border-b flex items-center justify-between">
        <h2 className="font-semibold truncate">Conversations</h2>
        <Button variant="ghost" size="icon" onClick={() => setCollapsed(true)}>
          <PanelLeftClose className="h-5 w-5" />
        </Button>
      </div>

      {/* New Button */}
      <div className="p-4">
        <Button onClick={() => setShowNewModal(true)} className="w-full" disabled={isLoading}>
          <Plus className="h-4 w-4 mr-2" />
          Nouvelle conversation
        </Button>
      </div>

      {/* Filters */}
      <div className="px-4 pb-2">
        <ConversationFilters onFilterChange={setFilters} />
      </div>

      {/* List */}
      <ScrollArea className="flex-1">
        <div className="pl-2 pr-2 pb-4">
          {isLoading ? (
            <div className="flex items-center justify-center py-8">
              <Loader2 className="h-6 w-6 animate-spin text-muted-foreground" />
            </div>
          ) : conversations.length === 0 ? (
            <p className="text-center text-sm text-muted-foreground py-8">
              Aucune conversation
            </p>
          ) : (
            (Object.keys(groupedConversations) as DateGroup[]).map((group) => {
              const items = groupedConversations[group];
              if (items.length === 0) return null;

              return (
                <div key={group} className="mb-4">
                  <h3 className="text-xs font-medium text-muted-foreground px-3 py-2">
                    {DATE_GROUP_LABELS[group]}
                  </h3>
                  <div className="space-y-1">
                    {items.map((conv) => (
                      <ConversationItem
                        key={conv.id}
                        conversation={conv}
                        isActive={conv.id === activeConversationId}
                        onClick={() => onSelectConversation(conv.id)}
                        onRename={() => {/* TODO */}}
                        onDelete={() => deleteConversation(conv.id)}
                      />
                    ))}
                  </div>
                </div>
              );
            })
          )}
        </div>
      </ScrollArea>

      <NewConversationModal
        open={showNewModal}
        onOpenChange={setShowNewModal}
        onConfirm={handleNewConversation}
      />
    </div>
  );
}

NOTES :
- Groupement par date (Aujourd'hui, Hier, Cette semaine, etc.)
- Mode collapsed = seulement icônes
- ConversationItem = sous-composant pour chaque item
- ConversationFilters = composant de filtres
```

---

## Tâche 20.4 — Composant ChatZone (affichage messages)

### Contexte
La ChatZone affiche la liste des messages dans un ScrollArea avec auto-scroll intelligent : toujours scroller pour les messages user, seulement si déjà en bas pour les messages assistant.

### Description
Créer le composant ChatZone avec auto-scroll intelligent et déduplication des messages.

### Prompt
```
Crée le composant ChatZone pour afficher les messages.

FICHIER : src/components/features/ai-chat/ChatZone.tsx

IMPORTS :
'use client';
import { useEffect, useRef, useCallback } from 'react';
import { ScrollArea } from '@/components/ui/scroll-area';
import type { ChatMessage as ChatMessageType } from '@/hooks/useAIChat';
import { ChatMessage } from './ChatMessage';
import { EmptyChat } from './EmptyChat';
import { cn } from '@/lib/utils';

PROPS :

interface ChatZoneProps {
  messages: ChatMessageType[];
  userName?: string;
  userAvatar?: string;
  onSuggestionClick?: (text: string) => void;
  className?: string;
}

COMPOSANT :

export function ChatZone({
  messages,
  userName,
  userAvatar,
  onSuggestionClick,
  className,
}: ChatZoneProps) {
  const bottomRef = useRef<HTMLDivElement>(null);
  const lastMessageCountRef = useRef(0);
  const shouldAutoScrollRef = useRef(true);

  // Dédupliquer les messages par ID
  const uniqueMessages = messages.filter(
    (msg, index, self) => index === self.findIndex((m) => m.id === msg.id)
  );

  const getScrollContainer = useCallback(() => {
    if (!bottomRef.current) return null;
    return bottomRef.current.closest('[data-radix-scroll-area-viewport]') as HTMLElement | null;
  }, []);

  const isNearBottom = useCallback(() => {
    const container = getScrollContainer();
    if (!container) return true;
    const threshold = 150;
    return container.scrollHeight - container.scrollTop - container.clientHeight < threshold;
  }, [getScrollContainer]);

  // Écoute le scroll pour détecter si user remonte manuellement
  useEffect(() => {
    const container = getScrollContainer();
    if (!container) return;

    const handleScroll = () => {
      shouldAutoScrollRef.current = isNearBottom();
    };

    container.addEventListener('scroll', handleScroll, { passive: true });
    return () => container.removeEventListener('scroll', handleScroll);
  }, [getScrollContainer, isNearBottom, uniqueMessages.length]);

  // Auto-scroll intelligent
  useEffect(() => {
    const currentCount = uniqueMessages.length;
    const wasNewMessageAdded = currentCount > lastMessageCountRef.current;
    lastMessageCountRef.current = currentCount;

    if (wasNewMessageAdded && bottomRef.current) {
      const lastMessage = uniqueMessages[uniqueMessages.length - 1];
      const isUserMessage = lastMessage?.role === 'user';
      
      // Toujours scroll pour messages user, sinon seulement si déjà en bas
      if (isUserMessage || shouldAutoScrollRef.current) {
        shouldAutoScrollRef.current = true;
        setTimeout(() => {
          bottomRef.current?.scrollIntoView({ behavior: 'smooth' });
        }, 50);
      }
    }
  }, [uniqueMessages]);

  // Empty state
  if (uniqueMessages.length === 0) {
    return (
      <div className={cn('h-full', className)}>
        <EmptyChat onSuggestionClick={onSuggestionClick || (() => {})} />
      </div>
    );
  }

  return (
    <ScrollArea className={cn('h-full', className)}>
      <div className="flex flex-col py-4">
        {uniqueMessages.map((message) => (
          <ChatMessage
            key={message.id}
            message={message}
            userName={userName}
            userAvatar={userAvatar}
          />
        ))}
        <div ref={bottomRef} />
      </div>
    </ScrollArea>
  );
}

NOTES :
- Auto-scroll intelligent pour éviter interruption lecture
- Déduplication par ID (sécurité)
- EmptyChat avec suggestions si vide
- bottomRef pour scroll vers le bas
```

---

## Tâche 20.5 — Composant ChatMessage (bulle message)

### Contexte
Chaque message a un rôle (user/assistant), un contenu (Markdown pour assistant), et des attachments optionnels. Les messages assistant supportent le streaming avec curseur animé.

### Description
Créer le composant ChatMessage avec support Markdown, streaming et attachments.

### Prompt
```
Crée le composant ChatMessage pour afficher une bulle de message.

FICHIER : src/components/features/ai-chat/ChatMessage.tsx

IMPORTS :
'use client';
import { memo } from 'react';
import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';
import { cn } from '@/lib/utils';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { Bot, User } from 'lucide-react';
import { MessageAttachment } from './MessageAttachment';
import type { ChatMessage as ChatMessageType } from '@/hooks/useAIChat';

PROPS :

interface ChatMessageProps {
  message: ChatMessageType;
  userName?: string;
  userAvatar?: string;
}

COMPOSANT :

export const ChatMessage = memo(function ChatMessage({
  message,
  userName,
  userAvatar,
}: ChatMessageProps) {
  const isUser = message.role === 'user';
  const isStreaming = message.isStreaming;

  return (
    <div className={cn('flex gap-3 px-4 py-3', isUser ? 'flex-row-reverse' : 'flex-row')}>
      {/* Avatar */}
      <Avatar className="h-8 w-8 shrink-0">
        {isUser ? (
          <>
            <AvatarImage src={userAvatar} alt={userName} />
            <AvatarFallback className="bg-primary text-primary-foreground">
              <User className="h-4 w-4" />
            </AvatarFallback>
          </>
        ) : (
          <AvatarFallback className="bg-gradient-to-br from-violet-500 to-purple-600 text-white">
            <Bot className="h-4 w-4" />
          </AvatarFallback>
        )}
      </Avatar>

      {/* Content */}
      <div className={cn('flex flex-col gap-2 max-w-[80%]', isUser ? 'items-end' : 'items-start')}>
        {/* Attachments (au-dessus pour user) */}
        {isUser && message.attachments?.length > 0 && (
          <div className="flex flex-wrap gap-2 justify-end">
            {message.attachments.map((att, idx) => (
              <MessageAttachment key={idx} attachment={att} />
            ))}
          </div>
        )}

        {/* Message Bubble */}
        <div
          className={cn(
            'rounded-2xl px-4 py-2',
            isUser
              ? 'bg-primary text-primary-foreground rounded-br-md'
              : 'bg-muted rounded-bl-md'
          )}
        >
          {isUser ? (
            <p className="text-sm whitespace-pre-wrap">{message.content}</p>
          ) : (
            <div className="prose prose-sm dark:prose-invert max-w-none">
              <ReactMarkdown remarkPlugins={[remarkGfm]}>
                {message.content}
              </ReactMarkdown>
              {isStreaming && (
                <span className="inline-block w-2 h-4 bg-current animate-pulse ml-1">
                  ▋
                </span>
              )}
            </div>
          )}
        </div>

        {/* Attachments (en-dessous pour assistant) */}
        {!isUser && message.attachments?.length > 0 && (
          <div className="flex flex-wrap gap-2">
            {message.attachments.map((att, idx) => (
              <MessageAttachment key={idx} attachment={att} />
            ))}
          </div>
        )}
      </div>
    </div>
  );
});

INSTALLER :
npm install react-markdown remark-gfm

NOTES :
- ReactMarkdown pour formatage messages assistant
- remarkGfm pour tables, listes à coches, etc.
- Curseur animé ▋ pendant streaming
- Attachments au-dessus pour user, en-dessous pour assistant
```

---

## Tâche 20.6 — Composant ChatInput (input multimodal)

### Contexte
L'input supporte texte multiligne, attachments (images, audio, vidéo, documents), drag & drop, enregistrement audio, et mode créatif. Il utilise le hook useFileUpload pour la gestion des fichiers.

### Description
Créer le composant ChatInput avec Textarea auto-resize, attachments, drag & drop et audio recorder.

### Prompt
```
Crée le composant ChatInput pour l'envoi de messages.

FICHIER : src/components/features/ai-chat/ChatInput.tsx

IMPORTS :
'use client';
import { useState, useRef, useCallback, useEffect } from 'react';
import type { KeyboardEvent, DragEvent } from 'react';
import { cn } from '@/lib/utils';
import { Button } from '@/components/ui/button';
import { Textarea } from '@/components/ui/textarea';
import { Tooltip, TooltipContent, TooltipTrigger } from '@/components/ui/tooltip';
import { Send, Paperclip, Sparkles, Loader2, Image as ImageIcon } from 'lucide-react';
import { useFileUpload } from '@/hooks/useFileUpload';
import { AttachmentPreview } from './AttachmentPreview';
import { AudioRecorder } from './AudioRecorder';
import type { UploadedFileInfo } from '@/types/upload';

PROPS :

interface ChatInputProps {
  onSendMessage: (content: string, attachments?: UploadedFileInfo[]) => void;
  onCreativeMode?: () => void;
  disabled?: boolean;
  placeholder?: string;
  className?: string;
}

COMPOSANT :

export function ChatInput({
  onSendMessage,
  onCreativeMode,
  disabled,
  placeholder = 'Pose ta question...',
  className,
}: ChatInputProps) {
  const [content, setContent] = useState('');
  const [isDragging, setIsDragging] = useState(false);
  const textareaRef = useRef<HTMLTextAreaElement>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const { files, isUploading, uploadFiles, removeFile, clearFiles } = useFileUpload();

  // Auto-resize textarea
  useEffect(() => {
    if (textareaRef.current) {
      textareaRef.current.style.height = 'auto';
      textareaRef.current.style.height = `${Math.min(textareaRef.current.scrollHeight, 200)}px`;
    }
  }, [content]);

  const handleSend = useCallback(() => {
    if ((!content.trim() && files.length === 0) || disabled || isUploading) return;

    onSendMessage(content.trim(), files.length > 0 ? files : undefined);
    setContent('');
    clearFiles();

    if (textareaRef.current) {
      textareaRef.current.style.height = 'auto';
    }
  }, [content, files, disabled, isUploading, onSendMessage, clearFiles]);

  const handleKeyDown = useCallback((e: KeyboardEvent<HTMLTextAreaElement>) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  }, [handleSend]);

  const handleFileSelect = useCallback(() => {
    fileInputRef.current?.click();
  }, []);

  const handleFileChange = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      uploadFiles(e.target.files);
      e.target.value = '';
    }
  }, [uploadFiles]);

  const handleDragOver = useCallback((e: DragEvent) => {
    e.preventDefault();
    setIsDragging(true);
  }, []);

  const handleDragLeave = useCallback((e: DragEvent) => {
    e.preventDefault();
    setIsDragging(false);
  }, []);

  const handleDrop = useCallback((e: DragEvent) => {
    e.preventDefault();
    setIsDragging(false);
    if (e.dataTransfer.files) {
      uploadFiles(e.dataTransfer.files);
    }
  }, [uploadFiles]);

  const handleAudioRecording = useCallback(async (blob: Blob) => {
    const file = new File([blob], `audio-${Date.now()}.webm`, { type: 'audio/webm' });
    await uploadFiles([file]);
  }, [uploadFiles]);

  return (
    <div
      className={cn(
        'relative border-t bg-background p-4',
        isDragging && 'ring-2 ring-primary ring-inset',
        className
      )}
      onDragOver={handleDragOver}
      onDragLeave={handleDragLeave}
      onDrop={handleDrop}
    >
      {/* Attachment Preview */}
      <AttachmentPreview
        files={files}
        onRemove={removeFile}
        isUploading={isUploading}
        className="mb-2"
      />

      {/* Drop overlay */}
      {isDragging && (
        <div className="absolute inset-0 bg-primary/10 flex items-center justify-center rounded-lg pointer-events-none z-10">
          <div className="flex flex-col items-center gap-2 text-primary">
            <ImageIcon className="h-8 w-8" />
            <span className="text-sm font-medium">Dépose tes fichiers ici</span>
          </div>
        </div>
      )}

      {/* Input Row */}
      <div className="flex items-end gap-2">
        {/* Left Actions */}
        <div className="flex items-center gap-1">
          <input
            ref={fileInputRef}
            type="file"
            multiple
            accept="image/*,audio/*,video/*,.pdf,.doc,.docx,.ppt,.pptx,.txt,.md"
            onChange={handleFileChange}
            className="hidden"
          />
          <Tooltip>
            <TooltipTrigger asChild>
              <Button
                type="button"
                variant="ghost"
                size="icon"
                className="h-8 w-8"
                onClick={handleFileSelect}
                disabled={disabled || isUploading}
              >
                <Paperclip className="h-4 w-4" />
              </Button>
            </TooltipTrigger>
            <TooltipContent>Joindre un fichier</TooltipContent>
          </Tooltip>

          <AudioRecorder
            onRecordingComplete={handleAudioRecording}
            disabled={disabled || isUploading}
          />
        </div>

        {/* Textarea */}
        <Textarea
          ref={textareaRef}
          value={content}
          onChange={(e) => setContent(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder={placeholder}
          disabled={disabled}
          className="min-h-[40px] max-h-[200px] resize-none flex-1"
          rows={1}
        />

        {/* Right Actions */}
        <div className="flex items-center gap-1">
          {onCreativeMode && (
            <Tooltip>
              <TooltipTrigger asChild>
                <Button
                  type="button"
                  variant="ghost"
                  size="icon"
                  className="h-8 w-8"
                  onClick={onCreativeMode}
                  disabled={disabled}
                >
                  <Sparkles className="h-4 w-4" />
                </Button>
              </TooltipTrigger>
              <TooltipContent>Mode créatif</TooltipContent>
            </Tooltip>
          )}

          <Tooltip>
            <TooltipTrigger asChild>
              <Button
                type="button"
                size="icon"
                className="h-8 w-8"
                onClick={handleSend}
                disabled={disabled || isUploading || (!content.trim() && files.length === 0)}
              >
                {isUploading ? (
                  <Loader2 className="h-4 w-4 animate-spin" />
                ) : (
                  <Send className="h-4 w-4" />
                )}
              </Button>
            </TooltipTrigger>
            <TooltipContent>Envoyer (Entrée)</TooltipContent>
          </Tooltip>
        </div>
      </div>
    </div>
  );
}

NOTES :
- Enter = envoyer, Shift+Enter = nouvelle ligne
- Auto-resize textarea jusqu'à 200px max
- Drag & drop avec overlay visuel
- AudioRecorder = sous-composant pour enregistrement audio
- AttachmentPreview = sous-composant pour prévisualisation
```

---

## Tâche 20.7 — Page student/ai (layout principal)

### Contexte
La page principale orchestre la sidebar, le chat et les modals. Elle supporte le responsive avec drawer mobile pour la sidebar, et utilise ResizablePanelLayout sur desktop.

### Description
Créer la page student/ai avec layout responsive et gestion de l'état.

### Prompt
```
Crée la page principale du chat IA pour les élèves.

FICHIER : src/app/(dashboard)/student/ai/page.tsx

IMPORTS :
'use client';
import { useState, useCallback } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useSession } from 'next-auth/react';
import {
  ConversationSidebar,
  ChatZone,
  ChatInput,
  ChatHeader,
  ConversationConfigModal,
} from '@/components/features/ai-chat';
import { useAIChat } from '@/hooks/useAIChat';
import { useConversations } from '@/hooks/useConversations';
import type { UploadedFileInfo } from '@/types/upload';
import { Loader2 } from 'lucide-react';
import { Sheet, SheetContent, SheetTitle, SheetDescription } from '@/components/ui/sheet';
import { VisuallyHidden } from '@radix-ui/react-visually-hidden';
import { ResizablePanelLayout } from '@/components/features/messages/ResizablePanelLayout';

COMPOSANT :

export default function StudentAIPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { data: session, status } = useSession();

  const activeConversationId = searchParams.get('id') || undefined;
  
  const [isMobileSidebarOpen, setIsMobileSidebarOpen] = useState(false);
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState(false);
  const [isConfigModalOpen, setIsConfigModalOpen] = useState(false);
  const [headerRefreshKey, setHeaderRefreshKey] = useState(0);

  const { renameConversation } = useConversations();

  const { messages, isLoading: isChatLoading, error: chatError, sendMessage } = useAIChat({
    conversationId: activeConversationId || '',
    onError: (error) => console.error('Erreur chat:', error),
  });

  const handleSelectConversation = useCallback((id: string) => {
    router.push(`/student/ai?id=${id}`);
    setIsMobileSidebarOpen(false);
  }, [router]);

  const handleNewConversation = useCallback((id: string) => {
    router.push(`/student/ai?id=${id}`);
    setIsMobileSidebarOpen(false);
  }, [router]);

  const handleSendMessage = useCallback(async (content: string, attachments?: UploadedFileInfo[]) => {
    if (!activeConversationId) return;
    await sendMessage(content, attachments);
  }, [activeConversationId, sendMessage]);

  const handleSuggestionClick = useCallback((text: string) => {
    handleSendMessage(text);
  }, [handleSendMessage]);

  const handleRenameConversation = useCallback(async (newTitle: string) => {
    if (!activeConversationId) return;
    await renameConversation(activeConversationId, newTitle);
  }, [activeConversationId, renameConversation]);

  const handleOpenConfigModal = useCallback(async () => {
    if (!activeConversationId) return;
    setIsConfigModalOpen(true);
  }, [activeConversationId]);

  const handleSaveConfig = useCallback(async (courseIds: string[], systemPrompt: string) => {
    if (!activeConversationId) return;
    
    await fetch(`/api/ai/conversations/${activeConversationId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ courseIds, systemPrompt }),
    });
    
    setHeaderRefreshKey(prev => prev + 1);
  }, [activeConversationId]);

  if (status === 'loading') {
    return (
      <div className="flex items-center justify-center h-screen">
        <Loader2 className="h-8 w-8 animate-spin text-muted-foreground" />
      </div>
    );
  }

  if (status === 'unauthenticated' || !session?.user) {
    router.push('/auth/signin');
    return null;
  }

  return (
    <div className="space-y-4">
      {/* Sidebar Mobile Drawer */}
      <Sheet open={isMobileSidebarOpen} onOpenChange={setIsMobileSidebarOpen}>
        <SheetContent side="left" className="p-0 w-[280px] md:hidden">
          <VisuallyHidden>
            <SheetTitle>Menu des conversations</SheetTitle>
            <SheetDescription>Liste de vos conversations avec l&apos;assistant IA</SheetDescription>
          </VisuallyHidden>
          <ConversationSidebar
            activeConversationId={activeConversationId}
            onSelectConversation={handleSelectConversation}
            onNewConversation={handleNewConversation}
            className="h-full"
          />
        </SheetContent>
      </Sheet>

      {/* Layout Desktop */}
      <div className="hidden md:block h-[calc(100vh-120px)]">
        <ResizablePanelLayout
          isCollapsed={isSidebarCollapsed}
          onCollapsedChange={setIsSidebarCollapsed}
          sidebar={
            <ConversationSidebar
              activeConversationId={activeConversationId}
              onSelectConversation={handleSelectConversation}
              onNewConversation={handleNewConversation}
              className="h-full rounded-lg border bg-card"
              isCollapsed={isSidebarCollapsed}
              onCollapsedChange={setIsSidebarCollapsed}
            />
          }
          content={
            <div className="flex flex-col h-full w-full overflow-hidden rounded-lg border bg-card">
              <ChatHeader
                key={`header-${activeConversationId}-${headerRefreshKey}`}
                conversationId={activeConversationId}
                onRename={handleRenameConversation}
                onOpenConfig={handleOpenConfigModal}
                onOpenMobileMenu={() => setIsMobileSidebarOpen(true)}
              />

              {activeConversationId ? (
                <div className="flex-1 flex flex-col overflow-hidden">
                  <ChatZone
                    messages={messages}
                    userName={session.user.name || 'Élève'}
                    userAvatar={session.user.image || undefined}
                    onSuggestionClick={handleSuggestionClick}
                    className="flex-1 overflow-y-auto"
                  />

                  {chatError && (
                    <div className="px-4 py-2 bg-destructive/10 border-t border-destructive/20">
                      <p className="text-sm text-destructive">{chatError}</p>
                    </div>
                  )}

                  <ChatInput
                    onSendMessage={handleSendMessage}
                    disabled={isChatLoading}
                    className="border-t"
                  />
                </div>
              ) : (
                <div className="flex-1 flex items-center justify-center p-4">
                  <div className="text-center max-w-md">
                    <h2 className="text-2xl font-bold mb-2">Bienvenue dans Blaiz&apos;bot Studio</h2>
                    <p className="text-muted-foreground mb-6">
                      Sélectionne une conversation ou crée-en une nouvelle.
                    </p>
                  </div>
                </div>
              )}
            </div>
          }
          defaultSidebarSize={30}
          minSidebarSize={20}
          maxSidebarSize={40}
        />
      </div>

      {/* Layout Mobile */}
      <div className="md:hidden h-full flex flex-col">
        <ChatHeader
          conversationId={activeConversationId}
          onRename={handleRenameConversation}
          onOpenConfig={handleOpenConfigModal}
          onOpenMobileMenu={() => setIsMobileSidebarOpen(true)}
        />

        {activeConversationId ? (
          <div className="flex-1 flex flex-col overflow-hidden">
            <ChatZone
              messages={messages}
              userName={session.user.name || 'Élève'}
              userAvatar={session.user.image || undefined}
              onSuggestionClick={handleSuggestionClick}
              className="flex-1"
            />

            {chatError && (
              <div className="px-4 py-2 bg-destructive/10 border-t">
                <p className="text-sm text-destructive">{chatError}</p>
              </div>
            )}

            <ChatInput onSendMessage={handleSendMessage} disabled={isChatLoading} />
          </div>
        ) : (
          <div className="flex-1 flex items-center justify-center p-4">
            <div className="text-center">
              <h2 className="text-2xl font-bold mb-2">Bienvenue</h2>
              <p className="text-muted-foreground">
                Ouvre le menu ☰ pour voir tes conversations
              </p>
            </div>
          </div>
        )}
      </div>

      {/* Config Modal */}
      {activeConversationId && (
        <ConversationConfigModal
          open={isConfigModalOpen}
          onOpenChange={setIsConfigModalOpen}
          onSave={handleSaveConfig}
        />
      )}
    </div>
  );
}

NOTES :
- URL comme source de vérité (searchParams.get('id'))
- Sheet mobile = drawer latéral
- ResizablePanelLayout desktop = sidebar redimensionnable
- headerRefreshKey pour forcer refresh après config
```

---

## Résumé Phase 20

| Tâche | Fichier | Fonction |
|-------|---------|----------|
| 20.1 | hooks/useConversations.ts | Hook CRUD conversations |
| 20.2 | hooks/useAIChat.ts | Hook messages + streaming SSE |
| 20.3 | ai-chat/ConversationSidebar.tsx | Liste conversations + filtres |
| 20.4 | ai-chat/ChatZone.tsx | Affichage messages + auto-scroll |
| 20.5 | ai-chat/ChatMessage.tsx | Bulle message Markdown |
| 20.6 | ai-chat/ChatInput.tsx | Input multimodal + drag&drop |
| 20.7 | student/ai/page.tsx | Page principale responsive |

**Total : 7 tâches**

**Composants additionnels déjà implémentés** :
- ChatHeader (titre + cours + actions)
- EmptyChat (suggestions initiales)
- NewConversationModal (création avec filtres)
- ConversationItem, ConversationFilters
- AttachmentPreview, AudioRecorder, MessageAttachment
- CoachWidget, ArtifactBubble, etc.
