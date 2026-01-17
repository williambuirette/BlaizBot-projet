# ➕ Modale : Nouvel Objectif Personnel

> **Chemin de navigation** : Dashboard Student → Agenda → **[+ Nouvel objectif]**  
> **Route** : `/student/agenda` (modale)  
> **Rôle** : STUDENT  
> **Composant source** : `src/components/features/student/agenda/CreateObjectiveModal.tsx`

---

## 📍 Parcours Utilisateur

```
1. Dashboard Student
   └── student/dashboard.md

2. Sidebar → Agenda
   └── student/agenda/page.md

3. Clic [+ Nouvel objectif]
   └── VOUS ÊTES ICI (modale)
```

---

## 📸 Aperçu Visuel

```
┌──────────────────────────────────────────────────────────────┐
│ Nouvel objectif personnel                                 ×  │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  Titre *                                                     │
│  ┌────────────────────────────────────────────────────────┐  │
│  │ Ex: Réviser les fractions                              │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                              │
│  Description                                                 │
│  ┌────────────────────────────────────────────────────────┐  │
│  │ Notes supplémentaires...                               │  │
│  │                                                        │  │
│  └────────────────────────────────────────────────────────┘  │
│                                                              │
│  ┌─────────────────────────┐  ┌─────────────────────────┐   │
│  │ Date début *            │  │ Heure début             │   │
│  │ ┌─────────────────┐     │  │ ┌─────────────────┐     │   │
│  │ │ jj.mm.aaaa    📅│     │  │ │ 09:00         🕐│     │   │
│  │ └─────────────────┘     │  │ └─────────────────┘     │   │
│  └─────────────────────────┘  └─────────────────────────┘   │
│                                                              │
│  ┌─────────────────────────┐  ┌─────────────────────────┐   │
│  │ Date fin *              │  │ Heure fin               │   │
│  │ ┌─────────────────┐     │  │ ┌─────────────────┐     │   │
│  │ │ jj.mm.aaaa    📅│     │  │ │ 10:00         🕐│     │   │
│  │ └─────────────────┘     │  │ └─────────────────┘     │   │
│  └─────────────────────────┘  └─────────────────────────┘   │
│                                                              │
│                              ┌─────────┐  ┌─────────────┐   │
│                              │ Annuler │  │    Créer    │   │
│                              └─────────┘  └─────────────┘   │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

---

## 🧩 Composants Utilisés

| Composant | Chemin | Description |
|-----------|--------|-------------|
| `Dialog` | `@/components/ui/dialog` | Conteneur modale |
| `DialogHeader` | `@/components/ui/dialog` | En-tête avec titre |
| `DialogContent` | `@/components/ui/dialog` | Corps du formulaire |
| `DialogFooter` | `@/components/ui/dialog` | Boutons Annuler/Créer |
| `Input` | `@/components/ui/input` | Champ titre |
| `Textarea` | `@/components/ui/textarea` | Champ description |
| `DatePicker` | `@/components/ui/date-picker` | Sélection dates |
| `TimePicker` | `@/components/ui/time-picker` | Sélection heures |
| `Button` | `@/components/ui/button` | Actions Annuler/Créer |

---

## 📋 Champs du Formulaire

| Champ | Type | Obligatoire | Validation | Description |
|-------|------|-------------|------------|-------------|
| **Titre** | `Input` | ✅ Oui | Min 3 caractères | Nom de l'objectif |
| **Description** | `Textarea` | Non | - | Notes supplémentaires |
| **Date début** | `DatePicker` | ✅ Oui | ≥ Aujourd'hui | Date de début |
| **Heure début** | `TimePicker` | Non | Format HH:mm | Heure de début (défaut: 09:00) |
| **Date fin** | `DatePicker` | ✅ Oui | ≥ Date début | Date d'échéance |
| **Heure fin** | `TimePicker` | Non | Format HH:mm | Heure de fin (défaut: 10:00) |

---

## 🔗 API Endpoints

| Méthode | Endpoint | Description | Payload |
|---------|----------|-------------|---------|
| `POST` | `/api/student/objectives` | Créer objectif personnel | `{ title, description?, startDate, startTime?, endDate, endTime? }` |

---

## 🔄 Comportements

### Affichage initial
- Champs vides
- Focus automatique sur le champ Titre
- Bouton [Créer] désactivé

### Validation
- Titre requis (min 3 caractères)
- Date début requise (≥ aujourd'hui)
- Date fin requise (≥ date début)
- Heures optionnelles avec valeurs par défaut

### Actions

| Action | Résultat |
|--------|----------|
| **Clic [Créer]** | Validation → POST API → Toast succès → Fermeture modale → Refresh agenda |
| **Clic [Annuler]** | Fermeture modale sans sauvegarde |
| **Clic [×]** | Fermeture modale sans sauvegarde |
| **Clic hors modale** | Fermeture modale sans sauvegarde |
| **Champs requis invalides** | Bouton [Créer] désactivé, messages d'erreur |

### États du bouton [Créer]

| État formulaire | Bouton |
|-----------------|--------|
| Champs requis vides | Désactivé (grisé) |
| Validation OK | Activé (bleu) |
| Envoi en cours | Loading spinner, désactivé |

---

## 🎨 États Visuels

| État | Apparence |
|------|-----------|
| **Vide** | Placeholders grisés |
| **Erreur** | Bordure rouge + message sous le champ |
| **Valide** | Bordure normale |
| **Soumission** | Spinner dans bouton, champs désactivés |

---

## 🔑 Points Clés

- ✅ **Objectif personnel** : Non lié à un cours du professeur
- ✅ **Plage horaire** : Début + Fin (dates et heures)
- ✅ **Validation temps réel** : Erreurs affichées avant soumission
- ✅ **Source "Perso"** : Apparaît avec badge 👤 dans l'agenda

---

**Navigation** :
- ← [Agenda](page.md) (page parente)

---

**Mots-clés** : Modale, Objectif, Création, Formulaire, Agenda personnel  
**Temps de lecture** : 2 minutes  
**Pages estimées** : 1
