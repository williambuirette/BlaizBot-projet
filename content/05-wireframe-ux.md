# 5. UX/UI : Wireframe & Flux

> Ce chapitre documente la phase de conception visuelle : wireframes interactifs, parcours utilisateurs et états de l'interface.

---

## 5.1 Méthodologie de wireframing

### 5.1.1 Approche Vibe Coding

Contrairement à l'approche traditionnelle (Figma → Export → Code), nous avons appliqué le **Vibe Coding** :

```
┌─────────────────────────────────────────────────────────────┐
│              APPROCHE TRADITIONNELLE                        │
│  Figma (3 jours) → Export → Intégration (5 jours) = 8 jours │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│              APPROCHE VIBE CODING                           │
│  HTML/CSS/JS direct (2 jours) → Référence pour prod = 2 j   │
└─────────────────────────────────────────────────────────────┘
```

**Avantages** :
- Feedback visuel instantané (F5)
- Wireframe interactif = spec vivante
- Réutilisation du design system en production

### 5.1.2 Outils utilisés

| Outil | Usage |
| :--- | :--- |
| HTML5 | Structure sémantique |
| CSS3 + Variables | Design system |
| JavaScript ES6+ | Interactions |
| Live Server | Auto-refresh |

## 5.2 Design System

### 5.2.1 Palette de couleurs

```css
:root {
    /* Couleurs principales */
    --primary-color: #3498db;      /* Bleu - Confiance */
    --secondary-color: #2ecc71;    /* Vert - Succès */
    --accent-color: #e74c3c;       /* Rouge - Alerte */
    --warning-color: #f39c12;      /* Orange - Attention */
    
    /* Neutres */
    --dark: #2c3e50;
    --gray: #95a5a6;
    --light: #ecf0f1;
    --white: #ffffff;
}
```

*Listing 5.1 : Variables CSS du design system*

### 5.2.2 Typographie

| Élément | Police | Taille |
| :--- | :--- | :--- |
| Titres H1 | Segoe UI Bold | 28px |
| Titres H2 | Segoe UI Semibold | 22px |
| Corps | Segoe UI Regular | 16px |
| Small | Segoe UI Light | 14px |

### 5.2.3 Espacements (8px grid)

```css
--spacing-xs: 4px;
--spacing-sm: 8px;
--spacing-md: 16px;
--spacing-lg: 24px;
--spacing-xl: 32px;
```

## 5.3 Wireframes par écran

### 5.3.1 Dashboard Élève

![Dashboard Élève](../assets/screenshots/05-wireframe/dashboard-student.png)
*Figure 5.1 : Dashboard élève avec progression et assistant IA*

**Sections** :

| Zone | Contenu |
| :--- | :--- |
| Sidebar | 8 sections de navigation |
| Header | Recherche, notifications, profil |
| Main | Contenu dynamique selon section |

**Navigation** :
1. 🏠 Tableau de bord - KPIs, progression, raccourcis
2. 🤖 Assistant Blaiz'bot - Chat IA
3. 🔬 Blaiz'Lab - Espace projet libre
4. 📚 Mes Révisions - Planning généré
5. 📅 Mon Agenda - Calendrier
6. 💬 Messages - Communication
7. 📊 Mes Résultats - Notes, compétences
8. 👤 Mon Profil - Paramètres

### 5.3.2 Dashboard Professeur

![Dashboard Professeur](../assets/screenshots/05-wireframe/dashboard-teacher.png)
*Figure 5.2 : Dashboard professeur avec calendrier et gestion des classes*

**Sections** :

| Zone | Fonctionnalité clé |
| :--- | :--- |
| Tableau de bord | KPIs classe, alertes |
| Mes Classes | Liste élèves par classe |
| Cours & Ressources | CRUD contenu |
| Suivi Élèves | Fiches individuelles |
| Planning | Calendrier interactif |
| Messagerie | Communication thématique |

**Fonctionnalité phare : Calendrier interactif**

```javascript
// Fonctionnalités du calendrier
- Navigation mois précédent/suivant
- Affichage événements sur les dates
- Sélection de plages de dates
- Filtrage par classe/matière
- Création d'événements (devoirs, soutien)
```

### 5.3.3 Dashboard Admin

![Dashboard Admin](../assets/screenshots/05-wireframe/dashboard-admin.png)
*Figure 5.3 : Dashboard admin avec statistiques globales*

**Sections** :

| Zone | Fonctionnalité |
| :--- | :--- |
| Statistiques | Graphiques, KPIs |
| Utilisateurs | CRUD complet |
| Organisation | Classes, matières |
| Paramètres | Configuration système |

## 5.4 Parcours utilisateur (Flows)

### 5.4.1 Flow connexion

```
┌─────────┐     ┌─────────────┐     ┌──────────────────┐
│  Login  │ ──▶ │ Vérification│ ──▶ │ Redirection rôle │
│  Page   │     │   Auth      │     │ (student/teacher │
└─────────┘     └─────────────┘     │  /admin)         │
                     │              └──────────────────┘
                     ▼ (échec)
              ┌─────────────┐
              │   Erreur    │
              │ (retry/pwd) │
              └─────────────┘
```

### 5.4.2 Flow élève : demander de l'aide

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Dashboard  │ ──▶ │  Chat IA    │ ──▶ │   Saisie    │
│    Élève    │     │  Blaiz'bot  │     │  Question   │
└─────────────┘     └─────────────┘     └──────┬──────┘
                                               │
                    ┌─────────────┐             │
                    │  Réponse IA │ ◀───────────┘
                    │  (indices)  │
                    └──────┬──────┘
                           │
              ┌────────────┴────────────┐
              ▼                         ▼
      ┌─────────────┐           ┌─────────────┐
      │  Compris !  │           │  Relance    │
      │  (retour)   │           │  (autre Q)  │
      └─────────────┘           └─────────────┘
```

### 5.4.3 Flow professeur : créer un cours

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Cours &   │ ──▶ │  Bouton     │ ──▶ │  Formulaire │
│  Ressources │     │ "Nouveau"   │     │  Création   │
└─────────────┘     └─────────────┘     └──────┬──────┘
                                               │
                                               ▼
                                       ┌─────────────┐
                                       │   Éditeur   │
                                       │   Contenu   │
                                       └──────┬──────┘
                                               │
                    ┌─────────────┐             │
                    │   Publié !  │ ◀───────────┘
                    │   (toast)   │
                    └─────────────┘
```

## 5.5 États UI

### 5.5.1 États standards

| État | Description | Exemple |
| :--- | :--- | :--- |
| **Vide** | Aucune donnée | "Pas encore de cours" |
| **Loading** | Chargement | Spinner animé |
| **Succès** | Action réussie | Toast vert |
| **Erreur** | Problème | Message rouge + action |

### 5.5.2 Exemples implémentés

```javascript
// État vide
<div class="empty-state">
    <span class="icon">📚</span>
    <p>Aucun cours disponible</p>
    <button>Créer mon premier cours</button>
</div>

// État loading
<div class="loading">
    <div class="spinner"></div>
    <p>Chargement en cours...</p>
</div>

// État erreur
<div class="error-state">
    <span class="icon">⚠️</span>
    <p>Une erreur est survenue</p>
    <button>Réessayer</button>
</div>
```

## 5.6 Métriques du wireframe

| Métrique | Valeur |
| :--- | :--- |
| **Temps de création** | 11 heures (2 jours) |
| **Fichiers HTML** | 4 (index, student, teacher, admin) |
| **Lignes CSS** | 1,316 |
| **Lignes JS** | 2,139 |
| **Composants UI** | 25+ |
| **Dépendances** | 0 (Vanilla uniquement) |

## 5.7 Preuves

### 5.7.1 Captures requises

- [ ] `05-wireframe/dashboard-student.png`
- [ ] `05-wireframe/dashboard-teacher.png`
- [ ] `05-wireframe/dashboard-admin.png`
- [ ] `05-wireframe/calendrier-interactif.png`
- [ ] `05-wireframe/chat-blaizbot.png`
- [ ] `05-wireframe/etats-ui.png`

### 5.7.2 Journal de bord

```
Date/heure : 20-21 décembre 2025
Étape : 5 - Création wireframe
Objectif : Wireframe interactif haute-fidélité
Prompt utilisé : "Crée un dashboard enseignant avec sidebar..."
Résultat : 4 pages HTML, design system complet
Problème : Calendrier multi-jours complexe
Décision : Centraliser l'état dans un objet calendarState
Preuve : blaizbot-wireframe/ (6,244 lignes)
```

---

**Mots-clés** : wireframe, UX, design system, flows, états UI
**Statut** : ✅ Réalisé (blaizbot-wireframe/ complet)
