# Paramètres (Menu Utilisateur)

> **Chemin de navigation** : Login → Dashboard Teacher → Avatar (Header) → Menu déroulant → **Paramètres**  
> **Accessible depuis** : Header (tous les rôles)  
> **Composant source** : `src/components/features/settings/SettingsModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Professeur)
   └── teacher/dashboard.md

3. Header (présent sur toutes les pages)
   └── Avatar [MD] Marc DUPONT ▼
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
| `Textarea` | `@/components/ui/textarea` | Zone de texte prompt IA |
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
  
  // Assistant IA (Teacher uniquement)
  ai?: {
    systemPrompt: string;
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
  ai: {
    systemPrompt: "Tu es un assistant pédagogique bienveillant.\nTu aides les élèves à comprendre leurs cours sans donner directement les réponses.\nTu encourages la réflexion et poses des questions pour guider l'apprentissage.",
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
| **Rappels avant les deadlines** | ON | Alertes avant les échéances importantes |
| **Alertes nouvelles soumissions** | ON | Notification lors de nouvelles soumissions d'élèves |

### Section Préférences
| Paramètre | Options | Défaut |
|-----------|---------|--------|
| **Langue** | Français, English, Español | Français |
| **Thème** | Clair, Sombre, Système | Système |

### Section Assistant IA
> **Visible pour** : TEACHER et ADMIN (pas pour STUDENT)

- Zone de texte éditable pour personnaliser le comportement de l'IA
- Bouton "Restaurer le prompt par défaut" pour réinitialiser
- Le prompt définit le ton et les limites de l'assistant IA pour les élèves du professeur

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Toggle notification** | Sauvegarde automatique + toast de confirmation |
| **Changement langue** | Recharge l'interface dans la nouvelle langue |
| **Changement thème** | Application immédiate du thème |
| **Modification prompt IA** | Sauvegarde au changement de focus |
| **Restaurer prompt défaut** | Confirmation → restauration du texte par défaut |
| **Réinitialiser paramètres** | Modale de confirmation → reset complet |
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
> - **STUDENT** : Pas de section "Assistant IA"
> - **TEACHER** : Section "Assistant IA" visible (définit le comportement pour ses élèves)
> - **ADMIN** : Section "Assistant IA" visible (définit le comportement global)

> **Sauvegarde** : 
> - Toggles et selects : sauvegarde immédiate
> - Prompt IA : sauvegarde automatique (debounce 500ms)
> - Confirmation pour actions destructives (reset)

> **Scope du prompt IA Teacher** :
> - Le prompt IA défini par un professeur s'applique uniquement à SES élèves
> - Chaque professeur peut personnaliser le comportement de l'IA pour ses classes

---

**← Retour** : [Dashboard Teacher](../dashboard.md)

*Documentation générée par rétro-ingénierie de BlaizBot-V1*  
*Date : 13 décembre 2025*

