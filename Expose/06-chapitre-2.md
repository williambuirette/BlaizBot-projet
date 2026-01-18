# Chapitre 2 — Blaiz'Bot : contexte du projet

---

## 2.1 Présentation de l'application

Blaiz'bot, c'est le projet que j'ai choisi pour mon travail de maturité. Une application web qui aide les enseignants à faire réviser leurs élèves, avec une intelligence artificielle comme assistant pédagogique.

L'application s'organise autour de trois interfaces, une par rôle : administrateur, professeur, élève. Cette séparation évite de mélanger les responsabilités et garde une structure claire.

**Côté élève**, on peut consulter les cours et les ressources, organiser ses révisions avec un agenda et des objectifs, et surtout utiliser un chatbot IA pour poser des questions, demander des explications ou s'entraîner. L'élève suit aussi sa progression grâce à des KPI (indicateurs clés de performance) — une façon d'identifier ses points forts et ses points faibles sans dépendre uniquement des notes.

**Côté professeur**, c'est la gestion des classes et des cours : créer et organiser les contenus (matières, chapitres, ressources), proposer des exercices, suivre les résultats. Le prof peut aussi consulter des KPI pour repérer les difficultés récurrentes, que ce soit chez un élève ou dans une partie de la classe.

**Côté administrateur**, on gère le cadre général : comptes, rôles, structure des classes, supervision du bon fonctionnement.

L'IA, elle, est centrée sur l'aide à la révision. Point important : les conversations élève–IA restent privées. Le professeur voit des indicateurs agrégés (score IA, nombre de sessions) mais n'accède pas au contenu des échanges. Ça préserve la confidentialité tout en gardant une vision pédagogique exploitable. Et pour être clair : Blaiz'bot n'a pas vocation à devenir une plateforme scolaire complète. C'est un prototype cohérent pour illustrer la démarche du vibe coding.

---

## 2.2 Motivations

Pourquoi ce projet ? D'abord, je voulais tester le vibe coding sur un cas concret, pas juste en théorie. Blaiz'bot est un bon terrain d'essai parce qu'il mélange plusieurs éléments : une interface utilisateur, une logique de gestion (cours, exercices, progression), et des usages différents selon qu'on est élève ou professeur. L'idée n'était pas de rester "sur le papier" mais d'aboutir à un prototype qui fonctionne — quelque chose que je peux montrer et faire tester.

Ensuite, le domaine m'intéressait. Réviser, c'est souvent difficile. Les élèves ne bloquent pas tous au même moment ni sur les mêmes notions. Avec Blaiz'bot, j'ai voulu rendre la révision plus simple et plus interactive : l'élève avance à son rythme, se corrige, comprend ce qu'il doit retravailler. Et le professeur, de son côté, ne voit pas qu'une note finale — il peut repérer les difficultés récurrentes et ajuster son cours.

Et puis il y a une motivation plus personnelle, tout simplement. J'aime l'informatique. J'avais envie de progresser en construisant une vraie application, de l'idée jusqu'au prototype. Ce travail m'a permis de développer des compétences concrètes : organiser un projet, créer des interfaces, comprendre la logique d'une application, intégrer une IA. Le tout dans un cadre scolaire clair et mesurable.

---

## 2.3 Objectifs et périmètre

### 2.3.1 Objectif principal

Ce travail a deux objectifs. Le premier : créer Blaiz'bot. Le second : rédiger un exposé qui explique comment j'ai fait. Le rapport décrit la démarche étape par étape — découpage en tâches, formulation des consignes, tests, corrections. L'idée est de montrer le déroulement réel du développement, avec une progression logique et des preuves concrètes.

Dans ce cadre, l'application sert surtout de support à la démonstration. Je ne cherche pas à ajouter un maximum de fonctionnalités. Je veux construire une version cohérente, puis expliquer le processus de façon structurée. Le rapport met en avant les choix, les limites assumées, et comment j'ai résolu les problèmes au fil des itérations.

### 2.3.2 Le MVP (Minimum Viable Product)

Pour rester réaliste, je vise un MVP — un produit minimum viable. Autrement dit : une version minimale mais complète, qui fonctionne de bout en bout et qu'on peut démontrer avec un scénario simple.

Concrètement, le MVP doit permettre :
- un accès par rôles (administrateur, professeur, élève)
- un espace professeur pour organiser des cours, déposer des ressources et proposer des exercices
- un espace élève pour consulter les contenus, s'entraîner et suivre sa progression
- un chat IA centré sur l'aide à la révision, lié aux cours
- une visualisation de la progression via des indicateurs, sans que le professeur voie le contenu exact du chat élève-IA

L'objectif : une application assez stable pour être testée et présentée, sans complexité inutile. Certaines améliorations UX (comme l'affichage progressif des réponses de l'IA) restent des bonus. Le cœur du MVP doit d'abord fonctionner.

### 2.3.3 Limites du périmètre

Certaines améliorations viendront plus tard, une fois le prototype stabilisé. D'autres idées sont volontairement exclues — elles rendraient le projet trop lourd pour un travail de maturité.

Pour être clair : je ne cherche pas à créer un LMS complet (type Moodle), ni à ajouter des fonctions complexes comme l'anti-triche, la surveillance avancée ou des analyses pédagogiques très détaillées. Le rôle Parent existe dans le modèle de données (pour une évolution future), mais je n'ai implémenté ni interface ni logique métier pour ce rôle dans le MVP. Le périmètre reste volontairement limité : une application claire, une démo réaliste, un rapport qui explique la méthode.

---

**Pages estimées** : 4-5 pages  
**Temps de lecture** : 6-8 minutes  
**Mots-clés** : BlaizBot, MVP, Application Éducative, Interfaces Multi-Rôles, Assistant IA
