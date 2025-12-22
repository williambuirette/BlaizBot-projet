# 8. Développement en Itérations

> Ce chapitre documente la phase de développement : plan d'itération, cycle de travail et gestion des bugs.

---

## 8.1 Plan d'itération

### 8.1.1 Découpage en slices

Le développement suit une approche par **slices verticales** (fonctionnalité complète de bout en bout) plutôt que par couches horizontales.

```
┌─────────────────────────────────────────────────────────────┐
│                    SLICE 1 : Auth + Base                    │
│  Login → Session → Redirection rôle → Dashboard vide       │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 2 : Élève MVP                      │
│  Dashboard → Chat IA → Progression → Cours                 │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 3 : Professeur MVP                 │
│  Dashboard → Classes → Suivi → Création cours              │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 4 : Admin MVP                      │
│  Dashboard → Users CRUD → Stats                            │
├─────────────────────────────────────────────────────────────┤
│                    SLICE 5 : Polish                         │
│  UX améliorations → Bugs → Performance                     │
└─────────────────────────────────────────────────────────────┘
```

### 8.1.2 Planning prévisionnel

| Slice | Durée estimée | Dates |
| :--- | :--- | :--- |
| Slice 1 : Auth + Base | 3-4 jours | ... |
| Slice 2 : Élève MVP | 5-6 jours | ... |
| Slice 3 : Professeur MVP | 5-6 jours | ... |
| Slice 4 : Admin MVP | 3-4 jours | ... |
| Slice 5 : Polish | 2-3 jours | ... |
| **Total** | **18-23 jours** | ... |

## 8.2 Cycle de développement Vibe Coding

### 8.2.1 Le cycle standard

```
┌─────────────────────────────────────────────────────────────┐
│                     CYCLE VIBE CODING                       │
│                                                             │
│   ┌─────────┐                                               │
│   │ 1.INTENT│  "Je veux créer le composant LoginForm"      │
│   └────┬────┘                                               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────┐  Contexte + contraintes + références          │
│   │2.PROMPT │  "Crée LoginForm avec email/password..."     │
│   └────┬────┘                                               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────┐  L'IA génère le code                          │
│   │ 3.GEN   │  → LoginForm.tsx (80 lignes)                 │
│   └────┬────┘                                               │
│        │                                                    │
│        ▼                                                    │
│   ┌─────────┐  Vérification visuelle + fonctionnelle        │
│   │ 4.TEST  │  → npm run dev → tester login                │
│   └────┬────┘                                               │
│        │                                                    │
│   ┌────┴────┐                                               │
│   │  OK ?   │                                               │
│   └────┬────┘                                               │
│    Non │  Oui                                               │
│        │   │                                                │
│   ┌────┴───┐│  ┌─────────┐                                  │
│   │5.CORREC││──│6.COMMIT │  git commit -m "feat: LoginForm"│
│   └────────┘   └─────────┘                                  │
│        │                                                    │
│        └──────────▶ Retour au cycle                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 8.2.2 Exemple concret : Création du chat IA

**1. Intention**
```
Je veux créer l'interface de chat avec Blaiz'bot pour les élèves.
```

**2. Prompt**
```
Crée un composant ChatInterface pour le dashboard élève.
Spécifications :
- Zone de messages scrollable
- Input avec bouton envoi
- Affichage messages user (droite) et bot (gauche)
- Indicateur "typing" pendant la réponse
- Intégration avec /api/student/chat (streaming)

Utilise Tailwind CSS et les composants shadcn/ui.
Référence design : blaizbot-wireframe/student.html section chat
```

**3. Génération**
```typescript
// src/components/features/ChatInterface.tsx
'use client';

import { useState, useRef, useEffect } from 'react';
import { useChat } from 'ai/react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { ScrollArea } from '@/components/ui/scroll-area';

export function ChatInterface() {
  const { messages, input, handleInputChange, handleSubmit, isLoading } = useChat({
    api: '/api/student/chat',
  });
  
  const scrollRef = useRef<HTMLDivElement>(null);
  
  useEffect(() => {
    scrollRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);
  
  return (
    <div className="flex flex-col h-[600px] border rounded-lg">
      <div className="p-4 border-b bg-primary text-white">
        <h3 className="font-semibold">🤖 Blaiz'bot</h3>
      </div>
      
      <ScrollArea className="flex-1 p-4">
        {messages.map((m) => (
          <div
            key={m.id}
            className={`mb-4 ${m.role === 'user' ? 'text-right' : 'text-left'}`}
          >
            <span className={`inline-block p-3 rounded-lg ${
              m.role === 'user' 
                ? 'bg-primary text-white' 
                : 'bg-muted'
            }`}>
              {m.content}
            </span>
          </div>
        ))}
        {isLoading && (
          <div className="text-muted-foreground">Blaiz'bot réfléchit...</div>
        )}
        <div ref={scrollRef} />
      </ScrollArea>
      
      <form onSubmit={handleSubmit} className="p-4 border-t flex gap-2">
        <Input
          value={input}
          onChange={handleInputChange}
          placeholder="Pose ta question..."
          disabled={isLoading}
        />
        <Button type="submit" disabled={isLoading}>
          Envoyer
        </Button>
      </form>
    </div>
  );
}
```

**4. Test**
- ✅ Interface s'affiche correctement
- ✅ Messages apparaissent des deux côtés
- ⚠️ Bug : scroll ne fonctionne pas au premier message

**5. Correction**
```
Le scroll ne fonctionne pas au chargement initial.
Ajoute un useEffect qui scroll au mount du composant.
```

**6. Commit**
```bash
git add src/components/features/ChatInterface.tsx
git commit -m "feat(student): add ChatInterface component with streaming"
```

## 8.3 Gestion des bugs

### 8.3.1 Template de rapport de bug

```markdown
## Bug #XXX : [Titre court]

**Contexte** : Où le bug a été découvert
**Étapes de reproduction** :
1. ...
2. ...

**Comportement attendu** : ...
**Comportement actuel** : ...

**Capture/Erreur** : [screenshot ou message d'erreur]

**Cause identifiée** : ...
**Solution appliquée** : ...

**Commit fix** : [hash]
```

### 8.3.2 Log des bugs rencontrés

| # | Bug | Cause | Solution | Status |
| :--- | :--- | :--- | :--- | :--- |
| 001 | *À documenter pendant le dev* | | | |
| 002 | | | | |
| ... | | | | |

### 8.3.3 Patterns de bugs fréquents

| Pattern | Symptôme | Solution type |
| :--- | :--- | :--- |
| Hydration mismatch | Console warning SSR | `'use client'` ou `suppressHydrationWarning` |
| Type error Prisma | TS error sur relations | `include: { relation: true }` |
| Auth redirect loop | Boucle infinie login | Vérifier middleware matcher |
| API 500 | Erreur serveur | Logs + try/catch |

## 8.4 Organisation modulaire du TODO

### 8.4.1 Problème du fichier monolithique

Le TODO initial (926 lignes) posait plusieurs problèmes :

| Problème | Impact |
| :--- | :--- |
| Taille excessive | Dépassait la règle 350 lignes |
| Surcharge contexte IA | L'IA lisait tout au lieu de la phase active |
| Navigation difficile | Scroll constant pour trouver l'info |
| Pas d'instructions contextuelles | Règles générales vs spécifiques |

### 8.4.2 Solution : dossier modulaire

```
todo/
├── INDEX.md              # 🎯 Point d'entrée (navigation + progression)
├── RULES.md              # ⚠️ Contraintes obligatoires (350 lignes, secrets)
├── STRUCTURE.md          # 🗂️ Arborescence cible du projet
│
├── phase-01-init.md      # 🚀 ~140 lignes
├── phase-02-layout.md    # 🎨 ~170 lignes
├── phase-03-slice.md     # 🧪 ~150 lignes
├── phase-04-database.md  # 🗄️ ~180 lignes
├── phase-05-auth.md      # 🔐 ~190 lignes
├── phase-06-admin.md     # 👔 ~180 lignes
├── phase-07-teacher.md   # 👨‍🏫 ~190 lignes
├── phase-08-student.md   # 🎓 ~190 lignes
├── phase-09-ai.md        # 🤖 ~200 lignes
└── phase-10-demo.md      # 🎬 ~200 lignes
```

### 8.4.3 Workflow de l'IA avec le nouveau système

```
┌─────────────────────────────────────────────────────────────┐
│                  WORKFLOW TODO MODULAIRE                    │
│                                                             │
│   1. OUVRIR INDEX.md                                        │
│      └─▶ Phase active = phase-01-init.md                   │
│                                                             │
│   2. LIRE RULES.md                                          │
│      └─▶ Contraintes : 350 lignes, secrets, types...       │
│                                                             │
│   3. LIRE STRUCTURE.md                                      │
│      └─▶ Où créer chaque fichier                           │
│                                                             │
│   4. OUVRIR phase-XX.md                                     │
│      └─▶ Instructions contextuelles + tâches détaillées    │
│                                                             │
│   5. EXÉCUTER tâche par tâche                               │
│      └─▶ Validation à chaque étape                         │
│                                                             │
│   6. METTRE À JOUR INDEX.md                                 │
│      └─▶ Progression globale                               │
└─────────────────────────────────────────────────────────────┘
```

### 8.4.4 Avantages mesurés

| Avant | Après | Gain |
| :--- | :--- | :--- |
| 1 fichier 926 lignes | 13 fichiers < 200 lignes | Respect règle 350 |
| Contexte complet chargé | Contexte ciblé par phase | -80% tokens |
| Instructions génériques | Instructions contextuelles | Moins d'erreurs |
| Navigation par scroll | Navigation par fichiers | Plus rapide |

## 8.5 Métriques de développement

### 8.5.1 Suivi du temps

| Slice | Estimé | Réel | Écart |
| :--- | :--- | :--- | :--- |
| Slice 1 | 4j | *À remplir* | |
| Slice 2 | 6j | *À remplir* | |
| Slice 3 | 6j | *À remplir* | |
| Slice 4 | 4j | *À remplir* | |
| Slice 5 | 3j | *À remplir* | |

### 8.5.2 Lignes de code

| Catégorie | Lignes | % IA généré | % modifié |
| :--- | :--- | :--- | :--- |
| Composants React | *À mesurer* | | |
| API Routes | | | |
| Prisma schema | | | |
| Styles (Tailwind) | | | |
| **Total** | | | |

### 8.5.3 Commits par jour

*Graphique à générer en fin de projet*

## 8.6 Preuves

### 8.6.1 Captures requises

- [ ] `08-dev/cycle-exemple.png` - Exemple de cycle complet
- [ ] `08-dev/terminal-dev.png` - Commandes typiques
- [ ] `08-dev/bug-fix-exemple.png` - Correction de bug
- [ ] `08-dev/commit-history.png` - Historique Git
- [ ] `08-dev/todo-structure.png` - Structure dossier todo/

### 8.6.2 Template journal de bord (par itération)

```
Date/heure : [...]
Slice : X - [Nom]
Objectif : [...]
Prompt utilisé : [...]
Résultat : [✅/⚠️/❌] [description]
Problème rencontré : [...]
Décision / justification : [...]
Temps passé : [...]
Commit(s) : [hash1, hash2, ...]
Preuves : [capture/lien]
```

---

**Mots-clés** : itérations, slices, cycle Vibe Coding, bugs, métriques, TODO modulaire
**Statut** : 🔄 En cours (documentation au fil de l'eau)
