# Carte Exercice - Vue Élève (Modale Lecture)

> **Chemin de navigation** : Login → Dashboard Student → Mes cours → [Cours] → Onglet Cours → Clic carte Exercice → **Modale**  
> **Route** : `/student/courses/[id]?tab=cours` (modale ouverte)  
> **Rôle** : STUDENT  
> **Mode** : 👁️ Lecture seule (modale)  
> **Composant source** : `src/components/features/cards/ExerciseCardModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Sidebar → Mes cours
   └── student/courses/liste.md

4. Clic sur "Voir" (ligne du tableau)
   └── student/courses/detail/[id].md

5. Onglet "Cours" → Section "Contenu du cours"
   └── Clic sur carte Exercice
   └── MODALE OUVERTE (VOUS ÊTES ICI)
```

---

## 📸 Aperçu Visuel

### Modale seule (détail)

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│  🎯 Carte exercice                                          ×   │
│  ┌──────────┐                                                   │
│  │ Exercice │                                                   │
│  └──────────┘                                                   │
│                                                                 │
│  [Consigne générale de l'exercice]                              │
│                                                                 │
│  ──────────────────────────────────────────────────────────     │
│                                                                 │
│  1. [Énoncé de la question 1]                              2 pts│
│                                                                 │
│     💡 [Indice optionnel pour aider l'élève]                    │
│                                                                 │
│     ┌────────────────────────────────────────────────────┐     │
│     │ Votre réponse...                                   │     │
│     │                                                    │     │
│     │ (Champ read-only en mode lecture)                  │     │
│     └────────────────────────────────────────────────────┘     │
│                                                                 │
│  ──────────────────────────────────────────────────────────     │
│                                                                 │
│  2. [Énoncé de la question 2]                              3 pts│
│                                                                 │
│     💡 [Indice optionnel]                                       │
│                                                                 │
│     ┌────────────────────────────────────────────────────┐     │
│     │ Votre réponse...                                   │     │
│     │                                                    │     │
│     └────────────────────────────────────────────────────┘     │
│                                                                 │
│  ──────────────────────────────────────────────────────────     │
│                                                                 │
│  3. [Question 3 si présente]                               1 pts│
│                                                                 │
│     ┌────────────────────────────────────────────────────┐     │
│     │ Votre réponse...                                   │     │
│     └────────────────────────────────────────────────────┘     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> ✏️ **Fonctionnalités clés** :
> - Questions ouvertes avec champs de réponse texte
> - Indices optionnels pour guider l'élève (icône 💡)
> - Points affichés par question (alignés à droite)
> - Mode lecture : champs désactivés (read-only)
> - Séparateurs visuels entre questions

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `DialogHeader` | `@/components/ui/dialog` | Header avec titre + badge |
| `DialogContent` | `@/components/ui/dialog` | Zone contenu |
| `Badge` | `@/components/ui/badge` | "Exercice" (orange) |
| `Button` | `@/components/ui/button` | Bouton fermer (×) |
| `Textarea` | `@/components/ui/textarea` | Champs de réponse (read-only) |
| `ScrollArea` | `@/components/ui/scroll-area` | Défilement si beaucoup de questions |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/courses/[id]/cards/[cardId]` | Détail carte exercice | - |

---

## 💾 Types & Interfaces

```typescript
interface ExerciseCardModal {
  id: string;
  type: 'EXERCISE';
  title: string;
  description: string;
  questions: ExerciseQuestion[];
  source: 'COURSE' | 'SUPPLEMENT';
  isCompleted?: boolean;
}

interface ExerciseQuestion {
  id: string;
  text: string;           // Énoncé de la question
  points: number;         // Nombre de points (ex: 2, 3)
  hint: string;           // Indice (optionnel)
  answer?: string;        // Réponse élève (vide en mode lecture)
  correctAnswer?: string; // Correction prof (masquée en lecture)
}
```

---

## 📋 Structure de la Modale

### Header Modale
| Élément | Description |
|---------|-------------|
| **🎯 Icône** | Icône exercice (cible) |
| **Titre** | "Carte exercice" |
| **Badge** | "Exercice" (orange #FF6B35, uppercase) |
| **Bouton ×** | Fermer la modale |

### Description
| Élément | Description |
|---------|-------------|
| **Texte** | Consigne générale de l'exercice (format texte) |
| **Style** | Texte normal, gris foncé #333 |

### Questions

#### Question
| Élément | Description |
|---------|-------------|
| **Numéro** | "1.", "2.", etc. |
| **Énoncé** | Texte de la question (gras, 16px) |
| **Points** | Aligné à droite (ex: "2 pts", "3 pts") |
| **Indice** | Texte italique gris avec 💡 (14px) |
| **Champ réponse** | Textarea vide (lecture seule) avec placeholder "Votre réponse..." |

#### Séparateur
- Ligne horizontale entre chaque question

---

## ⚙️ États & Logique

### Mode Lecture (Cours non commencé ou terminé)
```typescript
const [isReadOnly, setIsReadOnly] = useState(true);

// Champs de réponse désactivés
<Textarea 
  readOnly={isReadOnly} 
  disabled={isReadOnly}
  placeholder="Votre réponse..." 
/>
```

### Calcul Total Points
```typescript
const totalPoints = questions.reduce((sum, q) => sum + q.points, 0);
// Ex: Question 1 (2pts) + Question 2 (3pts) = 5pts total
```

---

## 🎨 Spécifications Visuelles

### Couleurs
| Élément | Couleur |
|---------|---------|
| Badge "Exercice" | Orange #FF6B35 (fond clair #FFF3E0) |
| Titre | Noir #1A1A1A |
| Énoncé | Gris foncé #333333 |
| Points | Gris moyen #666666 |
| Indice | Gris clair #999999 (italic) |
| Champ réponse | Bordure #E0E0E0, fond blanc #FFFFFF |

### Typographie
| Élément | Style |
|---------|-------|
| Badge | Uppercase, bold, 12px |
| Titre | Semi-bold, 18px |
| Énoncé | Medium, 16px |
| Points | Medium, 14px |
| Indice | Regular italic, 14px |
| Placeholder | Regular, 14px, gris #AAAAAA |

### Espacement
- Padding modale : 24px
- Gap entre questions : 24px
- Indice → Champ : 8px
- Champ de réponse min-height : 100px

---

## 🔄 Comportements Interactifs

### Ouverture Modale
1. Clic sur carte "Exercice" dans liste contenu
2. Modale s'ouvre avec animation fade + scale
3. Focus automatique sur bouton fermer (accessibilité)

### Fermeture Modale
- Clic sur **×**
- Touche **Escape**
- Clic sur overlay (fond sombre)

### Scroll
- Si > 4 questions → ScrollArea activé
- Scroll smooth avec indicateur visuel

---

## ♿ Accessibilité

| Feature | Implémentation |
|---------|----------------|
| **Focus trap** | Dialog confine focus à la modale |
| **Escape** | Ferme la modale |
| **ARIA labels** | `aria-label="Question 1 sur 2"` |
| **Screen reader** | Annonce "X points" pour chaque question |
| **Contraste** | AAA pour texte et champs |

---

## 📝 Structure de Données (Exemple)

```json
{
  "id": "card-ex-123",
  "type": "EXERCISE",
  "title": "Carte exercice",
  "description": "[Consigne générale de l'exercice]",
  "questions": [
    {
      "id": "q1",
      "text": "[Énoncé question 1]",
      "points": 2,
      "hint": "[Indice optionnel]",
      "answer": "",
      "correctAnswer": "[Réponse attendue par le professeur]"
    },
    {
      "id": "q2",
      "text": "[Énoncé question 2]",
      "points": 3,
      "hint": "[Indice optionnel]",
      "answer": "",
      "correctAnswer": "[Réponse attendue]"
    },
    {
      "id": "q3",
      "text": "[Énoncé question 3]",
      "points": 1,
      "hint": "",
      "answer": "",
      "correctAnswer": "[Réponse attendue]"
    }
  ],
  "source": "COURSE",
  "isCompleted": true
}
```

**Points clés** :
- `description` : Consigne générale affichée en haut
- `hint` : Optionnel (chaîne vide si absent)
- `answer` : Vide en mode lecture, rempli en mode complétion (V2)
- `correctAnswer` : Masqué en mode lecture, affiché en mode correction (V2)
- `points` : Valeur numérique (1, 2, 3, 5...)

**Total points** : Somme automatique (ex: 2 + 3 + 1 = 6 points)

---

## 🚀 Variantes Futures (Hors Scope V1)

| Variante | Description |
|----------|-------------|
| **Mode Complétion** | Champs éditables + bouton "Enregistrer brouillon" |
| **Mode Soumission** | Bouton "Soumettre" + verrouillage après envoi |
| **Mode Correction** | Affichage réponses correctes + score |
| **Timer** | Compte à rebours si exercice chronométré |
| **Auto-save** | Sauvegarde automatique toutes les 30s |

---

## ✅ Checklist Développement

- [ ] Dialog modal avec overlay
- [ ] Badge "Exercice" orange
- [ ] Affichage description
- [ ] Loop sur questions avec énoncé + points + indice
- [ ] Textarea read-only avec placeholder
- [ ] Séparateurs entre questions
- [ ] Bouton fermer (×)
- [ ] Gestion Escape key
- [ ] Focus trap
- [ ] ScrollArea si > 4 questions
- [ ] Tests unitaires (render, data binding)
- [ ] Tests accessibilité (aria, keyboard nav)