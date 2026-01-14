# Phase 03 — Layout & Navigation

> Structure du layout dashboard avec sidebar responsive et header

---

## 3.1 — Architecture des layouts

### 3.1.1 — Comprendre les layouts Next.js

#### Contexte
Next.js App Router utilise des fichiers `layout.tsx` imbriqués. Chaque layout enveloppe ses enfants et persiste entre les navigations.

#### Description
```
src/app/
├── layout.tsx           ← RootLayout (html, body, providers)
├── (auth)/
│   └── login/page.tsx   ← Pas de layout spécifique
└── (dashboard)/
    ├── layout.tsx       ← DashboardLayout (sidebar, header)
    ├── student/
    │   └── page.tsx
    ├── teacher/
    │   └── page.tsx
    └── admin/
        └── page.tsx
```

Les parenthèses `(auth)` et `(dashboard)` sont des **Route Groups** : ils organisent sans affecter l'URL.

#### Prompt
```
Structure des layouts à créer :

1. src/app/layout.tsx (RootLayout)
   - Balises <html> et <body>
   - Fonts Google (Geist)
   - Providers (Session)
   - Toaster (notifications)

2. src/app/(dashboard)/layout.tsx (DashboardLayout)
   - Vérifie la session (redirection si non connecté)
   - Enveloppe les pages avec DashboardShell

Les pages dans (dashboard)/ héritent automatiquement du layout dashboard.
```

---

## 3.2 — RootLayout

### 3.2.1 — Créer le layout racine

#### Contexte
Le RootLayout est le point d'entrée HTML de l'application. Il ne se recharge jamais.

#### Description
Éléments inclus :
- `<html lang="fr">` pour l'accessibilité
- Fonts Geist (sans-serif moderne de Vercel)
- `<Providers>` pour NextAuth session
- `<Toaster />` pour les notifications

#### Prompt
```
Crée src/app/layout.tsx :

import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { Toaster } from "@/components/ui/sonner";
import { Providers } from "@/components/providers/SessionProvider";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "BlaizBot - Plateforme Éducative",
  description: "Application éducative avec IA intégrée",
  viewport: {
    width: "device-width",
    initialScale: 1,
    maximumScale: 1,
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr" suppressHydrationWarning>
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
        suppressHydrationWarning
      >
        <Providers>
          {children}
          <Toaster />
        </Providers>
      </body>
    </html>
  );
}

Note : suppressHydrationWarning évite les warnings d'hydratation causés par les extensions navigateur.
```

---

### 3.2.2 — Créer le SessionProvider

#### Contexte
NextAuth v5 nécessite un provider client pour exposer la session aux composants.

#### Description
On isole le provider dans un fichier dédié car il utilise `"use client"`.

#### Prompt
```
Crée src/components/providers/SessionProvider.tsx :

"use client";

import { SessionProvider } from "next-auth/react";

interface ProvidersProps {
  children: React.ReactNode;
}

export function Providers({ children }: ProvidersProps) {
  return <SessionProvider>{children}</SessionProvider>;
}

Créer aussi le barrel export :
src/components/providers/index.ts :

export { Providers } from "./SessionProvider";

Ce provider sera utilisé dans RootLayout.
```

---

## 3.3 — DashboardLayout

### 3.3.1 — Créer le layout dashboard

#### Contexte
Les pages protégées (student, teacher, admin) partagent un layout commun avec sidebar et header.

#### Description
Ce layout :
1. Vérifie la session côté serveur avec `auth()`
2. Redirige vers `/login` si non connecté
3. Passe le rôle et l'utilisateur au shell

#### Prompt
```
Crée src/app/(dashboard)/layout.tsx :

import { DashboardShell } from "@/components/layout/DashboardShell";
import { auth } from "@/lib/auth";
import { redirect } from "next/navigation";
import type { Role } from "@/types";

export default async function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const session = await auth();

  // Redirection si non connecté
  if (!session?.user) {
    redirect("/login");
  }

  const role = session.user.role as Role;

  return (
    <DashboardShell role={role} user={session.user}>
      {children}
    </DashboardShell>
  );
}

Ce layout est un Server Component (async) qui peut appeler auth() directement.
```

---

## 3.4 — DashboardShell

### 3.4.1 — Créer le composant shell

#### Contexte
DashboardShell orchestre la sidebar et le header. C'est un Client Component car il gère l'état de la sidebar (ouvert/fermé sur mobile).

#### Description
Structure :
```
┌────────────────────────────────────────┐
│ Sidebar (fixed, 256px)                 │
│ ┌────────────────────────────────────┐ │
│ │ Header (sticky, 64px)              │ │
│ ├────────────────────────────────────┤ │
│ │ Main (scrollable)                  │ │
│ │ {children}                         │ │
│ └────────────────────────────────────┘ │
└────────────────────────────────────────┘
```

#### Prompt
```
Crée src/components/layout/DashboardShell.tsx :

"use client";

import { useState } from "react";
import { Sidebar, MenuButton } from "./Sidebar";
import { Header } from "./Header";
import type { Role } from "@/types";

interface DashboardShellProps {
  role: Role;
  user: {
    name?: string | null;
    email?: string | null;
    role?: "ADMIN" | "TEACHER" | "STUDENT" | "PARENT";
  };
  children: React.ReactNode;
}

export function DashboardShell({ role, user, children }: DashboardShellProps) {
  const [sidebarOpen, setSidebarOpen] = useState(false);

  const toggleSidebar = () => setSidebarOpen((prev) => !prev);

  return (
    <div className="h-screen flex flex-col bg-gray-50">
      {/* Sidebar */}
      <Sidebar role={role} isOpen={sidebarOpen} onToggle={toggleSidebar} />

      {/* Zone principale (décalée de 256px sur desktop) */}
      <div className="lg:ml-64 transition-all duration-300 flex flex-col flex-1 min-h-0">
        {/* Header avec menu burger mobile */}
        <Header user={user} menuButton={<MenuButton onClick={toggleSidebar} />} />

        {/* Contenu scrollable */}
        <main className="flex-1 overflow-y-auto p-4 md:p-6">{children}</main>
      </div>
    </div>
  );
}

Points clés :
- lg:ml-64 → marge gauche de 256px sur desktop (largeur sidebar)
- Sidebar fixed, Header sticky
- Main avec overflow-y-auto pour scroll indépendant
```

---

## 3.5 — Sidebar

### 3.5.1 — Créer la structure de la sidebar

#### Contexte
La sidebar affiche la navigation. Elle est fixed sur desktop (toujours visible) et cachée par défaut sur mobile (slide-in).

#### Description
Sections :
1. Logo + titre
2. Navigation (liens par rôle)
3. Footer (version)

#### Prompt
```
Crée src/components/layout/Sidebar.tsx :

"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";
import { Role } from "@/types";
import {
  Home,
  Users,
  School,
  BookMarked,
  BookOpen,
  MessageSquare,
  Brain,
  CalendarDays,
  X,
  Menu,
} from "lucide-react";

interface SidebarProps {
  role: Role;
  isOpen?: boolean;
  onToggle?: () => void;
}

interface NavItem {
  label: string;
  href: string;
  icon: React.ReactNode;
}

// Navigation par rôle
const adminNavItems: NavItem[] = [
  { label: "Dashboard", href: "/admin", icon: <Home size={20} /> },
  { label: "Utilisateurs", href: "/admin/users", icon: <Users size={20} /> },
  { label: "Classes", href: "/admin/classes", icon: <School size={20} /> },
  { label: "Matières", href: "/admin/subjects", icon: <BookMarked size={20} /> },
];

const teacherNavItems: NavItem[] = [
  { label: "Dashboard", href: "/teacher", icon: <Home size={20} /> },
  { label: "Mes classes", href: "/teacher/classes", icon: <School size={20} /> },
  { label: "Mes élèves", href: "/teacher/students", icon: <Users size={20} /> },
  { label: "Mes cours", href: "/teacher/courses", icon: <BookOpen size={20} /> },
  { label: "Agendas", href: "/teacher/assignments", icon: <CalendarDays size={20} /> },
  { label: "Messages", href: "/teacher/messages", icon: <MessageSquare size={20} /> },
];

const studentNavItems: NavItem[] = [
  { label: "Dashboard", href: "/student", icon: <Home size={20} /> },
  { label: "Mes cours", href: "/student/courses", icon: <BookOpen size={20} /> },
  { label: "Mes révisions", href: "/student/revisions", icon: <BookMarked size={20} /> },
  { label: "Agenda", href: "/student/agenda", icon: <CalendarDays size={20} /> },
  { label: "Assistant IA", href: "/student/ai", icon: <Brain size={20} /> },
  { label: "Messages", href: "/student/messages", icon: <MessageSquare size={20} /> },
];

const navItemsByRole: Record<Role, NavItem[]> = {
  ADMIN: adminNavItems,
  TEACHER: teacherNavItems,
  STUDENT: studentNavItems,
};

// Suite dans la tâche suivante...
```

---

### 3.5.2 — Compléter la sidebar avec le rendu

#### Contexte
Le composant Sidebar utilise Tailwind pour le responsive : caché sur mobile, visible sur desktop.

#### Description
- Mobile : `translate-x-full` par défaut, `translate-x-0` quand ouvert
- Desktop : `lg:translate-x-0` (toujours visible)
- Overlay sombre quand ouvert sur mobile

#### Prompt
```
Complète Sidebar.tsx avec le rendu :

export function Sidebar({ role, isOpen = true, onToggle }: SidebarProps) {
  const pathname = usePathname();
  const navItems = navItemsByRole[role];

  return (
    <>
      {/* Overlay mobile */}
      {isOpen && onToggle && (
        <div
          className="fixed inset-0 bg-black/50 z-40 lg:hidden"
          onClick={onToggle}
          aria-hidden="true"
        />
      )}

      {/* Sidebar */}
      <aside
        className={cn(
          "w-64 h-screen bg-slate-900 text-white fixed left-0 top-0 flex flex-col z-50",
          "transition-transform duration-300 ease-in-out",
          isOpen ? "translate-x-0" : "-translate-x-full",
          "lg:translate-x-0"
        )}
      >
        {/* Logo */}
        <div className="p-4 border-b border-slate-700 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <span className="text-2xl">🤖</span>
            <span className="text-xl font-bold">BlaizBot</span>
          </Link>
          
          {/* Bouton fermer (mobile) */}
          {onToggle && (
            <button
              onClick={onToggle}
              className="lg:hidden p-2 rounded-lg hover:bg-slate-800"
              aria-label="Fermer le menu"
            >
              <X size={24} />
            </button>
          )}
        </div>

        {/* Navigation */}
        <nav className="flex-1 p-4 overflow-y-auto">
          <ul className="space-y-1">
            {navItems.map((item) => {
              const isActive = pathname === item.href;
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    onClick={onToggle}
                    className={cn(
                      "flex items-center gap-3 px-4 py-2 rounded-lg transition-colors",
                      "hover:bg-slate-800",
                      isActive && "bg-slate-800 text-blue-400"
                    )}
                  >
                    {item.icon}
                    <span>{item.label}</span>
                  </Link>
                </li>
              );
            })}
          </ul>
        </nav>

        {/* Footer */}
        <div className="p-4 border-t border-slate-700">
          <p className="text-xs text-slate-400">BlaizBot v1.0</p>
        </div>
      </aside>
    </>
  );
}

// Bouton menu burger (exporté pour Header)
export function MenuButton({ onClick }: { onClick: () => void }) {
  return (
    <button
      onClick={onClick}
      className="lg:hidden p-2 rounded-lg hover:bg-gray-100"
      aria-label="Ouvrir le menu"
    >
      <Menu size={24} className="text-slate-700" />
    </button>
  );
}
```

---

## 3.6 — Header

### 3.6.1 — Créer le composant header

#### Contexte
Le header affiche le titre, la recherche (desktop), les notifications et le menu utilisateur.

#### Description
Zones :
1. Gauche : menu burger (mobile) + titre
2. Centre : barre de recherche (desktop)
3. Droite : notifications + avatar + dropdown

#### Prompt
```
Crée src/components/layout/Header.tsx :

"use client";

import { useState, useSyncExternalStore } from "react";
import { signOut } from "next-auth/react";
import { Input } from "@/components/ui/input";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { Search, User, Settings, LogOut } from "lucide-react";

interface HeaderProps {
  user?: {
    name?: string | null;
    email?: string | null;
    role?: "ADMIN" | "TEACHER" | "STUDENT" | "PARENT";
  };
  menuButton?: React.ReactNode;
}

// Fix hydration mismatch
const emptySubscribe = () => () => {};
const useIsClient = () =>
  useSyncExternalStore(emptySubscribe, () => true, () => false);

// Initiales depuis le nom
const getInitials = (name?: string | null): string => {
  if (!name) return "U";
  const parts = name.trim().split(" ").filter(Boolean);
  if (parts.length >= 2) {
    return `${parts[0][0]}${parts[1][0]}`.toUpperCase();
  }
  return name.slice(0, 2).toUpperCase();
};

export function Header({ user, menuButton }: HeaderProps) {
  const isClient = useIsClient();
  const initials = getInitials(user?.name);

  return (
    <header className="sticky top-0 h-16 bg-white border-b flex items-center justify-between px-4 md:px-6 z-30">
      {/* Gauche */}
      <div className="flex items-center gap-2">
        {menuButton}
        <h1 className="text-lg md:text-xl font-semibold truncate">Dashboard</h1>
      </div>

      {/* Centre - Recherche (desktop) */}
      <div className="relative max-w-md flex-1 mx-4 hidden md:block">
        <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
        <Input placeholder="Rechercher..." className="pl-10" />
      </div>

      {/* Droite */}
      <div className="flex items-center gap-4">
        {isClient && (
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <button className="flex items-center gap-2 hover:opacity-80">
                <Avatar>
                  <AvatarFallback className="bg-slate-700 text-white">
                    {initials}
                  </AvatarFallback>
                </Avatar>
                <span className="text-sm font-medium hidden sm:block">
                  {user?.name || "Utilisateur"}
                </span>
              </button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-56">
              <DropdownMenuLabel>
                <div className="flex flex-col space-y-1">
                  <p className="text-sm font-medium">{user?.name}</p>
                  <p className="text-xs text-muted-foreground">{user?.email}</p>
                </div>
              </DropdownMenuLabel>
              <DropdownMenuSeparator />
              <DropdownMenuItem>
                <User className="mr-2 h-4 w-4" />
                Mon profil
              </DropdownMenuItem>
              <DropdownMenuItem>
                <Settings className="mr-2 h-4 w-4" />
                Paramètres
              </DropdownMenuItem>
              <DropdownMenuSeparator />
              <DropdownMenuItem onClick={() => signOut({ callbackUrl: "/login" })}>
                <LogOut className="mr-2 h-4 w-4" />
                Déconnexion
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        )}
      </div>
    </header>
  );
}

Note : useIsClient évite les erreurs d'hydratation avec Radix UI.
```

---

## 3.7 — Types et utilitaires

### 3.7.1 — Définir le type Role

#### Contexte
Le type `Role` est utilisé partout pour typer les rôles utilisateur.

#### Description
Enum ou union type pour les 3 rôles principaux.

#### Prompt
```
Crée src/types/index.ts (ou ajoute si existe) :

export type Role = "ADMIN" | "TEACHER" | "STUDENT";

// Type utilisateur de base
export interface BaseUser {
  id: string;
  name: string | null;
  email: string;
  role: Role;
}

Ces types seront réutilisés partout dans l'application.
```

---

### 3.7.2 — Créer la fonction utilitaire cn()

#### Contexte
`cn()` combine clsx et tailwind-merge pour gérer les classes CSS dynamiques.

#### Description
Permet d'écrire `cn("px-4", isActive && "bg-blue-500")` sans conflit de classes.

#### Prompt
```
Vérifie que src/lib/utils.ts contient :

import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

Si ce fichier n'existe pas, le créer.
shadcn/ui l'a normalement généré lors de l'init.
```

---

## 3.8 — Structure des dossiers

### 3.8.1 — Créer les dossiers layout

#### Contexte
Organiser les composants de layout dans un dossier dédié.

#### Description
```
src/components/
├── layout/
│   ├── DashboardShell.tsx
│   ├── Header.tsx
│   ├── Sidebar.tsx
│   └── index.ts (barrel export)
├── providers/
│   ├── SessionProvider.tsx
│   └── index.ts
└── ui/
    └── ... (shadcn components)
```

#### Prompt
```
Crée les barrel exports :

src/components/layout/index.ts :
export { DashboardShell } from "./DashboardShell";
export { Header } from "./Header";
export { Sidebar, MenuButton } from "./Sidebar";

src/components/providers/index.ts :
export { Providers } from "./SessionProvider";

Cela permet des imports propres :
import { DashboardShell } from "@/components/layout";
```

---

## 3.9 — Commit Phase 03

### 3.9.1 — Commit du layout

#### Contexte
Sauvegarder le système de layout complet.

#### Description
Commit avec les composants créés.

#### Prompt
```
Commit le layout et la navigation :

git add .
git commit -m "feat: add dashboard layout with sidebar and header

- RootLayout with fonts, providers, toaster
- DashboardLayout with auth check
- DashboardShell orchestrating sidebar/header state
- Responsive Sidebar with role-based navigation
- Header with search, avatar, dropdown menu
- Role type and utility exports"

Vérification : git log montre le commit.
```

---

## ✅ Checklist Phase 03

- [ ] RootLayout créé avec fonts et providers
- [ ] SessionProvider créé
- [ ] DashboardLayout créé avec vérification auth
- [ ] DashboardShell créé (gestion état sidebar)
- [ ] Sidebar créée avec navigation par rôle
- [ ] Header créé avec dropdown menu
- [ ] Type Role défini
- [ ] Fonction cn() présente
- [ ] Barrel exports créés
- [ ] Layout responsive (mobile + desktop)
- [ ] Commit effectué

---

## 📐 Schéma récapitulatif

```
┌─────────────────────────────────────────────────────────┐
│                      RootLayout                         │
│  (html, body, fonts, Providers, Toaster)                │
│ ┌─────────────────────────────────────────────────────┐ │
│ │               DashboardLayout                       │ │
│ │  (auth check, redirect, role extraction)            │ │
│ │ ┌─────────────────────────────────────────────────┐ │ │
│ │ │              DashboardShell                     │ │ │
│ │ │  (sidebar state, responsive handling)          │ │ │
│ │ │ ┌─────────┐ ┌─────────────────────────────────┐│ │ │
│ │ │ │ Sidebar │ │ Header                          ││ │ │
│ │ │ │ (nav)   │ ├─────────────────────────────────┤│ │ │
│ │ │ │         │ │ Main (page content)             ││ │ │
│ │ │ │         │ │ {children}                      ││ │ │
│ │ │ └─────────┘ └─────────────────────────────────┘│ │ │
│ │ └─────────────────────────────────────────────────┘ │ │
│ └─────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
```

---

*Phase suivante : [04-AUTHENTIFICATION.md](04-AUTHENTIFICATION.md)*
