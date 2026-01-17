# Arborescence des Fichiers - BlaizBot Wireframe

> Mapping complet de l'arborescence du dossier `pages/` avec la numérotation hiérarchique A-XX-YY-ZZ

**Légende** :
- **A** = Auth | **B** = Admin | **C** = Student | **D** = Teacher
- **XX** = Section (01-99)
- **YY** = Sous-section (01-99)
- **ZZ** = Item (01-99)

---

## 📂 Structure Globale

```
pages/
├── A-auth/                    (Authentification - 3 pages)
├── B-admin/                   (Interface Admin - 5 sections)
├── C-student/                 (Interface Élève - 7 sections)
├── D-teacher/                 (Interface Professeur - 7 sections)
├── _TEMPLATE001.md           (Template de page)
└── NAVIGATION-ROADMAP.md     (Roadmap navigation fonctionnelle)
```

---

## 🔐 A-auth (Authentification)

```
A-auth/
├── A-01-01accueil.md         Wireframe : Page d'accueil
├── A-02-02accueil.png        Screenshot : Page d'accueil
├── A-03-03login.md           Wireframe : Page de connexion
├── A-04-04login.png          Screenshot : Page de connexion
├── A-05-05unauthorized.md    Wireframe : Accès non autorisé
└── A-06-06unauthorized.png   Screenshot : Accès non autorisé
```

**Total** : 3 pages × 2 fichiers (.md + .png) = 6 fichiers

---

## 👤 B-admin (Interface Administrateur)

### B-01-dashboard (Tableau de bord)
```
B-01-dashboard/
├── B-01-01-dashboard.md      Wireframe : Dashboard admin
└── B-01-02-dashboard.png     Screenshot : Dashboard admin
```

### B-02-header-menu (Menu d'en-tête)
```
B-02-header-menu/
├── B-02-01-01config-ia.md    Wireframe : Configuration IA
├── B-02-02-02config-ia.png   Screenshot : Configuration IA
├── B-02-03-03mon-profil.md   Wireframe : Mon profil
├── B-02-04-04mon-profil.png  Screenshot : Mon profil
├── B-02-05-05parametres.md   Wireframe : Paramètres
└── B-02-06-06parametres.png  Screenshot : Paramètres
```

### B-03-users (Gestion des utilisateurs)
```
B-03-users/
├── B-03-01-01create.md       Wireframe : Créer utilisateur
├── B-03-02-02create.png      Screenshot : Créer utilisateur
├── B-03-03-03edit.md         Wireframe : Modifier utilisateur
├── B-03-04-04edit.png        Screenshot : Modifier utilisateur
├── B-03-05-05liste.md        Wireframe : Liste utilisateurs
└── B-03-06-06liste.png       Screenshot : Liste utilisateurs
```

### B-04-classes (Gestion des classes)
```
B-04-classes/
├── B-04-01-01create.md       Wireframe : Créer classe
├── B-04-02-02create.png      Screenshot : Créer classe
├── B-04-03-03edit.md         Wireframe : Modifier classe
├── B-04-04-04edit.png        Screenshot : Modifier classe
├── B-04-05-05liste.md        Wireframe : Liste classes
└── B-04-06-06liste.png       Screenshot : Liste classes
```

### B-05-subjects (Gestion des matières)
```
B-05-subjects/
├── B-05-01-01create.md       Wireframe : Créer matière
├── B-05-02-02create.png      Screenshot : Créer matière
├── B-05-03-03edit.md         Wireframe : Modifier matière
├── B-05-04-04edit.png        Screenshot : Modifier matière
├── B-05-05-05liste.md        Wireframe : Liste matières
└── B-05-06-06liste.png       Screenshot : Liste matières
```

**Total** : 1 dashboard + 3 menu + 3×3 CRUD = 20 pages × 2 = 40 fichiers

---

## 🎓 C-student (Interface Élève)

### C-01-dashboard (Tableau de bord)
```
C-01-dashboard/
├── C-01-01-01dashboard.md    Wireframe : Dashboard élève
└── C-01-02-02dashboard.png   Screenshot : Dashboard élève
```

### C-02-header-menu (Menu d'en-tête)
```
C-02-header-menu/
├── C-02-01-01mon-profil.md   Wireframe : Mon profil
├── C-02-02-02mon-profil.png  Screenshot : Mon profil
├── C-02-03-03parametres.md   Wireframe : Paramètres
└── C-02-04-04parametres.png  Screenshot : Paramètres
```

### C-03-courses (Mes cours)
```
C-03-courses/
├── C-03-01-liste.md                                    Wireframe : Liste des cours
├── C-03-02-liste.png                                   Screenshot : Liste des cours
└── C-03-01-detail/                                     Détail d'un cours
    ├── C-03-01-01-[id].md                              Wireframe : Détail cours [id]
    ├── C-03-01-02-[id].png                             Screenshot : Détail cours [id]
    └── C-03-01-01-cards/                               Types de cartes
        ├── C-03-01-01-01-exercise/
        │   ├── C-03-01-01-01-01-[cardId].md            Wireframe : Carte exercice
        │   └── C-03-01-01-01-02-[cardId].png           Screenshot : Carte exercice
        ├── C-03-01-01-02-lesson/
        │   ├── C-03-01-01-02-01-[cardId].md            Wireframe : Carte leçon
        │   └── C-03-01-01-02-02-[cardId].png           Screenshot : Carte leçon
        ├── C-03-01-01-03-note/
        │   ├── C-03-01-01-03-01-[cardId].md            Wireframe : Carte note
        │   └── C-03-01-01-03-02-[cardId].png           Screenshot : Carte note
        ├── C-03-01-01-04-quiz/
        │   ├── C-03-01-01-04-01-[cardId].md            Wireframe : Carte quiz
        │   └── C-03-01-01-04-02-[cardId].png           Screenshot : Carte quiz
        └── C-03-01-01-05-video/
            ├── C-03-01-01-05-01-[cardId].md            Wireframe : Carte vidéo
            └── C-03-01-01-05-02-[cardId].png           Screenshot : Carte vidéo
```

### C-04-revisions (Mes révisions)
```
C-04-revisions/
├── C-04-01-01create.md                                 Wireframe : Créer révision
├── C-04-02-02create.png                                Screenshot : Créer révision
├── C-04-03-03liste.md                                  Wireframe : Liste révisions
├── C-04-04-04liste.png                                 Screenshot : Liste révisions
├── C-04-01-detail/                                     Détail d'une révision
│   ├── C-04-01-01-[id].md                              Wireframe : Détail révision [id]
│   ├── C-04-01-02-[id].png                             Screenshot : Détail révision [id]
│   └── C-04-01-01-cards/                               Types de cartes (idem C-03)
│       ├── C-04-01-01-01-exercise/
│       │   ├── C-04-01-01-01-01-[cardId].md
│       │   └── C-04-01-01-01-02-[cardId].png
│       ├── C-04-01-01-02-lesson/
│       │   ├── C-04-01-01-02-01-[cardId].md
│       │   └── C-04-01-01-02-02-[cardId].png
│       ├── C-04-01-01-03-note/
│       │   ├── C-04-01-01-03-01-[cardId].md
│       │   └── C-04-01-01-03-02-[cardId].png
│       ├── C-04-01-01-04-quiz/
│       │   ├── C-04-01-01-04-01-[cardId].md
│       │   └── C-04-01-01-04-02-[cardId].png
│       └── C-04-01-01-05-video/
│           ├── C-04-01-01-05-01-[cardId].md
│           └── C-04-01-01-05-02-[cardId].png
└── C-04-02-liste/                                      Fonctions liste
    ├── C-04-02-01-01create.png                         Screenshot : Créer depuis liste
    ├── C-04-02-02-02liaison-cours.md                   Wireframe : Liaison cours
    ├── C-04-02-03-03liste.png                          Screenshot : Liste révisions
    └── C-04-02-04-04supplement-card.md                 Wireframe : Supplément carte
```

### C-05-agenda (Mon agenda)
```
C-05-agenda/
├── C-05-01-01create-objectif.md                        Wireframe : Créer objectif
├── C-05-02-02create-objectif.png                       Screenshot : Créer objectif
├── C-05-03-03page.md                                   Wireframe : Page agenda
└── C-05-04-04page.png                                  Screenshot : Page agenda
```

### C-06-ai (IA Conversationnelle)
```
C-06-ai/
├── C-06-01-01create-conversation.md                    Wireframe : Créer conversation
├── C-06-02-02create-conversation.png                   Screenshot : Créer conversation
├── C-06-03-03page.md                                   Wireframe : Page IA
└── C-06-04-04page.png                                  Screenshot : Page IA
```

### C-07-messages (Messagerie)
```
C-07-messages/
├── C-07-01-01create-conversation.md                    Wireframe : Créer message
├── C-07-02-02create-conversation.png                   Screenshot : Créer message
├── C-07-03-03page.md                                   Wireframe : Page messages
└── C-07-04-04page.png                                  Screenshot : Page messages
```

**Total** : 1 dashboard + 2 menu + (1 liste + 1 detail + 5 cards) + (2 create + 1 liste + 1 detail + 5 cards + 2 liste-functions) + 3×2 pages = ~50 fichiers

---

## 👨‍🏫 D-teacher (Interface Professeur)

### D-01-dashboard (Tableau de bord)
```
D-01-dashboard/
├── D-01-01dashboard.md                                 Wireframe : Dashboard professeur
└── D-02-02dashboard.png                                Screenshot : Dashboard professeur
```

### D-02-header-menu (Menu d'en-tête)
```
D-02-header-menu/
├── D-02-01-01mon-profil.md                             Wireframe : Mon profil
├── D-02-02-02mon-profil.png                            Screenshot : Mon profil
├── D-02-03-03parametres.md                             Wireframe : Paramètres
└── D-02-04-04parametres.png                            Screenshot : Paramètres
```

### D-03-classes (Mes classes)
```
D-03-classes/
├── D-03-01-01liste.md                                  Wireframe : Liste classes
├── D-03-02-02liste.png                                 Screenshot : Liste classes
└── D-03-01-detail/
    ├── D-03-01-01-[id].md                              Wireframe : Détail classe [id]
    └── D-03-01-02-[id].png                             Screenshot : Détail classe [id]
```

### D-04-students (Mes élèves)
```
D-04-students/
├── D-04-01-01liste.md                                  Wireframe : Liste élèves
├── D-04-02-02liste.png                                 Screenshot : Liste élèves
└── D-04-01-detail/
    ├── D-04-01-01-[id].md                              Wireframe : Détail élève [id]
    ├── D-04-01-02-[id].png                             Screenshot : Détail élève [id]
    └── D-04-01-01-courses/                             Cours de l'élève
        ├── D-04-01-01-01-[courseId].md                 Wireframe : Cours élève [courseId]
        └── D-04-01-01-02-[courseId].png                Screenshot : Cours élève [courseId]
```

### D-05-courses (Mes cours)
```
D-05-courses/
├── D-05-01-01liste.md                                  Wireframe : Liste cours
├── D-05-02-02liste.png                                 Screenshot : Liste cours
├── D-05-03-03new.md                                    Wireframe : Nouveau cours
├── D-05-04-04new.png                                   Screenshot : Nouveau cours
└── D-05-01-detail/
    ├── D-05-01-01-[id].md                              Wireframe : Détail cours [id]
    ├── D-05-01-02-[id].png                             Screenshot : Détail cours [id]
    ├── D-05-01-03-03edit.md                            Wireframe : Modifier cours
    ├── D-05-01-04-04edit.png                           Screenshot : Modifier cours
    └── D-05-01-01-cards/                               Types de cartes
        ├── D-05-01-01-01-exercise/
        │   ├── D-05-01-01-01-01-[cardId].md            Wireframe : Carte exercice
        │   └── D-05-01-01-01-02-[cardId].png           Screenshot : Carte exercice
        ├── D-05-01-01-02-lesson/
        │   ├── D-05-01-01-02-01-[cardId].md            Wireframe : Carte leçon
        │   └── D-05-01-01-02-02-[cardId].png           Screenshot : Carte leçon
        ├── D-05-01-01-03-note/
        │   ├── D-05-01-01-03-01-[cardId].md            Wireframe : Carte note
        │   └── D-05-01-01-03-02-[cardId].png           Screenshot : Carte note
        ├── D-05-01-01-04-quiz/
        │   ├── D-05-01-01-04-01-[cardId].md            Wireframe : Carte quiz
        │   └── D-05-01-01-04-02-[cardId].png           Screenshot : Carte quiz
        └── D-05-01-01-05-video/
            ├── D-05-01-01-05-01-[cardId].md            Wireframe : Carte vidéo
            └── D-05-01-01-05-02-[cardId].png           Screenshot : Carte vidéo
```

### D-06-agendas-assignations (Agendas & Assignations)
```
D-06-agendas-assignations/
├── D-06-01-01create.md                                 Wireframe : Créer assignation
├── D-06-02-02create.png                                Screenshot : Créer assignation
├── D-06-03-03liste.md                                  Wireframe : Liste assignations
└── D-06-04-04liste.png                                 Screenshot : Liste assignations
```

### D-07-messages (Messagerie)
```
D-07-messages/
├── D-07-01-01create.md                                 Wireframe : Créer message
├── D-07-02-02create.png                                Screenshot : Créer message
├── D-07-03-03page.md                                   Wireframe : Page messages
└── D-07-04-04page.png                                  Screenshot : Page messages
```

**Total** : 1 dashboard + 2 menu + 2 listes + 2 details + (1 liste + 1 new + 1 detail + 1 edit + 5 cards) + 2×2 pages = ~40 fichiers

---

## 📊 Statistiques Globales

| Espace | Sections | Pages | Fichiers (.md + .png) |
|:---|---:|---:|---:|
| **A-auth** | 1 | 3 | 6 |
| **B-admin** | 5 | 20 | 40 |
| **C-student** | 7 | ~25 | ~50 |
| **D-teacher** | 7 | ~20 | ~40 |
| **TOTAL** | **20** | **~68** | **~136** |

---

## 🔍 Conventions de Nommage

### Fichiers Markdown (.md)
- **Wireframe** : Description en Markdown de la page/modale
- Contient la structure HTML/composants de la page

### Fichiers PNG (.png)
- **Screenshot** : Capture d'écran visuelle de la page
- Co-localisés avec les .md correspondants

### Fichiers Dynamiques
- **[id]** : ID unique de l'élément (cours, classe, révision, etc.)
- **[cardId]** : ID unique de la carte pédagogique
- **[courseId]** : ID unique du cours (contexte élève)

### Numérotation Hiérarchique
```
A-XX-YY-ZZ
│ │  │  │
│ │  │  └─ Item (01-99)
│ │  └──── Sous-section (01-99)
│ └─────── Section (01-99)
└───────── Espace (A=Auth, B=Admin, C=Student, D=Teacher)
```

---

## 🎯 Utilisation

Ce fichier sert de **référence technique** pour :
- Naviguer rapidement dans l'arborescence
- Identifier les fichiers manquants (screenshots)
- Mapper les wireframes vers l'exposé académique
- Automatiser l'insertion de screenshots dans les documents

Pour la **navigation fonctionnelle** de l'application, voir [NAVIGATION-ROADMAP.md](./NAVIGATION-ROADMAP.md).

---

**Dernière mise à jour** : 16 janvier 2026
**Version de numérotation** : A-XX-YY-ZZ (hiérarchique)
