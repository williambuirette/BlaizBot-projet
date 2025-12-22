# 9. Stabilisation & Préparation Démo

> Ce chapitre documente la phase finale avant livraison : critères de stabilité, script de démonstration et plans de secours.

---

## 9.1 Critères "Démo Stable"

### 9.1.1 Checklist de validation

Avant de considérer l'application prête pour la démo, tous ces critères doivent être validés :

**Fonctionnel**
- [ ] Parcours connexion complet (login → dashboard → logout)
- [ ] Élève peut utiliser le chat IA
- [ ] Professeur peut voir ses classes
- [ ] Admin peut gérer les utilisateurs
- [ ] Pas de page 404 dans les parcours principaux
- [ ] Pas d'erreur console bloquante

**Technique**
- [ ] Build production sans erreur (`npm run build`)
- [ ] Variables d'environnement configurées
- [ ] Base de données avec données de démo
- [ ] Déploiement Vercel fonctionnel

**UX**
- [ ] Loading states sur les actions longues
- [ ] Messages d'erreur compréhensibles
- [ ] Navigation intuitive
- [ ] Responsive (desktop minimum)

### 9.1.2 Données de démonstration

| Entité | Quantité | Détails |
| :--- | :--- | :--- |
| Utilisateurs | 10 | 5 élèves, 3 profs, 2 admins |
| Classes | 3 | 6ème A, 5ème B, 4ème C |
| Matières | 4 | Maths, Français, Histoire, Sciences |
| Cours | 8 | 2 par matière |
| Progressions | 15 | Variées pour montrer les graphiques |

### 9.1.3 Comptes de démo

| Rôle | Email | Mot de passe |
| :--- | :--- | :--- |
| Élève | `eleve@demo.com` | `demo123` |
| Professeur | `prof@demo.com` | `demo123` |
| Admin | `admin@demo.com` | `demo123` |

## 9.2 Script de démonstration

### 9.2.1 Durée cible : 5-7 minutes

```
┌─────────────────────────────────────────────────────────────┐
│                    SCRIPT DE DÉMO                           │
│                    Durée : 5-7 min                          │
└─────────────────────────────────────────────────────────────┘

0:00 - 0:30 │ INTRODUCTION
             │ "BlaizBot est une plateforme éducative avec IA intégrée."
             │ Montrer la page d'accueil / login

0:30 - 2:00 │ PARCOURS ÉLÈVE
             │ - Connexion élève
             │ - Dashboard : montrer la progression
             │ - Chat Blaiz'bot : poser une question de maths
             │ - Montrer que l'IA donne des indices, pas la réponse

2:00 - 3:30 │ PARCOURS PROFESSEUR
             │ - Connexion professeur
             │ - Dashboard : KPIs de la classe
             │ - Gestion des classes : liste des élèves
             │ - Suivi individuel : cliquer sur un élève

3:30 - 4:30 │ PARCOURS ADMIN
             │ - Connexion admin
             │ - Statistiques globales
             │ - Gestion des utilisateurs (montrer CRUD)

4:30 - 5:30 │ ASPECTS TECHNIQUES
             │ - Montrer le code (structure Next.js)
             │ - Montrer un agent (Copilot Chat)
             │ - Expliquer le Vibe Coding brièvement

5:30 - 7:00 │ QUESTIONS / CONCLUSION
             │ "Des questions sur l'application ou la méthodologie ?"
```

### 9.2.2 Points clés à mettre en avant

| Point | Message |
| :--- | :--- |
| **IA éducative** | "L'IA guide sans donner les réponses" |
| **3 rôles** | "Une plateforme complète : élève, prof, admin" |
| **Vibe Coding** | "Développé en X jours avec assistance IA" |
| **Full-stack** | "Next.js, Prisma, PostgreSQL, OpenAI" |

### 9.2.3 Transitions suggérées

- "Maintenant, voyons ce que peut faire un professeur..."
- "Passons au panneau d'administration..."
- "Du côté technique, voici comment c'est structuré..."

## 9.3 Plan B : Alternatives si problème

### 9.3.1 Scénarios de secours

| Problème | Solution |
| :--- | :--- |
| **Internet coupé** | Vidéo de démo pré-enregistrée |
| **API OpenAI down** | Réponses mockées en local |
| **Vercel inaccessible** | Démo en local (`npm run dev`) |
| **Bug critique** | Screenshots + explication technique |

### 9.3.2 Vidéo de backup

- [ ] Enregistrer une vidéo de 5 min du parcours complet
- [ ] Héberger sur Google Drive (accessible offline si téléchargée)
- [ ] Avoir la vidéo sur une clé USB

### 9.3.3 Version locale fonctionnelle

```bash
# Préparer une version locale qui fonctionne sans internet
git clone [repo]
npm install
# Configurer .env avec mock data
npm run dev
```

## 9.4 Checklist pré-démo (J-1)

### 9.4.1 Vérifications techniques

- [ ] Tester le déploiement Vercel
- [ ] Vérifier les variables d'environnement
- [ ] Tester les 3 parcours utilisateurs
- [ ] Vérifier que le chat IA répond
- [ ] Tester sur le navigateur de présentation

### 9.4.2 Préparation matérielle

- [ ] Ordinateur chargé
- [ ] Connexion internet testée
- [ ] Vidéo de backup disponible
- [ ] Notes / script imprimé (si besoin)

### 9.4.3 Préparation mentale

- [ ] Relire le script de démo
- [ ] Identifier les 3 points clés à retenir
- [ ] Préparer des réponses aux questions probables

## 9.5 Questions fréquentes anticipées

| Question | Réponse type |
| :--- | :--- |
| "Combien de temps pour développer ?" | "~X semaines en utilisant le Vibe Coding" |
| "L'IA peut-elle tricher ?" | "Non, elle est configurée pour donner des indices uniquement" |
| "C'est déployable en production ?" | "Oui, avec ajouts sécurité et tests" |
| "Quel est le coût de l'IA ?" | "~$X/mois pour Y utilisateurs" |
| "Tu as tout codé toi-même ?" | "J'ai guidé l'IA, validé et corrigé le code" |

## 9.6 Preuves

### 9.6.1 Captures requises

- [ ] `09-demo/checklist-validation.png`
- [ ] `09-demo/donnees-demo.png`
- [ ] `09-demo/script-demo.png`

### 9.6.2 Journal de bord

```
Date/heure : [...]
Étape : 9 - Préparation démo
Objectif : Application stable et script prêt
Actions :
- Checklist validation complétée
- Données de démo insérées
- Script de 5 min rédigé
- Vidéo backup enregistrée
Problèmes : [...]
Preuves : [lien vidéo, screenshots]
```

---

**Mots-clés** : démo, stabilisation, script, plan B, checklist
**Statut** : ⏳ À réaliser (après développement)
