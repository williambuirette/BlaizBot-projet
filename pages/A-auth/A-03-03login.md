# 🔐 Page de Connexion

> **Route** : `/login`  
> **Rôle(s)** : Public  
> **Fichier source** : `src/app/(auth)/login/page.tsx`

---

## 📸 Aperçu Visuel

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│                          (fond blanc/gris très clair)                       │
│                                                                             │
│                    ┌─────────────────────────────────┐                      │
│                    │                                 │                      │
│                    │        🤖                       │  ← Logo Robot 3D     │
│                    │   (image colorée violet/rose)   │     (pas emoji)      │
│                    │                                 │                      │
│                    │         BlaizBot                │  ← Titre noir gras   │
│                    │                                 │                      │
│                    │  Plateforme éducative avec IA   │  ← Sous-titre gris   │
│                    │         intégrée                │                      │
│                    │                                 │                      │
│                    │  Email                          │                      │
│                    │  ┌───────────────────────────┐  │                      │
│                    │  │ votre@email.com           │  │  ← Placeholder      │
│                    │  └───────────────────────────┘  │                      │
│                    │                                 │                      │
│                    │  Mot de passe                   │                      │
│                    │  ┌───────────────────────────┐  │                      │
│                    │  │ ••••••••                  │  │  ← Password masqué  │
│                    │  └───────────────────────────┘  │                      │
│                    │                                 │                      │
│                    │  ┌───────────────────────────┐  │                      │
│                    │  │      Se connecter         │  │  ← Bouton noir      │
│                    │  │   (bg-primary w-full)     │  │     pleine largeur  │
│                    │  └───────────────────────────┘  │                      │
│                    │                                 │                      │
│                    │  ─────────────────────────────  │  ← Séparateur       │
│                    │                                 │                      │
│                    │  🛠️ Connexion rapide (DEV)     │  ← Label centré     │
│                    │                                 │                      │
│                    │  ┌───────┐ ┌──────────┐ ┌─────┐│                      │
│                    │  │ Élève │ │Professeur│ │Admin││  ← 3 boutons        │
│                    │  │(outline│ │ (outline)│ │(out)││     outline         │
│                    │  └───────┘ └──────────┘ └─────┘│                      │
│                    │                                 │                      │
│                    └─────────────────────────────────┘                      │
│                          (Card centrée, ombre légère)                       │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 📸 Capture d'écran

![Page de connexion BlaizBot](../../../assets/screenshots/auth/login.png)

*Interface de connexion avec formulaire standard et boutons de connexion rapide (DEV)*

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `LoginForm` | `@/components/auth/LoginForm` | Formulaire de connexion complet |
| `Card` | `@/components/ui/card` | Conteneur carte centré |
| `CardHeader` | `@/components/ui/card` | En-tête avec logo + titre |
| `CardContent` | `@/components/ui/card` | Formulaire + boutons DEV |
| `Input` | `@/components/ui/input` | Champs Email et Mot de passe |
| `Button` | `@/components/ui/button` | Boutons (connexion + DEV) |
| `Label` | `@/components/ui/label` | Labels des champs |
| `Separator` | `@/components/ui/separator` | Ligne de séparation |

---

## 📋 Champs du Formulaire

| Champ | Type | Validation | Description |
|-------|------|------------|-------------|
| **Email** | `Input[email]` | Obligatoire, format email | Adresse email de l'utilisateur |
| **Mot de passe** | `Input[password]` | Obligatoire, min 6 char | Mot de passe masqué |

---

## 🛠️ Section DEV : Connexion Rapide

> ⚠️ **Visible uniquement en environnement de développement**

| Bouton | Rôle | Credentials |
|--------|------|-------------|
| **Élève** | `STUDENT` | Compte de test élève |
| **Professeur** | `TEACHER` | Compte de test professeur |
| **Admin** | `ADMIN` | Compte de test administrateur |

### Comportement
- Clic sur un bouton → Connexion automatique avec le compte de test
- Redirection vers le dashboard correspondant au rôle

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| `POST` | `/api/auth/signin` | Authentification NextAuth |
| `POST` | `/api/auth/callback/credentials` | Callback credentials |

---

## 🔄 Comportements

### Formulaire Standard
1. Saisie email et mot de passe
2. Clic "Se connecter"
3. Validation des credentials
4. Si succès → Redirection vers dashboard selon rôle
5. Si échec → Message d'erreur

### Connexion Rapide (DEV)
1. Clic sur bouton rôle
2. Authentification automatique
3. Redirection vers dashboard

### Redirections après connexion

| Rôle | Destination |
|------|-------------|
| `ADMIN` | `/admin` |
| `TEACHER` | `/teacher` |
| `STUDENT` | `/student` |

---

## 🎨 États Visuels

| État | Apparence |
|------|-----------|
| **Initial** | Champs vides, bouton actif |
| **Saisie** | Texte dans les champs |
| **Erreur** | Message rouge sous le formulaire |
| **Loading** | Spinner dans le bouton, champs désactivés |

---

## 🔐 Authentification

| Aspect | Détail |
|--------|--------|
| **Provider** | Credentials (NextAuth) |
| **Session** | JWT |
| **Durée** | 30 jours |

---

## 📂 Fichiers Liés

| Fichier | Description |
|---------|-------------|
| [accueil.md](accueil.md) | Redirection vers cette page |
| [unauthorized.md](unauthorized.md) | Page d'erreur d'accès |

---

**Navigation** :
- → [Dashboard Admin](../admin/00-dashboard.md) (si ADMIN)
- → [Dashboard Teacher](../teacher/dashboard.md) (si TEACHER)
- → [Dashboard Student](../student/dashboard.md) (si STUDENT)

---

**Mots-clés** : Login, Connexion, Authentification, NextAuth, Credentials  
**Temps de lecture** : 3 minutes  
**Pages estimées** : 1.5
