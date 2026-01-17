# Chapitre 2 — Blaiz'Bot : contexte du projet

---

## 2.1 Présentation de l'application

Blaiz'bot est le projet que j'ai choisi de réaliser pour mon travail de maturité. C'est une application web dont l'objectif est d'aider les enseignants à faire réviser leurs cours à leurs élèves, en s'appuyant sur une intelligence artificielle comme assistant pédagogique.

L'application est organisée autour de trois interfaces distinctes, liées à trois rôles : administrateur, professeur et élève. Cette séparation permet d'éviter de mélanger les responsabilités et de garder une structure simple.

L'interface élève permet de consulter les contenus de cours et les ressources associées, d'organiser ses révisions avec un agenda et des objectifs, et d'utiliser un chatbot IA pour poser des questions, demander des explications ou s'entraîner. L'élève peut aussi suivre sa progression grâce à des KPI (indicateurs clés de performance), afin d'identifier ses points forts et ses points faibles sans dépendre uniquement des notes.

L'interface professeur sert à gérer les classes et les cours : création et organisation des contenus (matières, chapitres, ressources), proposition d'exercices, suivi des résultats, et consultation de KPI pour repérer des difficultés récurrentes, soit chez un élève, soit dans une partie de la classe.

L'interface administrateur gère le cadre général : comptes, rôles, structure des classes et supervision du bon fonctionnement.

L'IA est surtout centrée sur l'aide à la révision de l'élève. Les conversations détaillées élève–IA restent privées, mais le professeur peut consulter des indicateurs agrégés (score IA, nombre de sessions) sans accéder au contenu des échanges. Cela permet de préserver la confidentialité tout en gardant une vision pédagogique exploitable. Enfin, Blaiz'bot n'a pas pour but d'être une plateforme scolaire complète : c'est un prototype cohérent et testable pour illustrer la démarche du vibe coding.

---

## 2.2 Motivations

Ma première motivation avec ce projet, c'est de travailler sur un cas concret pour tester le vibe coding dans des conditions réelles. Blaiz'bot est un bon terrain d'essai, parce qu'il mélange plusieurs éléments importants : une interface, une logique de gestion (cours, exercices, progression) et des usages différents selon qu'on est élève ou professeur. Je ne voulais pas rester dans une idée "sur le papier", mais aboutir à un prototype qui fonctionne et que je peux réellement montrer.

Ma deuxième motivation vient du domaine choisi. Réviser, c'est souvent difficile, surtout parce que les élèves ne bloquent pas tous au même moment ni sur les mêmes notions. Avec Blaiz'bot, l'objectif est de rendre la révision plus simple et plus interactive : l'élève avance à son rythme, peut se corriger et comprend mieux ce qu'il doit retravailler. De l'autre côté, le professeur n'a pas seulement une note finale : il peut repérer plus facilement les difficultés qui reviennent et ajuster son cours ou ses exercices.

Enfin, il y a une motivation plus personnelle. J'aime l'informatique et j'avais envie de progresser en construisant une application complète, depuis l'idée de départ jusqu'au prototype. Ce travail me permet de développer des compétences concrètes, comme l'organisation d'un projet, la création d'interfaces, la logique d'une application et l'intégration d'une IA, tout en restant dans un cadre scolaire clair et mesurable.

---

## 2.3 Objectifs et périmètre

### 2.3.1 Objectif principal

L'objectif de ce travail n'est pas seulement de créer Blaiz'bot, mais aussi de rédiger un exposé qui explique clairement comment le projet a été réalisé. Le rapport doit décrire la démarche étape par étape : découpage en tâches, formulation des consignes, tests, puis corrections quand c'est nécessaire. L'idée est de montrer le déroulement réel du développement, avec une progression logique et des preuves concrètes.

Dans ce cadre, l'application sert surtout de support à la démonstration. Le but n'est pas d'ajouter un maximum de fonctionnalités, mais de construire une version cohérente et compréhensible, puis d'expliquer le processus de façon structurée. Le rapport doit mettre en avant les choix, les limites assumées et la manière dont les problèmes ont été résolus au fil des itérations.

### 2.3.2 Le MVP (Minimum Viable Product)

Pour rester réaliste, je vise un produit minimum viable (MVP), c'est-à-dire une version minimale mais complète, qui fonctionne de bout en bout et peut être démontrée avec un scénario simple.

Dans le MVP, l'application doit permettre au minimum :
- un accès par rôles (administrateur, professeur, élève)
- un espace professeur pour organiser des cours, déposer des ressources et proposer des exercices
- un espace élève pour consulter les contenus, s'entraîner et suivre sa progression
- un chat IA centré sur l'aide à la révision, lié aux cours
- une visualisation de la progression via des indicateurs, sans montrer au professeur le contenu exact du chat élève-IA

L'objectif est d'obtenir une application assez stable pour être testée et présentée, sans complexité inutile. Certaines améliorations d'expérience utilisateur (par exemple l'affichage progressif des réponses de l'IA) restent des bonus, mais le cœur du MVP doit d'abord être fonctionnel.

### 2.3.3 Limites du périmètre

Certaines améliorations pourront être envisagées plus tard, une fois le prototype stabilisé. À l'inverse, certaines idées sont volontairement exclues, car elles rendraient le projet trop lourd pour un travail de maturité.

Par exemple, l'objectif n'est pas de créer une plateforme scolaire complète de type LMS (comme Moodle), ni d'ajouter des fonctions complexes comme l'anti-triche, la surveillance avancée ou des analyses pédagogiques très détaillées. Le rôle Parent existe dans le modèle de données (pour une évolution future), mais aucune interface ni logique métier n'a été implémentée pour ce rôle dans le MVP. Le périmètre reste donc volontairement limité : une application claire, une démonstration réaliste et un rapport qui explique précisément la méthode suivie.

---

**Pages estimées** : 4-5 pages  
**Temps de lecture** : 6-8 minutes  
**Mots-clés** : BlaizBot, MVP, Application Éducative, Interfaces Multi-Rôles, Assistant IA
