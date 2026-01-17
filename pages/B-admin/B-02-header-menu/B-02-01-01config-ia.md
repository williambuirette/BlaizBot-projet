# Configuration IA (Menu Utilisateur)

> **Chemin de navigation** : Login → Dashboard Admin → Avatar (Header) → Menu déroulant → **Configuration IA**  
> **Accessible depuis** : Header (ADMIN uniquement)  
> **Composant source** : `src/components/features/ai/AIConfigModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Pages publiques
   └── 01-login.md

2. Authentification réussie (Admin)
   └── admin/00-dashboard.md

3. Header (présent sur toutes les pages)
   └── Avatar [AS] Admin SYSTÈME ▼
       └── Menu déroulant
           ├── Mon profil
           ├── Paramètres
           ├── Configuration IA ← VOUS ÊTES ICI (ADMIN UNIQUEMENT)
           └── Déconnexion
```

---

## 📸 Aperçu Visuel - Modale Configuration IA

```
┌───────────────────────────────────────────────────────────────┐
│  🤖 Configuration IA                                    [×]   │
│                                                               │
│  Configurez la clé API Gemini pour activer les               │
│  fonctionnalités IA.                                          │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  Statut                                ⚠️ Non configurée     │
│                                           (badge orange)      │
│                                                               │
│  Clé API Gemini                                               │
│  ┌────────────────────────────────────────────────────────┐  │
│  │ AIzaSy...                                          👁️  │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                               │
│  Obtenez votre clé sur Google AI Studio (lien bleu)          │
│                                                               │
│  [Tester la clé]          [Enregistrer] (bouton noir)        │
│   (bouton gris)                                               │
│                                                               │
│                    Annuler                                    │
│                                                               │
└───────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `Input` | `@/components/ui/input` | Champ de saisie de la clé API |
| `Button` | `@/components/ui/button` | Boutons d'action |
| `Badge` | `@/components/ui/badge` | Badge de statut |
| `Label` | `@/components/ui/label` | Labels des champs |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `GET` | `/api/admin/ai-config` | Récupérer la configuration IA (clé masquée) | - |
| `POST` | `/api/admin/ai-config` | Enregistrer la clé API | `{ apiKey: string }` |
| `POST` | `/api/admin/ai-config/test` | Tester la validité de la clé | `{ apiKey: string }` |

---

## 💾 Types & Interfaces

```typescript
interface AIConfigFormData {
  apiKey: string;        // Clé API Gemini
  status: 'configured' | 'not-configured' | 'invalid';
}

interface AIConfigResponse {
  success: boolean;
  data?: {
    status: 'configured' | 'not-configured';
    apiKeyPreview?: string;  // Ex: "AIzaSy...xyz" (masqué)
  };
  error?: string;
}

interface AITestResponse {
  success: boolean;
  data?: {
    valid: boolean;
    model?: string;  // Ex: "gemini-1.5-pro"
  };
  error?: string;
}
```

---

## 🎯 États du Statut

| Statut | Badge | Description |
|--------|-------|-------------|
| **Non configurée** | ⚠️ Orange | Aucune clé API enregistrée |
| **Configurée** | ✅ Vert | Clé API valide et fonctionnelle |
| **Invalide** | ❌ Rouge | Clé API invalide ou expirée |

---

## 🔄 Actions Utilisateur

| Action | Comportement |
|--------|--------------|
| **Affichage initial** | Récupère le statut + clé masquée si existante |
| **Toggle 👁️** | Affiche/masque la clé API en clair |
| **Tester la clé** | Appelle `/api/admin/ai-config/test` → affiche toast de résultat |
| **Enregistrer** | Enregistre la clé → test automatique → ferme si succès |
| **Annuler** | Ferme la modale sans enregistrer |
| **Fermer [×]** | Ferme la modale sans enregistrer |

---

## 🔒 Sécurité

| Règle | Implémentation |
|-------|----------------|
| **Stockage** | Clé chiffrée en base de données |
| **Affichage** | Masquée par défaut (`AIzaSy...xyz`) |
| **API** | Jamais renvoyée en clair (seulement preview) |
| **Validation** | Test de connexion avant enregistrement |

---

## 🔗 Lien Externe

**Google AI Studio** : `https://aistudio.google.com/app/apikey`
- Lien cliquable dans la modale
- Ouvre dans un nouvel onglet

---

## 📝 Workflow d'Enregistrement

```
1. Admin ouvre "Configuration IA"
   ↓
2. Saisit la clé API Gemini
   ↓
3. (Optionnel) Clique "Tester la clé"
   ├─ Succès : Toast vert "Clé valide ✅"
   └─ Échec : Toast rouge "Clé invalide ❌"
   ↓
4. Clique "Enregistrer"
   ├─ Test automatique de la clé
   ├─ Si valide : Enregistrement + fermeture + toast succès
   └─ Si invalide : Erreur + modale reste ouverte
```

---

## 🔗 Navigation

| Action | Destination |
|--------|-------------|
| ← Fermer [×] | Retour au Dashboard |
| Annuler | Retour au Dashboard |
| Succès | Toast + fermeture automatique |

---

## 📝 Notes

> **Exclusivité Admin** : Seul le rôle ADMIN peut accéder à cette configuration. Les TEACHER et STUDENT ne voient pas cet élément dans le menu.

> **Impact global** : La clé API configurée ici est utilisée par tous les utilisateurs pour les fonctionnalités IA (assistant, génération de contenu, etc.).

> **Validation** : Le bouton "Enregistrer" est désactivé si le champ est vide.

---

**← Retour** : [Dashboard Admin](../00-dashboard.md)

*Documentation générée par rétro-ingénierie de BlaizBot-V1*  
*Date : 13 décembre 2025*

