# 11. Limites, Risques et Dette Technique

> Ce chapitre analyse de manière critique les limites du projet, les risques identifiés et la dette technique accumulée.

---

## 11.1 Limites du Vibe Coding

### 11.1.1 Limites techniques

| Limite | Impact | Mitigation |
| :--- | :--- | :--- |
| **Contexte IA limité** | Fichiers > 500 lignes difficiles à traiter | Découpage strict |
| **Hallucinations** | Code incorrect parfois généré | Validation systématique |
| **Dépendance internet** | Pas de travail offline | Cache local des prompts |
| **Coût API** | Utilisation intensive coûteuse | Rate limiting |

### 11.1.2 Limites méthodologiques

| Limite | Description |
| :--- | :--- |
| **Courbe d'apprentissage** | Calibrage des prompts prend du temps |
| **Documentation dispersée** | Prompts/décisions dans plusieurs endroits |
| **Reproductibilité** | Mêmes prompts ≠ mêmes résultats |
| **Dépendance au modèle** | Changement de modèle = recalibrage |

### 11.1.3 Quand ne PAS utiliser le Vibe Coding

| Contexte | Raison |
| :--- | :--- |
| Projet critique (finance, santé) | Besoin de certitude absolue |
| Équipe > 10 personnes | Coordination complexe |
| Code legacy massif | Contexte trop volumineux |
| Performance critique | Optimisations fines requises |

## 11.2 Risques identifiés

### 11.2.1 Matrice des risques

| Risque | Probabilité | Impact | Mitigation |
| :--- | :--- | :--- | :--- |
| **API OpenAI indisponible** | Faible | Critique | Fallback mock |
| **Dépassement budget API** | Moyenne | Modéré | Alertes + limites |
| **Données corrompues** | Faible | Critique | Backups réguliers |
| **Faille sécurité** | Moyenne | Critique | Audit avant prod |
| **Performance dégradée** | Moyenne | Modéré | Optimisation lazy |

### 11.2.2 Risques spécifiques au projet éducatif

| Risque | Description | Mitigation |
| :--- | :--- | :--- |
| **IA donne les réponses** | Bypass du mode hint-only | Prompts stricts + validation |
| **Données élèves** | RGPD / confidentialité | Anonymisation + consentement |
| **Contenu inapproprié** | IA génère contenu hors sujet | Filtres + modération |

## 11.3 Dette technique

### 11.3.1 Dette acceptée (consciente)

| Élément | Raison | Remboursement prévu |
| :--- | :--- | :--- |
| **Pas de tests unitaires** | MVP rapide | Sprint dédié post-MVP |
| **Styling inline parfois** | Itération rapide | Refactoring CSS |
| **Validation basique** | Focus fonctionnel | Schémas Zod complets |
| **Pas de cache API** | Simplicité | Redis en prod |

### 11.3.2 Dette à rembourser prioritairement

1. **Tests** : Ajouter Jest + Testing Library pour composants critiques
2. **Validation** : Schémas Zod sur toutes les routes API
3. **Logging** : Système de logs structurés (Pino)
4. **Monitoring** : Intégrer Sentry pour tracking erreurs

### 11.3.3 Dette à surveiller

| Indicateur | Seuil d'alerte | Action |
| :--- | :--- | :--- |
| Fichiers > 350 lignes | > 5 fichiers | Refactoring obligatoire |
| `any` TypeScript | > 10 occurrences | Typage prioritaire |
| Console.log en prod | > 0 | Nettoyage |
| TODO dans le code | > 20 | Sprint nettoyage |

## 11.4 Améliorations futures

### 11.4.1 Court terme (V1.1)

- [ ] Ajouter tests unitaires (couverture > 60%)
- [ ] Implémenter validation Zod complète
- [ ] Optimiser les requêtes Prisma (include sélectifs)
- [ ] Ajouter loading skeletons partout

### 11.4.2 Moyen terme (V2)

- [ ] Système de notifications temps réel (WebSocket)
- [ ] Export PDF des progressions
- [ ] Mode hors-ligne (PWA)
- [ ] Multi-langue (i18n)

### 11.4.3 Long terme

- [ ] Application mobile (React Native)
- [ ] IA fine-tunée sur contenu éducatif
- [ ] Analytics avancés (comportement utilisateur)
- [ ] Marketplace de cours

## 11.5 Réflexion critique

### 11.5.1 Ce que le projet a démontré

> Le Vibe Coding permet de créer un MVP fonctionnel rapidement, mais ne dispense pas des bonnes pratiques (tests, validation, sécurité) pour une mise en production.

### 11.5.2 Ce que le projet n'a pas prouvé

| Affirmation | Status |
| :--- | :--- |
| "L'IA remplace les développeurs" | ❌ Non - L'humain reste central |
| "Pas besoin de comprendre le code" | ❌ Non - Validation critique nécessaire |
| "Scalable en l'état" | ⚠️ Partiel - Optimisations requises |

### 11.5.3 Questions ouvertes

1. Comment maintenir un projet Vibe Coding sur le long terme ?
2. Comment transférer les connaissances (prompts, décisions) à une nouvelle équipe ?
3. Quel est le vrai coût du Vibe Coding (temps humain + API) ?

## 11.6 Preuves

### 11.6.1 Captures requises

- [ ] `11-limites/matrice-risques.png`
- [ ] `11-limites/dette-technique.png`
- [ ] `11-limites/todo-code.png` (recherche TODO dans le code)

### 11.6.2 Journal de bord

```
Date/heure : [Fin de projet]
Étape : 11 - Analyse critique
Objectif : Identifier limites et dette technique
Constat :
- X fichiers > 350 lignes
- Y occurrences de any
- Z TODO non résolus
Priorité remboursement : Tests > Validation > Logging
```

---

**Mots-clés** : limites, risques, dette technique, critique, améliorations
**Statut** : ⏳ À compléter (analyse continue)
