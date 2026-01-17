# Dashboard Élève

> **Chemin de navigation** : Login → **Dashboard Student**  
> **Route** : `/student`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/page.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── VOUS ÊTES ICI
```

---

## 📸 Aperçu Visuel

```
┌─────────────────────────────────────────────────────────────────────────┐
│ [Sidebar]  │  Dashboard                           🔍 Rechercher...  🔔 👤│
├────────────┼───────────────────────────────────────────────────────────┤
│            │                                                           │
│ Dashboard● │  ┌─────────────────────────────────────────────────────┐ │
│ Mes cours  │  │ Bonjour, Lucas 👋                                   │ │
│ Mes révis. │  │ Prêt à apprendre quelque chose de nouveau ?         │ │
│ Agenda     │  │ Classe : 1A                                         │ │
│ Assistant  │  └─────────────────────────────────────────────────────┘ │
│ IA         │                                                           │
│ Messages   │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐           │
│            │  │ 📚 0/2 │ │ 🟢 0%  │ │ 🏆 0%  │ │ 🕐 0h  │           │
│            │  │ Cours  │ │ Progre │ │ Score  │ │ Heures │           │
│            │  │ termin.│ │ -ssion │ │ moyen  │ │ passées│           │
│            │  └────────┘ └────────┘ └────────┘ └────────┘           │
│            │                                                           │
│            │  Accès rapide                                            │
│            │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐   │
│            │  │    💬    │ │    📅    │ │    📚    │ │    🤖    │   │
│            │  │          │ │          │ │          │ │          │   │
│            │  │Messagerie│ │  Agenda  │ │Mes Cours │ │Assistant │   │
│            │  │          │ │          │ │          │ │    IA    │   │
│            │  └──────────┘ └──────────┘ └──────────┘ └──────────┘   │
│            │                                                           │
└────────────┴───────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Card` | `@/components/ui/card` | Cards KPIs et Accès rapide |
| `Avatar` | `@/components/ui/avatar` | Avatar élève (header) |
| `Badge` | `@/components/ui/badge` | Badge classe "1A" |
| `Button` | `@/components/ui/button` | Cards cliquables accès rapide |
| `Progress` | `@/components/ui/progress` | Barre progression (si détaillée) |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/student/dashboard` | Récupérer données dashboard (KPIs + classe) | - |
| `GET` | `/api/student/stats` | Statistiques détaillées (cours, progression, score, temps) | - |

---

## 💾 Types & Interfaces

```typescript
interface StudentDashboardData {
  student: {
    id: string;
    firstName: string;
    lastName: string;
    email: string;
    avatar?: string;
    classId: string;
    className: string; // Ex: "1A"
  };
  stats: {
    coursesCompleted: number;
    coursesTotal: number;
    progressionPercentage: number; // 0-100
    averageScore: number; // 0-100
    hoursSpent: number; // En heures décimales
  };
}
```

---

## 📋 Structure de la Page

### Header Bienvenue (Bandeau bleu)

```
┌─────────────────────────────────────────────────┐
│ Bonjour, [Prénom] 👋                            │
│ Prêt à apprendre quelque chose de nouveau ?     │
│ Classe : [Nom Classe]                           │
└─────────────────────────────────────────────────┘
```

**Contenu** :
- Salutation personnalisée avec prénom de l'élève
- Message motivant
- Badge classe (ex: "Classe : 1A")

### KPIs (Indicateurs de Performance)

4 cards alignées horizontalement :

#### 1. 📚 Cours terminés
- **Icône** : 📚 (bleu)
- **Valeur** : `X/Y` (X = terminés, Y = total)
- **Label** : "Cours terminés"

#### 2. 🟢 Progression
- **Icône** : 🟢 (vert)
- **Valeur** : `X%` (pourcentage global)
- **Label** : "Progression"

#### 3. 🏆 Score moyen
- **Icône** : 🏆 (jaune/or)
- **Valeur** : `X%` (moyenne des scores)
- **Label** : "Score moyen"

#### 4. 🕐 Heures passées
- **Icône** : 🕐 (violet)
- **Valeur** : `Xh` (temps total)
- **Label** : "Heures passées"

### Accès Rapide

4 cards cliquables (boutons) :

#### 1. 💬 Messagerie
- **Icône** : 💬 (bleu)
- **Label** : "Messagerie"
- **Route** : `/student/messages`

#### 2. 📅 Agenda
- **Icône** : 📅 (vert)
- **Label** : "Agenda"
- **Route** : `/student/agenda`

#### 3. 📚 Mes Cours
- **Icône** : 📚 (violet)
- **Label** : "Mes Cours"
- **Route** : `/student/courses`

#### 4. 🤖 Assistant IA
- **Icône** : 🤖 (orange)
- **Label** : "Assistant IA"
- **Route** : `/student/ai`

---

## 🔄 Comportements

### Affichage initial
- Charge données dashboard depuis API
- Affiche nom élève + classe
- Affiche KPIs temps réel
- Calcul automatique des pourcentages

### Cards Accès rapide
- Hover : Effet d'élévation (shadow)
- Clic → Navigation vers la page correspondante

### Rafraîchissement
- Auto-refresh KPIs toutes les 30s (optionnel)
- Rechargement manuel : Pull-to-refresh (mobile)

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Cliquer Messagerie** | Redirection `/student/messages` |
| **Cliquer Agenda** | Redirection `/student/agenda` |
| **Cliquer Mes Cours** | Redirection `/student/courses` |
| **Cliquer Assistant IA** | Redirection `/student/ai` |
| **Recherche header** | Focus barre recherche → Recherche globale |
| **Clic notifications** | Ouvre panneau notifications |
| **Clic avatar** | Menu profil (Mon profil, Déconnexion) |

---

## 🎯 Calculs des KPIs

### Cours terminés
```typescript
const coursesCompleted = courses.filter(c => c.progress === 100).length;
const coursesTotal = courses.length;
// Affichage : `${coursesCompleted}/${coursesTotal}`
```

### Progression
```typescript
const progressionPercentage = 
  courses.reduce((sum, c) => sum + c.progress, 0) / courses.length;
// Affichage : `${Math.round(progressionPercentage)}%`
```

### Score moyen
```typescript
const completedCourses = courses.filter(c => c.finalScore !== null);
const averageScore = 
  completedCourses.reduce((sum, c) => sum + c.finalScore, 0) / completedCourses.length;
// Affichage : `${Math.round(averageScore)}%`
```

### Heures passées
```typescript
// Basé sur tracking temps par session
const totalMinutes = sessions.reduce((sum, s) => sum + s.duration, 0);
const hours = Math.floor(totalMinutes / 60);
// Affichage : `${hours}h`
```

---

## 📊 Récapitulatif Technique

**Type de page** : Dashboard personnalisé (Home élève)  
**Layout** : Header bienvenue + KPIs + Accès rapide  
**Données** : Temps réel depuis API `/api/student/dashboard`  
**Refresh** : Au chargement + optionnel auto-refresh  
**Responsive** : Grid adaptatif (4 cols → 2 cols → 1 col)  

**Performance** :
- Cache KPIs pendant 30s
- Preload routes accès rapide
- Lazy load stats détaillées

---

**Navigation** :
- → [Mes cours](courses/liste.md)
- → [Mes révisions](revisions/liste.md)
- → [Agenda](agenda/page.md)
- → [Assistant IA](ai/page.md)
- → [Messages](messages/page.md)

---

*Fichier créé le 13 décembre 2025*

