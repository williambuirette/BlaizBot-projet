# BlaizBot-projet - Instructions IA

## 🎯 Mission
Ce repo contient l'**exposé académique** sur le Vibecoding (~50 pages).
L'IA doit **mettre à jour l'exposé automatiquement** quand une étape de développement est validée.

## 📐 Structure
| Dossier | Contenu |
| :--- | :--- |
| `content/` | Chapitres de l'exposé en Markdown |
| `exports/` | Versions HTML et Word générées |
| `assets/` | Images, diagrammes, captures |
| `progress.json` | Tracker de progression |

## 🔄 Workflow automatisé

### Quand mettre à jour l'exposé ?
1. **Après validation d'une tâche TODO** dans BlaizBot-V1
2. **Après un commit significatif** (nouvelle feature)
3. **Après une session de travail** (devlog)

### Comment mettre à jour ?
1. Identifier le chapitre concerné via `progress.json`
2. Ajouter le contenu dans le fichier `content/XX-*.md`
3. Mettre à jour `progress.json` (status, metrics)
4. Si des captures sont nécessaires, les lister dans `assets/screenshots/`

## 📝 Format des chapitres

Chaque fichier dans `content/` suit ce format :

```markdown
# Titre du chapitre

> Résumé en 2-3 lignes

---

## Section 1
Contenu...

## Section 2
Contenu...

---

**Mots-clés** : mot1, mot2, mot3
**Temps de lecture** : X minutes
**Pages estimées** : X
```

## 🎨 Conventions de rédaction

### Ton
- Académique mais accessible
- Première personne du pluriel ("nous avons...")
- Exemples concrets avec code

### Citations
```markdown
> "Citation importante" - Auteur, Source
```

### Code
- Toujours annoté et expliqué
- Maximum 20 lignes par bloc
- Indiquer le fichier source

### Figures
```markdown
![Description](../assets/figures/nom-figure.png)
*Figure X : Légende descriptive*
```

## 📊 Métriques à capturer

Après chaque session de développement, mettre à jour `progress.json` :
- `brainstormingHours` : Heures de réflexion
- `wireframeHours` : Heures sur le wireframe
- `architectureHours` : Heures de conception
- `developmentHours` : Heures de code
- `totalLinesGenerated` : Lignes générées par l'IA
- `humanInterventions` : Corrections manuelles
- `aiSuggestions` : Suggestions IA appliquées

## ⛔ Interdits
- ❌ Inventer des métriques ou statistiques
- ❌ Plagier du contenu externe sans citation
- ❌ Dépasser 350 lignes par fichier chapitre
- ❌ Oublier de mettre à jour progress.json

## ✅ Sortie attendue

Quand l'IA met à jour l'exposé, elle doit indiquer :
1. **Chapitre modifié** : XX-nom.md
2. **Contenu ajouté** : Résumé en 1 ligne
3. **Pages estimées** : +X pages
4. **Progress** : XX% → YY%
