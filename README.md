# BlaizBot-projet 📚

> **Exposé académique sur le Vibecoding**
> Documentation vivante générée en parallèle du développement

## 🎯 Objectif

Ce repo contient l'**exposé final** (~50 pages) sur le paradigme du Vibecoding, illustré par le cas d'étude BlaizBot.

## 📁 Structure

```
BlaizBot-projet/
├── content/                    # Contenu brut de l'exposé (Markdown)
│   ├── 00-page-de-garde.md
│   ├── 01-introduction.md
│   ├── 02-problematique.md
│   ├── 03-vibecoding-definition.md
│   ├── 04-methodologie.md
│   ├── 05-etude-de-cas-blaizbot.md
│   ├── 06-phase-brainstorming.md
│   ├── 07-phase-wireframe.md
│   ├── 08-phase-architecture.md
│   ├── 09-phase-developpement.md
│   ├── 10-collaboration-ia.md
│   ├── 11-resultats-metriques.md
│   ├── 12-limites-challenges.md
│   ├── 13-conclusion.md
│   └── annexes/
│       ├── A-glossaire.md
│       ├── B-code-samples.md
│       ├── C-screenshots.md
│       └── D-references.md
├── exports/                    # Versions finales
│   ├── html/                   # Version web interactive
│   └── word/                   # Version Word pour impression
├── assets/                     # Images, diagrammes, captures
│   ├── diagrams/
│   ├── screenshots/
│   └── figures/
├── templates/                  # Templates pour génération
│   ├── html-template.html
│   └── styles.css
├── scripts/                    # Scripts d'automatisation
│   └── build-expose.ps1
├── progress.json               # Tracker de progression
├── .github/
│   └── copilot-instructions.md
└── README.md
```

## 🔄 Workflow automatisé

1. **Développement** → Tâche validée dans `BlaizBot-V1/TODO.md`
2. **Trigger** → L'IA met à jour la section correspondante dans `content/`
3. **Build** → Script génère HTML et prépare export Word
4. **Review** → Validation humaine

## 📊 Progression

| Chapitre | Pages | Statut |
| :--- | :--- | :--- |
| Page de garde | 1 | ✅ |
| Introduction | 2 | ✅ |
| Problématique | 3 | ✅ |
| Définition Vibecoding | 4 | ✅ |
| Méthodologie | 5 | 🔄 En cours |
| Étude de cas | 8 | 🔴 À faire |
| Phase Brainstorming | 4 | 🔴 À faire |
| Phase Wireframe | 5 | 🔴 À faire |
| Phase Architecture | 4 | 🔴 À faire |
| Phase Développement | 8 | 🔴 À faire |
| Collaboration IA | 4 | 🔴 À faire |
| Résultats | 3 | 🔴 À faire |
| Limites | 2 | 🔴 À faire |
| Conclusion | 2 | 🔴 À faire |
| Annexes | 5 | 🔴 À faire |
| **TOTAL** | **~50** | **20%** |

## 🛠️ Commandes

```bash
# Générer version HTML
.\scripts\build-expose.ps1 -Format html

# Préparer pour Word (nécessite Pandoc)
.\scripts\build-expose.ps1 -Format word
```

## 📎 Repos liés

- [blaizbot-wireframe](../blaizbot-wireframe) - Wireframe HTML/CSS/JS
- [Vibe-Coding](../../Vibe-Coding) - Méthodologie et templates
- [BlaizBot-V1](../BlaizBot-V1) - Application finale
