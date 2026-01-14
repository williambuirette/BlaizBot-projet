# Phase 08 — Admin : Classes et Matières

> Gestion CRUD des classes et matières avec création automatique des niveaux

---

## Vue d'ensemble

Cette phase implémente les modules de gestion des classes et matières :

| Ressource | Route API | Page | Table | Modal |
|-----------|-----------|------|-------|-------|
| Classes | `/api/admin/classes` | `/admin/classes` | `ClassesTable` | `ClassFormModal` |
| Matières | `/api/admin/subjects` | `/admin/subjects` | `SubjectsTable` | `SubjectFormModal` |

**Particularité** : Les niveaux (Level) sont créés automatiquement à partir du préfixe du nom de classe (ex: "9H-A" → Level "9H").

---

## Tâches

### 8.1 API GET/POST /api/admin/classes

#### Contexte
L'API classes gère la liste et la création de classes. Elle inclut le comptage des élèves inscrits et crée automatiquement le niveau (Level) basé sur le préfixe du nom.

#### Description
Créer `src/app/api/admin/classes/route.ts` avec GET et POST.

#### Prompt
```
Crée src/app/api/admin/classes/route.ts :

1. Imports :
   - prisma depuis @/lib/prisma
   - auth depuis @/lib/auth
   - z depuis zod

2. Schéma Zod createClassSchema :
   - name: z.string().min(2, 'Nom trop court')

3. GET handler :
   - Vérifier session.user.role === 'ADMIN' (sinon 401)
   - prisma.class.findMany avec select :
     - id, name, levelId, createdAt
     - Level: { select: { name } }
     - _count: { select: { StudentProfile: true } }
   - orderBy: { name: 'asc' }
   - Mapper pour retourner : id, name, level (Level.name), studentCount (_count), createdAt

4. POST handler :
   - Vérifier ADMIN
   - Valider body avec createClassSchema.parse()
   - Vérifier unicité du nom (findUnique)

5. POST - Création automatique du niveau :
   - Extraire levelName = name.split('-')[0] || name (ex: "9H-A" → "9H")
   - Chercher Level existant par nom
   - Si non trouvé, créer avec id `level-${levelName.toLowerCase()}`, order: 0

6. POST - Créer la classe :
   - Générer id : `class-${name.toLowerCase().replace(/\s+/g, '-')}`
   - Créer avec name + levelId
   - Retourner avec level name et studentCount: 0 (status 201)

7. Catch ZodError → 400
```

---

### 8.2 API GET/PUT/DELETE /api/admin/classes/[id]

#### Contexte
Les routes dynamiques permettent de lire, modifier et supprimer une classe. La suppression est bloquée si des élèves sont inscrits. La modification met à jour le niveau si le préfixe change.

#### Description
Créer `src/app/api/admin/classes/[id]/route.ts` avec les 3 handlers.

#### Prompt
```
Crée src/app/api/admin/classes/[id]/route.ts :

1. Type Params = { params: Promise<{ id: string }> }

2. Schéma Zod updateClassSchema :
   - name: z.string().min(2)

3. GET handler :
   - Vérifier ADMIN
   - const { id } = await params
   - findUnique avec select incluant Level et _count.StudentProfile
   - Retourner mappé ou 404

4. PUT handler :
   - Vérifier ADMIN, valider avec schema
   - Vérifier classe existe
   - Si name change, vérifier unicité
   - Extraire et créer/récupérer le nouveau Level (même logique que POST)
   - Update avec name + levelId
   - Retourner classe mise à jour avec level et studentCount

5. DELETE handler :
   - Vérifier ADMIN
   - Vérifier classe existe avec _count.StudentProfile
   - SI studentCount > 0 → erreur 400 "Impossible de supprimer : X élève(s) inscrit(s)"
   - Sinon delete et retourner { success: true }
```

---

### 8.3 API GET/POST /api/admin/subjects

#### Contexte
L'API matières est plus simple : pas de niveau, juste un nom unique. Elle inclut le comptage des cours et professeurs liés.

#### Description
Créer `src/app/api/admin/subjects/route.ts` avec GET et POST.

#### Prompt
```
Crée src/app/api/admin/subjects/route.ts :

1. Imports : prisma, auth, z

2. Schéma Zod createSubjectSchema :
   - name: z.string().min(2, 'Nom trop court')

3. GET handler :
   - Vérifier ADMIN
   - prisma.subject.findMany avec select :
     - id, name, createdAt
     - _count: { select: { Course: true, TeacherProfile: true } }
   - orderBy: { name: 'asc' }
   - Mapper : id, name, createdAt, courseCount, teacherCount

4. POST handler :
   - Vérifier ADMIN
   - Valider avec schema
   - Vérifier unicité du nom
   - Générer id : `subject-${name.toLowerCase().replace(/\s+/g, '-')}`
   - Créer avec prisma.subject.create
   - Retourner avec courseCount: 0, teacherCount: 0 (status 201)
```

---

### 8.4 API GET/PUT/DELETE /api/admin/subjects/[id]

#### Contexte
La suppression d'une matière est bloquée si des cours sont liés. Les professeurs ne bloquent pas la suppression (relation many-to-many).

#### Description
Créer `src/app/api/admin/subjects/[id]/route.ts` avec les 3 handlers.

#### Prompt
```
Crée src/app/api/admin/subjects/[id]/route.ts :

1. Type Params, schéma updateSubjectSchema (name optionnel)

2. GET handler :
   - Vérifier ADMIN
   - findUnique avec _count (Course, TeacherProfile)
   - Retourner mappé ou 404

3. PUT handler :
   - Vérifier ADMIN, valider
   - Vérifier matière existe
   - Si name change, vérifier unicité
   - Update et retourner avec counts

4. DELETE handler :
   - Vérifier ADMIN
   - Vérifier matière existe avec _count.Course
   - SI courseCount > 0 → erreur 400 "Impossible de supprimer : X cours lié(s)"
   - Sinon delete et retourner { success: true }
```

---

### 8.5 Composant ClassesTable

#### Contexte
Le tableau affiche les classes avec leur nombre d'élèves et un menu d'actions.

#### Description
Créer `src/components/features/admin/ClassesTable.tsx`.

#### Prompt
```
Crée src/components/features/admin/ClassesTable.tsx :

1. 'use client'

2. Imports :
   - Table, TableBody, TableCell, TableHead, TableHeader, TableRow
   - Button, DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger
   - MoreHorizontal, Pencil, Trash2, Users depuis lucide-react
   - ClassRow depuis @/types/admin

3. Re-export : export type { ClassRow } from '@/types/admin'

4. Props interface ClassesTableProps :
   - classes: ClassRow[]
   - onEdit: (classItem: ClassRow) => void
   - onDelete: (classItem: ClassRow) => void

5. Si classes.length === 0 : message "Aucune classe trouvée"

6. Colonnes :
   - Nom de la classe : font-medium
   - Élèves : icône Users + studentCount (text-muted-foreground)
   - Actions : DropdownMenu avec Modifier et Supprimer (rouge)
```

---

### 8.6 Composant ClassFormModal

#### Contexte
La modale de classe est simple : un seul champ "nom". Le niveau est créé automatiquement côté API.

#### Description
Créer `src/components/features/admin/ClassFormModal.tsx`.

#### Prompt
```
Crée src/components/features/admin/ClassFormModal.tsx :

1. 'use client'

2. Imports :
   - useState, useEffect
   - Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter
   - Button, Input, Label
   - ClassRow depuis @/types/admin

3. Props interface ClassFormModalProps :
   - open: boolean
   - onClose: () => void
   - classItem?: ClassRow | null
   - onSuccess: () => void

4. États : name, loading, error
   - isEdit = !!classItem

5. useEffect : pré-remplir name si classItem, sinon reset

6. handleSubmit :
   - URL = isEdit ? `/api/admin/classes/${classItem.id}` : '/api/admin/classes'
   - Method = isEdit ? 'PUT' : 'POST'
   - fetch avec { name }
   - Gérer erreurs, appeler onSuccess() et onClose() si OK

7. Dialog avec :
   - Titre dynamique (Modifier/Nouvelle classe)
   - Message erreur si error
   - Input name avec placeholder "ex: 9H-A, 10H-B"
   - Texte aide : "Le nom peut être modifié à tout moment"
   - Boutons Annuler + Submit (disabled si loading ou name vide)
```

---

### 8.7 Composant SubjectsTable

#### Contexte
Le tableau matières affiche le nom avec une pastille de couleur (basée sur un mapping), plus les compteurs cours et professeurs.

#### Description
Créer `src/components/features/admin/SubjectsTable.tsx`.

#### Prompt
```
Crée src/components/features/admin/SubjectsTable.tsx :

1. 'use client'

2. Imports : Table components, Button, DropdownMenu, lucide icons (BookOpen, Users)
   - SubjectRow depuis @/types/admin

3. Re-export SubjectRow

4. Mapping couleurs SUBJECT_COLORS :
   - 'Mathématiques': 'bg-blue-500'
   - 'Français': 'bg-red-500'
   - 'Histoire': 'bg-amber-500'
   - 'Géographie': 'bg-green-500'
   - 'Sciences': 'bg-purple-500'
   - 'Anglais': 'bg-pink-500'
   - 'Physique': 'bg-cyan-500'
   - 'Chimie': 'bg-orange-500'
   - 'SVT': 'bg-emerald-500'
   - 'Philosophie': 'bg-indigo-500'
   - Défaut: 'bg-gray-500'

5. Fonction getSubjectColor(name) : retourne la couleur ou gris

6. Colonnes :
   - Matière : pastille colorée (h-3 w-3 rounded-full) + nom
   - Cours : icône BookOpen + courseCount
   - Professeurs : icône Users + teacherCount
   - Actions : DropdownMenu Modifier/Supprimer
```

---

### 8.8 Composant SubjectFormModal

#### Contexte
La modale matière est identique à celle des classes : un champ nom.

#### Description
Créer `src/components/features/admin/SubjectFormModal.tsx`.

#### Prompt
```
Crée src/components/features/admin/SubjectFormModal.tsx :

1. 'use client'

2. Imports : Dialog components, Button, Input, Label, SubjectRow

3. Props : open, onClose, subject?: SubjectRow | null, onSuccess

4. États : name, loading, error, isEdit = !!subject

5. useEffect : pré-remplir si subject

6. handleSubmit :
   - URL : isEdit ? `/api/admin/subjects/${subject.id}` : '/api/admin/subjects'
   - Method : isEdit ? 'PUT' : 'POST'
   - fetch + gestion erreurs

7. Dialog avec Input name placeholder "ex: Mathématiques"
```

---

### 8.9 Page Admin Classes

#### Contexte
La page orchestre ClassesTable et ClassFormModal avec le pattern standard (fetch, edit, delete, create, success).

#### Description
Créer `src/app/(dashboard)/admin/classes/page.tsx`.

#### Prompt
```
Crée src/app/(dashboard)/admin/classes/page.tsx :

1. 'use client'

2. Imports :
   - useState, useEffect, useCallback
   - Button, Plus (lucide)
   - ClassesTable, ClassRow, ClassFormModal
   - toast depuis sonner

3. États : classes[], loading, modalOpen, selectedClass

4. fetchClasses (useCallback) :
   - fetch('/api/admin/classes')
   - setClasses(data)

5. useEffect → fetchClasses()

6. Handlers :
   - handleEdit(classItem) : setSelectedClass, setModalOpen(true)
   - handleDelete(classItem) : confirm(), fetch DELETE, toast, fetchClasses()
   - handleCreate() : setSelectedClass(null), setModalOpen(true)
   - handleSuccess() : toast.success(), fetchClasses()

7. Rendu :
   - Header : "Gestion des classes" + compteur + Button Ajouter
   - ClassesTable ou loading
   - ClassFormModal avec classItem={selectedClass}
```

---

### 8.10 Page Admin Subjects

#### Contexte
Page identique à classes mais pour les matières.

#### Description
Créer `src/app/(dashboard)/admin/subjects/page.tsx`.

#### Prompt
```
Crée src/app/(dashboard)/admin/subjects/page.tsx :

1. 'use client'

2. Même structure que classes :
   - États : subjects[], loading, modalOpen, selectedSubject
   - fetchSubjects()
   - Handlers : handleEdit, handleDelete, handleCreate, handleSuccess

3. Rendu :
   - Header : "Gestion des matières" + compteur + Button
   - SubjectsTable
   - SubjectFormModal avec subject={selectedSubject}
```

---

## Checklist de validation

- [ ] API GET /api/admin/classes retourne liste avec level et studentCount
- [ ] API POST /api/admin/classes crée classe + Level automatique
- [ ] API PUT /api/admin/classes/[id] met à jour name et Level si préfixe change
- [ ] API DELETE /api/admin/classes/[id] bloque si élèves inscrits
- [ ] API GET /api/admin/subjects retourne liste avec courseCount et teacherCount
- [ ] API POST /api/admin/subjects crée matière
- [ ] API DELETE /api/admin/subjects/[id] bloque si cours liés
- [ ] ClassesTable affiche compteur élèves avec icône Users
- [ ] SubjectsTable affiche pastille colorée par matière
- [ ] SubjectsTable affiche compteurs cours et professeurs
- [ ] Modales simples avec un seul champ name
- [ ] Pages fonctionnelles avec CRUD complet et toasts

---

## Liens

- [Phase précédente : 07-ADMIN-USERS.md](07-ADMIN-USERS.md)
- [Phase suivante : 09-STUDENT-DASHBOARD.md](09-STUDENT-DASHBOARD.md)
