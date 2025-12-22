# Journal de Bord - Exposé BlaizBot

> Historique chronologique de toutes les sessions de travail sur l'exposé.

---

## Mode d'emploi

Après chaque session de travail significative, ajouter une entrée avec :

```markdown
### [DATE] - [TITRE SESSION]

**Durée** : Xh
**Chapitres touchés** : XX, YY
**Résumé** : 1-2 lignes

**Réalisations** :
- Point 1
- Point 2

**Preuves ajoutées** :
- [ ] Capture X
- [ ] Capture Y

**Prochaines étapes** :
- À faire 1
- À faire 2
```

---

## Sessions

### 2025-01-15 - Création du wireframe (RÉTRO)

**Durée** : 11h (estimé)
**Chapitres touchés** : 05-wireframe-ux.md
**Résumé** : Wireframe complet créé avec Claude dans VS Code

**Réalisations** :
- 3 dashboards (élève, professeur, admin)
- Design system avec 25 composants
- 6,244 lignes de code (HTML/CSS/JS)
- Navigation fonctionnelle
- Données mockées

**Preuves ajoutées** :
- [x] Wireframe fonctionnel dans `blaizbot-wireframe/`
- [ ] Captures des 3 dashboards à faire

**Prochaines étapes** :
- Documenter le processus de création
- Prendre les captures d'écran

---

### 2025-01-18 - Architecture et agents

**Durée** : 8h (estimé)
**Chapitres touchés** : 06-architecture.md, 07-prompts-agents.md
**Résumé** : Structure BlaizBot-V1 et système d'agents créés

**Réalisations** :
- Documentation architecture Next.js
- 8 agents IA spécialisés créés
- Schéma Prisma documenté
- Structure API définie

**Preuves ajoutées** :
- [x] `BlaizBot-V1/docs/` complet
- [x] `.github/agents/` avec 8 agents
- [ ] Captures VS Code à faire

**Prochaines étapes** :
- Commencer le développement
- Documenter le chapitre 08

---

### 2025-12-22 - Restructuration exposé

**Durée** : 2h
**Chapitres touchés** : Tous (00-12)
**Résumé** : Restructuration complète selon guide académique

**Réalisations** :
- Suppression ancienne structure (11 fichiers)
- Création nouvelle structure (13 chapitres + 4 annexes)
- Template journal de bord dans chaque chapitre
- Mise à jour progress.json v2.0.0
- Suppression limite 50 pages

**Preuves ajoutées** :
- [x] Tous les fichiers chapitres créés
- [x] 4 annexes (glossaire, code, screenshots, refs)
- [x] progress.json mis à jour

**Prochaines étapes** :
- Rétro-documenter chapitre 02 (ChatGPT)
- Prendre captures d'écran des étapes passées
- Continuer développement BlaizBot-V1

---

### 2025-12-22 - Documentation ChatGPT + Plan 10 phases

**Durée** : 1h30
**Chapitres touchés** : 02-organisation-chatgpt.md, README
**Résumé** : Rétro-documentation ChatGPT et structuration plan de développement

**Réalisations** :
- Chapitre 02 complété avec captures réelles du projet "Blaiz'bot"
- 5 screenshots déposés (`assets/screenshots/02-organisation/`)
- README enrichi : PRD, MVP, MoSCoW, Context Engineering, RAG
- TODO.md restructuré en 10 phases Vibe Coding
- Règle 350 lignes/fichier intégrée au plan
- Vertical Slice (Phase 3) ajoutée pour démo précoce
- Repos GitHub créés : BlaizBot-V1, BlaizBot-projet

**Preuves ajoutées** :
- [x] `Screenshot_projet_chatgpt.png` - Vue d'ensemble 7 conversations
- [x] `Screenshot_chemin_prompt_system_projet.png` - Menu instructions
- [x] `Screenshot_prompt_system.png` - Prompt système Vibe Coding
- [x] `Screenshot_base_de_connaissance.png` - 2 documents uploadés
- [x] `scrennshot_chemin_base_de_connaissance.png` - Chemin fichiers

**Décisions prises** :
- Plan 10 phases validé (fusion proposition Copilot + ChatGPT)
- Vertical Slice avant DB pour valider UX tôt
- Admin avant Prof/Élève (source de vérité données)

**Prochaines étapes** :
- Phase 1 : Initialisation projet Next.js
- Continuer rétro-documentation chapitres 00, 01, 03, 04

---

## À documenter (rétro-documentation)

Ces sessions passées doivent être documentées a posteriori :

| Date estimée | Session | Chapitre | Priorité | Statut |
| :--- | :--- | :--- | :--- | :--- |
| Août 2025 | Projet ChatGPT créé | 02 | 🔴 Haute | ✅ Done |
| Mi-décembre | Brainstorming initial | 01 | 🟡 Moyenne | 🔴 À faire |
| Début janvier | Choix de la stack | 03 | 🟡 Moyenne | 🔴 À faire |
| Janvier | User stories | 04 | 🟡 Moyenne | 🔴 À faire |

---

## Métriques cumulées

| Métrique | Valeur | Dernière MAJ |
| :--- | :--- | :--- |
| Heures totales | ~22.5h | 2025-12-22 |
| Lignes wireframe | 6,244 | 2025-01-15 |
| Lignes production | 0 | - |
| Chapitres complétés | 4/13 | 2025-12-22 |
| Captures réalisées | 5 | 2025-12-22 |
| Phases planifiées | 10 | 2025-12-22 |
