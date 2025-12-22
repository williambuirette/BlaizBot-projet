# 1. Idée & Problématique

> Ce chapitre documente la phase de réflexion initiale : du brainstorming à la définition précise du MVP.

---

## 1.1 Brainstorming initial

### 1.1.1 Questions de départ

Avant de coder, nous avons posé les questions fondamentales :

| Question | Réflexion |
| :--- | :--- |
| **Quel problème résoudre ?** | Les élèves manquent d'accompagnement personnalisé |
| **Qui sont les utilisateurs ?** | Élèves, professeurs, administrateurs |
| **Quelle valeur apporter ?** | IA comme tuteur bienveillant, pas correcteur |
| **Quels risques ?** | Dépendance IA, hallucinations, coût API |

### 1.1.2 Idées explorées

Durant le brainstorming avec ChatGPT, plusieurs directions ont été envisagées :

1. ❌ Chatbot simple de Q&A → Trop basique
2. ❌ Générateur d'exercices automatique → Complexe, hors scope
3. ❌ Plateforme de cours en ligne → Existe déjà (Moodle, etc.)
4. ✅ **Assistant IA intégré dans une plateforme éducative** → Retenu

### 1.1.3 Direction retenue

> **BlaizBot** : Une plateforme éducative où l'IA accompagne l'apprentissage sans remplacer l'enseignant.

**Rétro-prompt (reconstitué)** :
```
Je veux créer une application éducative innovante.
Le but est d'utiliser l'IA comme assistant d'apprentissage.
Aide-moi à définir :
1. Le problème à résoudre
2. Les utilisateurs cibles
3. Ce qui différencie cette solution des existantes
```

## 1.2 Définition précise du but

### 1.2.1 Phrase objectif

> *Créer une plateforme web où l'IA aide les élèves à progresser via un accompagnement personnalisé, tout en donnant aux professeurs des outils de suivi efficaces.*

### 1.2.2 Critères de réussite (mesurables)

| # | Critère | Mesure |
| :--- | :--- | :--- |
| 1 | Application fonctionnelle | 3 dashboards navigables |
| 2 | IA intégrée | Chat fonctionnel avec réponses contextuelles |
| 3 | Données persistantes | CRUD complet sur utilisateurs/cours |
| 4 | Authentification | Login/logout avec rôles différenciés |
| 5 | Documentation | Exposé complet avec preuves |

### 1.2.3 Hypothèses

| Hypothèse | Validation prévue |
| :--- | :--- |
| L'IA peut aider sans donner les réponses | Test avec prompts "hint-only" |
| Un wireframe accélère le développement | Comparaison temps estimé vs réel |
| Le Vibe Coding multiplie la productivité | Métriques de temps par fonctionnalité |

## 1.3 Périmètre MVP

### 1.3.1 Fonctionnalités IN (indispensables)

**Élève** :
- ✅ Dashboard avec progression
- ✅ Chat avec assistant IA
- ✅ Accès aux cours
- ✅ Planning de révisions

**Professeur** :
- ✅ Tableau de bord classe
- ✅ Gestion des élèves
- ✅ Création de cours
- ✅ Suivi individuel

**Admin** :
- ✅ Gestion utilisateurs
- ✅ Statistiques globales

### 1.3.2 Fonctionnalités OUT (hors scope V1)

- ❌ Application mobile native
- ❌ Visioconférence intégrée
- ❌ Marketplace de cours
- ❌ Gamification avancée (badges, niveaux)
- ❌ Multi-établissements

### 1.3.3 Priorisation MoSCoW

| Priorité | Fonctionnalités |
| :--- | :--- |
| **Must** | Auth, Dashboards, Chat IA, CRUD cours |
| **Should** | Calendrier, Messagerie, Suivi progression |
| **Could** | Notifications, Export PDF, Thèmes |
| **Won't** | Mobile native, Marketplace, Visio |

## 1.4 Preuves

### 1.4.1 Captures requises

- [ ] `01-idee/brainstorming-chatgpt.png` - Session de brainstorming
- [ ] `01-idee/decision-finale.png` - Choix de direction
- [ ] `01-idee/tableau-moscow.png` - Priorisation MoSCoW

### 1.4.2 Journal de bord

```
Date/heure : [À compléter]
Étape : 1 - Brainstorming & problématique
Objectif : Définir l'idée et le périmètre MVP
Prompt utilisé : "Je veux créer une application éducative..."
Résultat : Direction BlaizBot retenue, MVP défini
Décision : Focus sur 3 rôles (élève, prof, admin)
Justification : Couvre tous les cas d'usage éducatifs
```

---

**Mots-clés** : brainstorming, problématique, MVP, MoSCoW, critères de réussite
**Statut** : ✅ Réalisé (à documenter rétroactivement)
