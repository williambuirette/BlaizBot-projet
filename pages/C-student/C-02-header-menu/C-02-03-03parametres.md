# Paramètres (Menu Utilisateur)

> **Chemin de navigation** : Login → Dashboard Student → Avatar (Header) → Menu déroulant → **Paramètres**  
> **Accessible depuis** : Header (tous les rôles)  
> **Composant source** : `src/components/features/settings/SettingsModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Élève)
   └── student/dashboard.md

3. Header (présent sur toutes les pages)
   └── Avatar [LM] Lucas MARTIN ▼
       └── Menu déroulant
           ├── Mon profil
           ├── Paramètres ← VOUS ÊTES ICI
           └── Déconnexion
```

---

## 📸 Aperçu Visuel - Modale Paramètres

```
┌─────────────────────────────────────────────────────────────────┐
│  ⚙️ Paramètres                                            [×]   │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  🔔 Notifications                                               │
│                                                                 │
│     Notifications par email              ┌──────────┐          │
│                                          │ ● ON     │          │
│                                          └──────────┘          │
│                                                                 │
│     Notifications push                   ┌──────────┐          │
│                                          │   OFF  ○ │          │
│                                          └──────────┘          │
│                                                                 │
│     Rappels avant les deadlines          ┌──────────┐          │
│                                          │ ● ON     │          │
│                                          └──────────┘          │
│                                                                 │
│     Alertes nouvelles soumissions        ┌──────────┐          │
│                                          │ ● ON     │          │
│                                          └──────────┘          │
│                                                                 │
│  ⚙️ Préférences                                                 │
│                                                                 │
│     Langue                                                      │
│     ┌──────────────────────────────────────┐                   │
│     │ Français                          ▼  │                   │
│     └──────────────────────────────────────┘                   │
│                                                                 │
│     Thème                                                       │
│     ┌──────────────────────────────────────┐                   │
│     │ Système                           ▼  │                   │
│     └──────────────────────────────────────┘                   │
│                                                                 │
│  🤖 Assistant IA                                                │
│                                                                 │
│     Prompt système   (instructions générales pour l'IA)        │
│     ┌───────────────────────────────────────────────────────┐  │
│     │ Tu es un assistant pédagogique bienveillant.         │  │
│     │ Tu aides les élèves à comprendre leurs cours sans   │  │
│     │ donner directement les réponses.                     │  │
│     │ Tu encourages la réflexion et poses des questions   │  │
│     │ pour guider l'apprentissage.                         │  │
│     │                                                      ✏️  │
│     └───────────────────────────────────────────────────────┘  │
│                                                                 │
│     Ce prompt définit le comportement général de l'IA pour     │
│     vos élèves.                                                 │
│                                                                 │
│     [Restaurer le prompt par défaut]                           │
│                                                                 │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │         ↻ Réinitialiser les paramètres                   │  │
│  └──────────────────────────────────────────────────────────┘  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `Switch` | `@/components/ui/switch` | Toggles de notifications |
| `Select` | `@/components/ui/select` | Dropdowns (langue, thème) |
| `Textarea` | `@/components/ui/textarea` | Zone de texte prompt IA (lecture seule pour Student) |
| `Button` | `@/components/ui/button` | Boutons d'action |
| `Label` | `@/components/ui/label` | Labels des champs |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/user/settings` | Récupérer les paramètres utilisateur | - |
| `PATCH` | `/api/user/settings` | Mettre à jour les paramètres | `SettingsFormData` |
| `POST` | `/api/user/settings/reset` | Réinitialiser aux valeurs par défaut | - |

---

## 💾 Types & Interfaces

```typescript
interface SettingsFormData {
  // Notifications
  notifications: {
    email: boolean;
    push: boolean;
    deadlineReminders: boolean;
    submissionAlerts: boolean;
  };
  
  // Préférences
  preferences: {
    language: 'fr' | 'en' | 'es';
    theme: 'light' | 'dark' | 'system';
  };
  
  // Assistant IA (affiché mais non éditable pour Student)
  ai?: {
    systemPrompt: string; // Lecture seule pour STUDENT
  };
}

// Valeurs par défaut
const DEFAULT_SETTINGS: SettingsFormData = {
  notifications: {
    email: true,
    push: false,
    deadlineReminders: true,
    submissionAlerts: true,
  },
  preferences: {
    language: 'fr',
    theme: 'system',
  },
};
```

---

## 🎯 Comportements Spécifiques

### Section Notifications
| Paramètre | Défaut | Description |
|-----------|--------|-------------|
| **Notifications par email** | ON | Recevoir les notifications par email |
| **Notifications push** | OFF | Notifications navigateur (nécessite permission) |
| **Rappels avant les deadlines** | ON | Alertes avant les échéances de devoirs |
| **Alertes nouvelles soumissions** | ON | Notification de nouveaux contenus/devoirs |

### Section Préférences
| Paramètre | Options | Défaut |
|-----------|---------|--------|
| **Langue** | Français, English, Español | Français |
| **Thème** | Clair, Sombre, Système | Système |

### Section Assistant IA
> **Pour STUDENT** : Affichage en lecture seule (défini par le professeur)

- Zone de texte non éditable (icône ✏️ indique que c'est éditable par le professeur)
- Bouton "Restaurer le prompt par défaut" désactivé pour Student
- Message informatif : "Ce prompt définit le comportement général de l'IA pour vos élèves." (défini par le professeur)

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Toggle notification** | Sauvegarde automatique + toast de confirmation |
| **Changement langue** | Recharge l'interface dans la nouvelle langue |
| **Changement thème** | Application immédiate du thème |
| **Voir prompt IA** | Lecture seule (défini par le professeur) |
| **Réinitialiser paramètres** | Modale de confirmation → reset notifications + préférences (pas IA) |
| **Fermer [×]** | Fermeture de la modale |

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| ← Fermer [×] | Retour au Dashboard |
| Changement langue | Recharge la page avec nouvelle locale |
| Réinitialiser | Confirmation → reload settings |

---

## 📝 Notes

> **Différences par rôle** :
> - **STUDENT** : Section "Assistant IA" visible en **lecture seule** (défini par le professeur)
> - **TEACHER** : Section "Assistant IA" **éditable** (définit le comportement pour ses élèves)
> - **ADMIN** : Section "Assistant IA" **éditable** (définit le comportement global)

> **Sauvegarde** : 
> - Toggles et selects : sauvegarde immédiate
> - Prompt IA : non éditable pour Student
> - Confirmation pour actions destructives (reset)

> **Scope du prompt IA pour Student** :
> - Le prompt IA affiché est celui défini par son professeur
> - L'élève peut le voir mais ne peut pas le modifier
> - Le bouton "Restaurer" est désactivé pour les élèves

---

**← Retour** : [Dashboard Student](../dashboard.md)

*Documentation générée par rétro-ingénierie de BlaizBot-V1*  
*Date : 13 décembre 2025*
