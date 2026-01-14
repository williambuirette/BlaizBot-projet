# Phase 02 — UI shadcn/ui

> Installation et configuration de shadcn/ui avec les composants de base

---

## 2.1 — Installation de shadcn/ui

### 2.1.1 — Initialiser shadcn/ui

#### Contexte
shadcn/ui n'est pas une librairie npm classique. C'est un générateur qui copie le code des composants directement dans ton projet, te donnant un contrôle total.

#### Description
La commande `npx shadcn@latest init` configure :
- Le fichier `components.json` (configuration)
- Les variables CSS dans `globals.css`
- Le dossier `src/components/ui/`

| Option | Valeur recommandée | Raison |
|:-------|:-------------------|:-------|
| Style | new-york | Design moderne et épuré |
| Base color | gray | Neutre, professionnel |
| CSS variables | yes | Thème personnalisable |

#### Prompt
```
Initialise shadcn/ui dans le projet :

npx shadcn@latest init

Répondre aux questions :
✔ Which style would you like to use? → new-york
✔ Which color would you like to use as the base color? → gray
✔ Would you like to use CSS variables for theming? → yes

Fichiers créés/modifiés :
- components.json (configuration shadcn)
- src/app/globals.css (variables CSS ajoutées)
- src/lib/utils.ts (fonction cn() si pas déjà présente)

Vérification : le fichier components.json existe à la racine.
```

---

### 2.1.2 — Vérifier components.json

#### Contexte
Le fichier `components.json` définit où shadcn génère les composants et quels alias utiliser.

#### Description
```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "new-york",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "",
    "css": "src/app/globals.css",
    "baseColor": "gray",
    "cssVariables": true
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  }
}
```

#### Prompt
```
Vérifie que components.json contient la bonne configuration :

{
  "style": "new-york",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "css": "src/app/globals.css",
    "baseColor": "gray",
    "cssVariables": true
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui"
  }
}

Points importants :
- rsc: true → React Server Components activés
- aliases → correspondent aux paths dans tsconfig.json
```

---

## 2.2 — Composants essentiels (Phase 1)

### 2.2.1 — Installer Button

#### Contexte
Le composant Button est le plus utilisé. Il sera présent dans presque toutes les pages.

#### Description
Le Button shadcn/ui supporte plusieurs variants :
- `default` : bouton principal (bg primaire)
- `secondary` : bouton secondaire
- `outline` : bordure uniquement
- `ghost` : transparent, hover visible
- `destructive` : actions dangereuses (rouge)
- `link` : style lien

#### Prompt
```
Installe le composant Button :

npx shadcn@latest add button

Fichier créé : src/components/ui/button.tsx

Test dans src/app/page.tsx :

import { Button } from "@/components/ui/button";

export default function HomePage() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center gap-4 p-24">
      <h1 className="text-4xl font-bold">BlaizBot</h1>
      <div className="flex gap-2">
        <Button>Primary</Button>
        <Button variant="secondary">Secondary</Button>
        <Button variant="outline">Outline</Button>
        <Button variant="ghost">Ghost</Button>
        <Button variant="destructive">Delete</Button>
      </div>
    </main>
  );
}

Vérification : les 5 boutons s'affichent avec des styles différents.
```

---

### 2.2.2 — Installer Card

#### Contexte
Les Cards sont utilisées pour afficher des blocs d'information (cours, utilisateurs, statistiques).

#### Description
Le composant Card comprend plusieurs sous-composants :
- `Card` : conteneur principal
- `CardHeader` : en-tête avec titre
- `CardTitle` : titre
- `CardDescription` : sous-titre
- `CardContent` : contenu principal
- `CardFooter` : actions en bas

#### Prompt
```
Installe le composant Card :

npx shadcn@latest add card

Fichier créé : src/components/ui/card.tsx

Test rapide :

import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";

<Card>
  <CardHeader>
    <CardTitle>Mon premier cours</CardTitle>
  </CardHeader>
  <CardContent>
    <p>Contenu du cours...</p>
  </CardContent>
</Card>

Le composant Card est prêt.
```

---

### 2.2.3 — Installer Input et Label

#### Contexte
Les champs de formulaire sont essentiels pour l'authentification et la création de contenu.

#### Description
- `Input` : champ texte stylisé
- `Label` : libellé accessible lié à l'input

#### Prompt
```
Installe les composants Input et Label :

npx shadcn@latest add input label

Fichiers créés :
- src/components/ui/input.tsx
- src/components/ui/label.tsx

Utilisation :

import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

<div className="space-y-2">
  <Label htmlFor="email">Email</Label>
  <Input id="email" type="email" placeholder="exemple@email.com" />
</div>

Les champs de formulaire sont prêts.
```

---

### 2.2.4 — Installer Textarea

#### Contexte
Pour les champs de texte multi-lignes (descriptions, messages, contenu de cours).

#### Description
Textarea stylisé compatible avec le design system.

#### Prompt
```
Installe le composant Textarea :

npx shadcn@latest add textarea

Fichier créé : src/components/ui/textarea.tsx

Utilisation :

import { Textarea } from "@/components/ui/textarea";

<Textarea placeholder="Écrivez votre message..." rows={4} />
```

---

## 2.3 — Composants de navigation

### 2.3.1 — Installer Tabs

#### Contexte
Les onglets permettent de naviguer entre différentes vues (ex: paramètres, filtres).

#### Description
- `Tabs` : conteneur principal
- `TabsList` : barre d'onglets
- `TabsTrigger` : bouton d'onglet
- `TabsContent` : contenu de chaque onglet

#### Prompt
```
Installe le composant Tabs :

npx shadcn@latest add tabs

Fichier créé : src/components/ui/tabs.tsx

Utilisation :

import { Tabs, TabsList, TabsTrigger, TabsContent } from "@/components/ui/tabs";

<Tabs defaultValue="info">
  <TabsList>
    <TabsTrigger value="info">Informations</TabsTrigger>
    <TabsTrigger value="settings">Paramètres</TabsTrigger>
  </TabsList>
  <TabsContent value="info">Contenu info...</TabsContent>
  <TabsContent value="settings">Contenu settings...</TabsContent>
</Tabs>
```

---

### 2.3.2 — Installer DropdownMenu

#### Contexte
Menus déroulants pour les actions contextuelles (profil, options, actions sur une ligne).

#### Description
Composant complexe avec sous-menus, séparateurs et raccourcis clavier.

#### Prompt
```
Installe le composant DropdownMenu :

npx shadcn@latest add dropdown-menu

Fichier créé : src/components/ui/dropdown-menu.tsx

Utilisation basique :

import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Button } from "@/components/ui/button";

<DropdownMenu>
  <DropdownMenuTrigger asChild>
    <Button variant="outline">Options</Button>
  </DropdownMenuTrigger>
  <DropdownMenuContent>
    <DropdownMenuItem>Éditer</DropdownMenuItem>
    <DropdownMenuItem>Dupliquer</DropdownMenuItem>
    <DropdownMenuItem className="text-destructive">Supprimer</DropdownMenuItem>
  </DropdownMenuContent>
</DropdownMenu>
```

---

## 2.4 — Composants de feedback

### 2.4.1 — Installer Sonner (Toast)

#### Contexte
Les toasts affichent des notifications temporaires (succès, erreur, info).

#### Description
Sonner est une librairie de toast moderne intégrée à shadcn/ui.

#### Prompt
```
Installe le composant Sonner :

npx shadcn@latest add sonner

Fichier créé : src/components/ui/sonner.tsx

1. Ajouter le Toaster dans layout.tsx :

import { Toaster } from "@/components/ui/sonner";

export default function RootLayout({ children }) {
  return (
    <html lang="fr">
      <body>
        {children}
        <Toaster />
      </body>
    </html>
  );
}

2. Utiliser toast() dans les composants :

import { toast } from "sonner";

// Succès
toast.success("Cours créé avec succès");

// Erreur
toast.error("Une erreur est survenue");

// Info
toast.info("Chargement en cours...");
```

---

### 2.4.2 — Installer Badge

#### Contexte
Les badges affichent des statuts, tags ou catégories (rôle utilisateur, niveau, matière).

#### Description
Badge avec plusieurs variants pour différents contextes.

#### Prompt
```
Installe le composant Badge :

npx shadcn@latest add badge

Fichier créé : src/components/ui/badge.tsx

Utilisation :

import { Badge } from "@/components/ui/badge";

<Badge>Nouveau</Badge>
<Badge variant="secondary">En cours</Badge>
<Badge variant="outline">Brouillon</Badge>
<Badge variant="destructive">Urgent</Badge>

Utile pour : rôles utilisateur, statuts, tags matières.
```

---

### 2.4.3 — Installer Skeleton

#### Contexte
Les skeletons affichent un placeholder pendant le chargement des données.

#### Description
Composant simple qui anime un rectangle gris.

#### Prompt
```
Installe le composant Skeleton :

npx shadcn@latest add skeleton

Fichier créé : src/components/ui/skeleton.tsx

Utilisation :

import { Skeleton } from "@/components/ui/skeleton";

// Pendant le chargement
<div className="space-y-2">
  <Skeleton className="h-4 w-[250px]" />
  <Skeleton className="h-4 w-[200px]" />
</div>

// Skeleton pour une carte
<Card>
  <CardHeader>
    <Skeleton className="h-6 w-[150px]" />
  </CardHeader>
  <CardContent>
    <Skeleton className="h-20 w-full" />
  </CardContent>
</Card>
```

---

## 2.5 — Composants de formulaire avancés

### 2.5.1 — Installer Select

#### Contexte
Les selects sont utilisés pour les choix uniques (classe, matière, niveau).

#### Description
Select natif accessible avec recherche optionnelle.

#### Prompt
```
Installe le composant Select :

npx shadcn@latest add select

Fichier créé : src/components/ui/select.tsx

Utilisation :

import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

<Select>
  <SelectTrigger className="w-[180px]">
    <SelectValue placeholder="Choisir une classe" />
  </SelectTrigger>
  <SelectContent>
    <SelectItem value="6a">6ème A</SelectItem>
    <SelectItem value="6b">6ème B</SelectItem>
    <SelectItem value="5a">5ème A</SelectItem>
  </SelectContent>
</Select>
```

---

### 2.5.2 — Installer Checkbox

#### Contexte
Cases à cocher pour les sélections multiples et les toggles.

#### Description
Checkbox accessible avec états checked, unchecked et indeterminate.

#### Prompt
```
Installe le composant Checkbox :

npx shadcn@latest add checkbox

Fichier créé : src/components/ui/checkbox.tsx

Utilisation :

import { Checkbox } from "@/components/ui/checkbox";
import { Label } from "@/components/ui/label";

<div className="flex items-center space-x-2">
  <Checkbox id="terms" />
  <Label htmlFor="terms">J'accepte les conditions</Label>
</div>
```

---

### 2.5.3 — Installer Switch

#### Contexte
Interrupteurs pour les options on/off (notifications, paramètres).

#### Description
Toggle switch accessible.

#### Prompt
```
Installe le composant Switch :

npx shadcn@latest add switch

Fichier créé : src/components/ui/switch.tsx

Utilisation :

import { Switch } from "@/components/ui/switch";
import { Label } from "@/components/ui/label";

<div className="flex items-center space-x-2">
  <Switch id="notifications" />
  <Label htmlFor="notifications">Activer les notifications</Label>
</div>
```

---

## 2.6 — Composants modaux et overlays

### 2.6.1 — Installer Dialog

#### Contexte
Les modales sont utilisées pour les formulaires, confirmations et détails.

#### Description
Dialog accessible avec focus trap et fermeture au clic extérieur.

#### Prompt
```
Installe le composant Dialog :

npx shadcn@latest add dialog

Fichier créé : src/components/ui/dialog.tsx

Utilisation :

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
  DialogFooter,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";

<Dialog>
  <DialogTrigger asChild>
    <Button>Ouvrir</Button>
  </DialogTrigger>
  <DialogContent>
    <DialogHeader>
      <DialogTitle>Titre de la modale</DialogTitle>
      <DialogDescription>Description optionnelle</DialogDescription>
    </DialogHeader>
    <div>Contenu...</div>
    <DialogFooter>
      <Button variant="outline">Annuler</Button>
      <Button>Confirmer</Button>
    </DialogFooter>
  </DialogContent>
</Dialog>
```

---

### 2.6.2 — Installer Sheet

#### Contexte
Panneau latéral pour les menus mobile et les détails.

#### Description
Sheet = Dialog mais qui glisse depuis un côté de l'écran.

#### Prompt
```
Installe le composant Sheet :

npx shadcn@latest add sheet

Fichier créé : src/components/ui/sheet.tsx

Utilisation :

import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/sheet";

<Sheet>
  <SheetTrigger asChild>
    <Button variant="outline">Menu</Button>
  </SheetTrigger>
  <SheetContent side="left">
    <SheetHeader>
      <SheetTitle>Navigation</SheetTitle>
    </SheetHeader>
    <nav>...</nav>
  </SheetContent>
</Sheet>

Paramètre side : "left", "right", "top", "bottom"
Utile pour : menu mobile, détails, filtres.
```

---

### 2.6.3 — Installer AlertDialog

#### Contexte
Dialogue de confirmation pour les actions destructives.

#### Description
AlertDialog bloquant qui demande confirmation avant une action irréversible.

#### Prompt
```
Installe le composant AlertDialog :

npx shadcn@latest add alert-dialog

Fichier créé : src/components/ui/alert-dialog.tsx

Utilisation :

import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog";

<AlertDialog>
  <AlertDialogTrigger asChild>
    <Button variant="destructive">Supprimer</Button>
  </AlertDialogTrigger>
  <AlertDialogContent>
    <AlertDialogHeader>
      <AlertDialogTitle>Êtes-vous sûr ?</AlertDialogTitle>
      <AlertDialogDescription>
        Cette action est irréversible.
      </AlertDialogDescription>
    </AlertDialogHeader>
    <AlertDialogFooter>
      <AlertDialogCancel>Annuler</AlertDialogCancel>
      <AlertDialogAction>Confirmer</AlertDialogAction>
    </AlertDialogFooter>
  </AlertDialogContent>
</AlertDialog>
```

---

## 2.7 — Composants de données

### 2.7.1 — Installer Table

#### Contexte
Tableaux pour afficher des listes de données (utilisateurs, cours, assignations).

#### Description
Table accessible avec en-têtes, corps et pagination possible.

#### Prompt
```
Installe le composant Table :

npx shadcn@latest add table

Fichier créé : src/components/ui/table.tsx

Utilisation :

import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

<Table>
  <TableHeader>
    <TableRow>
      <TableHead>Nom</TableHead>
      <TableHead>Email</TableHead>
      <TableHead>Rôle</TableHead>
    </TableRow>
  </TableHeader>
  <TableBody>
    <TableRow>
      <TableCell>Jean Dupont</TableCell>
      <TableCell>jean@email.com</TableCell>
      <TableCell>Élève</TableCell>
    </TableRow>
  </TableBody>
</Table>
```

---

### 2.7.2 — Installer Avatar

#### Contexte
Affichage des photos de profil des utilisateurs.

#### Description
Avatar avec fallback (initiales) si l'image n'est pas disponible.

#### Prompt
```
Installe le composant Avatar :

npx shadcn@latest add avatar

Fichier créé : src/components/ui/avatar.tsx

Utilisation :

import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";

<Avatar>
  <AvatarImage src="/photo.jpg" alt="Jean Dupont" />
  <AvatarFallback>JD</AvatarFallback>
</Avatar>

Le fallback affiche les initiales si l'image ne charge pas.
```

---

### 2.7.3 — Installer Progress

#### Contexte
Barres de progression pour afficher l'avancement (cours, téléchargement).

#### Description
Barre de progression accessible avec valeur en pourcentage.

#### Prompt
```
Installe le composant Progress :

npx shadcn@latest add progress

Fichier créé : src/components/ui/progress.tsx

Utilisation :

import { Progress } from "@/components/ui/progress";

<Progress value={66} />  // 66% de progression

// Avec label
<div className="space-y-2">
  <div className="flex justify-between text-sm">
    <span>Progression</span>
    <span>66%</span>
  </div>
  <Progress value={66} />
</div>
```

---

## 2.8 — Composants additionnels

### 2.8.1 — Installer ScrollArea

#### Contexte
Zone de scroll personnalisée pour les listes longues.

#### Description
ScrollArea avec scrollbar stylisée.

#### Prompt
```
Installe le composant ScrollArea :

npx shadcn@latest add scroll-area

Fichier créé : src/components/ui/scroll-area.tsx

Utilisation :

import { ScrollArea } from "@/components/ui/scroll-area";

<ScrollArea className="h-[300px]">
  <div className="space-y-4">
    {items.map(item => <div key={item.id}>{item.name}</div>)}
  </div>
</ScrollArea>

Utile pour : sidebar, listes de messages, conversations.
```

---

### 2.8.2 — Installer Separator et Tooltip

#### Contexte
Éléments UI complémentaires fréquemment utilisés.

#### Description
- Separator : ligne de séparation horizontale/verticale
- Tooltip : info-bulle au survol

#### Prompt
```
Installe les composants Separator et Tooltip :

npx shadcn@latest add separator tooltip

Fichiers créés :
- src/components/ui/separator.tsx
- src/components/ui/tooltip.tsx

Separator :
import { Separator } from "@/components/ui/separator";
<Separator className="my-4" />

Tooltip :
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from "@/components/ui/tooltip";

<TooltipProvider>
  <Tooltip>
    <TooltipTrigger>Hover me</TooltipTrigger>
    <TooltipContent>
      <p>Information supplémentaire</p>
    </TooltipContent>
  </Tooltip>
</TooltipProvider>
```

---

### 2.8.3 — Installer Popover

#### Contexte
Popover pour les menus contextuels et sélecteurs complexes.

#### Description
Popover positionné relativement à un trigger.

#### Prompt
```
Installe le composant Popover :

npx shadcn@latest add popover

Fichier créé : src/components/ui/popover.tsx

Utilisation :

import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";

<Popover>
  <PopoverTrigger asChild>
    <Button variant="outline">Filtres</Button>
  </PopoverTrigger>
  <PopoverContent className="w-80">
    <div className="space-y-4">
      <h4 className="font-medium">Filtres</h4>
      {/* Contenu des filtres */}
    </div>
  </PopoverContent>
</Popover>

Utile pour : filtres, sélection de date, menus complexes.
```

---

## 2.9 — Commit Phase 02

### 2.9.1 — Commit des composants shadcn

#### Contexte
Sauvegarder tous les composants installés.

#### Description
Commit avec la liste des composants ajoutés.

#### Prompt
```
Commit les composants shadcn/ui :

git add .
git commit -m "feat: add shadcn/ui components

Components added:
- button, card, input, label, textarea
- tabs, dropdown-menu
- sonner, badge, skeleton
- select, checkbox, switch
- dialog, sheet, alert-dialog
- table, avatar, progress
- scroll-area, separator, tooltip, popover"

Vérification : git log montre le commit.
```

---

## ✅ Checklist Phase 02

- [ ] shadcn/ui initialisé (npx shadcn@latest init)
- [ ] components.json configuré
- [ ] Button installé et testé
- [ ] Card installé
- [ ] Input, Label, Textarea installés
- [ ] Tabs, DropdownMenu installés
- [ ] Sonner (toast) installé et configuré dans layout
- [ ] Badge, Skeleton installés
- [ ] Select, Checkbox, Switch installés
- [ ] Dialog, Sheet, AlertDialog installés
- [ ] Table, Avatar, Progress installés
- [ ] ScrollArea, Separator, Tooltip, Popover installés
- [ ] Commit effectué

---

## 📦 Récapitulatif des composants

| Catégorie | Composants |
|:----------|:-----------|
| **Base** | Button, Card, Input, Label, Textarea |
| **Navigation** | Tabs, DropdownMenu |
| **Feedback** | Sonner, Badge, Skeleton |
| **Formulaire** | Select, Checkbox, Switch |
| **Modaux** | Dialog, Sheet, AlertDialog |
| **Données** | Table, Avatar, Progress |
| **Utilitaires** | ScrollArea, Separator, Tooltip, Popover |

**Total** : 20 composants installés

---

*Phase suivante : [03-LAYOUT-NAVIGATION.md](03-LAYOUT-NAVIGATION.md)*
