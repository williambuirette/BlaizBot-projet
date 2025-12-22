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

## À documenter (rétro-documentation)

Ces sessions passées doivent être documentées a posteriori :

| Date estimée | Session | Chapitre | Priorité |
| :--- | :--- | :--- | :--- |
| Mi-décembre | Projet ChatGPT créé | 02 | 🔴 Haute |
| Mi-décembre | Brainstorming initial | 01 | 🟡 Moyenne |
| Début janvier | Choix de la stack | 03 | 🟡 Moyenne |
| Janvier | User stories | 04 | 🟡 Moyenne |

---

## Métriques cumulées

| Métrique | Valeur | Dernière MAJ |
| :--- | :--- | :--- |
| Heures totales | ~21h | 2025-12-22 |
| Lignes wireframe | 6,244 | 2025-01-15 |
| Lignes production | 0 | - |
| Chapitres complétés | 3/13 | 2025-12-22 |
| Captures réalisées | 0 | - |
