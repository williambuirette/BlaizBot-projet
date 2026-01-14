# Phase 22 — AI : Artefacts interactifs

> Quiz, exercices et fiches de cours interactifs dans le chat IA

---

## Vue d'ensemble

| Fichiers | Rôle |
|----------|------|
| `src/app/api/ai/generate-artifact/route.ts` | Génération artifacts (quiz/exercise/lesson) |
| `src/app/api/ai/artifacts/save/route.ts` | Sauvegarde artifact → StudentCard |
| `src/components/features/ai-chat/ArtifactBubble.tsx` | Container artifact dans chat |
| `src/components/features/ai-chat/artifacts/QuizArtifact.tsx` | Quiz interactif QCM |
| `src/components/features/ai-chat/artifacts/ExerciseArtifact.tsx` | Exercice avec réponses libres |
| `src/components/features/ai-chat/artifacts/LessonArtifact.tsx` | Fiche de cours |
| `src/lib/ai/artifact-prompts.ts` | Prompts JSON stricts par type |
| `src/lib/validators/artifact.ts` | Schémas Zod de validation |
| `src/types/artifact.ts` | Types TypeScript |

**Concept** : L'IA génère des contenus interactifs (quiz, exercices, fiches) affichés dans des "bulles" dans le chat. L'élève peut interagir (répondre, voir solutions, sauvegarder).

---

## Tâche 22.1 — API generate-artifact (génération artifacts)

### Contexte
Pendant une conversation IA, l'assistant peut générer des quiz, exercices ou fiches de cours. Ces contenus sont appelés "artifacts" et sont affichés dans des composants interactifs.

### Description
Créer l'API POST /api/ai/generate-artifact qui génère un artifact selon le type demandé (quiz, exercise, lesson).

### Prompt
```
Crée l'API de génération d'artifacts interactifs.

FICHIER : src/app/api/ai/generate-artifact/route.ts

IMPORTS :
import { NextRequest, NextResponse } from 'next/server';
import { auth } from '@/lib/auth';
import { chatWithGemini, SYSTEM_PROMPTS, GeminiMessage } from '@/lib/ai/gemini';
import { ARTIFACT_PROMPTS } from '@/lib/ai/artifact-prompts';
import { ArtifactSchema } from '@/lib/validators/artifact';

TYPES :

interface GenerateArtifactRequest {
  type: 'quiz' | 'exercise' | 'lesson';
  subject?: string;
  topic: string;
  level?: 'elementary' | 'middle' | 'high' | 'university';
  context?: string;
}

HELPERS :

function mapLevelToFrench(level: string): string {
  const map: Record<string, string> = {
    elementary: 'Primaire (CM1-CM2)',
    middle: 'Collège (6e-3e)',
    high: 'Lycée (2nde-Tle)',
    university: 'Université',
  };
  return map[level] || 'Lycée';
}

function extractJSON(text: string): string {
  // Extraire le JSON même s'il y a du texte autour
  const jsonMatch = text.match(/\{[\s\S]*\}/);
  if (jsonMatch) {
    return jsonMatch[0];
  }
  return text;
}

ENDPOINT POST :

export async function POST(request: NextRequest) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json(
        { success: false, error: 'Non autorisé' },
        { status: 401 }
      );
    }

    const body: GenerateArtifactRequest = await request.json();
    const { type, subject, topic, level = 'high', context } = body;

    // Validation
    if (!type || !topic || !['quiz', 'exercise', 'lesson'].includes(type)) {
      return NextResponse.json(
        { success: false, error: 'Paramètres manquants ou invalides' },
        { status: 400 }
      );
    }

    // Construire le prompt utilisateur
    let userPrompt = `${ARTIFACT_PROMPTS[type]}\n\n`;
    userPrompt += `Sujet: ${topic}\n`;
    if (subject) userPrompt += `Matière: ${subject}\n`;
    userPrompt += `Niveau: ${mapLevelToFrench(level)}\n`;
    if (context) userPrompt += `Contexte: ${context}\n`;

    // Appeler Gemini
    const messages: GeminiMessage[] = [
      { role: 'user', content: userPrompt }
    ];

    const response = await chatWithGemini(messages, {
      systemPrompt: SYSTEM_PROMPTS.coach,
    });

    // Parser le JSON
    try {
      const jsonString = extractJSON(response);
      const artifact = JSON.parse(jsonString);
      
      // Valider avec Zod
      const validated = ArtifactSchema.parse(artifact);

      // Ajouter ID et timestamps
      const finalArtifact = {
        id: `artifact_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`,
        ...validated,
        createdAt: new Date().toISOString(),
      };

      return NextResponse.json({
        success: true,
        data: finalArtifact,
      });
    } catch (parseError) {
      console.error('Erreur parsing artifact:', parseError, response);
      return NextResponse.json(
        { 
          success: false, 
          error: 'La génération n\'a pas produit un format valide. Réessaie.' 
        },
        { status: 400 }
      );
    }
  } catch (error) {
    console.error('Erreur generation artifact:', error);
    return NextResponse.json(
      { success: false, error: 'Erreur serveur' },
      { status: 500 }
    );
  }
}

NOTES :
- Utilise ARTIFACT_PROMPTS (src/lib/ai/artifact-prompts.ts) pour les prompts stricts
- extractJSON gère les cas où Gemini retourne du texte avant/après le JSON
- Validation Zod stricte pour garantir le format
- ID unique généré côté serveur
```

---

## Tâche 22.2 — Prompts artifacts (artifact-prompts.ts)

### Contexte
Chaque type d'artifact (quiz, exercise, lesson) nécessite un prompt JSON strict pour forcer Gemini à retourner le bon format.

### Description
Créer le fichier src/lib/ai/artifact-prompts.ts avec les prompts optimisés par type.

### Prompt
```
Crée le fichier de prompts stricts pour artifacts.

FICHIER : src/lib/ai/artifact-prompts.ts

export const ARTIFACT_PROMPTS = {
  quiz: `Tu dois générer un quiz pédagogique au format JSON STRICT.
Retourne UNIQUEMENT du JSON valide, sans texte avant ou après.

Format JSON:
{
  "type": "quiz",
  "title": "Titre du quiz",
  "description": "Brève description",
  "content": {
    "questions": [
      {
        "id": "q1",
        "question": "Question ?",
        "options": ["Option A", "Option B", "Option C", "Option D"],
        "correctAnswers": [0],
        "explanation": "Explication détaillée de la bonne réponse"
      }
    ],
    "shuffleQuestions": false,
    "shuffleOptions": false,
    "showExplanation": true
  }
}

RÈGLES:
- Minimum 3 questions, maximum 10
- Chaque question doit avoir 2-4 options
- correctAnswers est un tableau (peut contenir plusieurs indices pour QCM multi-réponses)
- L'explication doit être pédagogique
- Utilise la langue française
- Adapte la difficulté au niveau scolaire demandé`,

  exercise: `Tu dois générer un exercice pédagogique au format JSON STRICT.
Retourne UNIQUEMENT du JSON valide, sans texte avant ou après.

Format JSON:
{
  "type": "exercise",
  "title": "Titre de l'exercice",
  "description": "Contexte ou matière",
  "content": {
    "instructions": "Instructions générales de l'exercice",
    "items": [
      {
        "id": "ex1",
        "question": "Question ou énoncé du problème",
        "answer": "Réponse détaillée et corrigé",
        "points": 2,
        "hint": "Indice pour aider l'élève"
      }
    ],
    "totalPoints": 10,
    "timeLimit": 15
  }
}

RÈGLES:
- Minimum 1 item, maximum 10
- Chaque item a une question et une réponse
- points est optionnel (par défaut 1)
- hint est optionnel mais recommandé
- timeLimit en minutes (optionnel)
- Adapte au niveau scolaire demandé`,

  lesson: `Tu dois générer une fiche de cours pédagogique au format JSON STRICT.
Retourne UNIQUEMENT du JSON valide, sans texte avant ou après.

Format JSON:
{
  "type": "lesson",
  "title": "Titre de la fiche",
  "description": "Résumé ou sujet",
  "content": {
    "title": "Titre principal",
    "sections": [
      {
        "title": "Titre de section",
        "content": "Contenu pédagogique et clair",
        "examples": ["Exemple 1", "Exemple 2"]
      }
    ]
  }
}

RÈGLES:
- Minimum 2 sections, maximum 6
- Chaque section doit être claire et structurée
- Ajoute des exemples pertinents
- Utilise un langage accessible
- Adapte la profondeur au niveau scolaire`,
};

NOTES :
- "JSON STRICT" force Gemini à ne retourner QUE du JSON
- Format aligné avec QuizEditor/ExerciseEditor (professeur)
- correctAnswers en tableau pour supporter multi-réponses
- instructions remplace description+problem (alignment)
```

---

## Tâche 22.3 — Validation Zod (artifact.ts validators)

### Contexte
Le JSON retourné par Gemini doit être validé avec Zod pour garantir la cohérence avec les types TypeScript.

### Description
Créer le fichier src/lib/validators/artifact.ts avec les schémas Zod.

### Prompt
```
Crée les schémas Zod de validation d'artifacts.

FICHIER : src/lib/validators/artifact.ts

IMPORTS :
import { z } from 'zod';

SCHÉMAS :

// QUIZ
export const QuizQuestionSchema = z.object({
  id: z.string(),
  question: z.string(),
  options: z.array(z.string()).min(2).max(6),
  correctAnswers: z.array(z.number().min(0)),
  explanation: z.string().optional(),
});

export const QuizContentSchema = z.object({
  questions: z.array(QuizQuestionSchema).min(1).max(10),
  shuffleQuestions: z.boolean().optional(),
  shuffleOptions: z.boolean().optional(),
  showExplanation: z.boolean().optional(),
});

// EXERCISE
export const ExerciseItemSchema = z.object({
  id: z.string(),
  question: z.string(),
  answer: z.string(),
  points: z.number().optional(),
  hint: z.string().optional(),
});

export const ExerciseContentSchema = z.object({
  instructions: z.string(),
  items: z.array(ExerciseItemSchema).min(1).max(20),
  totalPoints: z.number().optional(),
  timeLimit: z.number().optional(),
});

// LESSON
export const LessonSectionSchema = z.object({
  title: z.string(),
  content: z.string(),
  examples: z.array(z.string()).optional(),
});

export const LessonContentSchema = z.object({
  title: z.string(),
  sections: z.array(LessonSectionSchema).min(1),
});

// UNION
export const ArtifactSchema = z.union([
  z.object({
    type: z.literal('quiz'),
    title: z.string(),
    description: z.string().optional(),
    content: QuizContentSchema,
  }),
  z.object({
    type: z.literal('exercise'),
    title: z.string(),
    description: z.string().optional(),
    content: ExerciseContentSchema,
  }),
  z.object({
    type: z.literal('lesson'),
    title: z.string(),
    description: z.string().optional(),
    content: LessonContentSchema,
  }),
]);

export type Artifact = z.infer<typeof ArtifactSchema>;

NOTES :
- Union Zod pour discriminer les types (quiz | exercise | lesson)
- Aligné avec les structures professeur (QuizEditor, ExerciseEditor)
- correctAnswers en tableau (multi-réponses)
- instructions unifié pour exercises
```

---

## Tâche 22.4 — Composant ArtifactBubble (container)

### Contexte
Les artifacts sont affichés dans le chat comme des "bulles" enrichies. Le composant ArtifactBubble affiche l'artifact selon son type et gère les actions (agrandir, sauvegarder).

### Description
Créer le composant ArtifactBubble qui contient les artifacts dans le chat.

### Prompt
```
Crée le composant ArtifactBubble (container d'artifacts dans le chat).

FICHIER : src/components/features/ai-chat/ArtifactBubble.tsx

IMPORTS :
'use client';
import { useState } from 'react';
import { cn } from '@/lib/utils';
import { Button } from '@/components/ui/button';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Maximize2, FileQuestion, BookOpen, GraduationCap, FolderPlus, StickyNote, Video } from 'lucide-react';
import type { ArtifactData, ArtifactType, QuizContent, ExerciseContent, LessonContent } from '@/types/artifact';
import { QuizArtifact } from './artifacts/QuizArtifact';
import { ExerciseArtifact } from './artifacts/ExerciseArtifact';
import { LessonArtifact } from './artifacts/LessonArtifact';

INTERFACE :

interface ArtifactBubbleProps {
  artifact: ArtifactData;
  onSave?: () => void;
  onAssignToCourse?: () => void;
  showActions?: boolean;
}

METADATA :

const ARTIFACT_META: Record<ArtifactType, { 
  icon: React.ElementType; 
  label: string;
  gradient: string;
}> = {
  quiz: { 
    icon: FileQuestion, 
    label: 'Quiz', 
    gradient: 'from-blue-500 to-indigo-500' 
  },
  exercise: { 
    icon: GraduationCap, 
    label: 'Exercice', 
    gradient: 'from-amber-500 to-orange-500' 
  },
  lesson: { 
    icon: BookOpen, 
    label: 'Fiche', 
    gradient: 'from-purple-500 to-pink-50' 
  },
  note: { 
    icon: StickyNote, 
    label: 'Note', 
    gradient: 'from-green-500 to-teal-500' 
  },
  video: { 
    icon: Video, 
    label: 'Vidéo', 
    gradient: 'from-red-500 to-rose-500' 
  },
};

COMPOSANT :

export function ArtifactBubble({ 
  artifact, 
  onSave, 
  onAssignToCourse,
  showActions = false 
}: ArtifactBubbleProps) {
  const [expanded, setExpanded] = useState(false);
  const meta = ARTIFACT_META[artifact.type];
  const Icon = meta.icon;

  const renderContent = () => {
    switch (artifact.type) {
      case 'quiz':
        return <QuizArtifact content={artifact.content as QuizContent} onSave={onSave} />;
      case 'exercise':
        return <ExerciseArtifact content={artifact.content as ExerciseContent} onSave={onSave} />;
      case 'lesson':
        return <LessonArtifact content={artifact.content as LessonContent} onSave={onSave} />;
      default:
        return (
          <div className="p-4 text-sm text-muted-foreground">
            Type d&apos;artifact non supporté : {artifact.type}
          </div>
        );
    }
  };

  return (
    <>
      {/* Compact Preview */}
      <div className="my-2 rounded-lg border border-border overflow-hidden">
        {/* Header avec gradient selon type */}
        <div className={cn(
          'flex items-center justify-between p-2 text-white bg-gradient-to-r',
          meta.gradient
        )}>
          <div className="flex items-center gap-2">
            <Icon className="h-4 w-4" />
            <span className="text-sm font-medium">{meta.label}</span>
          </div>
          <Button
            variant="ghost"
            size="sm"
            className="h-6 w-6 p-0 hover:bg-white/20 text-white"
            onClick={() => setExpanded(true)}
          >
            <Maximize2 className="h-4 w-4" />
          </Button>
        </div>

        {/* Content Preview (max 300px) */}
        <div className="max-h-[300px] overflow-auto">
          {renderContent()}
        </div>

        {/* Actions (optionnel pour profs) */}
        {showActions && onAssignToCourse && (
          <div className="flex items-center justify-end gap-2 p-2 border-t bg-muted/30">
            <Button
              variant="outline"
              size="sm"
              onClick={onAssignToCourse}
              className="gap-2"
            >
              <FolderPlus className="h-4 w-4" />
              <span>Attribuer à un cours</span>
            </Button>
          </div>
        )}
      </div>

      {/* Expanded Dialog */}
      <Dialog open={expanded} onOpenChange={setExpanded}>
        <DialogContent className="max-w-2xl max-h-[90vh] overflow-auto">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              <Icon className="h-5 w-5" />
              {meta.label}
            </DialogTitle>
          </DialogHeader>
          {renderContent()}
        </DialogContent>
      </Dialog>
    </>
  );
}

NOTES :
- Affichage compact (max 300px) + modale agrandie
- Gradients différents par type (blue=quiz, amber=exercise, purple=lesson)
- renderContent() délègue au composant spécialisé
- showActions pour les profs (attribuer à un cours)
```

---

## Tâche 22.5 — QuizArtifact (quiz interactif)

### Contexte
Le composant QuizArtifact affiche un quiz QCM interactif : l'élève répond aux questions, valide, voit les explications, puis obtient un score final.

### Description
Créer le composant QuizArtifact avec validation question par question.

### Prompt
```
Crée le composant QuizArtifact (quiz QCM interactif).

FICHIER : src/components/features/ai-chat/artifacts/QuizArtifact.tsx

IMPORTS :
'use client';
import { useState } from 'react';
import { cn } from '@/lib/utils';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group';
import { Label } from '@/components/ui/label';
import { RotateCcw, Check, X, CheckCircle } from 'lucide-react';
import type { QuizContent, QuizState } from '@/types/artifact';

INTERFACE :

interface QuizArtifactProps {
  content: QuizContent;
  onSave?: () => void;
}

COMPOSANT :

export function QuizArtifact({ content, onSave }: QuizArtifactProps) {
  const [state, setState] = useState<QuizState>({
    currentQuestion: 0,
    answers: Array(content.questions.length).fill(null),
    showResults: false,
    score: undefined,
  });
  const [validated, setValidated] = useState(false);

  const question = content.questions[state.currentQuestion];
  if (!question) return null;

  const userAnswer = state.answers[state.currentQuestion];
  const isCorrect = userAnswer !== null && question.correctAnswers.includes(userAnswer);

  const handleAnswerChange = (value: string) => {
    if (validated) return; // Bloque après validation
    setState(prev => ({
      ...prev,
      answers: prev.answers.map((a, i) =>
        i === prev.currentQuestion ? parseInt(value) : a
      ),
    }));
  };

  const handleValidate = () => {
    if (userAnswer === null) return;
    setValidated(true);
  };

  const handleNext = () => {
    if (state.currentQuestion < content.questions.length - 1) {
      setState(prev => ({
        ...prev,
        currentQuestion: prev.currentQuestion + 1,
      }));
      setValidated(false);
    } else {
      const score = state.answers.filter((answer, idx) =>
        answer !== null && content.questions[idx]?.correctAnswers.includes(answer)
      ).length;
      setState(prev => ({ ...prev, showResults: true, score }));
    }
  };

  const handleReset = () => {
    setState({
      currentQuestion: 0,
      answers: Array(content.questions.length).fill(null),
      showResults: false,
      score: undefined,
    });
    setValidated(false);
  };

  // Écran résultats
  if (state.showResults && state.score !== undefined) {
    const percentage = Math.round((state.score / content.questions.length) * 100);
    return (
      <div className="bg-gradient-to-br from-blue-50 to-indigo-50 dark:from-blue-950 dark:to-indigo-950 rounded-lg p-4">
        <h3 className="font-semibold mb-4">Résultats</h3>
        <div className="text-center mb-6">
          <div className="text-4xl font-bold text-primary mb-2">
            {state.score}/{content.questions.length}
          </div>
          <p className="text-sm text-muted-foreground">{percentage}% de réussite</p>
        </div>
        <div className="space-y-2 mb-4">
          {content.questions.map((q, idx) => {
            const correct = state.answers[idx] !== null && q.correctAnswers.includes(state.answers[idx]!);
            return (
              <div key={q.id} className={cn(
                'flex items-center gap-2 p-2 rounded text-sm',
                correct ? 'bg-green-50 dark:bg-green-950' : 'bg-red-50 dark:bg-red-950'
              )}>
                {correct ? <Check className="h-4 w-4 text-green-600" /> : <X className="h-4 w-4 text-red-600" />}
                <span className="flex-1 truncate">Question {idx + 1}</span>
              </div>
            );
          })}
        </div>
        <div className="flex gap-2">
          <Button onClick={handleReset} variant="outline" size="sm" className="flex-1">
            <RotateCcw className="h-4 w-4 mr-2" />
            Recommencer
          </Button>
          {onSave && <Button onClick={onSave} size="sm" className="flex-1">Sauvegarder</Button>}
        </div>
      </div>
    );
  }

  // Question en cours
  return (
    <div className="bg-gradient-to-br from-blue-50 to-indigo-50 dark:from-blue-950 dark:to-indigo-950 rounded-lg p-4 space-y-4">
      <div className="flex items-center justify-between">
        <span className="text-sm font-medium">Question {state.currentQuestion + 1}/{content.questions.length}</span>
        <Badge variant="secondary">{Math.round(((state.currentQuestion + 1) / content.questions.length) * 100)}%</Badge>
      </div>
      <div className="h-1 bg-secondary rounded-full overflow-hidden">
        <div className="h-full bg-primary transition-all" style={{ width: `${((state.currentQuestion + 1) / content.questions.length) * 100}%` }} />
      </div>
      <div>
        <p className="font-medium mb-4">{question.question}</p>
        <RadioGroup 
          value={userAnswer !== null ? String(userAnswer) : ''} 
          onValueChange={handleAnswerChange}
          disabled={validated}
        >
          <div className="space-y-2">
            {question.options.map((option, idx) => {
              const isOptionCorrect = question.correctAnswers.includes(idx);
              const isSelected = userAnswer === idx;
              
              return (
                <div 
                  key={idx} 
                  className={cn(
                    'flex items-center space-x-2 p-2 rounded-md transition-colors',
                    validated && isOptionCorrect && 'bg-green-100 dark:bg-green-900/30',
                    validated && isSelected && !isOptionCorrect && 'bg-red-100 dark:bg-red-900/30',
                    !validated && 'hover:bg-muted/50'
                  )}
                >
                  <RadioGroupItem value={String(idx)} id={`q${state.currentQuestion}-opt${idx}`} />
                  <Label 
                    htmlFor={`q${state.currentQuestion}-opt${idx}`} 
                    className={cn(
                      'cursor-pointer flex-1',
                      validated && isOptionCorrect && 'text-green-700 dark:text-green-300 font-medium',
                      validated && isSelected && !isOptionCorrect && 'text-red-700 dark:text-red-300'
                    )}
                  >
                    {option}
                  </Label>
                  {validated && isOptionCorrect && <Check className="h-4 w-4 text-green-600" />}
                  {validated && isSelected && !isOptionCorrect && <X className="h-4 w-4 text-red-600" />}
                </div>
              );
            })}
          </div>
        </RadioGroup>
      </div>
      
      {/* Feedback après validation */}
      {validated && (
        <div className={cn('p-3 rounded text-sm', isCorrect ? 'bg-green-100 dark:bg-green-900/30' : 'bg-orange-100 dark:bg-orange-900/30')}>
          {isCorrect ? (
            <p className="font-medium flex items-center gap-2">
              <CheckCircle className="h-4 w-4 text-green-600" />
              Correct !
            </p>
          ) : (
            <>
              <p className="font-medium mb-1">Pas tout à fait...</p>
              {question.explanation && <p className="text-xs">{question.explanation}</p>}
            </>
          )}
        </div>
      )}
      
      {/* Boutons : Valider puis Suivant */}
      <div className="flex gap-2">
        {!validated ? (
          <Button 
            onClick={handleValidate} 
            disabled={userAnswer === null} 
            className="flex-1" 
            size="sm"
          >
            <CheckCircle className="h-4 w-4 mr-2" />
            Valider
          </Button>
        ) : (
          <Button onClick={handleNext} className="flex-1" size="sm">
            {state.currentQuestion === content.questions.length - 1 ? 'Voir les résultats' : 'Suivant'}
          </Button>
        )}
      </div>
    </div>
  );
}

NOTES :
- Validation question par question (bouton "Valider" puis "Suivant")
- Feedback immédiat avec explication
- Couleurs : vert = correct, rouge = faux
- Score final avec récapitulatif
- Bouton "Recommencer" pour refaire le quiz
```

---

## Tâche 22.6 — ExerciseArtifact (exercice interactif)

### Contexte
Le composant ExerciseArtifact affiche un exercice avec réponses libres. L'élève peut voir des indices, soumettre ses réponses, puis afficher les solutions.

### Description
Créer le composant ExerciseArtifact avec réponses libres et indices.

### Prompt
```
Crée le composant ExerciseArtifact (exercice avec réponses libres).

FICHIER : src/components/features/ai-chat/artifacts/ExerciseArtifact.tsx

IMPORTS :
'use client';
import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Textarea } from '@/components/ui/textarea';
import { Lightbulb, Eye, Zap, Clock, Award, Send } from 'lucide-react';
import type { ExerciseContent, ExerciseState } from '@/types/artifact';

INTERFACE :

interface ExerciseArtifactProps {
  content: ExerciseContent;
  onSave?: () => void;
}

COMPOSANT :

export function ExerciseArtifact({ content, onSave }: ExerciseArtifactProps) {
  const [state, setState] = useState<ExerciseState>({
    showHints: false,
    hintsRevealed: [],
    showSolution: false,
    userAnswers: {},
  });
  const [isSubmitted, setIsSubmitted] = useState(false);

  const updateAnswer = (itemId: string, answer: string) => {
    setState(prev => ({
      ...prev,
      userAnswers: { ...(prev.userAnswers || {}), [itemId]: answer },
    }));
  };

  const getUserAnswer = (itemId: string): string => {
    return state.userAnswers?.[itemId] || '';
  };

  const toggleHint = (itemId: string) => {
    setState(prev => {
      const idx = prev.hintsRevealed.indexOf(parseInt(itemId) || 0);
      return {
        ...prev,
        hintsRevealed: idx >= 0
          ? prev.hintsRevealed.filter((_, i) => i !== idx)
          : [...prev.hintsRevealed, content.items.findIndex(i => i.id === itemId)],
      };
    });
  };

  const answersCount = Object.keys(state.userAnswers || {}).length;
  const totalPoints = content.totalPoints || content.items.reduce((sum, item) => sum + (item.points || 1), 0);

  return (
    <div className="bg-gradient-to-br from-amber-50 to-orange-50 dark:from-amber-950 dark:to-orange-950 rounded-lg p-4 space-y-4">
      {/* Header */}
      <div className="flex items-start justify-between gap-2">
        <p className="text-sm text-muted-foreground flex-1">{content.instructions}</p>
        <div className="flex gap-2">
          {content.timeLimit && (
            <Badge variant="outline" className="gap-1">
              <Clock className="h-3 w-3" />
              {content.timeLimit} min
            </Badge>
          )}
          <Badge variant="secondary" className="gap-1">
            <Award className="h-3 w-3" />
            {totalPoints} pts
          </Badge>
        </div>
      </div>

      {/* Items */}
      <div className="space-y-4">
        {content.items.map((item, idx) => {
          const isHintRevealed = state.hintsRevealed.includes(idx);
          
          return (
            <div key={item.id} className="bg-white dark:bg-slate-900 p-3 rounded border space-y-2">
              <div className="flex items-start justify-between gap-2">
                <div className="flex gap-2">
                  <span className="font-medium text-primary">{idx + 1}.</span>
                  <p className="text-sm">{item.question}</p>
                </div>
                {item.points && (
                  <Badge variant="outline" className="text-xs shrink-0">
                    {item.points} pt{item.points > 1 ? 's' : ''}
                  </Badge>
                )}
              </div>

              {/* Indice */}
              {item.hint && !isHintRevealed && (
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => toggleHint(item.id)}
                  className="text-xs h-7"
                >
                  <Lightbulb className="h-3 w-3 mr-1" />
                  Voir l&apos;indice
                </Button>
              )}
              {item.hint && isHintRevealed && (
                <div className="bg-blue-50 dark:bg-blue-900/30 border border-blue-200 p-2 rounded text-xs">
                  <span className="font-medium">💡 Indice :</span> {item.hint}
                </div>
              )}

              {/* Zone réponse */}
              {!isSubmitted && !state.showSolution && (
                <div className="space-y-1">
                  <label className="text-xs font-medium text-muted-foreground">Ta réponse :</label>
                  <Textarea
                    value={getUserAnswer(item.id)}
                    onChange={(e) => updateAnswer(item.id, e.target.value)}
                    placeholder="Écris ta réponse ici..."
                    className="min-h-20 text-sm resize-none"
                  />
                </div>
              )}

              {/* Réponse soumise */}
              {isSubmitted && getUserAnswer(item.id) && (
                <div className="bg-slate-50 dark:bg-slate-800/50 border p-2 rounded text-xs">
                  <span className="font-medium">📝 Ta réponse :</span>
                  <p className="whitespace-pre-wrap mt-1">{getUserAnswer(item.id)}</p>
                </div>
              )}

              {/* Solution */}
              {state.showSolution && (
                <div className="bg-green-50 dark:bg-green-900/30 border border-green-200 p-2 rounded text-xs">
                  <span className="font-medium">✓ Réponse :</span>
                  <p className="whitespace-pre-wrap font-mono mt-1">{item.answer}</p>
                </div>
              )}
            </div>
          );
        })}
      </div>

      {/* Actions */}
      <div className="flex flex-col gap-2">
        {!isSubmitted && !state.showSolution && (
          <Button
            onClick={() => setIsSubmitted(true)}
            size="sm"
            className="w-full"
            disabled={answersCount === 0}
          >
            <Send className="h-4 w-4 mr-2" />
            Soumettre mes réponses
          </Button>
        )}

        <div className="flex gap-2">
          {!state.showSolution ? (
            <Button
              onClick={() => {
                setState(prev => ({ ...prev, showSolution: true }));
                setIsSubmitted(true);
              }}
              variant="outline"
              size="sm"
              className="flex-1"
            >
              <Eye className="h-4 w-4 mr-2" />
              Voir les solutions
            </Button>
          ) : (
            <Button
              onClick={() => setState(prev => ({ ...prev, showSolution: false }))}
              variant="outline"
              size="sm"
              className="flex-1"
            >
              Masquer les solutions
            </Button>
          )}
          {onSave && (
            <Button onClick={onSave} size="sm" className="flex-1">
              <Zap className="h-4 w-4 mr-2" />
              Sauvegarder
            </Button>
          )}
        </div>
      </div>
    </div>
  );
}

NOTES :
- Réponses libres (Textarea)
- Indices révélables par item
- Soumission puis affichage solutions
- Badges points et temps
- Sauvegarde optionnelle
```

---

## Tâche 22.7 — LessonArtifact (fiche de cours)

### Contexte
Le composant LessonArtifact affiche une fiche de cours structurée en sections avec exemples. L'élève peut sauvegarder la fiche dans ses notes.

### Description
Créer le composant LessonArtifact simple et lisible.

### Prompt
```
Crée le composant LessonArtifact (fiche de cours).

FICHIER : src/components/features/ai-chat/artifacts/LessonArtifact.tsx

IMPORTS :
'use client';
import type { LessonContent } from '@/types/artifact';
import { Button } from '@/components/ui/button';
import { BookOpen } from 'lucide-react';

INTERFACE :

interface LessonArtifactProps {
  content: LessonContent;
  onSave?: () => void;
}

COMPOSANT :

export function LessonArtifact({ content, onSave }: LessonArtifactProps) {
  return (
    <div className="bg-gradient-to-br from-purple-50 to-pink-50 dark:from-purple-950 dark:to-pink-950 rounded-lg p-4 space-y-4">
      <h3 className="font-semibold text-lg">{content.title}</h3>

      <div className="space-y-4">
        {content.sections.map((section, idx) => (
          <div key={idx} className="space-y-2">
            <h4 className="font-medium text-sm">{section.title}</h4>
            <p className="text-sm whitespace-pre-wrap">{section.content}</p>

            {section.examples && section.examples.length > 0 && (
              <div className="mt-2 pl-3 border-l-2 border-primary/30 space-y-1">
                <p className="text-xs font-medium text-muted-foreground">Exemples :</p>
                {section.examples.map((ex, i) => (
                  <p key={i} className="text-sm font-mono bg-white dark:bg-slate-900 p-2 rounded">
                    {ex}
                  </p>
                ))}
              </div>
            )}
          </div>
        ))}
      </div>

      {onSave && (
        <Button onClick={onSave} className="w-full" size="sm">
          <BookOpen className="h-4 w-4 mr-2" />
          Sauvegarder en fiche
        </Button>
      )}
    </div>
  );
}

NOTES :
- Affichage simple avec titre + sections
- Exemples en blocs mono (code)
- Bouton sauvegarder optionnel
- Gradient violet/rose pour distinguer des quiz/exercices
```

---

## Tâche 22.8 — API save artifact (sauvegarde en StudentCard)

### Contexte
Les élèves peuvent sauvegarder un artifact généré dans le chat vers leurs cartes personnelles (StudentCard). L'artifact est sauvegardé dans un supplément spécial "Cartes générées par IA".

### Description
Créer l'API POST /api/ai/artifacts/save pour sauvegarder un artifact.

### Prompt
```
Crée l'API de sauvegarde d'artifacts en StudentCard.

FICHIER : src/app/api/ai/artifacts/save/route.ts

IMPORTS :
import { NextRequest, NextResponse } from 'next/server';
import { auth } from '@/lib/auth';
import { prisma } from '@/lib/prisma';
import { SaveArtifactRequestSchema } from '@/lib/schemas/artifact-save';
import { artifactTypeToCardType } from '@/lib/ai/artifact-to-card';
import { StudentCardType } from '@prisma/client';

HELPERS :

function generateId(prefix: string): string {
  const timestamp = Date.now().toString(36);
  const random = Math.random().toString(36).substring(2, 8);
  return `${prefix}-${timestamp}-${random}`;
}

ENDPOINT POST :

export async function POST(request: NextRequest) {
  try {
    const session = await auth();
    if (!session?.user?.id) {
      return NextResponse.json(
        { success: false, error: 'Non autorisé' },
        { status: 401 }
      );
    }

    const body = await request.json();
    const validation = SaveArtifactRequestSchema.safeParse(body);

    if (!validation.success) {
      return NextResponse.json(
        { success: false, error: `Validation échouée: ${validation.error.message}` },
        { status: 400 }
      );
    }

    const { conversationId, artifact } = validation.data;

    // Vérifier la conversation
    const conversation = await prisma.aIConversation.findFirst({
      where: { id: conversationId, userId: session.user.id },
    });
    if (!conversation) {
      return NextResponse.json(
        { success: false, error: 'Conversation non trouvée' },
        { status: 404 }
      );
    }

    // Profil étudiant
    const studentProfile = await prisma.studentProfile.findUnique({
      where: { userId: session.user.id },
    });
    if (!studentProfile) {
      return NextResponse.json(
        { success: false, error: 'Profil étudiant non trouvé' },
        { status: 404 }
      );
    }

    // Trouver ou créer le supplément "Cartes IA"
    const AI_SUPPLEMENT_TITLE = '🤖 Cartes générées par IA';
    let supplement = await prisma.studentSupplement.findFirst({
      where: { studentId: studentProfile.id, title: AI_SUPPLEMENT_TITLE },
    });
    if (!supplement) {
      supplement = await prisma.studentSupplement.create({
        data: {
          id: generateId('supp'),
          studentId: studentProfile.id,
          title: AI_SUPPLEMENT_TITLE,
          description: 'Cartes créées automatiquement depuis le chat IA',
        },
      });
    }

    // Trouver ou créer un chapitre par type
    const chapterTitle = `${artifact.type}s`;
    let chapter = await prisma.studentChapter.findFirst({
      where: { supplementId: supplement.id, title: chapterTitle },
    });
    if (!chapter) {
      chapter = await prisma.studentChapter.create({
        data: {
          id: generateId('sch'),
          supplementId: supplement.id,
          title: chapterTitle,
          description: `Cartes de type ${artifact.type} générées par l'IA`,
        },
      });
    }

    // Anti-doublons
    const existing = await prisma.studentCard.findFirst({
      where: { chapterId: chapter.id, title: artifact.title },
    });
    if (existing) {
      return NextResponse.json(
        { success: false, error: `Vous avez déjà une carte "${artifact.title}"` },
        { status: 409 }
      );
    }

    // Mapper type artifact → StudentCardType
    const cardTypeStr = artifactTypeToCardType(artifact.type);
    const cardType = cardTypeStr as StudentCardType;

    // Créer la StudentCard
    const card = await prisma.studentCard.create({
      data: {
        id: generateId('scard'),
        chapterId: chapter.id,
        title: artifact.title,
        content: JSON.stringify(artifact.content),
        cardType: cardType,
      },
    });

    console.log(`Artifact sauvegardé: user=${session.user.id}, card=${card.id} (${card.cardType})`);

    return NextResponse.json({
      success: true,
      data: {
        cardId: card.id,
        title: card.title,
        cardType: card.cardType,
        savedAt: card.createdAt,
      },
    });
  } catch (error) {
    console.error('Erreur save artifact:', error);
    return NextResponse.json(
      { success: false, error: 'Erreur serveur' },
      { status: 500 }
    );
  }
}

HELPER artifactTypeToCardType : src/lib/ai/artifact-to-card.ts

export function artifactTypeToCardType(artifactType: string): string {
  const map: Record<string, string> = {
    quiz: 'QUIZ',
    exercise: 'EXERCISE',
    lesson: 'TEXT',
    note: 'TEXT',
  };
  return map[artifactType] || 'TEXT';
}

NOTES :
- Structure : StudentSupplement "🤖 Cartes générées par IA" → StudentChapter par type → StudentCard
- Anti-doublons par titre
- content JSON.stringify pour stocker le contenu structuré
- cardType mappé selon type artifact
```

---

## Résumé Phase 22

| Tâche | Fichier | Fonction |
|-------|---------|----------|
| 22.1 | generate-artifact/route.ts | API génération artifacts |
| 22.2 | artifact-prompts.ts | Prompts JSON stricts |
| 22.3 | validators/artifact.ts | Schémas Zod validation |
| 22.4 | ArtifactBubble.tsx | Container artifacts chat |
| 22.5 | QuizArtifact.tsx | Quiz QCM interactif |
| 22.6 | ExerciseArtifact.tsx | Exercice réponses libres |
| 22.7 | LessonArtifact.tsx | Fiche de cours |
| 22.8 | artifacts/save/route.ts | Sauvegarde → StudentCard |

**Total : 8 tâches**

**Workflow complet** :
1. **Génération** : /api/ai/generate-artifact (Gemini + prompts stricts)
2. **Affichage** : ArtifactBubble + composants spécialisés (Quiz/Exercise/Lesson)
3. **Interaction** : Élève répond, valide, voit feedback
4. **Sauvegarde** : /api/ai/artifacts/save → StudentCard dans supplément "🤖 Cartes IA"
