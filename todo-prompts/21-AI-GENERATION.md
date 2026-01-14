# Phase 21 — AI : Génération de contenu

> Génération automatique de cours, quiz, exercices, leçons, notes et correction IA.

---

## Vue d'ensemble

| Fichiers | Rôle |
|----------|------|
| `src/app/api/ai/generate-course/route.ts` | Génération cours complet (HTML) |
| `src/app/api/ai/generate-quiz/route.ts` | Génération questions quiz (JSON) |
| `src/app/api/ai/generate-exercise/route.ts` | Génération exercices + corrigés (JSON) |
| `src/app/api/ai/generate-lesson/route.ts` | Génération contenu leçon (HTML) |
| `src/app/api/ai/generate-note/route.ts` | Amélioration notes élèves (Markdown) |
| `src/app/api/ai/grade-exercise/route.ts` | Correction automatique exercices |
| `src/app/api/ai/evaluate/route.ts` | Évaluation session chat IA |

**Modèle IA** : Gemini 2.0 Flash (génération) + Claude 3.5 Sonnet (correction)

---

## Tâche 21.1 — API generate-quiz (génération quiz)

### Contexte
Les professeurs peuvent demander à l'IA de générer des questions de quiz à partir d'un sujet et d'instructions. L'IA retourne un JSON structuré avec questions, options, réponses correctes et explications.

### Description
Créer l'API POST /api/ai/generate-quiz qui utilise Gemini pour générer des questions QCM.

### Prompt
```
Crée l'API de génération de quiz automatique.

FICHIER : src/app/api/ai/generate-quiz/route.ts

IMPORTS :
import { NextRequest, NextResponse } from 'next/server';
import { auth } from '@/lib/auth';
import { geminiService } from '@/lib/ai/gemini';

TYPES :

interface QuizQuestion {
  id: string;
  question: string;
  options: string[];
  correctAnswers: number[];
  explanation?: string;
}

interface QuizResponse {
  questions: QuizQuestion[];
}

ENDPOINT POST :

export async function POST(request: NextRequest) {
  try {
    const session = await auth();
    if (!session?.user || session.user.role !== 'TEACHER') {
      return NextResponse.json({ error: 'Non autorisé' }, { status: 401 });
    }

    const { topic, prompt, count = 5 } = await request.json();

    if (!prompt?.trim()) {
      return NextResponse.json({ error: 'Prompt requis' }, { status: 400 });
    }

    // Extraire le nombre demandé depuis le prompt utilisateur
    const numberMatch = prompt.match(/(\d+)\s*(questions?|quiz)/i);
    const requestedCount = numberMatch ? parseInt(numberMatch[1], 10) : count;
    const finalCount = Math.min(Math.max(requestedCount, 1), 20); // Limiter entre 1 et 20

    const fullPrompt = `
RÔLE:
Tu es un assistant pédagogique expert en création de quiz éducatifs.

TÂCHE CRITIQUE:
Génère EXACTEMENT ${finalCount} question(s) à choix multiples en français.
⚠️ NE GÉNÈRE NI PLUS NI MOINS QUE ${finalCount} QUESTION(S).

CONTEXTE:
${topic ? `Sujet du cours : ${topic}` : 'Sujet : Général'}

INSTRUCTIONS SPÉCIFIQUES DU PROFESSEUR:
${prompt}

FORMAT DE RÉPONSE (JSON valide uniquement) :
{
  "questions": [
    {
      "id": "q-1",
      "question": "La question posée ?",
      "options": ["Option A", "Option B", "Option C", "Option D"],
      "correctAnswers": [0],
      "explanation": "Explication de la bonne réponse"
    }
  ]
}

RÈGLES STRICTES:
1. NOMBRE: Exactement ${finalCount} question(s) - c'est OBLIGATOIRE
2. OPTIONS: 4 options par question (A, B, C, D)
3. RÉPONSES: correctAnswers = indices (0-3) des bonnes réponses
4. QUALITÉ: Questions claires, niveau adapté au contexte
5. Respecte TOUTES les demandes spécifiques du professeur
`;

    const parsed = await geminiService.generateJson<QuizResponse>(fullPrompt);
    const questions: QuizQuestion[] = parsed.questions || [];

    // Valider et nettoyer les questions
    const validQuestions = questions
      .filter((q) => q.question && q.options?.length >= 2)
      .map((q, index) => ({
        id: `q-${Date.now()}-${index}`,
        question: q.question,
        options: q.options.slice(0, 6),
        correctAnswers: q.correctAnswers?.filter((i: number) => i >= 0 && i < q.options.length) || [0],
        explanation: q.explanation || undefined,
      }));

    return NextResponse.json({ questions: validQuestions });
  } catch (error) {
    console.error('Erreur génération quiz:', error);
    return NextResponse.json({ error: 'Erreur lors de la génération' }, { status: 500 });
  }
}

NOTES :
- geminiService.generateJson<T> parse automatiquement le JSON
- Extraction automatique du nombre depuis le prompt ("5 questions")
- Validation stricte : minimum 2 options, correctAnswers valides
- Limite 1-20 questions pour éviter surcharge
```

---

## Tâche 21.2 — API generate-exercise (génération exercices)

### Contexte
Les exercices ont des questions ouvertes avec réponses attendues. L'IA génère l'énoncé, la réponse attendue, les points et des indices optionnels.

### Description
Créer l'API POST /api/ai/generate-exercise pour générer des exercices avec corrigés.

### Prompt
```
Crée l'API de génération d'exercices automatique.

FICHIER : src/app/api/ai/generate-exercise/route.ts

TYPES :

interface ExerciseItem {
  id: string;
  question: string;
  answer: string;
  points?: number;
  hint?: string;
}

interface ExerciseResponse {
  instructions: string;
  items: ExerciseItem[];
}

ENDPOINT POST :

export async function POST(request: NextRequest) {
  try {
    const session = await auth();
    if (!session?.user || session.user.role !== 'TEACHER') {
      return NextResponse.json({ error: 'Non autorisé' }, { status: 401 });
    }

    const { topic, prompt, count = 5 } = await request.json();

    if (!prompt?.trim()) {
      return NextResponse.json({ error: 'Prompt requis' }, { status: 400 });
    }

    // Extraire le nombre demandé
    const numberMatch = prompt.match(/(\d+)\s*(exercices?|questions?)/i);
    const requestedCount = numberMatch ? parseInt(numberMatch[1], 10) : count;
    const finalCount = Math.min(Math.max(requestedCount, 1), 20);

    const fullPrompt = `
RÔLE:
Tu es un assistant pédagogique expert en création d'exercices éducatifs.

TÂCHE CRITIQUE:
Génère EXACTEMENT ${finalCount} exercice(s) en français avec leurs corrigés.
⚠️ NE GÉNÈRE NI PLUS NI MOINS QUE ${finalCount} EXERCICE(S).

CONTEXTE:
${topic ? `Sujet du cours : ${topic}` : 'Sujet : Général'}

INSTRUCTIONS SPÉCIFIQUES DU PROFESSEUR:
${prompt}

FORMAT DE RÉPONSE (JSON valide uniquement) :
{
  "instructions": "Consignes générales pour les exercices",
  "items": [
    {
      "id": "ex-1",
      "question": "L'énoncé de l'exercice",
      "answer": "La réponse attendue avec le développement",
      "points": 2,
      "hint": "Un indice optionnel"
    }
  ]
}

RÈGLES STRICTES:
1. NOMBRE: Exactement ${finalCount} exercice(s) - c'est OBLIGATOIRE
2. CLARTÉ: Questions claires et précises
3. CORRIGÉS: Réponses complètes avec raisonnement
4. POINTS: Reflètent la difficulté (1-5 points)
5. VARIÉTÉ: Varier les types si plusieurs exercices
6. Respecte TOUTES les demandes spécifiques du professeur
`;

    const parsed = await geminiService.generateJson<ExerciseResponse>(fullPrompt);
    
    const instructions = parsed.instructions || '';
    const items: ExerciseItem[] = parsed.items || [];

    // Valider et nettoyer
    const validItems = items
      .filter((item) => item.question && item.answer)
      .map((item, index) => ({
        id: `ex-${Date.now()}-${index}`,
        question: item.question,
        answer: item.answer,
        points: item.points || 1,
        hint: item.hint || undefined,
      }));

    return NextResponse.json({ instructions, items: validItems });
  } catch (error) {
    console.error('Erreur génération exercice:', error);
    return NextResponse.json({ error: 'Erreur lors de la génération' }, { status: 500 });
  }
}

NOTES :
- instructions = consignes générales (ex: "Résoudre les équations suivantes")
- items = liste des exercices individuels
- points par exercice pour pondération du barème
- hint optionnel pour aider les élèves
```

---

## Tâche 21.3 — API generate-lesson (génération leçon)

### Contexte
Les leçons sont du contenu HTML riche inséré dans les sections de cours. L'IA génère du HTML structuré avec titres, paragraphes, listes, citations, etc.

### Description
Créer l'API POST /api/ai/generate-lesson pour générer du contenu de leçon en HTML.

### Prompt
```
Crée l'API de génération de contenu de leçon.

FICHIER : src/app/api/ai/generate-lesson/route.ts

IMPORTS :
import { NextResponse } from 'next/server';
import { auth } from '@/lib/auth';
import { z } from 'zod';
import { chatWithGemini, GeminiMessage } from '@/lib/ai/gemini';

SCHEMA :

const generateLessonSchema = z.object({
  topic: z.string().min(1),
  prompt: z.string().min(1),
  existingContent: z.string().optional(),
  level: z.enum(['elementary', 'middle', 'high', 'university']).optional(),
});

HELPERS :

function mapLevelToFrench(level?: string): string {
  const map: Record<string, string> = {
    elementary: 'Primaire (CM1-CM2)',
    middle: 'Collège (6e-3e)',
    high: 'Lycée (2nde-Tle)',
    university: 'Université',
  };
  return map[level || 'high'] || 'Lycée';
}

ENDPOINT POST :

export async function POST(request: Request) {
  try {
    const session = await auth();

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 });
    }

    const body = await request.json();
    const validation = generateLessonSchema.safeParse(body);

    if (!validation.success) {
      return NextResponse.json(
        { error: 'Données invalides', details: validation.error.flatten() },
        { status: 400 }
      );
    }

    const { topic, prompt, existingContent, level } = validation.data;

    // Prompt système
    const systemPrompt = `Tu es un assistant pédagogique expert qui aide à créer du contenu de cours de qualité.
Tu génères du contenu HTML bien structuré pour un éditeur de texte riche.

Règles de formatage :
- Utilise des balises HTML : <h2>, <h3>, <p>, <ul>, <ol>, <li>, <strong>, <em>, <blockquote>, <code>
- Structure le contenu avec des sections claires
- Inclus des exemples concrets et des explications progressives
- Adapte le niveau au public cible : ${mapLevelToFrench(level)}
- Rends le contenu engageant, pédagogique et facile à comprendre
- N'inclus pas de balise <h1> (elle sera ajoutée par le système)

Réponds UNIQUEMENT avec le contenu HTML généré, sans commentaires ni explications supplémentaires.`;

    // Prompt utilisateur
    let userPrompt = `Sujet : ${topic}\n\nInstructions : ${prompt}`;
    
    if (existingContent?.trim()) {
      userPrompt += `\n\nContenu existant (à compléter/améliorer) :\n${existingContent}`;
    }

    // Appeler Gemini
    const messages: GeminiMessage[] = [
      { role: 'user', content: userPrompt }
    ];

    const generatedContent = await chatWithGemini(messages, { systemPrompt });

    return NextResponse.json({ 
      success: true,
      content: generatedContent 
    });

  } catch (error) {
    console.error('Erreur API generate-lesson:', error);
    return NextResponse.json(
      { error: 'Erreur lors de la génération du contenu' },
      { status: 500 }
    );
  }
}

NOTES :
- level adapte le vocabulaire et la complexité
- existingContent permet d'améliorer un contenu existant
- HTML sans <html>, <body>, <head> (pour insertion dans éditeur)
- chatWithGemini (non-streaming) car pas besoin de feedback temps réel
```

---

## Tâche 21.4 — API generate-note (amélioration notes élèves)

### Contexte
Les élèves peuvent demander à l'IA d'améliorer, résumer, développer ou réorganiser leurs notes personnelles. L'IA garde le ton naturel de l'élève tout en améliorant la clarté.

### Description
Créer l'API POST /api/ai/generate-note pour améliorer les notes d'élèves.

### Prompt
```
Crée l'API d'amélioration de notes personnelles élèves.

FICHIER : src/app/api/ai/generate-note/route.ts

SCHEMA :

const generateNoteSchema = z.object({
  title: z.string().min(1),
  currentContent: z.string().optional(),
  context: z.string().optional(),
  action: z.enum(['improve', 'summarize', 'expand', 'organize']).default('improve'),
});

ENDPOINT POST :

export async function POST(request: Request) {
  try {
    const session = await auth();

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 });
    }

    const body = await request.json();
    const validation = generateNoteSchema.safeParse(body);

    if (!validation.success) {
      return NextResponse.json(
        { error: 'Données invalides', details: validation.error.flatten() },
        { status: 400 }
      );
    }

    const { title, currentContent, context, action } = validation.data;

    // Prompts selon l'action
    const actionPrompts: Record<string, string> = {
      improve: `Améliore et enrichis ces notes en gardant le même style et les idées principales.
Corrige les erreurs, ajoute des précisions utiles et améliore la structure.`,
      summarize: `Résume ces notes de manière concise en gardant l'essentiel.
Crée une version condensée facile à réviser.`,
      expand: `Développe et complète ces notes avec plus de détails et d'exemples.
Ajoute des explications supplémentaires tout en restant pédagogique.`,
      organize: `Réorganise ces notes de manière plus structurée et claire.
Utilise des titres, des listes à puces et une hiérarchie logique.`,
    };

    const systemPrompt = `Tu es un assistant qui aide les étudiants à prendre de meilleures notes.
Tu dois ${actionPrompts[action]}

Règles :
- Garde le ton personnel et naturel des notes de l'élève
- Utilise un formatage simple : titres, listes, texte gras pour les concepts clés
- Sois concis mais complet
- N'ajoute pas de contenu inventé ou hors sujet
- Si le contenu actuel est vide, génère une base de notes sur le sujet

Format de sortie : Texte simple avec formatage markdown basique.`;

    let userPrompt = `Sujet : ${title}\n`;
    
    if (context) {
      userPrompt += `Contexte : ${context}\n`;
    }
    
    if (currentContent?.trim()) {
      userPrompt += `\nNotes actuelles :\n${currentContent}`;
    } else {
      userPrompt += `\nL'élève n'a pas encore de notes. Génère une base de notes sur ce sujet.`;
    }

    const messages: GeminiMessage[] = [
      { role: 'user', content: userPrompt }
    ];

    const generatedContent = await chatWithGemini(messages, { systemPrompt });

    return NextResponse.json({ 
      success: true,
      content: generatedContent 
    });

  } catch (error) {
    console.error('Erreur API generate-note:', error);
    return NextResponse.json(
      { error: 'Erreur lors de la génération' },
      { status: 500 }
    );
  }
}

NOTES :
- 4 actions : improve, summarize, expand, organize
- Markdown basique (pas HTML) car notes personnelles
- Garde le ton de l'élève (pas trop formel)
- Si contenu vide, génère une base de notes
```

---

## Tâche 21.5 — API generate-course (génération cours complet)

### Contexte
Les professeurs peuvent générer un cours complet (plusieurs sections) à partir d'un titre, une description, des objectifs et des fichiers de référence. L'IA structure le contenu en HTML.

### Description
Créer l'API POST /api/ai/generate-course pour générer un cours structuré complet.

### Prompt
```
Crée l'API de génération de cours complet.

FICHIER : src/app/api/ai/generate-course/route.ts

SCHEMA :

const generateCourseSchema = z.object({
  title: z.string().min(3),
  description: z.string().optional(),
  objectives: z.array(z.string()).optional(),
  difficulty: z.enum(['EASY', 'MEDIUM', 'HARD']).optional(),
  instructions: z.string().optional(),
  files: z.array(z.object({
    filename: z.string(),
    url: z.string(),
    type: z.string(),
  })).optional(),
});

HELPERS :

const difficultyLabels = {
  EASY: 'débutant',
  MEDIUM: 'intermédiaire',
  HARD: 'avancé',
};

function buildUserPrompt({ title, description, objectives, difficulty, instructions, files }) {
  let prompt = `Génère un cours complet sur le sujet suivant :

**Titre** : ${title}`;

  if (description) {
    prompt += `\n**Description** : ${description}`;
  }

  if (difficulty) {
    prompt += `\n**Niveau** : ${difficultyLabels[difficulty]}`;
  }

  if (objectives && objectives.length > 0) {
    prompt += `\n**Objectifs pédagogiques** :\n${objectives.map((o) => `- ${o}`).join('\n')}`;
  }

  if (files && files.length > 0) {
    prompt += `\n\n**Documents de référence fournis** :\n${files.map((f) => `- ${f.filename} (${f.type})`).join('\n')}`;
    prompt += `\n\nBase le contenu sur ces documents si pertinent.`;
  }

  if (instructions) {
    prompt += `\n\n**Instructions supplémentaires du professeur** :\n${instructions}`;
  }

  prompt += `

Génère un cours structuré en HTML avec :
1. Une introduction engageante
2. Plusieurs sections avec des sous-titres (H2, H3)
3. Des explications claires avec des exemples
4. Des points clés à retenir
5. Une conclusion ou résumé

Retourne uniquement le HTML du cours, sans balises <html>, <body> ou <head>.`;

  return prompt;
}

ENDPOINT POST :

export async function POST(request: Request) {
  try {
    const session = await auth();

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non authentifié' }, { status: 401 });
    }
    if (session.user.role !== 'TEACHER') {
      return NextResponse.json({ error: 'Accès réservé aux professeurs' }, { status: 403 });
    }

    const body = await request.json();
    const validation = generateCourseSchema.safeParse(body);

    if (!validation.success) {
      return NextResponse.json(
        { error: 'Données invalides', details: validation.error.flatten() },
        { status: 400 }
      );
    }

    const { title, description, objectives, difficulty, instructions, files } = validation.data;

    const systemPrompt = `Tu es un assistant pédagogique expert qui aide les professeurs à créer des cours de qualité.
Tu génères du contenu HTML bien structuré pour un éditeur de texte riche.

Règles de formatage :
- Utilise des balises HTML : <h1>, <h2>, <h3>, <p>, <ul>, <ol>, <li>, <strong>, <em>, <blockquote>
- Structure le cours avec des sections claires
- Inclus des exemples concrets
- Adapte le niveau au public cible
- Rends le contenu engageant et pédagogique`;

    const userPrompt = buildUserPrompt({
      title,
      description,
      objectives,
      difficulty,
      instructions,
      files,
    });

    try {
      const messages: GeminiMessage[] = [
        { role: 'user', content: userPrompt }
      ];
      
      const generatedContent = await chatWithGemini(messages, { systemPrompt });
      return NextResponse.json({ content: generatedContent });
    } catch (aiError) {
      console.error('Erreur Gemini:', aiError);
      // Fallback vers contenu démo si erreur
      const demoContent = generateDemoContent(title, description, objectives, difficulty);
      return NextResponse.json({ content: demoContent });
    }
  } catch (error) {
    console.error('Erreur API generate-course:', error);
    return NextResponse.json({ error: 'Erreur serveur' }, { status: 500 });
  }
}

FALLBACK generateDemoContent :

function generateDemoContent(title, description, objectives, difficulty) {
  const level = difficulty ? difficultyLabels[difficulty] : 'intermédiaire';
  
  return `<h1>${title}</h1>

<p><em>Niveau : ${level}</em></p>

<h2>Introduction</h2>
<p>${description || `Bienvenue dans ce cours sur <strong>${title}</strong>.`}</p>

${objectives?.length > 0 ? `
<h2>Objectifs du cours</h2>
<ul>
${objectives.map((o) => `  <li>${o}</li>`).join('\n')}
</ul>
` : ''}

<h2>1. Concepts fondamentaux</h2>
<p>Commençons par explorer les bases...</p>

<blockquote>
<p>💡 <strong>Point clé</strong> : La compréhension des fondamentaux est essentielle.</p>
</blockquote>

<h2>2. Mise en pratique</h2>
<p>Passons à la pratique avec des exemples concrets...</p>

<h2>3. Résumé</h2>
<ol>
  <li>Premier point important</li>
  <li>Deuxième point important</li>
</ol>

<p><em>⚠️ Ce contenu a été généré automatiquement. Veuillez le personnaliser.</em></p>`;
}

NOTES :
- files = références pour RAG (documents uploadés)
- Fallback demo content si erreur IA
- HTML structuré pour TipTap editor
- Objectifs pédagogiques guidant la génération
```

---

## Tâche 21.6 — API grade-exercise (correction automatique)

### Contexte
Les élèves soumettent leurs réponses aux exercices. L'IA compare avec les réponses attendues, attribue des points et donne un feedback personnalisé.

### Description
Créer l'API POST /api/ai/grade-exercise pour corriger automatiquement les exercices.

### Prompt
```
Crée l'API de correction automatique d'exercices.

FICHIER : src/app/api/ai/grade-exercise/route.ts

IMPORTS :
import { auth } from '@/lib/auth';
import { NextResponse } from 'next/server';
import Anthropic from '@anthropic-ai/sdk';

TYPES :

interface ExerciseAnswer {
  questionId: string;
  question: string;
  expectedAnswer: string;
  studentAnswer: string;
  points: number;
}

interface GradingResult {
  questionId: string;
  isCorrect: boolean;
  earnedPoints: number;
  maxPoints: number;
  feedback: string;
}

interface GradingResponse {
  results: GradingResult[];
  totalScore: number;
  maxScore: number;
  percentage: number;
  globalFeedback: string;
}

CLIENT ANTHROPIC :

const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY,
});

ENDPOINT POST :

export async function POST(req: Request) {
  try {
    const session = await auth();

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Non autorisé' }, { status: 401 });
    }

    const body = await req.json();
    const { answers } = body as { answers: ExerciseAnswer[] };

    if (!answers || !Array.isArray(answers) || answers.length === 0) {
      return NextResponse.json({ error: 'Réponses manquantes' }, { status: 400 });
    }

    const prompt = buildGradingPrompt(answers);

    const message = await anthropic.messages.create({
      model: 'claude-3-5-sonnet-20241022',
      max_tokens: 2048,
      temperature: 0.2,
      messages: [{ role: 'user', content: prompt }],
    });

    const firstContent = message.content?.[0];
    const content = firstContent && firstContent.type === 'text' ? firstContent.text : '';
    const gradingResult = parseGradingResponse(content, answers);

    return NextResponse.json(gradingResult);
  } catch (error) {
    console.error('Erreur correction IA:', error);
    return NextResponse.json({ error: 'Erreur lors de la correction' }, { status: 500 });
  }
}

FONCTION buildGradingPrompt :

function buildGradingPrompt(answers: ExerciseAnswer[]): string {
  const questionsText = answers
    .map((a, i) => `
Question ${i + 1} (${a.points} points):
- Question: ${a.question}
- Réponse attendue: ${a.expectedAnswer}
- Réponse de l'élève: ${a.studentAnswer || '(pas de réponse)'}
`)
    .join('\n');

  return `Tu es un professeur bienveillant qui corrige les exercices d'un élève.

EXERCICE À CORRIGER:
${questionsText}

INSTRUCTIONS:
1. Compare chaque réponse de l'élève avec la réponse attendue
2. Accepte les réponses correctes même si:
   - L'orthographe est légèrement différente
   - La formulation est différente mais le sens est correct
   - Des synonymes sont utilisés
3. Attribue les points (tout ou rien, ou points partiels si réponse partiellement correcte)
4. Donne un feedback constructif et encourageant pour chaque réponse

RÉPONDS EN JSON STRICT (pas de markdown, pas de \`\`\`):
{
  "results": [
    {
      "questionId": "id de la question",
      "isCorrect": true/false,
      "earnedPoints": nombre de points obtenus,
      "feedback": "Explication courte et encourageante"
    }
  ],
  "globalFeedback": "Message global d'encouragement avec conseil pour s'améliorer"
}`;
}

FONCTION parseGradingResponse :

function parseGradingResponse(content: string, originalAnswers: ExerciseAnswer[]): GradingResponse {
  try {
    // Nettoyer le contenu (enlever backticks markdown)
    let cleanContent = content.trim();
    if (cleanContent.startsWith('```json')) {
      cleanContent = cleanContent.slice(7);
    }
    if (cleanContent.startsWith('```')) {
      cleanContent = cleanContent.slice(3);
    }
    if (cleanContent.endsWith('```')) {
      cleanContent = cleanContent.slice(0, -3);
    }
    cleanContent = cleanContent.trim();

    const parsed = JSON.parse(cleanContent);

    const results: GradingResult[] = originalAnswers.map((answer, index) => {
      const aiResult = parsed.results?.[index] || {};
      return {
        questionId: answer.questionId,
        isCorrect: aiResult.isCorrect ?? false,
        earnedPoints: aiResult.earnedPoints ?? 0,
        maxPoints: answer.points,
        feedback: aiResult.feedback || 'Pas de feedback disponible',
      };
    });

    const totalScore = results.reduce((sum, r) => sum + r.earnedPoints, 0);
    const maxScore = results.reduce((sum, r) => sum + r.maxPoints, 0);
    const percentage = maxScore > 0 ? Math.round((totalScore / maxScore) * 100) : 0;

    return {
      results,
      totalScore,
      maxScore,
      percentage,
      globalFeedback: parsed.globalFeedback || 'Continue comme ça !',
    };
  } catch (error) {
    console.error('Erreur parsing réponse IA:', error);
    
    // Fallback: correction simple par comparaison exacte
    const results: GradingResult[] = originalAnswers.map((answer) => {
      const isCorrect = normalizeAnswer(answer.studentAnswer) === normalizeAnswer(answer.expectedAnswer);
      return {
        questionId: answer.questionId,
        isCorrect,
        earnedPoints: isCorrect ? answer.points : 0,
        maxPoints: answer.points,
        feedback: isCorrect ? 'Bonne réponse !' : 'Réponse incorrecte',
      };
    });

    const totalScore = results.reduce((sum, r) => sum + r.earnedPoints, 0);
    const maxScore = results.reduce((sum, r) => sum + r.maxPoints, 0);

    return {
      results,
      totalScore,
      maxScore,
      percentage: maxScore > 0 ? Math.round((totalScore / maxScore) * 100) : 0,
      globalFeedback: 'Correction automatique (fallback)',
    };
  }
}

FONCTION normalizeAnswer (fallback) :

function normalizeAnswer(answer: string): string {
  return (answer || '')
    .toLowerCase()
    .trim()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[^a-z0-9\s]/g, '');
}

INSTALLER :
npm install @anthropic-ai/sdk

ENV :
ANTHROPIC_API_KEY=sk-ant-xxx

NOTES :
- Claude 3.5 Sonnet pour correction (meilleur que Gemini pour évaluation nuancée)
- temperature 0.2 pour cohérence
- Fallback si parsing JSON échoue (comparaison exacte)
- Feedback personnalisé et encourageant
```

---

## Tâche 21.7 — API evaluate (évaluation session chat IA)

### Contexte
Après une session de chat IA (quiz, exercice, révision), l'élève peut demander une évaluation. L'IA analyse l'historique de messages et calcule des scores (compréhension, précision, autonomie).

### Description
Créer l'API POST /api/ai/evaluate pour évaluer une session de chat IA.

### Prompt
```
Crée l'API d'évaluation de session chat IA.

FICHIER : src/app/api/ai/evaluate/route.ts

IMPORTS :
import { auth } from '@/lib/auth';
import { prisma } from '@/lib/prisma';
import { NextResponse } from 'next/server';
import {
  evaluateQuizSession,
  evaluateExerciseSession,
  evaluateRevisionSession,
  saveActivityScore,
  updateStudentScoreFromAI,
  ActivityType,
} from '@/lib/ai-evaluation-service';

ENDPOINT POST :

export async function POST(req: Request) {
  try {
    const session = await auth();

    if (!session?.user?.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await req.json();
    const { aiChatId, activityType, activityId, courseId } = body;

    if (!aiChatId || !activityType || !courseId) {
      return NextResponse.json(
        { error: 'Missing required fields: aiChatId, activityType, courseId' },
        { status: 400 }
      );
    }

    // 1. Récupérer la session chat
    const aiChat = await prisma.aIChat.findUnique({
      where: { id: aiChatId },
    });

    if (!aiChat) {
      return NextResponse.json({ error: 'Chat session not found' }, { status: 404 });
    }

    // 2. Vérifier propriété
    if (aiChat.userId !== session.user.id) {
      return NextResponse.json({ error: 'Forbidden' }, { status: 403 });
    }

    // 3. Vérifier pas déjà évaluée
    const existing = await prisma.aIActivityScore.findUnique({
      where: { aiChatId: aiChatId },
    });

    if (existing) {
      return NextResponse.json({ error: 'Session already evaluated' }, { status: 409 });
    }

    // 4. Préparer historique
    const messages = aiChat.messages as Array<{ role: string; content: string }>;
    const chatHistory = messages.map((m) => ({
      role: m.role,
      content: m.content,
    }));

    // 5. Évaluer selon le type
    let evaluation;

    switch (activityType) {
      case 'QUIZ':
        evaluation = await evaluateQuizSession(chatHistory, {
          title: activityId ? `Quiz ${activityId}` : 'Quiz IA',
          questions: ['Question 1', 'Question 2', 'Question 3'],
        }, aiChat.contextType || 'Cours général');
        break;

      case 'EXERCISE':
        if (activityId) {
          const exercise = await prisma.exercise.findUnique({
            where: { id: activityId },
          });
          if (exercise) {
            const exerciseContent = exercise.content as { description?: string } | null;
            evaluation = await evaluateExerciseSession(chatHistory, {
              title: exercise.title,
              description: exerciseContent?.description || exercise.title,
            });
            break;
          }
        }
        evaluation = await evaluateExerciseSession(chatHistory, {
          title: 'Exercice IA',
          description: 'Exercice assisté par IA',
        });
        break;

      case 'REVISION':
        evaluation = await evaluateRevisionSession(chatHistory, aiChat.contextType || 'Cours général');
        break;

      default:
        return NextResponse.json({ error: 'Invalid activity type' }, { status: 400 });
    }

    // 6. Calculer durée et tokens
    const createdAt = new Date(aiChat.createdAt);
    const updatedAt = new Date(aiChat.updatedAt);
    const duration = Math.max(1, Math.floor((updatedAt.getTime() - createdAt.getTime()) / 60000));

    // 7. Enregistrer le score
    await saveActivityScore(
      session.user.id,
      courseId,
      aiChatId,
      activityType as ActivityType,
      evaluation,
      {
        duration,
        messageCount: messages.length,
        tokens: 0,
      }
    );

    // 8. Mettre à jour StudentScore
    await updateStudentScoreFromAI(session.user.id, courseId);

    // 9. Retourner l'évaluation
    const finalScore =
      evaluation.comprehension * 0.4 + evaluation.accuracy * 0.4 + evaluation.autonomy * 0.2;

    return NextResponse.json({
      success: true,
      data: {
        score: Math.round(finalScore),
        comprehension: evaluation.comprehension,
        accuracy: evaluation.accuracy,
        autonomy: evaluation.autonomy,
        strengths: evaluation.strengths,
        weaknesses: evaluation.weaknesses,
        recommendation: evaluation.recommendation,
      },
    });
  } catch (error) {
    console.error('AI evaluation error:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Internal server error' },
      { status: 500 }
    );
  }
}

SERVICE : src/lib/ai-evaluation-service.ts

export type ActivityType = 'QUIZ' | 'EXERCISE' | 'REVISION';

export interface EvaluationResult {
  comprehension: number;  // 0-100
  accuracy: number;       // 0-100
  autonomy: number;       // 0-100
  strengths: string[];
  weaknesses: string[];
  recommendation: string;
}

// Fonctions d'évaluation spécialisées
export async function evaluateQuizSession(
  chatHistory: { role: string; content: string }[],
  quizData: { title: string; questions: string[] },
  topic: string
): Promise<EvaluationResult>

export async function evaluateExerciseSession(
  chatHistory: { role: string; content: string }[],
  exerciseData: { title: string; description: string }
): Promise<EvaluationResult>

export async function evaluateRevisionSession(
  chatHistory: { role: string; content: string }[],
  topic: string
): Promise<EvaluationResult>

NOTES :
- Évaluation basée sur l'analyse du chat (questions posées, aide demandée, etc.)
- 3 scores : comprehension, accuracy, autonomy
- Sauvegarde dans AIActivityScore puis agrégation dans StudentScore
- Prévention double évaluation (unique constraint sur aiChatId)
```

---

## Résumé Phase 21

| Tâche | Fichier | Fonction |
|-------|---------|----------|
| 21.1 | generate-quiz/route.ts | Génération quiz QCM (JSON) |
| 21.2 | generate-exercise/route.ts | Génération exercices + corrigés (JSON) |
| 21.3 | generate-lesson/route.ts | Génération contenu leçon (HTML) |
| 21.4 | generate-note/route.ts | Amélioration notes élèves (Markdown) |
| 21.5 | generate-course/route.ts | Génération cours complet (HTML) |
| 21.6 | grade-exercise/route.ts | Correction automatique exercices |
| 21.7 | evaluate/route.ts | Évaluation session chat IA |

**Total : 7 tâches**

**Modèles IA utilisés** :
- **Gemini 2.0 Flash** : Génération (quiz, exercices, cours, leçons, notes)
- **Claude 3.5 Sonnet** : Correction (grade-exercise) - Meilleure évaluation nuancée
