# Phase 05 — Authentification NextAuth

> Configuration NextAuth v5 avec credentials provider et RBAC

---

## 5.1 — Installation

### 5.1.1 — Installer NextAuth v5

#### Contexte
NextAuth v5 (beta) est la nouvelle version majeure avec support natif des Server Components et Edge Runtime.

#### Description
Packages à installer :
- `next-auth@beta` : NextAuth v5
- `bcryptjs` + `@types/bcryptjs` : Hash des mots de passe

#### Prompt
```
Installe NextAuth v5 et bcrypt :

npm install next-auth@beta bcryptjs
npm install @types/bcryptjs --save-dev

NextAuth v5 utilise une nouvelle API avec :
- Un fichier auth.ts central
- Des handlers exportés pour les routes API
- La fonction auth() pour récupérer la session côté serveur
```

---

### 5.1.2 — Générer le secret AUTH_SECRET

#### Contexte
NextAuth nécessite un secret pour signer les JWT.

#### Description
Générer une chaîne aléatoire sécurisée.

#### Prompt
```
Génère le secret et ajoute-le au .env :

# Terminal
openssl rand -base64 32

# Ou avec Node.js
node -e "console.log(require('crypto').randomBytes(32).toString('base64'))"

# .env
AUTH_SECRET="ta-chaine-generee-ici"

⚠️ Ne jamais commiter AUTH_SECRET !
```

---

## 5.2 — Configuration auth.ts

### 5.2.1 — Créer le fichier auth.ts

#### Contexte
Le fichier `src/lib/auth.ts` centralise toute la configuration NextAuth.

#### Description
```
auth.ts exporte :
├── auth()      → récupérer la session (Server Components)
├── signIn()    → connecter un utilisateur
├── signOut()   → déconnecter
└── handlers    → routes GET/POST pour /api/auth/*
```

#### Prompt
```
Crée src/lib/auth.ts :

import NextAuth from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import bcrypt from "bcryptjs";
import { prisma } from "./prisma";
import type { Role } from "@prisma/client";

export const { auth, signIn, signOut, handlers } = NextAuth({
  secret: process.env.AUTH_SECRET,
  trustHost: true,
  debug: process.env.NODE_ENV === "development",
  
  providers: [
    CredentialsProvider({
      name: "credentials",
      credentials: {
        email: { label: "Email", type: "email" },
        password: { label: "Password", type: "password" },
      },
      async authorize(credentials) {
        if (!credentials?.email || !credentials?.password) {
          return null;
        }

        // Chercher l'utilisateur
        const user = await prisma.user.findUnique({
          where: { email: credentials.email as string },
        });

        if (!user) return null;

        // Vérifier le mot de passe
        const isValid = await bcrypt.compare(
          credentials.password as string,
          user.passwordHash
        );

        if (!isValid) return null;

        // Retourner l'utilisateur (sera stocké dans le JWT)
        return {
          id: user.id,
          email: user.email,
          name: `${user.firstName} ${user.lastName}`,
          role: user.role,
        };
      },
    }),
  ],
  
  session: {
    strategy: "jwt",
  },
  
  pages: {
    signIn: "/login",
  },
});

Points clés :
- trustHost: true → nécessaire pour Vercel
- strategy: "jwt" → pas de session en BDD
- pages.signIn → redirige vers /login au lieu de la page par défaut
```

---

### 5.2.2 — Ajouter les callbacks JWT et Session

#### Contexte
Les callbacks permettent d'enrichir le token JWT et la session avec le rôle utilisateur.

#### Description
```
authorize() → jwt() → session()
     ↓           ↓          ↓
   user      token.role   session.user.role
```

#### Prompt
```
Ajoute les callbacks dans auth.ts :

callbacks: {
  async jwt({ token, user }) {
    // Lors de la connexion, user est défini
    if (user) {
      token.id = user.id;
      token.role = user.role;
    }
    return token;
  },
  
  async session({ session, token }) {
    // Enrichir la session avec les données du token
    if (session.user) {
      session.user.id = token.id as string;
      session.user.role = token.role as Role;
    }
    return session;
  },
  
  async redirect({ url, baseUrl }) {
    // Autoriser les URLs relatives
    if (url.startsWith("/")) return `${baseUrl}${url}`;
    // Autoriser les URLs du même domaine
    if (url.startsWith(baseUrl)) return url;
    return baseUrl;
  },
},

Le callback redirect évite les erreurs CORS lors des redirections.
```

---

### 5.2.3 — Étendre les types TypeScript

#### Contexte
TypeScript ne connaît pas le champ `role` par défaut. Il faut étendre les interfaces.

#### Description
Fichier de déclaration pour augmenter les types next-auth.

#### Prompt
```
Crée src/types/next-auth.d.ts :

import { Role } from "@prisma/client";
import "next-auth";

declare module "next-auth" {
  interface User {
    role: Role;
  }
  interface Session {
    user: User & { role: Role };
  }
}

declare module "next-auth/jwt" {
  interface JWT {
    role: Role;
  }
}

Maintenant session.user.role est typé correctement.
```

---

## 5.3 — Route API NextAuth

### 5.3.1 — Créer le handler API

#### Contexte
NextAuth v5 expose les handlers GET et POST pour toutes les routes `/api/auth/*`.

#### Description
Une seule ligne grâce au pattern catch-all `[...nextauth]`.

#### Prompt
```
Crée src/app/api/auth/[...nextauth]/route.ts :

import { handlers } from "@/lib/auth";
export const { GET, POST } = handlers;

Ce fichier gère automatiquement :
- GET /api/auth/session → récupérer la session
- GET /api/auth/csrf → token CSRF
- POST /api/auth/signin → connexion
- POST /api/auth/signout → déconnexion
- GET /api/auth/providers → liste des providers
```

---

## 5.4 — Middleware de protection

### 5.4.1 — Créer le middleware

#### Contexte
Le middleware s'exécute avant chaque requête pour protéger les routes.

#### Description
```
middleware.ts
├── Routes publiques → passer
├── Non connecté → redirect /login
├── Connecté → vérifier le rôle (RBAC)
└── Accès refusé → redirect /unauthorized
```

#### Prompt
```
Crée src/middleware.ts :

import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";
import { getToken } from "next-auth/jwt";

export async function middleware(req: NextRequest) {
  const { pathname } = req.nextUrl;

  // Routes publiques - ne pas protéger
  if (
    pathname.startsWith("/login") ||
    pathname.startsWith("/api") ||
    pathname.startsWith("/_next") ||
    pathname.startsWith("/favicon.ico") ||
    pathname === "/"
  ) {
    return NextResponse.next();
  }

  // Récupérer le token JWT
  const token = await getToken({
    req,
    secret: process.env.AUTH_SECRET,
    secureCookie: process.env.NODE_ENV === "production",
  });

  // Non connecté → login
  if (!token) {
    const loginUrl = new URL("/login", req.url);
    return NextResponse.redirect(loginUrl);
  }

  const role = token.role as string;

  // RBAC - vérifier l'accès aux routes protégées
  if (pathname.startsWith("/admin") && role !== "ADMIN") {
    return NextResponse.redirect(new URL("/unauthorized", req.url));
  }
  if (pathname.startsWith("/teacher") && role !== "TEACHER") {
    return NextResponse.redirect(new URL("/unauthorized", req.url));
  }
  if (pathname.startsWith("/student") && role !== "STUDENT") {
    return NextResponse.redirect(new URL("/unauthorized", req.url));
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/((?!_next/static|_next/image|favicon.ico).*)"],
};

Le matcher exclut les assets statiques du middleware.
```

---

## 5.5 — Page de login

### 5.5.1 — Créer la page login

#### Contexte
Page publique dans le route group `(auth)` (sans layout dashboard).

#### Description
Structure simple avec le composant LoginForm.

#### Prompt
```
Crée src/app/(auth)/login/page.tsx :

import { LoginForm } from "@/components/auth/LoginForm";

export default function LoginPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <LoginForm />
    </div>
  );
}

Page Server Component qui affiche le formulaire client.
```

---

### 5.5.2 — Créer le composant LoginForm

#### Contexte
Formulaire de connexion avec gestion d'erreurs et boutons de connexion rapide (dev).

#### Description
```
LoginForm
├── Champs email/password
├── Gestion loading/error
├── Boutons DEV (Élève, Prof, Admin)
└── Redirection après connexion
```

#### Prompt
```
Crée src/components/auth/LoginForm.tsx :

"use client";

import { useState } from "react";
import { signIn } from "next-auth/react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";

// Comptes de test (définis dans seed.ts)
const DEV_ACCOUNTS = {
  student: { email: "lucas.martin@blaizbot.edu", password: "eleve123" },
  teacher: { email: "m.dupont@blaizbot.edu", password: "prof123" },
  admin: { email: "admin@blaizbot.edu", password: "admin123" },
};

export function LoginForm() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleLogin = async (emailValue: string, passwordValue: string, targetRole?: string) => {
    setLoading(true);
    setError("");

    try {
      const result = await signIn("credentials", {
        email: emailValue,
        password: passwordValue,
        redirect: false,
      });

      if (result?.error) {
        setLoading(false);
        setError("Email ou mot de passe incorrect");
        return;
      }

      // Attendre que le cookie soit posé
      await new Promise(resolve => setTimeout(resolve, 300));
      
      // Rediriger selon le rôle
      let redirectPath = targetRole ? `/${targetRole}` : null;
      
      if (!redirectPath) {
        // Récupérer la session pour déterminer le rôle
        const sessionRes = await fetch("/api/auth/session");
        const session = await sessionRes.json();
        
        const roleRoutes: Record<string, string> = {
          ADMIN: "/admin",
          TEACHER: "/teacher",
          STUDENT: "/student",
        };
        redirectPath = roleRoutes[session?.user?.role] || "/login";
      }
      
      window.location.href = redirectPath;
    } catch {
      setLoading(false);
      setError("Erreur de connexion");
    }
  };

  const loginAs = (role: "student" | "teacher" | "admin") => {
    const account = DEV_ACCOUNTS[role];
    handleLogin(account.email, account.password, role);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    handleLogin(email, password);
  };

  return (
    <Card className="w-full max-w-md">
      <CardHeader className="text-center">
        <div className="flex justify-center mb-4">
          <span className="text-5xl">🤖</span>
        </div>
        <CardTitle className="text-2xl">BlaizBot</CardTitle>
        <CardDescription>Plateforme éducative avec IA intégrée</CardDescription>
      </CardHeader>

      <CardContent className="space-y-6">
        {/* Formulaire */}
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input
              id="email"
              type="email"
              placeholder="votre@email.com"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              disabled={loading}
            />
          </div>
          <div className="space-y-2">
            <Label htmlFor="password">Mot de passe</Label>
            <Input
              id="password"
              type="password"
              placeholder="••••••••"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              disabled={loading}
            />
          </div>

          {error && <p className="text-sm text-red-500 text-center">{error}</p>}

          <Button type="submit" className="w-full" disabled={loading}>
            {loading ? "Connexion..." : "Se connecter"}
          </Button>
        </form>

        {/* Boutons DEV */}
        <div className="border-t pt-4">
          <p className="text-sm text-muted-foreground text-center mb-3">
            🛠️ Connexion rapide (DEV)
          </p>
          <div className="grid grid-cols-3 gap-2">
            <Button
              variant="outline"
              size="sm"
              onClick={() => loginAs("student")}
              disabled={loading}
            >
              Élève
            </Button>
            <Button
              variant="outline"
              size="sm"
              onClick={() => loginAs("teacher")}
              disabled={loading}
            >
              Prof
            </Button>
            <Button
              variant="outline"
              size="sm"
              onClick={() => loginAs("admin")}
              disabled={loading}
            >
              Admin
            </Button>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}

Points clés :
- redirect: false → gestion manuelle de la redirection
- Délai de 300ms pour que le cookie JWT soit posé
- Boutons DEV pour tester rapidement les différents rôles
```

---

## 5.6 — Page non autorisé

### 5.6.1 — Créer la page unauthorized

#### Contexte
Page affichée quand un utilisateur tente d'accéder à une zone non autorisée.

#### Description
Message d'erreur avec lien de retour.

#### Prompt
```
Crée src/app/unauthorized/page.tsx :

import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ShieldX } from "lucide-react";

export default function UnauthorizedPage() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <Card className="w-full max-w-md text-center">
        <CardHeader>
          <div className="flex justify-center mb-4">
            <ShieldX className="h-16 w-16 text-red-500" />
          </div>
          <CardTitle className="text-2xl">Accès refusé</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <p className="text-muted-foreground">
            Vous n'avez pas les permissions nécessaires pour accéder à cette page.
          </p>
          <Button asChild>
            <Link href="/">Retour à l'accueil</Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}
```

---

## 5.7 — Utilisation de auth()

### 5.7.1 — Récupérer la session côté serveur

#### Contexte
Dans les Server Components et les layouts, utiliser `auth()` pour récupérer la session.

#### Description
Exemple dans le DashboardLayout.

#### Prompt
```
Exemple d'utilisation dans un Server Component :

import { auth } from "@/lib/auth";
import { redirect } from "next/navigation";

export default async function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const session = await auth();

  // Rediriger si non connecté
  if (!session?.user) {
    redirect("/login");
  }

  const role = session.user.role;

  // Utiliser role pour afficher le bon contenu
  return (
    <DashboardShell role={role} user={session.user}>
      {children}
    </DashboardShell>
  );
}

auth() est une fonction async qui retourne la session ou null.
```

---

### 5.7.2 — Utiliser useSession côté client

#### Contexte
Dans les Client Components, utiliser `useSession()` de next-auth/react.

#### Description
Hook React pour accéder à la session.

#### Prompt
```
Exemple d'utilisation dans un Client Component :

"use client";

import { useSession } from "next-auth/react";

export function UserInfo() {
  const { data: session, status } = useSession();

  if (status === "loading") {
    return <p>Chargement...</p>;
  }

  if (!session) {
    return <p>Non connecté</p>;
  }

  return (
    <div>
      <p>Bonjour {session.user.name}</p>
      <p>Rôle : {session.user.role}</p>
    </div>
  );
}

Rappel : Le SessionProvider doit envelopper l'application (voir Phase 03).
```

---

## 5.8 — Déconnexion

### 5.8.1 — Implémenter la déconnexion

#### Contexte
Utiliser `signOut()` de next-auth/react pour déconnecter l'utilisateur.

#### Description
Rediriger vers /login après déconnexion.

#### Prompt
```
Dans le Header ou un menu utilisateur :

import { signOut } from "next-auth/react";

<DropdownMenuItem onClick={() => signOut({ callbackUrl: "/login" })}>
  <LogOut className="mr-2 h-4 w-4" />
  Déconnexion
</DropdownMenuItem>

L'option callbackUrl redirige vers /login après déconnexion.
```

---

## 5.9 — Variables d'environnement

### 5.9.1 — Récapitulatif .env

#### Contexte
Toutes les variables nécessaires pour l'authentification.

#### Description
Variables à définir dans `.env` et `.env.example`.

#### Prompt
```
Vérifie que .env contient :

# NextAuth
AUTH_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# Optionnel : URL de base (auto-détectée en dev)
# NEXTAUTH_URL="http://localhost:3000"

Crée aussi .env.example (sans les valeurs sensibles) :

# NextAuth
AUTH_SECRET="generate-with-openssl-rand-base64-32"

# Database (voir Phase 04)
DATABASE_URL="postgresql://..."
DIRECT_URL="postgresql://..."

.env.example sert de documentation pour les nouveaux développeurs.
```

---

## 5.10 — Commit Phase 05

### 5.10.1 — Commit de l'authentification

#### Contexte
Sauvegarder tout le système d'authentification.

#### Description
Commit avec les fichiers créés.

#### Prompt
```
Commit l'authentification :

git add .
git commit -m "feat: add NextAuth v5 authentication

- Credentials provider with bcrypt
- JWT callbacks with role
- Middleware for route protection (RBAC)
- Login page with dev quick-login buttons
- Unauthorized page
- TypeScript type augmentation"

Vérification :
1. npm run dev
2. Aller sur /login
3. Se connecter avec un compte de test
4. Vérifier la redirection vers le bon dashboard
```

---

## ✅ Checklist Phase 05

- [ ] NextAuth v5 installé
- [ ] AUTH_SECRET généré dans .env
- [ ] src/lib/auth.ts créé avec CredentialsProvider
- [ ] Callbacks JWT et Session configurés
- [ ] Types TypeScript étendus (next-auth.d.ts)
- [ ] Route API [...nextauth] créée
- [ ] Middleware de protection avec RBAC
- [ ] Page /login créée
- [ ] Composant LoginForm créé
- [ ] Page /unauthorized créée
- [ ] SessionProvider dans RootLayout
- [ ] Déconnexion fonctionnelle
- [ ] Test : connexion → redirection par rôle
- [ ] Commit effectué

---

## 🔐 Flux d'authentification

```
┌─────────────────────────────────────────────────────────┐
│                    Utilisateur                          │
│                         │                               │
│                         ▼                               │
│                  GET /student                           │
│                         │                               │
│                         ▼                               │
│  ┌─────────────────────────────────────────────────┐   │
│  │                 Middleware                       │   │
│  │  ├── Token JWT ?                                 │   │
│  │  │   ├── Non → redirect /login                  │   │
│  │  │   └── Oui → vérifier rôle                    │   │
│  │  │       ├── STUDENT → ✅ accès autorisé        │   │
│  │  │       └── Autre → redirect /unauthorized     │   │
│  └─────────────────────────────────────────────────┘   │
│                         │                               │
│                         ▼                               │
│              DashboardLayout (auth())                   │
│                         │                               │
│                         ▼                               │
│                  Page /student                          │
└─────────────────────────────────────────────────────────┘
```

---

## 📝 Comptes de test (seed)

| Rôle | Email | Mot de passe |
|:-----|:------|:-------------|
| Admin | admin@blaizbot.edu | admin123 |
| Prof | m.dupont@blaizbot.edu | prof123 |
| Élève | lucas.martin@blaizbot.edu | eleve123 |

---

*Phase suivante : [06-PAGES-DASHBOARD.md](06-PAGES-DASHBOARD.md)*
