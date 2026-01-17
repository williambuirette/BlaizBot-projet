# Carte Quiz - Vue Élève (Modale Interactive)

> **Chemin de navigation** : Login → Dashboard Student → Mes cours → [Cours] → Onglet Cours → Clic carte Quiz → **Modale**  
> **Route** : `/student/courses/[id]?tab=cours` (modale ouverte)  
> **Rôle** : STUDENT  
> **Mode** : 🎮 Interactif (réponse QCM)  
> **Composant source** : `src/components/features/cards/QuizCardModal.tsx`

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
   └── Clic sur carte Quiz
   └── MODALE OUVERTE (VOUS ÊTES ICI)
```

---

## 📸 Aperçu Visuel

### Modale seule (détail)

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│  ❓ Carte quiz                                              ×   │
│  ┌──────┐                                                       │
│  │ Quiz │                                                       │
│  └──────┘                                                       │
│                                                                 │
│  Question 1/2                                   Score : 0/0     │
│                                                                 │
│  ──────────────────────────────────────────────────────────     │
│                                                                 │
│  [Énoncé de la question]                                        │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐    │
│  │  ○  Choix A                                            │    │
│  └────────────────────────────────────────────────────────┘    │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐    │
│  │  ○  Choix B                                            │    │
│  └────────────────────────────────────────────────────────┘    │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐    │
│  │  ○  Choix C                                            │    │
│  └────────────────────────────────────────────────────────┘    │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐    │
│  │  ○  Choix D                                            │    │
│  └────────────────────────────────────────────────────────┘    │
│                                                                 │
│  ──────────────────────────────────────────────────────────     │
│                                                                 │
│  ⟳ Recommencer                              [ Valider ]        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

> 🎮 **Fonctionnalités clés** :
> - QCM interactif avec sélection unique (radio buttons)
> - Validation de réponse avec feedback visuel immédiat (vert/rouge)
> - Score calculé en temps réel
> - Navigation entre questions
> - Bouton Recommencer pour reset complet

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `DialogHeader` | `@/components/ui/dialog` | Header avec titre + badge |
| `DialogContent` | `@/components/ui/dialog` | Zone contenu |
| `Badge` | `@/components/ui/badge` | "Quiz" (violet/mauve) |
| `Button` | `@/components/ui/button` | Boutons "Valider", "Suivant", "Recommencer", × |
| `RadioGroup` | `@/components/ui/radio-group` | Groupe de choix de réponses |
| `RadioGroupItem` | `@/components/ui/radio-group` | Bouton radio individuel |
| `Label` | `@/components/ui/label` | Labels pour les choix |
| `Progress` | `@/components/ui/progress` | Barre de progression (optionnel) |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/courses/[id]/cards/[cardId]` | Détail carte quiz | - |
| `POST` | `/api/student/courses/[id]/cards/[cardId]/submit` | Soumettre réponse | `{ questionId, answerId }` |
| `POST` | `/api/student/courses/[id]/cards/[cardId]/complete` | Terminer quiz | `{ score, answers }` |

---

## 💾 Types & Interfaces

```typescript
interface QuizCardModal {
  id: string;
  type: 'QUIZ';
  title: string;
  questions: QuizQuestion[];
  totalQuestions: number;
  passingScore: number;        // Score minimum pour réussir (ex: 50%)
  source: 'COURSE' | 'SUPPLEMENT';
  isCompleted?: boolean;
  userScore?: number;
}

interface QuizQuestion {
  id: string;
  questionNumber: number;       // Position (1, 2, 3...)
  text: string;                 // Énoncé de la question
  choices: QuizChoice[];        // 4 choix de réponses
  correctAnswerId: string;      // ID de la bonne réponse
  explanation?: string;         // Explication après validation
  points: number;               // Points attribués (ex: 1)
}

interface QuizChoice {
  id: string;
  text: string;                 // Texte du choix
  isCorrect: boolean;           // true si bonne réponse
}

interface QuizState {
  currentQuestionIndex: number;
  selectedAnswer: string | null;
  answers: Record<string, string>;  // questionId -> answerId
  score: number;
  isSubmitted: boolean;
  showFeedback: boolean;
}
```

---

## 📋 Structure de la Modale

### Header Modale
| Élément | Description |
|---------|-------------|
| **❓ Icône** | Icône question |
| **Titre** | "Carte quiz" |
| **Badge** | "Quiz" (violet/mauve #9C27B0, uppercase) |
| **Bouton ×** | Fermer la modale |

### Indicateurs Progression
| Élément | Description | Position |
|---------|-------------|----------|
| **Question X/Y** | "Question 1/2", "Question 2/2" | En haut à gauche |
| **Score** | "Score : X/Y" (ex: "0/0", "1/2") | En haut à droite |

### Question
| Élément | Description |
|---------|-------------|
| **Énoncé** | Texte de la question (gras, 16px) |
| **Choix de réponses** | 4 boutons radio avec labels |
| **Radio Button** | Cercle vide (○) → Cercle rempli (●) si sélectionné |

### Actions (Footer)
| Bouton | État | Action |
|--------|------|--------|
| **⟳ Recommencer** | Toujours visible | Reset quiz, retour question 1, score 0 |
| **Valider** | Actif si réponse sélectionnée | Valide la réponse, affiche feedback |
| **Suivant** | Après validation | Passe à la question suivante |
| **Terminer** | Dernière question validée | Ferme modale, enregistre score |

---

## ⚙️ États & Logique

### Cycle de Vie d'une Question

```typescript
// 1. SÉLECTION
const [selectedAnswer, setSelectedAnswer] = useState<string | null>(null);

// 2. VALIDATION
const handleValidate = () => {
  const isCorrect = selectedAnswer === currentQuestion.correctAnswerId;
  
  if (isCorrect) {
    setScore(score + currentQuestion.points);
  }
  
  setShowFeedback(true);
  setIsSubmitted(true);
};

// 3. FEEDBACK VISUEL
// ✅ Bonne réponse → Bordure verte + icône ✓
// ❌ Mauvaise réponse → Bordure rouge + icône ✗
// Bonne réponse affichée en vert

// 4. NAVIGATION
const handleNext = () => {
  if (currentQuestionIndex < questions.length - 1) {
    setCurrentQuestionIndex(currentQuestionIndex + 1);
    setSelectedAnswer(null);
    setShowFeedback(false);
    setIsSubmitted(false);
  } else {
    handleComplete();
  }
};
```

### Calcul du Score

```typescript
const calculateScore = () => {
  const correctAnswers = Object.entries(answers).filter(
    ([questionId, answerId]) => {
      const question = questions.find(q => q.id === questionId);
      return question?.correctAnswerId === answerId;
    }
  ).length;
  
  return {
    score: correctAnswers,
    total: questions.length,
    percentage: Math.round((correctAnswers / questions.length) * 100)
  };
};

// Score affiché : "Score : 1/2" ou "Score : 2/2"
```

### Recommencer Quiz

```typescript
const handleRestart = () => {
  setCurrentQuestionIndex(0);
  setSelectedAnswer(null);
  setAnswers({});
  setScore(0);
  setIsSubmitted(false);
  setShowFeedback(false);
};
```

---

## 🎨 Spécifications Visuelles

### Couleurs
| Élément | Couleur |
|---------|---------|
| Badge "Quiz" | Violet/Mauve #9C27B0 (fond clair #F3E5F5) |
| Titre | Noir #1A1A1A |
| Énoncé | Gris foncé #333333 |
| Progression | Gris moyen #666666 |
| Choix non sélectionné | Bordure #E0E0E0, fond blanc #FFFFFF |
| Choix sélectionné | Bordure bleu #2196F3 |
| **Feedback correct** | Bordure verte #4CAF50, fond vert clair #E8F5E9 |
| **Feedback incorrect** | Bordure rouge #F44336, fond rouge clair #FFEBEE |
| Bouton "Valider" | Bleu #2196F3 (actif) / Gris #CCCCCC (disabled) |

### Typographie
| Élément | Style |
|---------|-------|
| Badge | Uppercase, bold, 12px |
| Titre | Semi-bold, 18px |
| Progression | Regular, 14px |
| Énoncé | Medium, 16px |
| Choix de réponses | Regular, 14px |
| Boutons | Medium, 14px |

### Espacement
- Padding modale : 24px
- Gap entre choix : 12px
- Énoncé → Choix : 16px
- Hauteur choix : 48px (padding 12px vertical)

---

## 🔄 Comportements Interactifs

### Sélection Réponse
1. Clic sur un choix → Radio button se remplit (●)
2. Ancien choix se désélectionne automatiquement
3. Bouton "Valider" devient actif (bleu)

### Validation
1. Clic sur "Valider"
2. **Si correct** :
   - Choix sélectionné → bordure verte + ✓
   - Score +1 (ex: "Score : 0/0" → "Score : 1/2")
3. **Si incorrect** :
   - Choix sélectionné → bordure rouge + ✗
   - Bonne réponse → bordure verte + ✓
   - Score inchangé
4. Bouton "Valider" → remplacé par "Suivant" (ou "Terminer" si dernière question)

### Navigation
- **Suivant** : Passe à la question suivante, reset sélection
- **Terminer** : Ferme modale, enregistre résultat, marque carte comme terminée
- **Recommencer** : Reset complet du quiz

### Ouverture/Fermeture Modale
- Ouverture : Animation fade + scale
- Fermeture : Clic ×, Escape, overlay
- ⚠️ Si quiz en cours → Confirmation "Voulez-vous quitter sans terminer ?" (optionnel V2)

---

## ♿ Accessibilité

| Feature | Implémentation |
|---------|----------------|
| **Focus trap** | Dialog confine focus à la modale |
| **Keyboard nav** | Tab entre choix, Space/Enter pour sélectionner |
| **Escape** | Ferme la modale (avec confirmation si en cours) |
| **ARIA labels** | `aria-label="Question 1 sur 2"` |
| **Radio group** | `role="radiogroup"` avec labels associés |
| **Feedback** | `aria-live="polite"` pour annonces score |
| **Contraste** | AAA pour texte et boutons |

---

## 📝 Structure de Données (Exemple)

```json
{
  "id": "card-quiz-456",
  "type": "QUIZ",
  "title": "Carte quiz",
  "totalQuestions": 2,
  "passingScore": 50,
  "questions": [
    {
      "id": "q1",
      "questionNumber": 1,
      "text": "[Énoncé question 1]",
      "choices": [
        { "id": "c1", "text": "Choix A", "isCorrect": false },
        { "id": "c2", "text": "Choix B", "isCorrect": false },
        { "id": "c3", "text": "Choix C", "isCorrect": true },
        { "id": "c4", "text": "Choix D", "isCorrect": false }
      ],
      "correctAnswerId": "c3",
      "explanation": "[Explication optionnelle]",
      "points": 1
    },
    {
      "id": "q2",
      "questionNumber": 2,
      "text": "[Énoncé question 2]",
      "choices": [
        { "id": "c1", "text": "Choix A", "isCorrect": false },
        { "id": "c2", "text": "Choix B", "isCorrect": true },
        { "id": "c3", "text": "Choix C", "isCorrect": false },
        { "id": "c4", "text": "Choix D", "isCorrect": false }
      ],
      "correctAnswerId": "c2",
      "points": 1
    }
  ],
  "source": "COURSE",
  "isCompleted": false,
  "userScore": 0
}
```

**Points clés** :
- Chaque question a exactement 4 choix
- Un seul `isCorrect: true` par question
- `correctAnswerId` doit matcher l'id du choix correct
- `explanation` est optionnelle (affichée après validation en V2)

---

## 🚀 Variantes Futures (Hors Scope V1)

| Variante | Description |
|----------|-------------|
| **QCM multiple** | Plusieurs bonnes réponses (checkboxes au lieu de radio) |
| **Vrai/Faux** | Format binaire avec justification |
| **Questions ouvertes** | Input texte au lieu de QCM |
| **Timer** | Compte à rebours par question |
| **Explication** | Affichage explication après validation |
| **Review final** | Page récap avec toutes les questions + réponses |
| **Tentatives** | Limiter le nombre d'essais (ex: 3 max) |
| **Shuffle** | Ordre aléatoire des questions/choix |

---

## ✅ Checklist Développement

- [ ] Dialog modal avec overlay
- [ ] Badge "Quiz" violet
- [ ] Affichage progression "Question X/Y"
- [ ] Affichage score "Score : X/Y"
- [ ] RadioGroup pour choix de réponses
- [ ] Logique sélection réponse
- [ ] Bouton "Valider" (actif/disabled selon sélection)
- [ ] Feedback visuel correct/incorrect
- [ ] Mise à jour score en temps réel
- [ ] Bouton "Suivant" après validation
- [ ] Bouton "Terminer" sur dernière question
- [ ] Bouton "Recommencer" (reset complet)
- [ ] Bouton fermer (×)
- [ ] Gestion Escape key
- [ ] Focus trap
- [ ] Enregistrement résultats API
- [ ] Tests unitaires (render, logique validation, score)
- [ ] Tests accessibilité (aria, keyboard nav, radio groups)