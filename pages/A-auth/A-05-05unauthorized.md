# 🛡️ Page Accès Non Autorisé

> **Route** : `/unauthorized`  
> **Rôle(s)** : Public (page d'erreur)  
> **Fichier source** : `src/app/unauthorized/page.tsx`

---

## 📸 Aperçu Visuel

### Utilisateur Connecté

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                                                                             │
│                          ┌─────────────────┐                                │
│                          │                 │                                │
│                          │   🛡️❌          │  ← Cercle rouge clair         │
│                          │   (ShieldX)     │     avec icône                │
│                          │                 │                                │
│                          └─────────────────┘                                │
│                                                                             │
│                        Accès non autorisé                                   │
│                        (text-3xl, font-bold)                                │
│                                                                             │
│              Vous n'avez pas les droits nécessaires pour                    │
│              accéder à cette page. Veuillez contacter un                    │
│              administrateur si vous pensez qu'il s'agit                     │
│              d'une erreur.                                                  │
│                                                                             │
│                   ┌──────────┐    ┌─────────────────────┐                   │
│                   │  Retour  │    │ 🏠 Mon tableau de   │                   │
│                   │ (outline)│    │      bord           │                   │
│                   └──────────┘    └─────────────────────┘                   │
│                                                                             │
│                          (fond gris clair : bg-gray-50)                     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Utilisateur Non Connecté

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                          [Même icône et texte]                              │
│                                                                             │
│                   ┌──────────┐    ┌──────────────────┐                      │
│                   │  Retour  │    │  Se connecter    │                      │
│                   │ (outline)│    │   (primary)      │                      │
│                   └──────────┘    └──────────────────┘                      │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Button` | `@/components/ui/button` | Boutons d'action |
| `ShieldX` | `lucide-react` | Icône bouclier avec X |
| `Home` | `lucide-react` | Icône maison |

---

## 🔄 Comportements

### Bouton "Retour"
- Action : `router.back()`
- Retourne à la page précédente dans l'historique

### Bouton Principal (conditionnel)

| État Session | Bouton | Action |
|--------------|--------|--------|
| **Connecté** | "Mon tableau de bord" | Redirige vers dashboard du rôle |
| **Non connecté** | "Se connecter" | Redirige vers `/login` |

### Détermination du Dashboard

| Rôle | Destination |
|------|-------------|
| `ADMIN` | `/admin` |
| `TEACHER` | `/teacher` |
| `STUDENT` | `/student` |

---

## 🔗 API Endpoints

Aucun appel API direct. Utilise `useSession` de NextAuth.

---

## 🔐 Cas d'Usage

Cette page s'affiche quand :

1. **Accès à une route protégée sans session**
   - Ex: `/admin` sans être connecté

2. **Accès à une route avec mauvais rôle**
   - Ex: Élève essayant d'accéder à `/admin`

3. **Token expiré**
   - Session invalide, redirection automatique

---

## 📂 Fichiers Liés

| Fichier | Description |
|---------|-------------|
| [login.md](login.md) | Destination si non connecté |
| [accueil.md](accueil.md) | Page d'accueil |

---

**Navigation** :
- ← Retour (page précédente)
- → [Login](login.md) (si non connecté)
- → Dashboard (si connecté, selon rôle)

---

**Mots-clés** : Unauthorized, Accès refusé, Erreur, Permissions, Rôles  
**Temps de lecture** : 2 minutes  
**Pages estimées** : 1
