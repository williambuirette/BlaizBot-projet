# 4. Spécifications Produit (PRD)

> Ce chapitre documente les exigences fonctionnelles : utilisateurs, user stories, règles métier et critères d'acceptation.

---

## 4.1 Utilisateurs & rôles

### 4.1.1 Vue d'ensemble

```
┌─────────────────────────────────────────────────────────────┐
│                      BLAIZBOT                               │
├─────────────────┬─────────────────┬─────────────────────────┤
│     ÉLÈVE       │   PROFESSEUR    │    ADMINISTRATEUR       │
├─────────────────┼─────────────────┼─────────────────────────┤
│ • Apprendre     │ • Enseigner     │ • Gérer                 │
│ • Réviser       │ • Suivre        │ • Piloter               │
│ • Progresser    │ • Créer         │ • Configurer            │
│ • Communiquer   │ • Évaluer       │ • Superviser            │
└─────────────────┴─────────────────┴─────────────────────────┘
```

### 4.1.2 Profil Élève

| Attribut | Description |
| :--- | :--- |
| **Qui** | Collégiens, lycéens (12-18 ans) |
| **Objectif** | Progresser dans les matières, obtenir de l'aide |
| **Fréquence** | Usage quotidien (devoirs, révisions) |
| **Niveau tech** | Familier avec apps mobiles/web |

**Besoins principaux** :
1. Aide personnalisée (pas les réponses, des indices)
2. Suivi de progression visuel
3. Organisation des révisions
4. Communication avec les professeurs

### 4.1.3 Profil Professeur

| Attribut | Description |
| :--- | :--- |
| **Qui** | Enseignants toutes matières |
| **Objectif** | Suivre les élèves, créer du contenu |
| **Fréquence** | Usage quotidien (préparation, suivi) |
| **Niveau tech** | Variable (interface simple requise) |

**Besoins principaux** :
1. Vue globale de la classe
2. Identification des élèves en difficulté
3. Création de cours et exercices
4. Communication ciblée

### 4.1.4 Profil Administrateur

| Attribut | Description |
| :--- | :--- |
| **Qui** | Personnel administratif, direction |
| **Objectif** | Gérer l'établissement, piloter |
| **Fréquence** | Hebdomadaire |
| **Niveau tech** | Basique à intermédiaire |

**Besoins principaux** :
1. Gestion des comptes utilisateurs
2. Organisation (classes, matières)
3. Statistiques globales
4. Configuration système

## 4.2 User Stories & Critères d'acceptation

### 4.2.1 User Stories Élève

#### US-E1 : Consulter ma progression
```
En tant qu'élève,
Je veux voir ma progression par matière,
Afin de savoir où concentrer mes efforts.

Critères d'acceptation :
✅ Graphique de progression visible sur le dashboard
✅ Pourcentage de complétion par matière
✅ Liste des compétences acquises/en cours
✅ Historique des dernières activités
```

#### US-E2 : Discuter avec l'assistant IA
```
En tant qu'élève,
Je veux poser des questions à Blaiz'bot,
Afin d'obtenir de l'aide sur mes devoirs.

Critères d'acceptation :
✅ Interface de chat accessible
✅ Réponses en moins de 5 secondes
✅ L'IA donne des indices, pas les réponses directes
✅ Historique des conversations conservé
```

#### US-E3 : Accéder à mes cours
```
En tant qu'élève,
Je veux consulter les cours de mes matières,
Afin de réviser le contenu.

Critères d'acceptation :
✅ Liste des cours par matière
✅ Contenu lisible (texte, images)
✅ Possibilité de marquer comme "lu"
✅ Recherche dans les cours
```

### 4.2.2 User Stories Professeur

#### US-P1 : Voir le tableau de bord classe
```
En tant que professeur,
Je veux voir un résumé de ma classe,
Afin d'identifier rapidement les situations à traiter.

Critères d'acceptation :
✅ KPIs visibles (moyenne, progression, alertes)
✅ Liste des élèves avec statut
✅ Alertes sur élèves en difficulté
✅ Accès rapide aux actions fréquentes
```

#### US-P2 : Créer un cours
```
En tant que professeur,
Je veux créer un nouveau cours,
Afin de partager du contenu avec mes élèves.

Critères d'acceptation :
✅ Formulaire de création (titre, contenu, matière)
✅ Éditeur de texte riche
✅ Upload de fichiers (PDF, images)
✅ Assignation à une ou plusieurs classes
```

#### US-P3 : Suivre un élève individuellement
```
En tant que professeur,
Je veux voir le détail d'un élève,
Afin de personnaliser mon accompagnement.

Critères d'acceptation :
✅ Fiche élève avec infos générales
✅ Progression par matière
✅ Historique des interactions IA
✅ Notes et commentaires personnels
```

### 4.2.3 User Stories Admin

#### US-A1 : Gérer les utilisateurs
```
En tant qu'admin,
Je veux créer/modifier/supprimer des utilisateurs,
Afin de gérer les accès à la plateforme.

Critères d'acceptation :
✅ Liste des utilisateurs avec filtres
✅ Formulaire de création (nom, email, rôle)
✅ Modification des informations
✅ Désactivation de compte (pas suppression définitive)
```

#### US-A2 : Consulter les statistiques
```
En tant qu'admin,
Je veux voir les statistiques globales,
Afin de piloter l'usage de la plateforme.

Critères d'acceptation :
✅ Nombre d'utilisateurs actifs
✅ Cours les plus consultés
✅ Taux d'utilisation de l'IA
✅ Export des données (CSV)
```

## 4.3 Règles pédagogiques

### 4.3.1 Comportement de l'IA

| Règle | Description |
| :--- | :--- |
| **Hint-only** | L'IA guide sans donner la réponse |
| **Encouragement** | Ton positif et bienveillant |
| **Adaptation** | Niveau de détail selon le contexte |
| **Limites** | Refus poli si question hors sujet |

**Exemple de prompt IA** :
```
Tu es Blaiz'bot, un assistant éducatif bienveillant.
Règles :
- Ne jamais donner la réponse directement
- Poser des questions pour guider la réflexion
- Encourager les efforts de l'élève
- Suggérer des ressources si l'élève est bloqué
```

### 4.3.2 Progression et notation

| Élément | Implémentation |
| :--- | :--- |
| Compétences | Liste par matière, statut acquis/en cours |
| Progression | % calculé sur exercices complétés |
| Pas de notes chiffrées | Focus sur l'acquisition, pas le classement |

## 4.4 Données & confidentialité

### 4.4.1 Données collectées

| Donnée | Finalité | Rétention |
| :--- | :--- | :--- |
| Profil utilisateur | Identification | Durée du compte |
| Progression | Suivi pédagogique | Année scolaire |
| Conversations IA | Amélioration | 30 jours |
| Logs d'accès | Sécurité | 90 jours |

### 4.4.2 Principes RGPD

- ✅ Minimisation des données
- ✅ Pas de données sensibles (santé, religion)
- ✅ Droit à l'oubli (suppression sur demande)
- ✅ Consentement pour l'IA

## 4.5 Preuves

### 4.5.1 Captures requises

- [ ] `04-prd/user-stories-liste.png` - Liste des US
- [ ] `04-prd/criteres-acceptation.png` - Exemple de CA
- [ ] `04-prd/regles-ia.png` - Configuration IA

### 4.5.2 Journal de bord

```
Date/heure : [À compléter]
Étape : 4 - Spécifications PRD
Objectif : Définir les exigences fonctionnelles
Prompt utilisé : "Définis les user stories pour une plateforme éducative..."
Résultat : 8 US principales avec critères d'acceptation
Décision : Mode "hint-only" pour l'IA
Justification : Objectif pédagogique > facilité
```

---

**Mots-clés** : PRD, user stories, critères d'acceptation, rôles, RGPD
**Statut** : ✅ Réalisé (documentation existante dans BlaizBot-V1/docs/)
