# Annexe B - Extraits de Code & Journal des Prompts

> Échantillons de code représentatifs et documentation des prompts utilisés.

---

## B.0 Journal des Prompts - Intérêt Académique

### Pourquoi documenter les prompts ?

Le **Journal des Prompts** est un outil d'apprentissage qui permet de :

| Objectif | Description |
| :--- | :--- |
| **Traçabilité** | Conserver l'historique de chaque interaction IA |
| **Amélioration** | Identifier les patterns qui fonctionnent |
| **Réflexivité** | Comprendre comment l'IA "raisonne" |
| **Reproductibilité** | Pouvoir reproduire un résultat |

### Structure du journal

Le journal est organisé en **10 fichiers** (1 par phase de développement) :

```
BlaizBot-V1/
├── PROMPTS.md                    ← Index + statistiques globales
└── prompts/
    ├── phase-01-init.md          ← Initialisation projet
    ├── phase-02-layout.md        ← Layout & navigation
    ├── phase-03-slice.md         ← Vertical slice (démo mock)
    ├── phase-04-database.md      ← Base de données
    ├── phase-05-auth.md          ← Authentification
    ├── phase-06-admin.md         ← Interface Admin
    ├── phase-07-teacher.md       ← Interface Professeur
    ├── phase-08-student.md       ← Interface Élève
    ├── phase-09-ia.md            ← Intégration IA
    └── phase-10-demo.md          ← Stabilisation & démo
```

📎 [Voir le journal complet sur GitHub](https://github.com/williambuirette/BlaizBot-V1/blob/master/PROMPTS.md)

### Workflow par tâche

```
┌─────────────────────────────────────────────────────────────┐
│  1. PROMPT INITIAL                                          │
│     → Écrire son intention en langage naturel               │
│     → Documenter tel quel dans le journal                   │
└─────────────────────┬───────────────────────────────────────┘
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  2. ITÉRATIONS                                              │
│     → Tester le résultat généré                             │
│     → Noter chaque correction demandée                      │
│     → Objectif : < 3 itérations                             │
└─────────────────────┬───────────────────────────────────────┘
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  3. VALIDATION                                              │
│     → Code fonctionne ✅                                    │
│     → Respecte les contraintes (< 350 lignes) ✅            │
└─────────────────────┬───────────────────────────────────────┘
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  4. RÉTRO-PROMPT                                            │
│     → Demander : "Quel prompt aurais-je dû écrire ?"        │
│     → L'IA génère le prompt "parfait"                       │
└─────────────────────┬───────────────────────────────────────┘
                      ▼
┌─────────────────────────────────────────────────────────────┐
│  5. LEÇONS APPRISES                                         │
│     → Identifier ce qui manquait au prompt initial          │
│     → Enrichir sa bibliothèque de patterns                  │
└─────────────────────────────────────────────────────────────┘
```

### Métriques suivies

| Métrique | Description | Objectif |
| :--- | :--- | :--- |
| **Itérations** | Nombre de corrections par tâche | < 3 |
| **Taux 1-shot** | % de prompts réussis du premier coup | > 50% |
| **Temps** | Durée par tâche | Réduction au fil du projet |

### Valeur académique

Ce workflow apporte une **dimension réflexive** au Vibe Coding :

1. **Avant** : On code "à l'instinct" → résultats aléatoires
2. **Après** : On documente → on comprend → on s'améliore

> "Le rétro-prompt révèle l'écart entre l'intention floue et l'instruction précise."

---

## B.0.1 Exemples de Prompts (Best-of)

*Les meilleurs exemples seront extraits du journal pendant le développement.*

### Exemple type

**Tâche** : Créer le composant Sidebar

**Prompt initial** :
```
Fais-moi une sidebar pour le dashboard
```

**Problème** : Trop vague, résultat incohérent avec le design system

**Rétro-prompt** ✨ :
```
Crée un composant Sidebar.tsx en TypeScript/React :
- Props : { role: 'student' | 'teacher' | 'admin', currentPath: string }
- Items de navigation selon le rôle (voir wireframe)
- Style : Tailwind, bg-slate-900, w-64, fixed left
- État actif sur l'item correspondant à currentPath
- Icônes Lucide React
- < 200 lignes
```

**Leçon** : Toujours préciser le typage des props, le style attendu, et la limite de lignes.

---

## B.1 Structure d'une route API (Next.js)

```typescript
// src/app/api/student/progress/route.ts
// Route API pour récupérer la progression d'un élève

import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';
import { getServerSession } from 'next-auth';
import { authOptions } from '@/lib/auth';

export async function GET(request: NextRequest) {
  try {
    // 1. Vérifier l'authentification
    const session = await getServerSession(authOptions);
    if (!session?.user) {
      return NextResponse.json(
        { success: false, error: 'Non authentifié' },
        { status: 401 }
      );
    }

    // 2. Récupérer les données
    const progress = await prisma.progress.findMany({
      where: { userId: session.user.id },
      include: {
        subject: true,
        chapter: true,
      },
    });

    // 3. Retourner la réponse formatée
    return NextResponse.json({
      success: true,
      data: progress,
    });

  } catch (error) {
    // 4. Gestion d'erreur centralisée
    console.error('Erreur progression:', error);
    return NextResponse.json(
      { success: false, error: 'Erreur serveur' },
      { status: 500 }
    );
  }
}
```

**Commentaire** : Ce pattern est utilisé sur toutes les routes API. Il illustre la structure standard avec authentification, requête Prisma et gestion d'erreur.

---

## B.2 Composant React avec TypeScript

```tsx
// src/components/features/ProgressCard.tsx
// Carte affichant la progression d'une matière

import { Progress } from '@/components/ui/progress';
import { Card, CardHeader, CardTitle, CardContent } from '@/components/ui/card';

// Types explicites pour les props
interface ProgressCardProps {
  subject: string;
  percentage: number;
  chaptersCompleted: number;
  totalChapters: number;
}

export function ProgressCard({
  subject,
  percentage,
  chaptersCompleted,
  totalChapters,
}: ProgressCardProps) {
  // Logique de couleur selon le pourcentage
  const getColorClass = () => {
    if (percentage >= 80) return 'bg-green-500';
    if (percentage >= 50) return 'bg-yellow-500';
    return 'bg-red-500';
  };

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle className="text-lg">{subject}</CardTitle>
      </CardHeader>
      <CardContent>
        <Progress value={percentage} className={getColorClass()} />
        <p className="text-sm text-muted-foreground mt-2">
          {chaptersCompleted}/{totalChapters} chapitres
        </p>
      </CardContent>
    </Card>
  );
}
```

**Commentaire** : Composant fonctionnel typé avec props destructurées. Utilise shadcn/ui pour les composants de base.

---

## B.3 Schéma Prisma (extrait)

```prisma
// prisma/schema.prisma
// Modèle de données BlaizBot

model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  role      Role     @default(STUDENT)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  // Relations
  classes    ClassUser[]
  progress   Progress[]
  messages   Message[]
}

model Class {
  id        String   @id @default(cuid())
  name      String
  level     String   // Ex: "6ème", "5ème"
  year      String   // Ex: "2024-2025"
  
  // Relations
  users     ClassUser[]
  subjects  Subject[]
}

model Progress {
  id         String   @id @default(cuid())
  userId     String
  subjectId  String
  chapterId  String?
  percentage Int      @default(0)
  updatedAt  DateTime @updatedAt

  // Relations
  user       User     @relation(fields: [userId], references: [id])
  subject    Subject  @relation(fields: [subjectId], references: [id])
  chapter    Chapter? @relation(fields: [chapterId], references: [id])

  @@unique([userId, subjectId, chapterId])
}

enum Role {
  STUDENT
  TEACHER
  ADMIN
}
```

**Commentaire** : Schéma relationnel avec énumérations et contraintes d'unicité. Les relations sont bidirectionnelles pour faciliter les requêtes.

---

## B.4 Prompt système pour Blaiz'bot

```typescript
// src/lib/ai/prompts.ts
// Prompt système pour le chat IA élève

export const STUDENT_CHAT_SYSTEM_PROMPT = `Tu es Blaiz'bot, un assistant pédagogique pour les élèves de collège.

RÈGLES STRICTES :
1. Tu ne donnes JAMAIS la réponse directe à un exercice
2. Tu guides l'élève avec des questions et des indices
3. Tu encourages et valorises les efforts
4. Tu adaptes ton vocabulaire au niveau collège
5. Tu restes toujours bienveillant et patient

FORMAT DE RÉPONSE :
- Commence par reconnaître la question de l'élève
- Pose une question guidante ou donne un indice
- Termine par un encouragement

EXEMPLE :
Élève: "C'est quoi le résultat de 15 x 8 ?"
Blaiz'bot: "Bonne question ! 🤔 Pour t'aider, essaie de décomposer : 
15 x 8 = (10 + 5) x 8. Peux-tu calculer chaque partie séparément ? 
Tu vas y arriver ! 💪"

MATIÈRES SUPPORTÉES : Maths, Français, Histoire, Sciences, Anglais

Si la question est hors sujet, ramène gentiment l'élève vers l'apprentissage.`;
```

**Commentaire** : Le prompt système définit le comportement strict de l'IA. Le mode "hint-only" est appliqué via les règles explicites.

---

## B.5 Hook React personnalisé

```typescript
// src/hooks/useProgress.ts
// Hook pour gérer la progression de l'élève

import { useState, useEffect } from 'react';

interface Progress {
  subject: string;
  percentage: number;
  lastUpdated: string;
}

export function useProgress(userId: string) {
  const [progress, setProgress] = useState<Progress[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchProgress = async () => {
      try {
        setLoading(true);
        const response = await fetch(`/api/student/progress?userId=${userId}`);
        const data = await response.json();
        
        if (!data.success) {
          throw new Error(data.error);
        }
        
        setProgress(data.data);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Erreur inconnue');
      } finally {
        setLoading(false);
      }
    };

    if (userId) {
      fetchProgress();
    }
  }, [userId]);

  return { progress, loading, error };
}
```

**Commentaire** : Pattern standard de hook avec gestion d'état (loading, error, data). Réutilisable dans plusieurs composants.

---

## B.6 Configuration Tailwind (extrait)

```javascript
// tailwind.config.js
// Configuration du design system

module.exports = {
  content: ['./src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        // Couleurs BlaizBot
        primary: {
          DEFAULT: '#3B82F6', // Bleu principal
          light: '#60A5FA',
          dark: '#2563EB',
        },
        accent: {
          student: '#10B981', // Vert élève
          teacher: '#8B5CF6', // Violet professeur
          admin: '#EF4444',   // Rouge admin
        },
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
    },
  },
  plugins: [require('@tailwindcss/typography')],
};
```

**Commentaire** : Design tokens centralisés. Les couleurs par rôle facilitent l'identification visuelle des interfaces.

---

**Note** : Ces extraits sont représentatifs du code produit. Le code complet est disponible dans le repository BlaizBot-V1.
