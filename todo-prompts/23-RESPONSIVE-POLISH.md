# Phase 23 — Responsive et Polish

> Optimisation mobile, corrections UX et finitions

---

## Vue d'ensemble

| Fichiers | Rôle |
|----------|------|
| `src/app/layout.tsx` | Viewport meta tag mobile |
| `src/components/layout/Sidebar.tsx` | Sidebar responsive avec overlay mobile |
| `src/components/ui/sheet.tsx` | Sheet (drawer) mobile Radix UI |
| `src/components/features/shared/message-thread/MessageBubble.tsx` | Timestamps avec date-fns |
| `src/styles/calendar.css` | Media queries calendrier mobile |
| Composants `suppressHydrationWarning` | Fix hydration Radix UI |

**Objectif** : Rendre l'application utilisable sur mobile (smartphone, tablette) avec une UX fluide et cohérente.

---

## Tâche 23.1 — Viewport meta tag (layout.tsx)

### Contexte
Pour que l'application soit correctement affichée sur mobile, il faut configurer le viewport avec `width=device-width` et `initialScale=1`.

### Description
Ajouter le viewport dans metadata de layout.tsx.

### Prompt
```
Configure le viewport pour le responsive mobile.

FICHIER : src/app/layout.tsx

IMPORTS :
import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { Toaster } from "@/components/ui/sonner";
import { Providers } from "@/components/providers/SessionProvider";
import "./globals.css";

FONTS :

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

METADATA avec viewport :

export const metadata: Metadata = {
  title: "BlaizBot - Plateforme Éducative",
  description: "Application éducative avec IA intégrée pour élèves, professeurs et administrateurs",
  viewport: {
    width: "device-width",
    initialScale: 1,
    maximumScale: 1,
  },
};

LAYOUT :

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

NOTES :
- viewport.width = "device-width" adapte à la largeur de l'écran
- initialScale = 1 zoom par défaut 100%
- maximumScale = 1 empêche zoom (optionnel, peut être retiré pour accessibilité)
- suppressHydrationWarning évite warnings date-fns et Radix UI (voir 23.4)
```

---

## Tâche 23.2 — Sidebar responsive (Sidebar.tsx)

### Contexte
La sidebar doit être cachée sur mobile et affichée en overlay avec un bouton burger. Sur desktop (lg+), elle reste toujours visible.

### Description
Créer une Sidebar responsive avec état isOpen et bouton Menu.

### Prompt
```
Crée la Sidebar responsive mobile + desktop.

FICHIER : src/components/layout/Sidebar.tsx

IMPORTS :
'use client';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { cn } from '@/lib/utils';
import { Role } from '@/types';
import {
  Home, Users, School, BookMarked, BookOpen,
  MessageSquare, Brain, CalendarDays, X, Menu
} from 'lucide-react';

TYPES :

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

NAVIGATION PAR RÔLE :

const adminNavItems: NavItem[] = [
  { label: 'Dashboard', href: '/admin', icon: <Home size={20} /> },
  { label: 'Utilisateurs', href: '/admin/users', icon: <Users size={20} /> },
  { label: 'Classes', href: '/admin/classes', icon: <School size={20} /> },
  { label: 'Matières', href: '/admin/subjects', icon: <BookMarked size={20} /> },
];

const teacherNavItems: NavItem[] = [
  { label: 'Dashboard', href: '/teacher', icon: <Home size={20} /> },
  { label: 'Mes classes', href: '/teacher/classes', icon: <School size={20} /> },
  { label: 'Mes élèves', href: '/teacher/students', icon: <Users size={20} /> },
  { label: 'Mes cours', href: '/teacher/courses', icon: <BookOpen size={20} /> },
  { label: 'Agendas et Assignations', href: '/teacher/assignments', icon: <CalendarDays size={20} /> },
  { label: 'Messages', href: '/teacher/messages', icon: <MessageSquare size={20} /> },
];

const studentNavItems: NavItem[] = [
  { label: 'Dashboard', href: '/student', icon: <Home size={20} /> },
  { label: 'Mes cours', href: '/student/courses', icon: <BookOpen size={20} /> },
  { label: 'Mes révisions', href: '/student/revisions', icon: <BookMarked size={20} /> },
  { label: 'Agenda', href: '/student/agenda', icon: <CalendarDays size={20} /> },
  { label: 'Assistant IA', href: '/student/ai', icon: <Brain size={20} /> },
  { label: 'Messages', href: '/student/messages', icon: <MessageSquare size={20} /> },
];

const navItemsByRole: Record<Role, NavItem[]> = {
  ADMIN: adminNavItems,
  TEACHER: teacherNavItems,
  STUDENT: studentNavItems,
};

COMPOSANT Sidebar :

export function Sidebar({ role, isOpen = true, onToggle }: SidebarProps) {
  const pathname = usePathname();
  const navItems = navItemsByRole[role];

  return (
    <>
      {/* Overlay mobile (fond sombre) */}
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
          'w-64 h-screen bg-slate-900 text-white fixed left-0 top-0 flex flex-col z-50',
          'transition-transform duration-300 ease-in-out',
          // Mobile: caché par défaut, visible quand isOpen
          isOpen ? 'translate-x-0' : '-translate-x-full',
          // Desktop (lg+): toujours visible
          'lg:translate-x-0'
        )}
      >
        {/* Header : Logo + Bouton fermeture mobile */}
        <div className="p-4 border-b border-slate-700 flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2">
            <span className="text-2xl">🤖</span>
            <span className="text-xl font-bold">BlaizBot</span>
          </Link>
          
          {/* Bouton X (visible seulement mobile) */}
          {onToggle && (
            <button
              onClick={onToggle}
              className="lg:hidden p-2 rounded-lg hover:bg-slate-800 transition-colors"
              aria-label="Fermer le menu"
            >
              <X size={24} />
            </button>
          )}
        </div>

        {/* Navigation */}
        <nav className="flex-1 p-4 overflow-y-auto">
          <ul className="space-y-1">
            {navItems.map(item => {
              const isActive = pathname === item.href;
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    onClick={onToggle} // Ferme sidebar après clic sur mobile
                    className={cn(
                      'flex items-center gap-3 px-4 py-2 rounded-lg transition-colors',
                      'hover:bg-slate-800',
                      isActive && 'bg-slate-800 text-blue-400'
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

BOUTON MENU BURGER (pour Header) :

export function MenuButton({ onClick }: { onClick: () => void }) {
  return (
    <button
      onClick={onClick}
      className="lg:hidden p-2 rounded-lg hover:bg-gray-100 transition-colors"
      aria-label="Ouvrir le menu"
    >
      <Menu size={24} className="text-slate-700" />
    </button>
  );
}

NOTES :
- Mobile (< lg) : sidebar cachée par défaut (-translate-x-full)
- Overlay noir 50% opacité quand sidebar ouverte
- Desktop (lg+) : sidebar toujours visible, pas d'overlay
- isOpen contrôlé par le layout parent avec useState
- onToggle ferme la sidebar après navigation (UX mobile)
```

---

## Tâche 23.3 — Sheet UI (drawer mobile Radix)

### Contexte
Le composant Sheet (drawer) de Radix UI permet d'afficher des panneaux latéraux sur mobile (ex: liste conversations IA).

### Description
Créer le composant Sheet avec animations slide.

### Prompt
```
Crée le composant Sheet (drawer Radix UI).

FICHIER : src/components/ui/sheet.tsx

IMPORTS :
"use client"
import * as React from "react"
import * as SheetPrimitive from "@radix-ui/react-dialog"
import { XIcon } from "lucide-react"
import { cn } from "@/lib/utils"

COMPOSANTS :

function Sheet({ ...props }: React.ComponentProps<typeof SheetPrimitive.Root>) {
  return <SheetPrimitive.Root data-slot="sheet" {...props} />
}

function SheetTrigger({
  ...props
}: React.ComponentProps<typeof SheetPrimitive.Trigger>) {
  return <SheetPrimitive.Trigger data-slot="sheet-trigger" {...props} />
}

function SheetClose({
  ...props
}: React.ComponentProps<typeof SheetPrimitive.Close>) {
  return <SheetPrimitive.Close data-slot="sheet-close" {...props} />
}

function SheetPortal({
  ...props
}: React.ComponentProps<typeof SheetPrimitive.Portal>) {
  return <SheetPrimitive.Portal data-slot="sheet-portal" {...props} />
}

function SheetOverlay({
  className,
  ...props
}: React.ComponentProps<typeof SheetPrimitive.Overlay>) {
  return (
    <SheetPrimitive.Overlay
      data-slot="sheet-overlay"
      className={cn(
        "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50",
        className
      )}
      {...props}
    />
  )
}

function SheetContent({
  className,
  children,
  side = "right",
  ...props
}: React.ComponentProps<typeof SheetPrimitive.Content> & {
  side?: "top" | "right" | "bottom" | "left"
}) {
  return (
    <SheetPortal>
      <SheetOverlay />
      <SheetPrimitive.Content
        data-slot="sheet-content"
        className={cn(
          "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out fixed z-50 flex flex-col gap-4 shadow-lg transition ease-in-out data-[state=closed]:duration-300 data-[state=open]:duration-500",
          side === "right" &&
            "data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right inset-y-0 right-0 h-full w-3/4 border-l sm:max-w-sm",
          side === "left" &&
            "data-[state=closed]:slide-out-to-left data-[state=open]:slide-in-from-left inset-y-0 left-0 h-full w-3/4 border-r sm:max-w-sm",
          side === "top" &&
            "data-[state=closed]:slide-out-to-top data-[state=open]:slide-in-from-top inset-x-0 top-0 h-auto border-b",
          side === "bottom" &&
            "data-[state=closed]:slide-out-to-bottom data-[state=open]:slide-in-from-bottom inset-x-0 bottom-0 h-auto border-t",
          className
        )}
        {...props}
      >
        {children}
        <SheetPrimitive.Close className="ring-offset-background focus:ring-ring data-[state=open]:bg-secondary absolute top-4 right-4 rounded-xs opacity-70 transition-opacity hover:opacity-100 focus:ring-2 focus:ring-offset-2 focus:outline-hidden disabled:pointer-events-none">
          <XIcon className="size-4" />
          <span className="sr-only">Close</span>
        </SheetPrimitive.Close>
      </SheetPrimitive.Content>
    </SheetPortal>
  )
}

function SheetHeader({ className, ...props }: React.ComponentProps<"div">) {
  return (
    <div
      data-slot="sheet-header"
      className={cn("flex flex-col gap-1.5 p-4", className)}
      {...props}
    />
  )
}

function SheetFooter({ className, ...props }: React.ComponentProps<"div">) {
  return (
    <div
      data-slot="sheet-footer"
      className={cn("mt-auto flex flex-col gap-2 p-4", className)}
      {...props}
    />
  )
}

function SheetTitle({
  className,
  ...props
}: React.ComponentProps<typeof SheetPrimitive.Title>) {
  return (
    <SheetPrimitive.Title
      data-slot="sheet-title"
      className={cn("text-foreground font-semibold", className)}
      {...props}
    />
  )
}

function SheetDescription({
  className,
  ...props
}: React.ComponentProps<typeof SheetPrimitive.Description>) {
  return (
    <SheetPrimitive.Description
      data-slot="sheet-description"
      className={cn("text-muted-foreground text-sm", className)}
      {...props}
    />
  )
}

EXPORTS :

export {
  Sheet,
  SheetTrigger,
  SheetClose,
  SheetContent,
  SheetHeader,
  SheetFooter,
  SheetTitle,
  SheetDescription,
}

NOTES :
- Utilise Radix Dialog comme base (plus léger que Drawer)
- side="right" : drawer depuis la droite (mobile conversations)
- w-3/4 mobile, max-w-sm desktop
- Animations slide avec Tailwind data-state
- Overlay noir 50% opacité
```

---

## Tâche 23.4 — Fix hydration warnings (suppressHydrationWarning)

### Contexte
Radix UI et date-fns peuvent causer des warnings d'hydration SSR/CSR (timestamps, dialogs). `suppressHydrationWarning` désactive ces warnings sur html/body.

### Description
Ajouter suppressHydrationWarning sur html et body dans layout.tsx.

### Prompt
```
Fix les warnings d'hydration Radix UI + date-fns.

FICHIER : src/app/layout.tsx

EXPLICATION :
- date-fns génère des timestamps relatifs côté client ("il y a 2 minutes")
- Radix UI gère des états SSR/CSR différents (dialogs, popovers)
- Ces différences créent des warnings hydration

SOLUTION :
Ajouter suppressHydrationWarning sur <html> et <body>

CODE :

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

COMPOSANTS CONCERNÉS :
- MessageBubble (formatDistanceToNow)
- NotificationBell (formatDistanceToNow)
- SupplementCard (formatDistanceToNow)
- Tous les Dialog/Sheet/Popover Radix UI

NOTES :
- suppressHydrationWarning ne désactive QUE les warnings, pas l'hydration
- À utiliser avec parcimonie (seulement root layout)
- Alternative : useEffect côté client pour timestamps
```

---

## Tâche 23.5 — Timestamps avec date-fns (MessageBubble)

### Contexte
Les timestamps doivent être affichés en format relatif français ("il y a 2 minutes") avec date-fns et locale fr.

### Description
Utiliser formatDistanceToNow dans les composants de messages.

### Prompt
```
Affiche les timestamps en format relatif français.

FICHIER : src/components/features/shared/message-thread/MessageBubble.tsx

IMPORTS :
import { formatDistanceToNow } from 'date-fns';
import { fr } from 'date-fns/locale';

USAGE :

// Dans le composant MessageBubble
{formatDistanceToNow(new Date(message.createdAt), {
  addSuffix: true,
  locale: fr,
})}

EXEMPLES OUTPUT :
- "il y a 2 minutes"
- "il y a 1 heure"
- "il y a 3 jours"
- "il y a environ 1 mois"

COMPOSANT COMPLET :

export function MessageBubble({ message, isOwn, onDownloadFile }: MessageBubbleProps) {
  const isTeacher = message.senderRole === 'TEACHER';

  return (
    <div className={cn('flex gap-3', isOwn && 'justify-end')}>
      {!isOwn && (
        <div className="flex h-8 w-8 items-center justify-center rounded-full bg-muted">
          <User className="h-4 w-4" />
        </div>
      )}
      <div
        className={cn(
          'max-w-[70%] rounded-2xl px-4 py-2',
          isOwn
            ? 'bg-primary text-primary-foreground rounded-br-md'
            : 'bg-muted rounded-bl-md'
        )}
      >
        {message.content && (
          <p className="text-sm whitespace-pre-wrap">{message.content}</p>
        )}
        
        {/* Pièces jointes */}
        {message.attachments && message.attachments.length > 0 && (
          <div className="mt-2 space-y-1">
            {message.attachments.map((file, idx) => {
              const FileIcon = getFileIcon(file.type);
              return (
                <Badge
                  key={idx}
                  variant="secondary"
                  className="cursor-pointer hover:bg-secondary/80 flex items-center gap-2 w-fit"
                  onClick={() => onDownloadFile(message.id, file.name)}
                >
                  <FileIcon className="h-3 w-3" />
                  <span className="text-xs">{file.name}</span>
                  <span className="text-xs opacity-70">({formatFileSize(file.size)})</span>
                </Badge>
              );
            })}
          </div>
        )}
        
        {/* Pied : nom + badge prof + timestamp */}
        <div className={cn(
          'flex items-center gap-2 mt-1 flex-wrap',
          isOwn ? 'justify-end' : 'justify-start'
        )}>
          <span className={cn(
            'text-xs font-medium',
            isOwn ? 'text-primary-foreground/80' : 'text-foreground/70'
          )}>
            {message.senderName}
          </span>
          {isTeacher && (
            <Badge 
              variant={isOwn ? 'secondary' : 'outline'} 
              className="text-[10px] px-1 py-0 h-4"
            >
              Prof
            </Badge>
          )}
          <span
            className={cn(
              'text-xs',
              isOwn ? 'text-primary-foreground/60' : 'text-muted-foreground'
            )}
          >
            {formatDistanceToNow(new Date(message.createdAt), {
              addSuffix: true,
              locale: fr,
            })}
          </span>
        </div>
      </div>
    </div>
  );
}

INSTALLER :
npm install date-fns

NOTES :
- addSuffix ajoute "il y a" / "dans"
- locale: fr pour français
- Même pattern dans NotificationBell, SupplementCard, etc.
```

---

## Tâche 23.6 — Calendrier responsive (calendar.css)

### Contexte
Le calendrier react-big-calendar doit être adapté pour mobile avec media queries (réduction taille toolbar, hauteur lignes, etc.).

### Description
Ajouter les media queries mobile dans calendar.css.

### Prompt
```
Adapte le calendrier pour mobile.

FICHIER : src/styles/calendar.css

MEDIA QUERY @media (max-width: 768px) :

/* Toolbar (navigation calendrier) */
@media (max-width: 768px) {
  .rbc-toolbar {
    flex-direction: column;
    gap: 0.75rem;
  }
  
  .rbc-toolbar-label {
    order: -1;
    width: 100%;
    text-align: center;
  }
  
  .rbc-btn-group {
    width: 100%;
    justify-content: center;
  }
  
  .rbc-btn-group button {
    flex: 1;
    padding: 0.5rem;
  }
  
  /* Headers (jours de la semaine) */
  .rbc-header {
    font-size: 0.7rem;
    padding: 0.125rem 0;
  }
  
  /* Événements */
  .rbc-event {
    font-size: 0.6rem;
    padding: 0.125rem 0.25rem;
  }

  /* Réduire hauteur des lignes pour voir 6 semaines */
  .rbc-month-row {
    min-height: 2.75rem;
  }

  /* Numéros de jour */
  .rbc-date-cell {
    padding: 0.125rem;
  }

  .rbc-date-cell > a {
    font-size: 0.7rem;
    min-width: 1.125rem;
    min-height: 1.125rem;
  }

  /* Espacement toolbar */
  .rbc-toolbar {
    margin-bottom: 0.5rem;
    gap: 0.5rem;
  }
}

NOTES :
- Breakpoint 768px = tablettes et mobiles
- toolbar en colonne (boutons empilés)
- Réduction tailles texte (0.7rem, 0.6rem)
- min-height lignes réduit pour voir plus de semaines
- Boutons toolbar en flex: 1 pour occuper toute la largeur
```

---

## Tâche 23.7 — Harmonisation interfaces (polish final)

### Contexte
Dernières corrections UX pour cohérence globale : espacement, couleurs, feedback, animations.

### Description
Checklist de polish final avant production.

### Prompt
```
Checklist de polish final UX/UI.

CORRECTIONS À APPLIQUER :

1. ESPACEMENT COHÉRENT
- Utiliser space-y-4 pour sections verticales
- gap-2 ou gap-4 pour flex/grid horizontaux
- p-4 ou p-6 pour padding containers principaux

2. COULEURS COHÉRENTES
- Primary : blue-600 (boutons principaux)
- Muted : slate-100/slate-800 (backgrounds secondaires)
- Destructive : red-600 (suppression, erreurs)
- Success : green-600 (validation, succès)

3. FEEDBACK UTILISATEUR
- Loading states : Skeleton ou Spinner
- Success toast : "✓ Enregistré avec succès"
- Error toast : "✗ Une erreur est survenue"
- Animations : transition-colors sur hover

4. ACCESSIBILITÉ
- aria-label sur boutons icône seul
- sr-only pour textes screen readers
- focus:ring-2 sur éléments focusables
- Contraste texte > 4.5:1 (WCAG AA)

5. RESPONSIVE
- hidden lg:block pour éléments desktop only
- lg:hidden pour éléments mobile only
- max-w-7xl pour limiter largeur conteneurs
- overflow-x-auto pour tableaux

6. PERFORMANCE
- Lazy load images : <Image loading="lazy" />
- Virtualization listes longues (react-window)
- Debounce recherches (300ms)
- Optimistic UI updates (messages, likes)

7. TYPOGRAPHY
- text-sm : labels, descriptions
- text-base : contenu principal
- text-lg : titres sections
- text-2xl : titres pages
- font-semibold ou font-bold pour emphase

8. ANIMATIONS
- transition-all duration-200 : hover buttons
- animate-in fade-in : entrée modales
- animate-out fade-out : sortie modales
- data-[state=open]:animate-in Radix UI

FICHIERS À VÉRIFIER :
- Tous les composants features/**
- Tous les boutons (variant, size cohérents)
- Toutes les modales (Dialog, Sheet)
- Tous les formulaires (validation, feedback)

TESTS FINAUX :
1. Navigation complète admin/teacher/student
2. Créer cours, quiz, exercice, message
3. Chat IA avec artifacts
4. Calendrier + assignations
5. Messages + notifications
6. Révisions élèves + cartes
7. Responsive mobile (iPhone, iPad, Android)

NOTES :
- Utiliser shadcn/ui variants (Button, Badge, etc.)
- Respecter design system Tailwind
- Tester dark mode (si activé)
- Vérifier console browser (0 erreurs)
```

---

## Résumé Phase 23

| Tâche | Fichier | Fonction |
|-------|---------|----------|
| 23.1 | layout.tsx | Viewport meta tag mobile |
| 23.2 | Sidebar.tsx | Sidebar responsive + overlay mobile |
| 23.3 | sheet.tsx | Sheet (drawer) Radix UI |
| 23.4 | layout.tsx | Fix hydration warnings |
| 23.5 | MessageBubble.tsx | Timestamps date-fns français |
| 23.6 | calendar.css | Media queries mobile |
| 23.7 | - | Checklist polish final UX/UI |

**Total : 7 tâches**

**Breakpoints Tailwind** :
- `sm` : 640px (mobile large)
- `md` : 768px (tablette)
- `lg` : 1024px (desktop)
- `xl` : 1280px (large desktop)

**Pattern responsive courant** :
- Mobile first : styles de base = mobile
- `lg:` prefixe = desktop overrides
- `hidden lg:flex` = visible seulement desktop
- `lg:hidden` = visible seulement mobile
