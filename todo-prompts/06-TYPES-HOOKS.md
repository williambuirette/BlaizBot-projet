# Phase 06 — Types et Hooks

> Types TypeScript centralisés et hooks React réutilisables

---

## 6.1 — Architecture des types

### 6.1.1 — Organiser les types

#### Contexte
Les types TypeScript sont centralisés dans `src/types/` pour être réutilisables dans toute l'application.

#### Description
```
src/types/
├── index.ts          ← Types globaux (Role, User, ApiResponse)
├── admin.ts          ← Types spécifiques admin (UserRow, ClassRow)
├── profile.ts        ← Types profil utilisateur
├── ai-conversation.ts ← Types IA (conversations, messages)
├── ai-chat.ts        ← Types chat IA
├── upload.ts         ← Types upload fichiers
├── artifact.ts       ← Types artefacts IA
└── next-auth.d.ts    ← Extension types NextAuth
```

#### Prompt
```
Crée la structure des types :

mkdir -p src/types

Fichier principal src/types/index.ts qui exporte tout :
- Types énumérés (Role, Status, etc.)
- Types entités (User, Course, etc.)
- Types API (ApiResponse, PaginatedResponse)
- Types utilitaires (LayoutProps, NavItem)

L'import unifié permet :
import { Role, User, ApiResponse } from "@/types";
```

---

## 6.2 — Types de base

### 6.2.1 — Énumérations

#### Contexte
Les types énumérés évitent les erreurs de typo et permettent l'autocomplétion.

#### Description
Types union pour les valeurs fixes.

#### Prompt
```
Ajoute dans src/types/index.ts :

// -----------------------------------------------------
// ÉNUMÉRATIONS
// -----------------------------------------------------

/**
 * Rôles utilisateur
 */
export type Role = "ADMIN" | "TEACHER" | "STUDENT";

/**
 * Statuts entités
 */
export type Status = "ACTIVE" | "INACTIVE" | "PENDING" | "ARCHIVED";

/**
 * Types d'exercices IA
 */
export type ExerciseType = "QCM" | "OPEN" | "TRUE_FALSE" | "FILL_BLANK";

/**
 * Modes assistant IA
 */
export type AIMode = "HINT" | "EXPLAIN" | "QUIZ" | "REVISION";

/**
 * Niveaux de difficulté
 */
export type Difficulty = "EASY" | "MEDIUM" | "HARD";

/**
 * Statuts de progression
 */
export type ProgressStatus = "NOT_STARTED" | "IN_PROGRESS" | "COMPLETED" | "GRADED";

Les types union sont préférés aux enums car :
- Pas de code JS généré
- Compatibles avec les valeurs Prisma
- Autocomplétion IDE
```

---

### 6.2.2 — Types Utilisateur

#### Contexte
L'utilisateur est l'entité centrale, utilisée dans la session, les listes, les profils.

#### Description
Plusieurs interfaces selon le contexte d'utilisation.

#### Prompt
```
Ajoute les types utilisateur :

// -----------------------------------------------------
// UTILISATEURS
// -----------------------------------------------------

/**
 * Utilisateur de base (session, affichage)
 */
export interface User {
  id: string;
  email: string;
  role: Role;
  firstName: string;
  lastName: string;
  avatar?: string;
}

/**
 * Utilisateur complet (admin, détails)
 */
export interface UserFull extends User {
  createdAt: Date;
  updatedAt: Date;
  status: Status;
  phone?: string;
  address?: string;
  city?: string;
  postalCode?: string;
  classId?: string;
  className?: string;
}

/**
 * Ligne tableau admin
 */
export interface UserRow {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  role: Role;
  phone?: string | null;
  isActive?: boolean;
  createdAt: Date | string;
  // Pour STUDENT
  classId?: string | null;
  className?: string | null;
  // Pour TEACHER (N classes)
  classIds?: string[];
  classNames?: string[];
  // Matières (TEACHER)
  subjectIds?: string[];
  subjectNames?: string[];
}

L'extension "extends" permet de réutiliser les champs de base.
```

---

### 6.2.3 — Types Entités métier

#### Contexte
Classes, matières, cours sont les entités principales de l'application.

#### Description
Interfaces pour chaque entité avec relations optionnelles.

#### Prompt
```
Ajoute les types entités :

// -----------------------------------------------------
// ENTITÉS MÉTIER
// -----------------------------------------------------

/**
 * Classe (groupe d'élèves)
 */
export interface Class {
  id: string;
  name: string;
  level: string;
  color?: string;
  studentCount?: number;
}

/**
 * Matière
 */
export interface Subject {
  id: string;
  name: string;
  color?: string;
}

/**
 * Cours
 */
export interface Course {
  id: string;
  title: string;
  description?: string;
  subjectId: string;
  subject?: Subject;
  teacherId: string;
  teacher?: User;
  chaptersCount?: number;
  progress?: number; // 0-100 pour élève
  isDraft?: boolean;
  difficulty?: Difficulty;
}

/**
 * Chapitre de cours
 */
export interface Chapter {
  id: string;
  title: string;
  content?: string;
  order: number;
  courseId: string;
  isCompleted?: boolean;
}

/**
 * Section de chapitre
 */
export interface Section {
  id: string;
  title: string;
  type: "LESSON" | "EXERCISE" | "QUIZ" | "VIDEO";
  content?: string;
  order: number;
  chapterId: string;
}

Les champs optionnels (?) indiquent des données chargées à la demande.
```

---

## 6.3 — Types API

### 6.3.1 — Réponses standardisées

#### Contexte
Toutes les API retournent un format uniforme pour faciliter le traitement côté client.

#### Description
Pattern discriminated union avec `success: true | false`.

#### Prompt
```
Ajoute les types API :

// -----------------------------------------------------
// RÉPONSES API
// -----------------------------------------------------

/**
 * Réponse succès
 */
export interface ApiSuccessResponse<T> {
  success: true;
  data: T;
}

/**
 * Réponse erreur
 */
export interface ApiErrorResponse {
  success: false;
  error: {
    code: string;
    message: string;
    details?: Record<string, string[]>;
  };
}

/**
 * Réponse générique (union discriminée)
 */
export type ApiResponse<T> = ApiSuccessResponse<T> | ApiErrorResponse;

/**
 * Réponse paginée
 */
export interface PaginatedResponse<T> {
  data: T[];
  pagination: {
    page: number;
    limit: number;
    total: number;
    totalPages: number;
  };
}

Usage :
const response: ApiResponse<User> = await api.getUser(id);
if (response.success) {
  console.log(response.data.firstName); // Typé !
} else {
  console.error(response.error.message);
}
```

---

### 6.3.2 — Types Pagination et Filtres

#### Contexte
Les listes utilisent la pagination et des filtres.

#### Description
Interfaces pour les paramètres de requête.

#### Prompt
```
Ajoute les types pagination :

/**
 * Paramètres de pagination
 */
export interface PaginationParams {
  page?: number;
  limit?: number;
  sortBy?: string;
  sortOrder?: "asc" | "desc";
}

/**
 * Filtres génériques
 */
export interface BaseFilters {
  search?: string;
  status?: Status;
}

/**
 * Filtres utilisateurs (admin)
 */
export interface UserFilters extends BaseFilters {
  role?: Role;
  classId?: string;
}

/**
 * Filtres cours
 */
export interface CourseFilters extends BaseFilters {
  subjectId?: string;
  teacherId?: string;
  isDraft?: boolean;
}

Ces types permettent de construire les query params :
const params = new URLSearchParams();
if (filters.role) params.set("role", filters.role);
```

---

## 6.4 — Types Profil

### 6.4.1 — Types profil utilisateur

#### Contexte
Le profil utilisateur a des types lecture et écriture distincts.

#### Description
Séparer les données affichées des données modifiables.

#### Prompt
```
Crée src/types/profile.ts :

import { Role } from "@prisma/client";

/**
 * Données profil (lecture)
 */
export interface ProfileData {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  phone: string | null;
  address: string | null;
  city: string | null;
  postalCode: string | null;
  role: Role;
  createdAt: Date | string;
  lastLogin: Date | string | null;
}

/**
 * Payload mise à jour profil (écriture)
 * Note: email et role ne sont pas modifiables
 */
export interface ProfileUpdatePayload {
  firstName?: string;
  lastName?: string;
  phone?: string | null;
  address?: string | null;
  city?: string | null;
  postalCode?: string | null;
}

/**
 * Payload changement mot de passe
 */
export interface PasswordChangePayload {
  currentPassword: string;
  newPassword: string;
  confirmPassword: string;
}

/**
 * Préférences notification
 */
export interface NotificationSettings {
  emailEnabled: boolean;
  pushEnabled: boolean;
  deadlineReminder: boolean;
  newSubmissionAlert: boolean;
}

/**
 * Préférences générales
 */
export interface PreferenceSettings {
  language: "fr" | "en";
  theme: "light" | "dark" | "system";
}
```

---

## 6.5 — Types IA

### 6.5.1 — Types conversations IA

#### Contexte
Les conversations avec l'assistant IA ont une structure spécifique.

#### Description
Interfaces pour la liste, le détail et les messages.

#### Prompt
```
Crée src/types/ai-conversation.ts :

/**
 * Item conversation (liste sidebar)
 */
export interface AIConversationWithPreview {
  id: string;
  title: string;
  courseIds: string[];
  isPinned: boolean;
  messageCount: number;
  lastMessagePreview?: string | null;
  lastMessageAt?: string | null;
  createdAt: Date | string;
}

/**
 * Détail conversation (avec messages)
 */
export interface AIConversationDetail {
  id: string;
  title: string | null;
  courseIds: string[];
  isPinned: boolean;
  messageCount: number;
  createdAt: string;
  updatedAt: string;
  messages: AIMessageItem[];
  coachSession?: CoachSessionData | null;
}

/**
 * Message IA
 */
export interface AIMessageItem {
  id: string;
  role: "user" | "assistant" | "system";
  content: string;
  attachments: Attachment[] | null;
  artifact: Artifact | null;
  sources: Source[] | null;
  createdAt: string;
}

/**
 * Pièce jointe
 */
export interface Attachment {
  type: "image" | "audio" | "video" | "document";
  url: string;
  mimeType: string;
  name: string;
  size?: number;
}

/**
 * Source RAG
 */
export interface Source {
  docId: string;
  docName: string;
  excerpt: string;
  page?: number;
}

/**
 * Artefact généré par l'IA
 */
export interface Artifact {
  id: string;
  type: ArtifactType;
  state: ArtifactState;
  title: string;
  data: Record<string, unknown>;
}

export type ArtifactType = "NOTE" | "LESSON" | "VIDEO" | "EXERCISE" | "QUIZ";
export type ArtifactState = "GENERATING" | "READY" | "PLAYING" | "COMPLETED" | "SAVED";

/**
 * Session coach IA (métriques)
 */
export interface CoachSessionData {
  comprehension: number;
  autonomy: number;
  rigor: number;
  comprehensionTrend: number;
  autonomyTrend: number;
  rigorTrend: number;
  messageCount: number;
  lastAdvice?: string;
}
```

---

## 6.6 — Types utilitaires

### 6.6.1 — Types React courants

#### Contexte
Types réutilisables pour les composants React.

#### Description
Props communes pour layouts, classNames, etc.

#### Prompt
```
Ajoute dans src/types/index.ts :

// -----------------------------------------------------
// UTILITAIRES
// -----------------------------------------------------

/**
 * Props avec children (layouts)
 */
export interface LayoutProps {
  children: React.ReactNode;
}

/**
 * Props avec className optionnel
 */
export interface ClassNameProps {
  className?: string;
}

/**
 * Props combinées
 */
export interface BaseComponentProps extends ClassNameProps {
  children?: React.ReactNode;
}

/**
 * Item navigation (sidebar)
 */
export interface NavItem {
  label: string;
  href: string;
  icon: React.ReactNode;
  badge?: number;
}

/**
 * Option de select
 */
export interface SelectOption {
  value: string;
  label: string;
  disabled?: boolean;
}

/**
 * État de chargement
 */
export interface LoadingState {
  isLoading: boolean;
  error: string | null;
}
```

---

## 6.7 — Architecture des hooks

### 6.7.1 — Organiser les hooks

#### Contexte
Les hooks personnalisés sont dans `src/hooks/` organisés par domaine.

#### Description
```
src/hooks/
├── useUserProfile.ts     ← Profil utilisateur (SWR)
├── useNotifications.ts   ← Notifications temps réel
├── useConversations.ts   ← Liste conversations IA
├── useAIChat.ts          ← Chat IA avec streaming
├── useFileUpload.ts      ← Upload fichiers
├── use-toast.ts          ← Notifications toast
├── admin/                ← Hooks spécifiques admin
└── teacher/              ← Hooks spécifiques prof
```

#### Prompt
```
Crée la structure des hooks :

mkdir -p src/hooks/admin
mkdir -p src/hooks/teacher

Convention :
- Préfixe "use" obligatoire
- Un hook = une responsabilité
- Retourne un objet typé avec les méthodes et états
```

---

## 6.8 — Hook useUserProfile

### 6.8.1 — Créer useUserProfile

#### Contexte
Hook pour gérer le profil utilisateur avec SWR (cache + revalidation).

#### Description
- Chargement automatique du profil
- Mise à jour optimiste
- Changement de mot de passe

#### Prompt
```
Crée src/hooks/useUserProfile.ts :

"use client";

import useSWR from "swr";
import { ProfileData, ProfileUpdatePayload, PasswordChangePayload } from "@/types/profile";

// Fetcher standard
const fetcher = async (url: string) => {
  const res = await fetch(url);
  const data = await res.json();
  if (!data.success) throw new Error(data.error || "Erreur chargement");
  return data.data;
};

export function useUserProfile() {
  const { data, error, isLoading, mutate } = useSWR<ProfileData>(
    "/api/user/profile",
    fetcher
  );

  /**
   * Mettre à jour le profil
   */
  const updateProfile = async (payload: ProfileUpdatePayload) => {
    try {
      // Optimistic update
      if (data) {
        mutate({ ...data, ...payload }, false);
      }

      const res = await fetch("/api/user/profile", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });

      const result = await res.json();

      if (!result.success) {
        mutate(); // Rollback
        return { success: false, error: result.error };
      }

      mutate(result.data);
      return { success: true };
    } catch (err) {
      mutate(); // Rollback
      return { success: false, error: "Erreur inattendue" };
    }
  };

  /**
   * Changer le mot de passe
   */
  const changePassword = async (payload: PasswordChangePayload) => {
    const res = await fetch("/api/user/password", {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });

    const result = await res.json();
    return result.success 
      ? { success: true } 
      : { success: false, error: result.error };
  };

  return {
    profile: data,
    isLoading,
    error: error?.message,
    updateProfile,
    changePassword,
    refetch: () => mutate(),
  };
}

SWR apporte :
- Cache automatique
- Revalidation au focus
- Déduplication des requêtes
- État de chargement intégré
```

---

## 6.9 — Hook useNotifications

### 6.9.1 — Créer useNotifications

#### Contexte
Hook pour les notifications avec polling automatique.

#### Description
- Chargement initial + polling 30s
- Marquer comme lu
- Compteur non lus

#### Prompt
```
Crée src/hooks/useNotifications.ts :

"use client";

import { useState, useEffect, useCallback } from "react";

interface Notification {
  id: string;
  type: string;
  title: string;
  message: string;
  link?: string;
  isRead: boolean;
  createdAt: string;
}

export function useNotifications() {
  const [notifications, setNotifications] = useState<Notification[]>([]);
  const [unreadCount, setUnreadCount] = useState(0);
  const [isLoading, setIsLoading] = useState(true);

  const fetchNotifications = useCallback(async () => {
    try {
      const response = await fetch("/api/notifications");
      const data = await response.json();
      if (data.success) {
        setNotifications(data.data.notifications);
        setUnreadCount(data.data.unreadCount);
      }
    } catch (error) {
      console.error("Erreur fetch notifications:", error);
    } finally {
      setIsLoading(false);
    }
  }, []);

  // Chargement initial + polling
  useEffect(() => {
    fetchNotifications();
    const interval = setInterval(fetchNotifications, 30000);
    return () => clearInterval(interval);
  }, [fetchNotifications]);

  const markAsRead = useCallback(async (notificationId: string) => {
    try {
      await fetch("/api/notifications", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          action: "mark_read",
          notificationId,
        }),
      });

      // Mise à jour locale
      setNotifications((prev) =>
        prev.map((n) => (n.id === notificationId ? { ...n, isRead: true } : n))
      );
      setUnreadCount((prev) => Math.max(0, prev - 1));
    } catch (error) {
      console.error("Erreur mark_read:", error);
    }
  }, []);

  const markAllAsRead = useCallback(async () => {
    await fetch("/api/notifications", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ action: "mark_all_read" }),
    });

    setNotifications((prev) => prev.map((n) => ({ ...n, isRead: true })));
    setUnreadCount(0);
  }, []);

  return {
    notifications,
    unreadCount,
    isLoading,
    markAsRead,
    markAllAsRead,
    refetch: fetchNotifications,
  };
}
```

---

## 6.10 — Hook useFileUpload

### 6.10.1 — Créer useFileUpload

#### Contexte
Hook pour l'upload de fichiers avec progression.

#### Description
- Upload simple ou multiple
- Progression en temps réel
- Gestion des erreurs

#### Prompt
```
Crée src/hooks/useFileUpload.ts :

"use client";

import { useState, useCallback } from "react";

export interface UploadedFileInfo {
  id: string;
  filename: string;
  url: string;
  mimeType: string;
  size: number;
}

export function useFileUpload() {
  const [files, setFiles] = useState<UploadedFileInfo[]>([]);
  const [isUploading, setIsUploading] = useState(false);
  const [uploadProgress, setUploadProgress] = useState(0);

  const uploadFile = useCallback(async (file: File) => {
    const formData = new FormData();
    formData.append("file", file);

    const response = await fetch("/api/upload", {
      method: "POST",
      body: formData,
    });

    const data = await response.json();
    if (!data.success) throw new Error(data.error);

    return data.file as UploadedFileInfo;
  }, []);

  const uploadFiles = useCallback(async (fileList: FileList | File[]) => {
    const filesArray = Array.from(fileList);
    if (filesArray.length === 0) return;

    setIsUploading(true);
    setUploadProgress(0);

    const uploaded: UploadedFileInfo[] = [];

    for (let i = 0; i < filesArray.length; i++) {
      const file = filesArray[i];
      if (!file) continue;

      try {
        const result = await uploadFile(file);
        uploaded.push(result);
      } catch (error) {
        console.error(`Échec upload ${file.name}:`, error);
      }

      setUploadProgress(((i + 1) / filesArray.length) * 100);
    }

    setFiles((prev) => [...prev, ...uploaded]);
    setIsUploading(false);
    setUploadProgress(0);
  }, [uploadFile]);

  const removeFile = useCallback((id: string) => {
    setFiles((prev) => prev.filter((f) => f.id !== id));
  }, []);

  const clearFiles = useCallback(() => {
    setFiles([]);
  }, []);

  return {
    files,
    isUploading,
    uploadProgress,
    uploadFile,
    uploadFiles,
    removeFile,
    clearFiles,
  };
}
```

---

## 6.11 — Hook useConversations

### 6.11.1 — Créer useConversations

#### Contexte
Hook pour gérer la liste des conversations IA.

#### Description
- Chargement avec filtres
- CRUD conversations
- Mise à jour locale après actions

#### Prompt
```
Crée src/hooks/useConversations.ts :

"use client";

import { useState, useEffect, useCallback } from "react";
import type { AIConversationWithPreview } from "@/types/ai-conversation";

interface UseConversationsOptions {
  filters?: {
    courseId?: string;
  };
}

export function useConversations(options: UseConversationsOptions = {}) {
  const [conversations, setConversations] = useState<AIConversationWithPreview[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchConversations = useCallback(async () => {
    try {
      setIsLoading(true);
      const params = new URLSearchParams();
      if (options.filters?.courseId) {
        params.set("courseId", options.filters.courseId);
      }

      const response = await fetch(`/api/ai/conversations?${params}`);
      const data = await response.json();

      if (data.error) throw new Error(data.error);

      setConversations(data.items || []);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Erreur");
    } finally {
      setIsLoading(false);
    }
  }, [options.filters?.courseId]);

  useEffect(() => {
    fetchConversations();
  }, [fetchConversations]);

  const createConversation = useCallback(async (title?: string, courseIds?: string[]) => {
    const response = await fetch("/api/ai/conversations", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ title, courseIds }),
    });

    const data = await response.json();
    if (!data.success) throw new Error(data.error);

    setConversations((prev) => [data.data, ...prev]);
    return data.data.id;
  }, []);

  const deleteConversation = useCallback(async (id: string) => {
    await fetch(`/api/ai/conversations/${id}`, { method: "DELETE" });
    setConversations((prev) => prev.filter((c) => c.id !== id));
  }, []);

  const renameConversation = useCallback(async (id: string, title: string) => {
    await fetch(`/api/ai/conversations/${id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ title }),
    });

    setConversations((prev) =>
      prev.map((c) => (c.id === id ? { ...c, title } : c))
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
```

---

## 6.12 — Hook useAIChat

### 6.12.1 — Créer useAIChat (streaming)

#### Contexte
Hook pour le chat IA avec support du streaming de réponse.

#### Description
- Chargement messages existants
- Envoi message + streaming réponse
- Gestion abort controller

#### Prompt
```
Crée src/hooks/useAIChat.ts :

"use client";

import { useState, useCallback, useRef, useEffect } from "react";

export interface ChatMessage {
  id: string;
  role: "user" | "assistant";
  content: string;
  isStreaming?: boolean;
  createdAt: Date;
}

interface UseAIChatOptions {
  conversationId: string;
  onError?: (error: string) => void;
}

export function useAIChat({ conversationId, onError }: UseAIChatOptions) {
  const [messages, setMessages] = useState<ChatMessage[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const [isLoadingMessages, setIsLoadingMessages] = useState(false);
  const abortControllerRef = useRef<AbortController | null>(null);

  // Charger les messages existants
  useEffect(() => {
    if (!conversationId) {
      setMessages([]);
      return;
    }

    const loadMessages = async () => {
      setIsLoadingMessages(true);
      try {
        const response = await fetch(`/api/ai/conversations/${conversationId}`);
        const data = await response.json();

        const loaded = (data.messages || []).map((msg: any) => ({
          id: msg.id,
          role: msg.role,
          content: msg.content,
          createdAt: new Date(msg.createdAt),
        }));

        setMessages(loaded);
      } catch (err) {
        onError?.(err instanceof Error ? err.message : "Erreur");
      } finally {
        setIsLoadingMessages(false);
      }
    };

    loadMessages();
  }, [conversationId, onError]);

  const sendMessage = useCallback(async (content: string) => {
    if (!content.trim() || isLoading) return;

    // Annuler requête précédente
    if (abortControllerRef.current) {
      abortControllerRef.current.abort();
    }
    abortControllerRef.current = new AbortController();

    setIsLoading(true);

    // Ajouter message utilisateur
    const userMessage: ChatMessage = {
      id: `temp_${Date.now()}`,
      role: "user",
      content,
      createdAt: new Date(),
    };
    setMessages((prev) => [...prev, userMessage]);

    // Message assistant (streaming)
    const assistantId = `assistant_${Date.now()}`;
    setMessages((prev) => [
      ...prev,
      { id: assistantId, role: "assistant", content: "", isStreaming: true, createdAt: new Date() },
    ]);

    try {
      const response = await fetch("/api/ai/chat", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ conversationId, content }),
        signal: abortControllerRef.current.signal,
      });

      const reader = response.body?.getReader();
      const decoder = new TextDecoder();

      if (reader) {
        while (true) {
          const { done, value } = await reader.read();
          if (done) break;

          const chunk = decoder.decode(value);
          setMessages((prev) =>
            prev.map((m) =>
              m.id === assistantId ? { ...m, content: m.content + chunk } : m
            )
          );
        }
      }

      // Fin streaming
      setMessages((prev) =>
        prev.map((m) => (m.id === assistantId ? { ...m, isStreaming: false } : m))
      );
    } catch (err) {
      if ((err as Error).name !== "AbortError") {
        onError?.(err instanceof Error ? err.message : "Erreur");
      }
    } finally {
      setIsLoading(false);
    }
  }, [conversationId, isLoading, onError]);

  return {
    messages,
    isLoading,
    isLoadingMessages,
    sendMessage,
    setMessages,
  };
}
```

---

## 6.13 — Hook use-toast

### 6.13.1 — Utiliser le toast de shadcn

#### Contexte
shadcn/ui fournit un système de toast prêt à l'emploi avec Sonner.

#### Description
Wrapper simple pour les notifications toast.

#### Prompt
```
Le toast est déjà configuré avec Sonner (Phase 02).

Usage dans les composants :

import { toast } from "sonner";

// Succès
toast.success("Profil mis à jour !");

// Erreur
toast.error("Échec de la sauvegarde");

// Info
toast.info("Chargement en cours...");

// Custom
toast("Message", {
  description: "Description détaillée",
  action: {
    label: "Annuler",
    onClick: () => console.log("Annulé"),
  },
});

Pas besoin de hook custom, Sonner gère tout.
```

---

## 6.14 — Commit Phase 06

### 6.14.1 — Commit des types et hooks

#### Contexte
Sauvegarder les types et hooks centralisés.

#### Description
Commit avec tous les fichiers créés.

#### Prompt
```
Commit les types et hooks :

git add .
git commit -m "feat: add centralized types and custom hooks

Types:
- Role, Status, Difficulty enums
- User, UserFull, UserRow
- Class, Subject, Course, Chapter
- ApiResponse, PaginatedResponse
- AIConversation, AIMessage, Artifact
- ProfileData, ProfileUpdatePayload

Hooks:
- useUserProfile (SWR + optimistic updates)
- useNotifications (polling 30s)
- useFileUpload (progress tracking)
- useConversations (CRUD)
- useAIChat (streaming support)"

Vérification : npm run lint
```

---

## ✅ Checklist Phase 06

- [ ] Structure src/types/ créée
- [ ] Types énumérés (Role, Status, Difficulty)
- [ ] Types User (base, full, row)
- [ ] Types entités (Class, Subject, Course)
- [ ] Types API (ApiResponse, Paginated)
- [ ] Types profil (ProfileData, UpdatePayload)
- [ ] Types IA (Conversation, Message, Artifact)
- [ ] Types utilitaires (LayoutProps, NavItem)
- [ ] Hook useUserProfile avec SWR
- [ ] Hook useNotifications avec polling
- [ ] Hook useFileUpload avec progress
- [ ] Hook useConversations (CRUD)
- [ ] Hook useAIChat avec streaming
- [ ] Commit effectué

---

## 📊 Récapitulatif

| Catégorie | Fichiers |
|:----------|:---------|
| **Types base** | index.ts (Role, User, ApiResponse, etc.) |
| **Types profil** | profile.ts |
| **Types IA** | ai-conversation.ts, ai-chat.ts |
| **Types upload** | upload.ts |
| **Types admin** | admin.ts |
| **Hook profil** | useUserProfile.ts |
| **Hook notifications** | useNotifications.ts |
| **Hook upload** | useFileUpload.ts |
| **Hook conversations** | useConversations.ts |
| **Hook chat** | useAIChat.ts |

---

*Phase suivante : [07-API-CRUD.md](07-API-CRUD.md)*
