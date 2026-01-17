# 🏠 Page d'Accueil (Redirection)

> **Route** : `/`  
> **Rôle(s)** : Public (redirection automatique)  
> **Fichier source** : `src/app/page.tsx`

---

## 📸 Aperçu Visuel

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                                                                             │
│                         ⏳ Redirection automatique...                       │
│                                                                             │
│                              → /login                                       │
│                                                                             │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### Comportement

Cette page ne s'affiche jamais visuellement. Elle redirige immédiatement vers `/login`.

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| Aucun | - | Page de redirection uniquement |

---

## 🔗 API Endpoints

Aucun appel API.

---

## 💾 Code Source

```typescript
import { redirect } from "next/navigation";

export default function Home() {
  redirect("/login");
}
```

---

## 🔐 Authentification & Autorisations

| Aspect | Détail |
|--------|--------|
| **Middleware** | Non applicable |
| **Session** | Non vérifiée |
| **Rôles autorisés** | Tous (public) |
| **Redirection** | Toujours vers `/login` |

---

## 📂 Fichiers Liés

| Fichier | Description |
|---------|-------------|
| [login.md](login.md) | Page de connexion (destination) |

---

**Mots-clés** : Accueil, Redirection, Public  
**Temps de lecture** : 1 minute  
**Pages estimées** : 0.5
