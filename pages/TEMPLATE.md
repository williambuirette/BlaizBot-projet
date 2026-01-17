# [Nom de la Page]

> **Route** : `/chemin/de/la/page`  
> **Rôle(s)** : STUDENT | TEACHER | ADMIN  
> **Fichier source** : `src/app/.../page.tsx`

---

## 📸 Aperçu Visuel

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  🏠 BlaizBot                              🔔  👤 Nom Utilisateur  [Déco]    │
├──────────────┬──────────────────────────────────────────────────────────────┤
│              │                                                              │
│  📊 Accueil  │   ┌─────────────────────────────────────────────────────┐   │
│              │   │                                                     │   │
│  📚 Cours    │   │              [CONTENU PRINCIPAL]                    │   │
│              │   │                                                     │   │
│  📝 Devoirs  │   │                                                     │   │
│              │   └─────────────────────────────────────────────────────┘   │
│  💬 Messages │                                                              │
│              │                                                              │
│  ⚙️ Params   │                                                              │
│              │                                                              │
└──────────────┴──────────────────────────────────────────────────────────────┘
```

### Légende des éléments

| Zone | Description |
|------|-------------|
| Header | Logo, notifications, profil utilisateur |
| Sidebar | Navigation principale |
| Contenu | Zone dynamique selon la page |

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `DashboardShell` | `@/components/layout/DashboardShell` | Layout principal avec sidebar |
| `Header` | `@/components/layout/Header` | Barre supérieure |
| `Sidebar` | `@/components/layout/Sidebar` | Navigation latérale |
| `Card` | `@/components/ui/card` | Carte conteneur |
| `Button` | `@/components/ui/button` | Boutons d'action |

---

## 📦 Dépendances

### Packages NPM
```json
{
  "next": "15.x",
  "react": "19.x",
  "typescript": "5.x",
  "tailwindcss": "3.x"
}
```

### Composants shadcn/ui
- [ ] `Button`
- [ ] `Card`
- [ ] `Input`
- [ ] `Select`
- [ ] `Table`
- [ ] `Dialog`
- [ ] `DropdownMenu`
- [ ] `Avatar`
- [ ] `Badge`
- [ ] `Skeleton`

### Composants Layout
- [ ] `DashboardShell`
- [ ] `Header`
- [ ] `Sidebar`

### Composants Features
- [ ] `[Lister les composants métier utilisés]`

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/...` | Description | - |
| `POST` | `/api/...` | Description | `{ ... }` |
| `PUT` | `/api/...` | Description | `{ ... }` |
| `DELETE` | `/api/...` | Description | - |

---

## 💾 Types & Interfaces

### Props de la page
```typescript
interface PageProps {
  params: {
    id?: string;
  };
  searchParams?: {
    [key: string]: string | string[] | undefined;
  };
}
```

### Données affichées
```typescript
interface DataType {
  id: string;
  // ... autres champs
}
```

---

## 🔐 Authentification & Autorisations

| Aspect | Détail |
|--------|--------|
| **Middleware** | `src/middleware.ts` |
| **Session** | NextAuth via `getServerSession()` |
| **Rôles autorisés** | STUDENT / TEACHER / ADMIN |
| **Redirection si non autorisé** | `/unauthorized` |

---

## 🎨 États de l'Interface

### État de chargement
```
┌─────────────────────────────────────────┐
│  ████████░░░░  Chargement...            │
│  [Skeleton loaders]                     │
└─────────────────────────────────────────┘
```

### État vide
```
┌─────────────────────────────────────────┐
│        📭 Aucune donnée                 │
│     [Message explicatif]                │
│        [Bouton d'action]                │
└─────────────────────────────────────────┘
```

### État erreur
```
┌─────────────────────────────────────────┐
│        ❌ Erreur                        │
│     [Message d'erreur]                  │
│        [Réessayer]                      │
└─────────────────────────────────────────┘
```

---

## 📱 Responsive Design

| Breakpoint | Comportement |
|------------|--------------|
| `mobile` < 768px | Sidebar masquée, menu hamburger |
| `tablet` 768px-1024px | Sidebar réduite (icônes) |
| `desktop` > 1024px | Sidebar complète |

---

## 📋 Checklist de Recréation

### Structure
- [ ] Route Next.js créée
- [ ] Layout parent appliqué
- [ ] Métadonnées SEO

### UI
- [ ] Header avec navigation
- [ ] Sidebar avec liens actifs
- [ ] Contenu principal
- [ ] Footer (si applicable)

### Fonctionnalités
- [ ] Chargement des données
- [ ] États de chargement (Skeleton)
- [ ] États vides
- [ ] Gestion des erreurs
- [ ] Actions utilisateur

### Qualité
- [ ] Responsive (mobile, tablet, desktop)
- [ ] Accessibilité (a11y)
- [ ] Performance (lazy loading)
- [ ] Tests unitaires

---

## 🔗 Navigation

| Direction | Page | Route |
|-----------|------|-------|
| ← Précédent | [Nom] | `/route` |
| → Suivant | [Nom] | `/route` |
| ↑ Parent | [Nom] | `/route` |

---

## 📝 Notes de Développement

> Ajouter ici les observations, décisions techniques, ou points d'attention particuliers.

---

*Documentation générée par rétro-ingénierie de BlaizBot-V1*  
*Date : [DATE]*

