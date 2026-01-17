# Nouveau Supplément - Création

> **Chemin de navigation** : Login → Dashboard Élève → Mes révisions → **Bouton Nouveau**  
> **Route** : `/student/revisions/create`  
> **Rôle** : STUDENT  
> **Composant source** : `src/app/(dashboard)/student/revisions/create/page.tsx`

---

## 📸 Aperçu Fonctionnel (Structure)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  [Header]                                                                   │
├──────────────┬──────────────────────────────────────────────────────────────┤
│              │  Nouveau supplément                                          │
│  [Sidebar]   │  Créez des notes liées à un cours ou un cours personnel      │
│              │                                                              │
│              │  ┌────────────────────────────────────────────────────────┐ │
│              │  │  ← Créer un supplément                                 │ │
│              │  │                                                        │ │
│              │  │  Titre *                                                │ │
│              │  │  [ Input : Ex: Mes notes de Maths... ]                 │ │
│              │  │                                                        │ │
│              │  │  Description (optionnel)                               │ │
│              │  │  [ Textarea : Décrivez le contenu... ]                 │ │
│              │  │                                                        │ │
│              │  │  Type de supplément                                    │ │
│              │  │  ( ) Cours personnel (Indépendant)                      │ │
│              │  │  ( ) Lié à un cours (Notes complémentaires)             │ │
│              │  │                                                        │ │
│              │  │  [ Si "Lié à un cours" coché : ]                       │ │
│              │  │  Cours associé                                         │ │
│              │  │  [ Select : Sélectionner un cours... ]                 │ │
│              │  │                                                        │ │
│              │  │                                    [Annuler] [Créer]   │ │
│              │  └────────────────────────────────────────────────────────┘ │
└──────────────┴──────────────────────────────────────────────────────────────┘
```

---

## ⚙️ Logique Fonctionnelle

### 1. États du Formulaire
- **Titre (Obligatoire)** : Minimum 3 caractères.
- **Description (Optionnel)** : Champ texte libre.
- **Mode de Création (Sélecteur)** :
  - `personal` (Défaut) : Le supplément est autonome.
  - `linked` : Affiche dynamiquement le sélecteur de cours.

### 2. Chargement des Données (SSR)
- La page récupère via `getStudentCourses(userId)` la liste de tous les cours assignés à la classe de l'élève.
- Ces données alimentent le composant `Select` quand le mode "Lié à un cours" est sélectionné.

### 3. Soumission et Validation
- **Validation Client** : Vérification de la longueur du titre avant l'envoi.
- **Appel API** : `POST /api/student/supplements`.
- **Payload** :
  ```json
  {
    "title": "string",
    "description": "string | null",
    "courseId": "string | null" // null si 'personal'
  }
  ```
- **Redirection** : Après succès, redirection automatique vers la page de détail du supplément créé : `/student/revisions/${newId}`.

---

## 🧩 Composants Utilisés

| Composant | Bibliothèque | Rôle |
|-----------|--------------|------|
| `RadioGroup` | `shadcn/ui` | Sélection exclusive du type (Personnel vs Lié). |
| `Select` | `shadcn/ui` | Choix du cours parent (uniquement en mode lié). |
| `Card` | `shadcn/ui` | Conteneur visuel central. |
| `Input` / `Textarea` | `shadcn/ui` | Champs de saisie standard. |
| `Button` | `shadcn/ui` | Soumission et annulation. |

---

## 🔗 Endpoints & Flux de Données

| Méthode | Endpoint | Description |
|---------|----------|-------------|
| `GET` | *(SSR Prisma)* | Récupération des cours de l'élève pour le sélecteur. |
| `POST` | `/api/student/supplements` | Création de l'entité `StudentSupplement` dans la base. |

---

## 🔄 Flux Utilisateur (User Flow)

1. **Choix du Type** : Par défaut, "Cours personnel" est sélectionné.
2. **Affichage Conditionnel** : Si l'utilisateur clique sur "Lié à un cours", le champ "Cours associé" apparaît instantanément.
3. **Sélection du Cours** : L'élève choisit parmi les cours de ses professeurs.
4. **Validation** : Le bouton "Créer le supplément" passe en état `loading` pendant le traitement.
5. **Redirection** : L'utilisateur est envoyé vers son nouvel espace de révision.

---

## ✅ Checklist d'implémentation

- [x] Route `/student/revisions/create` fonctionnelle
- [x] Récupération SSR des cours de l'élève
- [x] Toggle dynamique entre mode Personnel et Lié
- [x] Validation du titre (min 3 chars)
- [x] Liaison `courseId` lors de la création
- [x] Redirection post-création
- [x] Gestion des états d'erreur et de loading
