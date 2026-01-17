# 📐 Plan d'Action - Mise en Forme de l'Exposé BlaizBot

> **Objectif** : Enrichir l'exposé avec des éléments visuels (images, schémas, tableaux, captures d'écran) pour le rendre agréable à lire sur GitHub et préparer une version web dynamique.

---

## 🎯 Vue d'Ensemble du Projet

### Livrables Finaux
1. **Version GitHub** : Markdown enrichi avec images, lisible directement sur GitHub
2. **Version PDF/Word** : Export formaté pour impression (≈50 pages A4)
3. **Version Web Dynamique** : Page intégrée à BlaizBot avec :
   - Vue linéaire complète (scroll) + téléchargement PDF/Word
   - Vue interactive (onglets, chapitres repliables/dépliables)

### Statistiques Cibles
- **Pages estimées** : 50-55 pages
- **Visuels nécessaires** : 25-35 éléments (1 visuel toutes les 1.5-2 pages)
- **Types de visuels** :
  - 📷 Captures d'écran (interfaces, code, outils)
  - 📊 Schémas/Diagrammes (architecture, flux, processus)
  - 📈 Graphiques (métriques, comparaisons)
  - 🎨 Infographies (résumés visuels, concepts clés)
  - 📝 Blocs Markdown (code, exemples de prompts)

---

## 📁 Structure de Référence

### Fichiers de l'Exposé (BlaizBot-projet/Expose/)
```
00-page-garde.md         → Page de garde
01-remerciements.md      → Remerciements
02-avant-propos.md       → Avant-propos + Note méthodologique
03-table-matieres.md     → Table des matières
04-introduction-generale.md → Introduction générale
05-chapitre-1.md         → Chapitre 1 : Le Vibe Coding
06-chapitre-2.md         → Chapitre 2 : BlaizBot - Contexte
07-chapitre-3.md         → Chapitre 3 : Pré-projet (wireframe)
08-chapitre-4.md         → Chapitre 4 : Développement wireframe HTML
09-chapitre-5.md         → Chapitre 5 : Architecture technique
10-chapitre-6.md         → Chapitre 6 : Développement MVP
11-chapitre-7.md         → Chapitre 7 : Intégration IA
12-chapitre-8.md         → Chapitre 8 : Conclusion
13-glossaire.md          → Glossaire
14-bibliographie.md      → Bibliographie
15-annexes.md            → Annexes
```

### Arborescence des Visuels (BlaizBot-projet/assets/)
```
assets/
├── screenshots/          → Captures d'écran
│   ├── 01-intro/
│   ├── 02-organisation/
│   ├── 06-brainstorm/
│   ├── 07-wireframe/
│   ├── 08-archi/
│   ├── 09-dev/
│   ├── 10-collab/
│   └── 11-results/
├── diagrams/             → Schémas et diagrammes
└── figures/              → Infographies et graphiques
```

### Documentation Wireframe (BlaizBot-projet/pages/)
```
pages/
├── A-auth/               → Authentification (A-01 à A-06)
├── B-admin/              → Espace Admin (B-01 à B-05)
├── C-student/            → Espace Élève (C-01 à C-07)
├── D-teacher/            → Espace Professeur (D-01 à D-07)
└── E-docs/               → Documentation (NAVIGATION-ROADMAP.md)
```

> ✅ Le dossier `pages/` a été copié depuis `blaizbot-wireframe` pour centraliser toutes les ressources dans le même dépôt.

**Convention de nommage wireframe** (format `{Espace}-{Section}-{Ordre}{Ordre}-{description}.{ext}`) :
- Fichiers `.md` = Documentation textuelle (wireframe)
- Fichiers `.png` = Captures d'écran correspondantes
- **Espace** : A=Auth, B=Admin, C=Student, D=Teacher
- **Section** : 01-99 (dashboard, header-menu, courses...)
- **Ordre** : Numérotation séquentielle (01, 02, 03...)

**Exemples** :
```
pages/C-student/C-01-dashboard/C-01-02-02dashboard.png  → Dashboard élève
pages/D-teacher/D-05-courses/D-05-04-04new.png          → Nouveau cours (prof)
pages/C-student/C-06-ai/C-06-04-04page.png              → Assistant IA
```

> 📖 Voir [PAGES-TREE.md](../pages/E-docs/PAGES-TREE.md) pour l'arborescence complète des ~136 fichiers.

---

## 🔧 Workflow de l'Agent de Mise en Forme

### Étape 1 : Analyse du Chapitre
Pour chaque fichier `XX-chapitre-X.md` :
1. Lire le contenu complet
2. Identifier les sections et sous-sections
3. Repérer les concepts clés qui méritent un visuel
4. Déterminer le type de visuel adapté (capture, schéma, tableau, etc.)

### Étape 2 : Annotation du Texte
Insérer des marqueurs au bon endroit dans le texte :

```markdown
<!-- [VISUEL-XX] Type: capture | Réf: C-01-02-02dashboard.png | Légende: Dashboard élève avec KPIs de progression -->

<!-- [VISUEL-XX] Type: schema | À créer: Flux de la boucle vibe coding | Légende: Cycle Intention → Génération → Test → Correction -->

<!-- [VISUEL-XX] Type: tableau | Contenu: Comparaison LLM (GPT/Claude/Gemini) | Légende: Tableau comparatif des modèles IA -->

<!-- [VISUEL-XX] Type: code | Source: exemple-prompt.md | Légende: Exemple de prompt efficace pour créer un composant -->

<!-- [VISUEL-XX] Type: infographie | À créer avec IA: Résumé visuel du chapitre | Légende: Les 5 étapes du pré-projet -->
```

### Étape 3 : Format des Annotations

```
<!-- [VISUEL-{NUM}] 
  Type: {capture|schema|tableau|code|infographie|graphique}
  Source: {chemin vers fichier existant OU "À créer"}
  Réf-Wireframe: {ID du fichier wireframe si applicable, ex: C-01-02}
  Prompt-Création: {prompt pour générer l'image si Type=infographie}
  Légende: {texte descriptif pour la légende}
  Position: {après ce paragraphe|en face de ce texte|pleine page}
-->
```

### Étape 4 : Génération du Rapport
Créer un fichier récapitulatif `VISUELS-REQUIS.md` listant :
- Tous les visuels annotés par chapitre
- Statut : existant / à capturer / à créer
- Priorité (essentiel / recommandé / bonus)

### Étape 5 : Génération du TODO par Chapitre
Créer un fichier `Expose/todo/TODO-XX-chapitre-X.md` contenant :
- Liste ordonnée de toutes les tâches (ordre chronologique du texte)
- Pour chaque tâche : action, source, destination, légende
- Récapitulatif par type de visuel
- Cases à cocher pour suivi de progression

> 📖 Template disponible : `Expose/todo/_TEMPLATE-TODO.md`

---

## 📋 Mapping Chapitre par Chapitre

### 00-page-garde.md
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| Centre | infographie | Logo BlaizBot stylisé | À créer |
| Bas | tableau | Informations du candidat | Texte existant |

---

### 02-avant-propos.md (Note méthodologique)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| Après "Outils utilisés" | schema | Workflow des outils (ChatGPT↔Claude↔VSCode) | À créer |
| Après "Méthode de travail" | infographie | 5 étapes de la rédaction assistée | À créer |

---

### 04-introduction-generale.md
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| Résumé projet | capture | Application finale en fonctionnement | À capturer |
| Timeline | infographie | 5 grandes étapes du projet | À créer |

---

### 05-chapitre-1.md (Le Vibe Coding)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| §1.1 "origine" | capture | Tweet original d'Andrej Karpathy | À capturer (web) |
| §1.1 après "principe simple" | schema | Cycle : Description → IA génère → Test → Correction | À créer (Mermaid) |
| §1.2 "modèles LLM" | tableau | Comparaison GPT / Claude / Gemini | À créer (Markdown) |
| §1.2 "boucle continue" | schema | Diagramme flux : Intention → Génération → Test → Correction → Amélioration | À créer |
| §1.3 "avantages" | infographie | Liste visuelle des avantages du vibe coding | À créer |
| §1.3 "limites" | infographie | Liste visuelle des limites et risques | À créer |
| §1.3 "rôle humain" | schema | Répartition Humain vs IA (balance) | À créer |

---

### 06-chapitre-2.md (BlaizBot - Contexte)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| §2.1 "trois interfaces" | schema | Vue des 3 rôles (Admin/Prof/Élève) | À créer |
| §2.1 interface élève | capture | Dashboard élève | `pages/C-student/C-01-dashboard/C-01-02-02dashboard.png` |
| §2.1 interface prof | capture | Dashboard professeur | `pages/D-teacher/D-01-dashboard/D-02-02dashboard.png` |
| §2.1 interface admin | capture | Dashboard admin | `pages/B-admin/B-01-dashboard/B-01-02-dashboard.png` |
| §2.3.2 MVP | tableau | Liste des fonctionnalités MVP | À créer (Markdown) |
| §2.3.3 limites | infographie | Périmètre IN vs OUT | À créer |

---

### 07-chapitre-3.md (Pré-projet)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| §3.1 brainstorming | capture | Interface projet ChatGPT | À capturer |
| §3.2 prompt système | code | Extrait du prompt système ChatGPT | À extraire |
| §3.2 organisation | capture | Liste des fils de discussion ChatGPT | À capturer |
| §3.3 outils | schema | Workflow outils : VSCode → GitHub → Vercel | À créer |
| §3.3 VSCode | capture | Interface VSCode avec le projet | À capturer |
| §3.3 GitHub | capture | Dépôt GitHub avec commits | À capturer |
| §3.4 pipeline | schema | Pipeline : idée → code → test → commit → déploiement | À créer |
| §3.5 règles qualité | tableau | Règles de qualité (Prettier, ESLint, .env) | À créer |
| §3.6 TODO v0 | code | Extrait de la première TODO list | À extraire |
| §3.7 agents | capture | Dossier agents dans VSCode | Réf: assets/screenshots/08-archi/ |
| §3.7 agents | tableau | Liste des agents et leurs rôles | À créer |
| §3.8 wireframe MD | capture | Extrait du wireframe Markdown | À capturer |
| §3.9 inventaire UI | tableau | Exemple d'inventaire (1 page) | À créer |
| §3.10 kickoff | code | Prompt de lancement complet | À extraire |
| §3.11 sortie phase | infographie | Résumé des 3 livrables de la phase 3 | À créer |

---

### 08-chapitre-4.md (Développement Wireframe HTML)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| Structure | capture | Arborescence du projet wireframe | À capturer |
| Dashboard élève | capture | Dashboard élève wireframe | `pages/C-student/C-01-dashboard/C-01-02-02dashboard.png` |
| Dashboard prof | capture | Dashboard professeur wireframe | `pages/D-teacher/D-01-dashboard/D-02-02dashboard.png` |
| Dashboard admin | capture | Dashboard admin wireframe | `pages/B-admin/B-01-dashboard/B-01-02-dashboard.png` |
| Calendrier | capture | Calendrier/Agenda interactif | `pages/C-student/C-05-agenda/C-05-04-04page.png` |
| Chatbot | capture | Interface Blaiz'bot | `pages/C-student/C-06-ai/C-06-04-04page.png` |
| Code structure | capture | Code JavaScript modules | À capturer |

---

### 09-chapitre-5.md (Architecture Technique)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| 4 repos | schema | Vue d'ensemble des 4 dépôts | À créer |
| Next.js | schema | Architecture Next.js App Router | À créer |
| Structure | capture | Arborescence src/ dans VSCode | À capturer |
| Prisma | capture | Schéma Prisma | À capturer |
| API | schema | Pattern API Layer (mock → prod) | À créer |
| Agents | capture | Fichier agent dans VSCode | À capturer |

---

### 10-chapitre-6.md (Développement MVP)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| Composant | capture | Création composant avec Copilot | À capturer |
| API route | capture | Route API dans VSCode | À capturer |
| Terminal | capture | Commandes terminal typiques | À capturer |
| Progression | graphique | Timeline du développement | À créer |
| Métriques | tableau | Statistiques du développement | À créer |

---

### 11-chapitre-7.md (Intégration IA)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| Prompt exemple | code | Exemple de prompt efficace | À extraire |
| Code généré | capture | Code généré vs code final | À capturer |
| Correction | capture | Diff avant/après correction humaine | À capturer |
| Chat history | capture | Historique conversation Copilot | À capturer |
| Comparaison | tableau | Prompts naïf vs optimisé | À créer |

---

### 12-chapitre-8.md (Conclusion)
| Position | Type | Description | Réf/Source |
|----------|------|-------------|------------|
| App finale | capture | Application en fonctionnement | À capturer |
| Métriques | tableau | Bilan chiffré du projet | À créer |
| Répartition | graphique | Camembert Humain vs IA | À créer |
| Timeline | infographie | Récapitulatif du parcours | À créer |
| Évolution | graphique | Courbe d'apprentissage | À créer |

---

## 📝 Types de Visuels et Conventions

### 1. Captures d'Écran (📷)
**Spécifications** :
- Résolution : 1920x1080 ou plus
- Mode : Light mode (meilleure lisibilité imprimée)
- Format : PNG
- Annotations : Flèches rouges si nécessaire

**Convention de nommage** :
```
{chapitre}-{section}-{description}.png
Ex: ch3-s2-chatgpt-projet.png
```

### 2. Schémas/Diagrammes (📊)
**Outils recommandés** :
- Mermaid (intégré Markdown)
- Draw.io / Excalidraw
- Figma

**Types de schémas** :
- Flux de processus (flowchart)
- Architecture système (boxes)
- Timeline
- Organigramme

### 3. Tableaux (📋)
**Format Markdown** :
```markdown
| Colonne 1 | Colonne 2 | Colonne 3 |
|-----------|-----------|-----------|
| Valeur 1  | Valeur 2  | Valeur 3  |
```

### 4. Blocs de Code (💻)
**Format** :
```markdown
```language
// Code avec commentaires explicatifs
```
*Figure X : Description du code*
```

### 5. Infographies (🎨)
**Création** :
- Prompt pour IA générative (Midjourney, DALL-E, Ideogram)
- Style : professionnel, épuré, couleurs BlaizBot

**Prompt type** :
```
(Créer une infographie minimaliste montrant les 5 étapes du vibe coding : 
1. Décrire l'intention, 2. IA génère, 3. Tester, 4. Corriger, 5. Améliorer. 
Style flat design, couleurs bleu et blanc, icônes simples, flèches de progression)
```

### 6. Graphiques (📈)
**Outils** :
- Excel / Google Sheets
- Chart.js
- Mermaid (pie, bar)

---

## ✅ Checklist de l'Agent

Pour chaque chapitre, l'agent doit :

- [ ] Lire le contenu complet du fichier
- [ ] Identifier les sections qui manquent de visuels
- [ ] Déterminer le type de visuel approprié
- [ ] Vérifier si un visuel existe déjà (wireframe, assets)
- [ ] Insérer les annotations `<!-- [VISUEL-XX] ... -->`
- [ ] Rédiger les légendes descriptives
- [ ] Créer les prompts pour les infographies IA
- [ ] Extraire les blocs de code pertinents
- [ ] Mettre à jour le fichier VISUELS-REQUIS.md
- [ ] **Générer le fichier `Expose/todo/TODO-XX-chapitre-X.md`**

---

## 📊 Estimation des Visuels par Chapitre

| Chapitre | Captures | Schémas | Tableaux | Infographies | Code | Total |
|----------|----------|---------|----------|--------------|------|-------|
| Page garde | 0 | 0 | 1 | 1 | 0 | 2 |
| Avant-propos | 0 | 1 | 0 | 1 | 0 | 2 |
| Introduction | 1 | 0 | 0 | 1 | 0 | 2 |
| Chapitre 1 | 1 | 3 | 1 | 3 | 0 | 8 |
| Chapitre 2 | 3 | 1 | 1 | 1 | 0 | 6 |
| Chapitre 3 | 5 | 2 | 3 | 2 | 3 | 15 |
| Chapitre 4 | 6 | 0 | 0 | 0 | 1 | 7 |
| Chapitre 5 | 4 | 3 | 1 | 0 | 0 | 8 |
| Chapitre 6 | 4 | 0 | 2 | 0 | 1 | 7 |
| Chapitre 7 | 4 | 0 | 1 | 0 | 2 | 7 |
| Chapitre 8 | 1 | 0 | 1 | 2 | 0 | 4 |
| **TOTAL** | **29** | **10** | **11** | **11** | **7** | **68** |

> Note : Certains visuels pourront être combinés ou simplifiés selon la mise en page finale.

---

## 🚀 Prochaines Étapes

1. **Valider ce plan** avec l'utilisateur
2. **Créer l'agent** avec les instructions ci-dessus
3. **Traiter chapitre par chapitre** en commençant par le 1
4. **Générer les fichiers TODO** pour chaque chapitre traité
5. **Réaliser les tâches** des TODO (captures, schémas, etc.)
6. **Assembler la version finale** pour GitHub/PDF/Web

---

## 📁 Structure des Fichiers TODO

```
Expose/todo/
├── _TEMPLATE-TODO.md       → Template de référence
├── TODO-00-page-garde.md
├── TODO-02-avant-propos.md
├── TODO-04-introduction.md
├── TODO-05-chapitre-1.md
├── TODO-06-chapitre-2.md
├── TODO-07-chapitre-3.md
├── TODO-08-chapitre-4.md
├── TODO-09-chapitre-5.md
├── TODO-10-chapitre-6.md
├── TODO-11-chapitre-7.md
└── TODO-12-chapitre-8.md
```

Chaque fichier TODO contient :
- ✅ Liste ordonnée des tâches (ordre du texte)
- 📋 Actions précises (capturer, créer, rédiger)
- 📂 Chemins source et destination
- 🏷️ Légendes prêtes à copier
- 📊 Récapitulatif par type

---

*Dernière mise à jour : 17 janvier 2026*
