# Phase 18 — AI : Setup Gemini

> Configuration de l'intégration Google Gemini avec streaming, multimodal et gestion des clés API.

---

## Vue d'ensemble

| Fichiers | Rôle |
|----------|------|
| `src/lib/ai/gemini.ts` | Client Gemini principal (488 lignes) |
| `prisma/schema.prisma` | Modèle AISettings + enums |
| `.env` | Variable `GEMINI_API_KEY` |

**Modèle utilisé** : `gemini-2.0-flash` (multimodal : texte, image, audio, vidéo, PDF)

---

## Tâche 18.1 — Installation du SDK Gemini

### Contexte
L'intégration IA de BlaizBot utilise Google Gemini 2.0 Flash, le modèle multimodal le plus récent de Google. Le SDK officiel `@google/generative-ai` fournit toutes les fonctionnalités nécessaires.

### Description
Installer le SDK Google Generative AI et configurer la variable d'environnement pour la clé API.

### Prompt
```
Installe le SDK Google Gemini pour Next.js.

COMMANDE :
npm install @google/generative-ai

FICHIER : .env.local
Ajoute :
GEMINI_API_KEY=ta_cle_api_google

FICHIER : .env.example
Ajoute :
GEMINI_API_KEY=your_google_gemini_api_key

VÉRIFICATION :
npm list @google/generative-ai → version installée
```

---

## Tâche 18.2 — Modèle AISettings (Prisma)

### Contexte
La configuration IA doit être modifiable par l'admin sans redéployer l'application. Le modèle AISettings stocke le provider actif, la clé API chiffrée, le modèle par défaut et les restrictions.

### Description
Créer le modèle Prisma AISettings avec les enums AIProvider et AIRestrictionLevel pour une configuration flexible multi-provider.

### Prompt
```
Crée le modèle Prisma AISettings pour la configuration IA.

FICHIER : prisma/schema.prisma

AJOUTER LES ENUMS :

enum AIProvider {
  OPENAI
  GOOGLE
  ANTHROPIC
  MISTRAL
  CUSTOM
}

enum AIRestrictionLevel {
  STRICT     // Réponses très contrôlées
  BALANCED   // Équilibre créativité/contrôle (défaut)
  CREATIVE   // Plus de liberté
}

AJOUTER LE MODÈLE :

model AISettings {
  id                  String             @id
  provider            AIProvider         @default(OPENAI)
  apiKey              String
  model               String             @default("gpt-4o")
  endpoint            String?
  restrictionLevel    AIRestrictionLevel @default(BALANCED)
  enablePdfAnalysis   Boolean            @default(true)
  allowTeacherPrompts Boolean            @default(true)
  maintenanceMode     Boolean            @default(false)
  platformName        String             @default("Blaiz'bot")
  defaultLanguage     String             @default("fr")
  updatedAt           DateTime
}

EXÉCUTER :
npx prisma generate
npx prisma db push

NOTES :
- id = 'global' pour la config principale
- apiKey sera stockée chiffrée en production
- restrictionLevel contrôle la "créativité" du modèle
```

---

## Tâche 18.3 — Configuration et constantes Gemini

### Contexte
Le client Gemini nécessite une configuration centralisée : nom du modèle, paramètres de génération (temperature, tokens), et gestion du cache pour les clés API.

### Description
Créer la section configuration du fichier gemini.ts avec le nom du modèle, le cache API key avec TTL, et les paramètres par défaut.

### Prompt
```
Crée la configuration du client Gemini.

FICHIER : src/lib/ai/gemini.ts

IMPORTS :
import {
  GoogleGenerativeAI,
  GenerativeModel,
  Content,
  Part,
  GenerateContentStreamResult,
} from '@google/generative-ai';
import { Resource, StudentProgress, CourseAssignment, User } from '@prisma/client';
import { prisma } from '@/lib/prisma';

SECTION CONFIGURATION :

// Modèle principal : Gemini 2.0 Flash (2026)
const MODEL_NAME = 'gemini-2.0-flash';

// Cache clé API (évite requête BDD à chaque appel)
let cachedApiKey: string | null = null;
let cacheTimestamp: number = 0;
const CACHE_TTL = 5 * 60 * 1000; // 5 minutes

// Configuration par défaut
const DEFAULT_CONFIG = {
  temperature: 0.7,      // Créativité modérée
  maxOutputTokens: 4096, // Réponses détaillées
  topP: 0.95,            // Nucleus sampling
  topK: 40,              // Diversité vocabulaire
};

EXPORTER :
export { MODEL_NAME };

NOTES :
- gemini-2.0-flash = modèle multimodal (texte, image, audio, vidéo, PDF)
- Cache évite requête BDD à chaque appel IA
- TTL 5 min = bon compromis fraîcheur/performance
```

---

## Tâche 18.4 — Fonction getGeminiApiKey

### Contexte
La clé API peut provenir de plusieurs sources : variable d'environnement (dev/CI), cache mémoire (performance), ou base de données (config admin). Cette hiérarchie permet une flexibilité maximale.

### Description
Implémenter la fonction getGeminiApiKey avec priorité env > cache > BDD et gestion du TTL.

### Prompt
```
Crée la fonction de récupération de clé API avec cache.

FICHIER : src/lib/ai/gemini.ts

FONCTION getGeminiApiKey :

/**
 * Récupère la clé API Gemini (priorité: env > cache > BDD)
 */
async function getGeminiApiKey(): Promise<string | null> {
  // Priorité 1 : variable d'environnement
  if (process.env.GEMINI_API_KEY) {
    return process.env.GEMINI_API_KEY;
  }
  
  // Priorité 2 : cache valide
  if (cachedApiKey && Date.now() - cacheTimestamp < CACHE_TTL) {
    return cachedApiKey;
  }
  
  // Priorité 3 : BDD (via table system_settings)
  try {
    const result = await prisma.$queryRaw<Array<{ value: string }>>`
      SELECT value FROM system_settings WHERE key = 'GEMINI_API_KEY' LIMIT 1
    `;
    cachedApiKey = result[0]?.value || null;
    cacheTimestamp = Date.now();
    return cachedApiKey;
  } catch {
    return null;
  }
}

FONCTION resetGeminiCache :

/**
 * Réinitialise le cache (appeler après modification de la clé)
 */
export function resetGeminiCache(): void {
  cachedApiKey = null;
  cacheTimestamp = 0;
}

NOTES :
- Priorité env = utile pour dev local et CI/CD
- Cache évite 99% des requêtes BDD
- $queryRaw car system_settings peut ne pas être dans le schéma Prisma
- resetGeminiCache à appeler quand admin change la clé
```

---

## Tâche 18.5 — Interfaces TypeScript (Messages et Attachments)

### Contexte
L'API Gemini supporte le multimodal : images, audio, vidéo, documents. Les interfaces TypeScript définissent la structure des messages avec leurs pièces jointes potentielles.

### Description
Créer les interfaces GeminiMessage, GeminiAttachment et GeminiOptions pour typer les échanges avec l'API.

### Prompt
```
Crée les interfaces TypeScript pour les messages Gemini.

FICHIER : src/lib/ai/gemini.ts

SECTION TYPES :

export interface GeminiMessage {
  role: 'user' | 'model';  // user = humain, model = assistant
  content: string;          // Texte du message
  attachments?: GeminiAttachment[];  // Pièces jointes optionnelles
}

export interface GeminiAttachment {
  type: 'image' | 'audio' | 'video' | 'document';
  mimeType: string;  // Ex: 'image/png', 'audio/mp3'
  data?: string;     // Base64 pour inline (< 20MB)
  uri?: string;      // URI Gemini File API (> 20MB)
}

export interface GeminiOptions {
  systemPrompt?: string;   // Instructions système
  temperature?: number;    // 0-2, créativité
  maxTokens?: number;      // Limite réponse
}

// Types legacy pour compatibilité
export interface AIAnalysisResult {
  summary: string;
  strengths: string[];
  weaknesses: string[];
  actions: string[];
}

export interface QuizQuestion {
  question: string;
  options: string[];
  correctAnswer: number;
  explanation: string;
}

NOTES :
- role 'model' (pas 'assistant') = convention Gemini
- Attachments supportent inline (base64) ou File API (URI)
- File API nécessaire pour fichiers > 20MB
- Types legacy = pour fonctions existantes (quiz, analyse)
```

---

## Tâche 18.6 — Fonction getModel

### Contexte
Chaque appel IA nécessite une instance du modèle Gemini configurée. La fonction getModel centralise cette création avec le system prompt optionnel.

### Description
Créer la fonction getModel qui instancie GoogleGenerativeAI et retourne un GenerativeModel configuré.

### Prompt
```
Crée la fonction d'instanciation du modèle Gemini.

FICHIER : src/lib/ai/gemini.ts

FONCTION getModel :

/**
 * Obtenir le modèle Gemini configuré
 */
async function getModel(systemPrompt?: string): Promise<GenerativeModel> {
  const apiKey = await getGeminiApiKey();
  if (!apiKey) {
    throw new Error('Clé API Gemini non configurée. Contactez l\'administrateur.');
  }
  
  const genAI = new GoogleGenerativeAI(apiKey);
  
  return genAI.getGenerativeModel({
    model: MODEL_NAME,
    generationConfig: {
      temperature: DEFAULT_CONFIG.temperature,
      maxOutputTokens: DEFAULT_CONFIG.maxOutputTokens,
      topP: DEFAULT_CONFIG.topP,
      topK: DEFAULT_CONFIG.topK,
    },
    systemInstruction: systemPrompt,
  });
}

NOTES :
- systemInstruction = prompt système (ex: "Tu es un assistant pédagogique...")
- generationConfig = paramètres de génération
- Erreur explicite si clé manquante (UX admin)
- getModel est private (non exportée)
```

---

## Tâche 18.7 — Fonction toGeminiContents (conversion messages)

### Contexte
L'API Gemini attend un format spécifique `Content[]` avec des `Part[]`. Cette fonction convertit nos GeminiMessage en format natif, gérant texte et attachments.

### Description
Créer la fonction toGeminiContents qui transforme les messages avec leurs pièces jointes en format Content[] natif Gemini.

### Prompt
```
Crée la fonction de conversion des messages vers le format Gemini.

FICHIER : src/lib/ai/gemini.ts

FONCTION toGeminiContents :

/**
 * Convertir nos messages vers le format Gemini
 */
function toGeminiContents(messages: GeminiMessage[]): Content[] {
  return messages.map((msg) => {
    const parts: Part[] = [];

    // Texte
    if (msg.content) {
      parts.push({ text: msg.content });
    }

    // Attachements
    if (msg.attachments) {
      for (const att of msg.attachments) {
        if (att.data) {
          // Inline data (base64 pour fichiers < 20MB)
          parts.push({
            inlineData: {
              mimeType: att.mimeType,
              data: att.data,
            },
          });
        } else if (att.uri) {
          // File API URI (pour fichiers > 20MB)
          parts.push({
            fileData: {
              mimeType: att.mimeType,
              fileUri: att.uri,
            },
          });
        }
      }
    }

    return {
      role: msg.role === 'user' ? 'user' : 'model',
      parts,
    };
  });
}

NOTES :
- inlineData = base64 encodé (images, audio < 20MB)
- fileData = référence File API (vidéos, gros fichiers)
- Un message peut avoir texte + plusieurs attachments
- Role mapping: 'model' (notre convention) → 'model' (Gemini)
```

---

## Tâche 18.8 — Fonction chatWithGemini (non-streaming)

### Contexte
La plupart des appels IA (génération quiz, analyse, etc.) n'ont pas besoin de streaming. Cette fonction simple envoie les messages et retourne la réponse complète.

### Description
Créer la fonction chatWithGemini pour les appels IA simples sans streaming.

### Prompt
```
Crée la fonction de chat non-streaming avec Gemini.

FICHIER : src/lib/ai/gemini.ts

FONCTION chatWithGemini :

/**
 * Chat simple (non-streaming)
 */
export async function chatWithGemini(
  messages: GeminiMessage[],
  options: GeminiOptions = {}
): Promise<string> {
  const model = await getModel(options.systemPrompt);
  const contents = toGeminiContents(messages);

  const result = await model.generateContent({ contents });
  const response = result.response;

  return response.text();
}

USAGE :

const response = await chatWithGemini([
  { role: 'user', content: 'Explique la photosynthèse' }
], {
  systemPrompt: 'Tu es un professeur de SVT pour collégiens.'
});

console.log(response); // Texte de la réponse

NOTES :
- Fonction exportée (utilisable partout)
- Retourne directement le texte (string)
- Options permet de personnaliser temperature, systemPrompt
- Utilisée pour : quiz, exercices, analyse, évaluation
```

---

## Tâche 18.9 — Fonction streamGemini (streaming)

### Contexte
Pour le chat en temps réel (interface élève), le streaming améliore l'UX en affichant la réponse au fur et à mesure. La fonction retourne un stream itérable.

### Description
Créer la fonction streamGemini qui retourne un GenerateContentStreamResult pour affichage progressif.

### Prompt
```
Crée la fonction de chat avec streaming Gemini.

FICHIER : src/lib/ai/gemini.ts

FONCTION streamGemini :

/**
 * Chat avec streaming
 */
export async function streamGemini(
  messages: GeminiMessage[],
  options: GeminiOptions = {}
): Promise<GenerateContentStreamResult> {
  const model = await getModel(options.systemPrompt);
  const contents = toGeminiContents(messages);

  return model.generateContentStream({ contents });
}

USAGE CÔTÉ API ROUTE :

export async function POST(req: Request) {
  const { messages, systemPrompt } = await req.json();
  
  const stream = await streamGemini(messages, { systemPrompt });
  
  // Créer un ReadableStream pour la réponse
  const encoder = new TextEncoder();
  const readable = new ReadableStream({
    async start(controller) {
      for await (const chunk of stream.stream) {
        const text = chunk.text();
        controller.enqueue(encoder.encode(text));
      }
      controller.close();
    },
  });
  
  return new Response(readable, {
    headers: { 'Content-Type': 'text/plain; charset=utf-8' },
  });
}

NOTES :
- Retourne GenerateContentStreamResult (pas string)
- L'API route itère sur stream.stream
- Chaque chunk = portion de texte
- Utilisé pour : chat élève temps réel
```

---

## Tâche 18.10 — Helpers multimodaux (analyzeImage, analyzeAudio, analyzeVideo)

### Contexte
Gemini 2.0 Flash est multimodal : il peut analyser images, audio et vidéo. Ces helpers simplifient l'envoi de médias avec un prompt.

### Description
Créer les fonctions helper analyzeImage, analyzeAudio et analyzeVideo pour l'analyse de médias.

### Prompt
```
Crée les helpers d'analyse multimodale Gemini.

FICHIER : src/lib/ai/gemini.ts

FONCTION analyzeImage :

/**
 * Analyser une image (helper)
 */
export async function analyzeImage(
  imageBase64: string,
  mimeType: string,
  prompt: string,
  systemPrompt?: string
): Promise<string> {
  const messages: GeminiMessage[] = [
    {
      role: 'user',
      content: prompt,
      attachments: [
        {
          type: 'image',
          mimeType,
          data: imageBase64,
        },
      ],
    },
  ];

  return chatWithGemini(messages, { systemPrompt });
}

FONCTION analyzeAudio :

/**
 * Analyser un audio (transcription + question)
 */
export async function analyzeAudio(
  audioBase64: string,
  mimeType: string,
  prompt: string = 'Transcris cet audio et réponds à la question si présente.'
): Promise<string> {
  const messages: GeminiMessage[] = [
    {
      role: 'user',
      content: prompt,
      attachments: [
        {
          type: 'audio',
          mimeType,
          data: audioBase64,
        },
      ],
    },
  ];

  return chatWithGemini(messages);
}

FONCTION analyzeVideo :

/**
 * Analyser une vidéo via File API URI
 */
export async function analyzeVideo(
  videoUri: string,
  mimeType: string,
  prompt: string
): Promise<string> {
  const messages: GeminiMessage[] = [
    {
      role: 'user',
      content: prompt,
      attachments: [
        {
          type: 'video',
          mimeType,
          uri: videoUri,  // Vidéos nécessitent File API (trop gros pour base64)
        },
      ],
    },
  ];

  return chatWithGemini(messages);
}

NOTES :
- Image/Audio : inline base64 (< 20MB)
- Vidéo : File API URI (uploadé préalablement)
- mimeType obligatoire (ex: 'image/jpeg', 'audio/mpeg', 'video/mp4')
```

---

## Tâche 18.11 — Prompts système prédéfinis (SYSTEM_PROMPTS)

### Contexte
Chaque cas d'usage IA (chat élève, génération quiz, évaluation) nécessite un prompt système différent. Ces prompts sont centralisés pour maintenance facile.

### Description
Créer l'objet SYSTEM_PROMPTS avec les prompts système pour student, quiz, exercise et coach.

### Prompt
```
Crée les prompts système prédéfinis pour chaque cas d'usage.

FICHIER : src/lib/ai/gemini.ts

CONSTANTE SYSTEM_PROMPTS :

export const SYSTEM_PROMPTS = {
  student: `Tu es Blaiz'bot, un assistant pédagogique bienveillant pour les élèves de collège/lycée.

Tu as accès aux informations suivantes :
- Le profil de l'élève (prénom, classe, cours inscrits)
- Les devoirs à venir de l'élève
- Les résultats récents de l'élève
- Le niveau de l'élève (compréhension, autonomie, rigueur)
- Le contenu détaillé des cours sélectionnés pour cette conversation

RÈGLES :
1. Utilise le PRÉNOM de l'élève pour personnaliser tes réponses
2. Réponds de manière claire et adaptée au niveau de l'élève
3. Si l'élève a des devoirs à venir, mentionne-les de façon encourageante
4. Utilise des exemples concrets pour expliquer
5. Encourage l'élève à réfléchir plutôt que donner directement la réponse
6. Si tu utilises des infos des cours fournis, cite le chapitre ou la section
7. Si tu ne sais pas, dis-le clairement
8. Utilise le format Markdown pour structurer tes réponses
9. Sois encourageant et positif`,

  quiz: `Tu génères des quiz éducatifs. Retourne UNIQUEMENT du JSON valide, sans texte avant ou après.`,

  exercise: `Tu génères des exercices éducatifs. Retourne UNIQUEMENT du JSON valide, sans texte avant ou après.`,

  coach: `Tu évalues la qualité des messages d'un élève. Retourne UNIQUEMENT du JSON valide avec les scores.`,
};

USAGE :

const response = await chatWithGemini(messages, {
  systemPrompt: SYSTEM_PROMPTS.student
});

NOTES :
- student = prompt riche avec contexte et règles
- quiz/exercise/coach = prompts minimalistes car le prompt principal est dans le message user
- JSON strict pour éviter pollution du parsing
```

---

## Tâche 18.12 — Classe GeminiService (legacy)

### Contexte
Pour compatibilité avec l'ancien code et cas d'usage spécifiques (génération JSON, analyse classe), une classe GeminiService encapsule des méthodes utilitaires.

### Description
Créer la classe GeminiService avec les méthodes generateJson, generateQuizFromVideo et analyzeClassProgress.

### Prompt
```
Crée la classe GeminiService pour les méthodes utilitaires.

FICHIER : src/lib/ai/gemini.ts

CLASSE GeminiService :

export class GeminiService {
  private legacyModel: GenerativeModel | null = null;

  private async getLegacyModel(): Promise<GenerativeModel> {
    if (this.legacyModel) return this.legacyModel;

    const apiKey = await getGeminiApiKey();
    if (!apiKey) {
      throw new Error('Clé API Gemini non configurée. Contactez l\'administrateur.');
    }
    const genAI = new GoogleGenerativeAI(apiKey);
    this.legacyModel = genAI.getGenerativeModel({ 
      model: MODEL_NAME,
      generationConfig: {
        temperature: DEFAULT_CONFIG.temperature,
        maxOutputTokens: DEFAULT_CONFIG.maxOutputTokens,
      },
    });
    return this.legacyModel;
  }

  /**
   * Helper pour générer du JSON structuré
   */
  async generateJson<T>(prompt: string): Promise<T> {
    try {
      const model = await this.getLegacyModel();
      const result = await model.generateContent(prompt);
      const response = result.response;
      const text = response.text();
      
      // Nettoyage du markdown JSON (```json ... ```)
      const jsonString = text
        .replace(/```json\n|\n```/g, '')
        .replace(/```/g, '')
        .trim();
      
      return JSON.parse(jsonString) as T;
    } catch (error) {
      console.error('Erreur Gemini generateJson:', error);
      throw error;
    }
  }

  /**
   * Génère un quiz à partir d'une URL de vidéo
   */
  async generateQuizFromVideo(
    videoUrl: string, 
    topic: string, 
    count: number = 5
  ): Promise<QuizQuestion[]> {
    const prompt = `
      RÔLE: Tu es un expert pédagogique.
      
      TÂCHE: Génère un quiz de ${count} questions à choix multiples 
      basé sur la vidéo suivante.
      
      VIDÉO: ${videoUrl}
      SUJET: ${topic}
      
      FORMAT JSON ATTENDU:
      [
        {
          "question": "Question ?",
          "options": ["A", "B", "C", "D"],
          "correctAnswer": 0,
          "explanation": "Pourquoi c'est la bonne réponse"
        }
      ]
    `;
    
    return this.generateJson<QuizQuestion[]>(prompt);
  }
}

SINGLETON :

export const geminiService = new GeminiService();

NOTES :
- Singleton pour réutiliser le modèle (performance)
- generateJson nettoie automatiquement les markers ```json
- Type générique T pour typer le retour JSON
```

---

## Tâche 18.13 — Méthode analyzeClassProgress

### Contexte
Les professeurs peuvent demander une analyse IA de la progression de leur classe. Cette méthode agrège les ressources et les scores élèves pour générer des recommandations.

### Description
Ajouter la méthode analyzeClassProgress à GeminiService pour l'analyse pédagogique de classe.

### Prompt
```
Ajoute la méthode d'analyse de progression de classe.

FICHIER : src/lib/ai/gemini.ts

DANS LA CLASSE GeminiService, AJOUTER :

/**
 * Analyse le contenu du cours et la progression des élèves
 */
async analyzeClassProgress(
  resources: Resource[],
  progressData: (StudentProgress & { student: User; assignment: CourseAssignment })[],
  statsContext?: string
): Promise<AIAnalysisResult> {
  try {
    // Formater les ressources du cours
    const resourcesContext = resources
      .map((r) => `- [${r.type}] ${r.title}: ${r.description || 'Pas de description'}`)
      .join('\n');

    // Formater la progression des élèves
    const progressContext = progressData
      .map((p) =>
        `- Élève: ${p.student.firstName} ${p.student.lastName}, ` +
        `Devoir: ${p.assignment.title}, Score: ${p.score}/100, Statut: ${p.status}`
      )
      .join('\n');

    const prompt = `
      RÔLE: Tu es un assistant pédagogique expert.

      CONTEXTE DU COURS (Ressources disponibles):
      ${resourcesContext}

      STATISTIQUES GLOBALES:
      ${statsContext || 'Non disponibles'}

      DÉTAIL PROGRESSION DES ÉLÈVES:
      ${progressContext}

      TÂCHE: Analyse ces données pour fournir une synthèse pédagogique.
      
      FORMAT DE RÉPONSE ATTENDU (JSON uniquement):
      {
        "summary": "Résumé global de la situation (max 50 mots)",
        "strengths": ["Point fort 1", "Point fort 2"],
        "weaknesses": ["Point faible 1", "Point faible 2"],
        "actions": ["Action concrète 1", "Action concrète 2"]
      }
    `;

    return await this.generateJson<AIAnalysisResult>(prompt);
  } catch (error) {
    console.error('Erreur lors de l\'analyse Gemini:', error);
    // Fallback en cas d'erreur
    return {
      summary: 'Impossible de générer l\'analyse pour le moment.',
      strengths: [],
      weaknesses: [],
      actions: ['Vérifier la configuration de l\'IA'],
    };
  }
}

NOTES :
- Prend des relations Prisma (StudentProgress avec student et assignment)
- statsContext = stats pré-calculées (moyenne classe, etc.)
- Fallback gracieux si erreur IA
- Retourne AIAnalysisResult typé
```

---

## Tâche 18.14 — Placeholder File API (uploadToGeminiFileAPI)

### Contexte
Les fichiers > 20MB (vidéos) nécessitent l'upload préalable vers Gemini File API. Cette fonction est un placeholder pour l'implémentation future.

### Description
Créer la fonction placeholder uploadToGeminiFileAPI pour les fichiers volumineux.

### Prompt
```
Crée le placeholder pour l'upload File API Gemini.

FICHIER : src/lib/ai/gemini.ts

FONCTION uploadToGeminiFileAPI :

/**
 * Upload un fichier volumineux vers Gemini File API
 * Les fichiers sont stockés temporairement (48h) chez Google
 * @returns URI du fichier uploadé (format: files/xxx)
 */
export async function uploadToGeminiFileAPI(
  buffer: Buffer,
  mimeType: string,
  displayName: string
): Promise<string> {
  // Note: Gemini File API nécessite une approche différente
  // Pour l'instant, on utilise l'approche base64 inline
  // La vraie File API nécessite google-auth-library
  console.log('Placeholder params:', { mimeType, displayName, bufferSize: buffer.length });
  
  console.warn('Gemini File API: using base64 fallback for large files');
  
  // Conversion en base64 comme fallback
  void buffer.toString('base64');
  
  // Placeholder - retourne une URI fictive
  const fileId = `temp_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`;
  
  return `files/${fileId}`;
}

NOTES :
- Placeholder car File API nécessite auth différente
- Format retour : 'files/xxx' (convention Gemini)
- 48h = durée de vie des fichiers chez Google
- À implémenter avec google-auth-library si besoin
```

---

## Tâche 18.15 — Exports et tests manuels

### Contexte
Le module gemini.ts doit exporter toutes les fonctions publiques et le singleton. Un test manuel vérifie que l'intégration fonctionne.

### Description
Finaliser les exports du module et créer un test manuel de vérification.

### Prompt
```
Finalise les exports et crée un test de vérification.

FICHIER : src/lib/ai/gemini.ts

EXPORTS FINAUX (en bas du fichier) :

export { MODEL_NAME };
// Les autres fonctions/classes sont déjà exportées avec 'export'

RÉCAPITULATIF DES EXPORTS :
- chatWithGemini (fonction) - Chat non-streaming
- streamGemini (fonction) - Chat streaming
- analyzeImage (fonction) - Analyse image
- analyzeAudio (fonction) - Transcription audio
- analyzeVideo (fonction) - Analyse vidéo
- resetGeminiCache (fonction) - Reset cache clé API
- uploadToGeminiFileAPI (fonction) - Upload File API (placeholder)
- GeminiService (classe) - Utilitaires (generateJson, etc.)
- geminiService (singleton) - Instance unique
- SYSTEM_PROMPTS (constante) - Prompts prédéfinis
- MODEL_NAME (constante) - Nom du modèle
- GeminiMessage, GeminiAttachment, GeminiOptions (interfaces)
- AIAnalysisResult, QuizQuestion (interfaces legacy)

TEST MANUEL (dans un fichier temporaire ou API route) :

import { chatWithGemini, SYSTEM_PROMPTS } from '@/lib/ai/gemini';

async function testGemini() {
  try {
    const response = await chatWithGemini([
      { role: 'user', content: 'Dis bonjour en 10 mots maximum.' }
    ], {
      systemPrompt: SYSTEM_PROMPTS.student
    });
    
    console.log('✅ Gemini OK:', response);
    return { success: true, response };
  } catch (error) {
    console.error('❌ Gemini Error:', error);
    return { success: false, error: String(error) };
  }
}

VÉRIFICATION :
1. Variable GEMINI_API_KEY dans .env.local
2. Appeler testGemini() depuis une API route ou script
3. Vérifier le log console

NOTES :
- Test simple pour valider la connexion
- Si erreur "Clé API non configurée" → vérifier .env
- Si erreur réseau → vérifier la clé API est valide
```

---

## Résumé Phase 18

| Tâche | Fichier | Fonction |
|-------|---------|----------|
| 18.1 | package.json | Install @google/generative-ai |
| 18.2 | schema.prisma | AISettings + enums |
| 18.3 | gemini.ts | Configuration et constantes |
| 18.4 | gemini.ts | getGeminiApiKey |
| 18.5 | gemini.ts | Interfaces TypeScript |
| 18.6 | gemini.ts | getModel |
| 18.7 | gemini.ts | toGeminiContents |
| 18.8 | gemini.ts | chatWithGemini |
| 18.9 | gemini.ts | streamGemini |
| 18.10 | gemini.ts | Helpers multimodaux |
| 18.11 | gemini.ts | SYSTEM_PROMPTS |
| 18.12 | gemini.ts | GeminiService class |
| 18.13 | gemini.ts | analyzeClassProgress |
| 18.14 | gemini.ts | uploadToGeminiFileAPI |
| 18.15 | gemini.ts | Exports et tests |

**Total : 15 tâches**
