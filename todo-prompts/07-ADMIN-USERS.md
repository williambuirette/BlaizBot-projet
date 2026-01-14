# Phase 07 — Admin : Gestion Utilisateurs

> Interface CRUD complète pour les utilisateurs avec attribution de rôles, classes et matières

---

## Vue d'ensemble

Cette phase implémente le module de gestion des utilisateurs pour l'administrateur :

| Composant | Fichier | Rôle |
|-----------|---------|------|
| Page | `(dashboard)/admin/users/page.tsx` | Liste + actions CRUD |
| API GET | `api/admin/users/route.ts` | Liste tous les users |
| API POST | `api/admin/users/route.ts` | Crée un user |
| API GET [id] | `api/admin/users/[id]/route.ts` | Récupère 1 user |
| API PUT [id] | `api/admin/users/[id]/route.ts` | Modifie 1 user |
| API DELETE [id] | `api/admin/users/[id]/route.ts` | Supprime 1 user |
| Table | `UsersTable.tsx` | Affichage liste |
| Modal | `UserFormModal.tsx` | Formulaire création/édition |
| Hook | `useUserForm.ts` | Logique formulaire |

---

## Tâches

### 7.1 Types Admin

#### Contexte
Les types partagés pour l'administration permettent de typer les données utilisateur, classe et matière de manière cohérente entre l'API et les composants.

#### Description
Créer le fichier de types `src/types/admin.ts` avec les interfaces `UserRow`, `ClassRow`, `SubjectRow` et le type `Role`.

#### Prompt
```
Crée src/types/admin.ts avec :

1. UserRow interface :
   - id: string
   - email: string
   - firstName, lastName: string
   - role: 'ADMIN' | 'TEACHER' | 'STUDENT'
   - phone, address, city, postalCode: string | null (optionnels)
   - isActive: boolean (optionnel)
   - createdAt: Date | string
   - Pour STUDENT : classId, className (optionnels)
   - Pour TEACHER : classIds[], classNames[], subjectIds[], subjectNames[] (optionnels)

2. ClassRow interface :
   - id, name, level: string
   - studentCount: number
   - createdAt: Date | string

3. SubjectRow interface :
   - id, name: string
   - courseCount, teacherCount: number
   - createdAt: Date | string

4. Role type = 'ADMIN' | 'TEACHER' | 'STUDENT'

Exporter tous les types.
```

---

### 7.2 API GET /api/admin/users

#### Contexte
L'API doit retourner la liste des utilisateurs avec leurs profils (StudentProfile/TeacherProfile) aplatis pour faciliter l'affichage. Elle inclut les classes et matières assignées.

#### Description
Créer la route GET dans `src/app/api/admin/users/route.ts` qui :
- Vérifie que l'utilisateur est ADMIN
- Récupère tous les users avec leurs profils via Prisma
- Mappe les données pour aplatir la structure

#### Prompt
```
Crée src/app/api/admin/users/route.ts avec GET :

1. Imports :
   - prisma depuis @/lib/prisma
   - auth depuis @/lib/auth

2. GET handler :
   - Vérifier session.user.role === 'ADMIN' (sinon 401)
   - prisma.user.findMany avec select :
     - Champs de base : id, email, firstName, lastName, role, phone, address, city, postalCode, isActive, createdAt
     - StudentProfile: { select: { classId, Class: { select: { id, name } } } }
     - TeacherProfile: { select: { Class: { select: { id, name } }, Subject: { select: { id, name } } } }
   - orderBy: { createdAt: 'desc' }

3. Mapper les résultats pour aplatir :
   - classId, className depuis StudentProfile
   - classIds[], classNames[] depuis TeacherProfile.Class
   - subjectIds[], subjectNames[] depuis TeacherProfile.Subject

4. Retourner Response.json(mappedUsers)
```

---

### 7.3 API POST /api/admin/users

#### Contexte
La création d'utilisateur doit :
- Valider les données avec Zod
- Hasher le mot de passe avec bcrypt
- Créer User + StudentProfile/TeacherProfile dans une transaction
- Gérer l'attribution des classes (1 pour STUDENT, N pour TEACHER) et matières (N pour TEACHER)

#### Description
Ajouter le handler POST dans `src/app/api/admin/users/route.ts` avec validation Zod et transaction Prisma.

#### Prompt
```
Ajoute POST à src/app/api/admin/users/route.ts :

1. Imports supplémentaires :
   - bcrypt depuis bcryptjs
   - z depuis zod

2. Schéma Zod createUserSchema :
   - email: z.string().email()
   - firstName, lastName: z.string().min(2)
   - password: z.string().min(6)
   - role: z.enum(['ADMIN', 'TEACHER', 'STUDENT'])
   - phone, address, city, postalCode: z.string().nullable().optional()
   - classId: z.string().optional() (pour STUDENT)
   - classIds: z.array(z.string()).optional() (pour TEACHER)
   - subjectIds: z.array(z.string()).optional() (pour TEACHER)
   - Ajouter .refine() : si role=STUDENT, classId obligatoire

3. POST handler :
   - Vérifier ADMIN
   - Valider body avec createUserSchema.parse()
   - Vérifier email unique (findUnique)
   - Hasher password : bcrypt.hash(data.password, 10)
   - Générer id : `user-${email.split('@')[0]}-${Date.now()}`

4. Transaction prisma.$transaction :
   - Créer User
   - Si STUDENT + classId : créer StudentProfile avec id `student-${user.id}`
   - Si TEACHER : créer TeacherProfile avec id `teacher-${user.id}`
     - Class: { connect: classIds.map(cid => ({ id: cid })) }
     - Subject: { connect: subjectIds.map(sid => ({ id: sid })) }

5. Récupérer et retourner l'user créé avec profils (status 201)

6. Catch ZodError → 400 avec details
```

---

### 7.4 API GET/PUT/DELETE /api/admin/users/[id]

#### Contexte
Les routes dynamiques permettent de gérer un utilisateur spécifique. Le PUT doit gérer :
- Mise à jour des champs de base
- Mise à jour du mot de passe (optionnel)
- Mise à jour des classes/matières via set/connect Prisma

#### Description
Créer `src/app/api/admin/users/[id]/route.ts` avec les 3 handlers.

#### Prompt
```
Crée src/app/api/admin/users/[id]/route.ts :

1. Type Params = { params: Promise<{ id: string }> }

2. Schéma Zod updateUserSchema (tous champs .optional()) :
   - email, firstName, lastName, password, role
   - phone, address, city, postalCode (.nullable())
   - classId (.nullable())
   - classIds, subjectIds (arrays)

3. Helper mapUserWithClasses(user) pour aplatir la réponse

4. GET handler :
   - Vérifier ADMIN
   - const { id } = await params
   - findUnique avec select incluant StudentProfile et TeacherProfile
   - Retourner mapUserWithClasses(user) ou 404

5. PUT handler :
   - Vérifier ADMIN
   - Valider avec updateUserSchema
   - Vérifier user existe
   - Si email change, vérifier unicité
   - Préparer updateData (ne pas inclure champs undefined)
   - Si password fourni : bcrypt.hash()

6. PUT - Transaction pour profils :
   - Si STUDENT + classId défini :
     - Si StudentProfile existe → update
     - Sinon → create
   - Si TEACHER + (classIds ou subjectIds défini) :
     - Si TeacherProfile existe → update avec set:[] puis connect
     - Sinon → create avec connect
   - Retourner user mis à jour

7. DELETE handler :
   - Vérifier ADMIN
   - Empêcher suppression dernier admin (count ADMIN <= 1)
   - Empêcher auto-suppression (id === session.user.id)
   - prisma.user.delete({ where: { id } })
   - Retourner { success: true }
```

---

### 7.5 Composant UsersTable

#### Contexte
Le tableau affiche la liste des utilisateurs avec leurs rôles (via RoleBadge), leurs classes/matières (badges) et un menu d'actions (modifier/supprimer).

#### Description
Créer `src/components/features/admin/UsersTable.tsx` avec les composants shadcn/ui Table et DropdownMenu.

#### Prompt
```
Crée src/components/features/admin/UsersTable.tsx :

1. 'use client'

2. Imports :
   - Table, TableBody, TableCell, TableHead, TableHeader, TableRow depuis @/components/ui/table
   - Button depuis @/components/ui/button
   - DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger depuis @/components/ui/dropdown-menu
   - Badge depuis @/components/ui/badge
   - RoleBadge depuis @/components/ui/role-badge
   - MoreHorizontal, Pencil, Trash2 depuis lucide-react
   - UserRow depuis @/types/admin

3. Re-export : export type { UserRow } from '@/types/admin'

4. Props interface UsersTableProps :
   - users: UserRow[]
   - onEdit: (user: UserRow) => void
   - onDelete: (user: UserRow) => void

5. Si users.length === 0 : afficher message "Aucun utilisateur"

6. Colonnes du tableau :
   - Nom : {firstName} {lastName}
   - Email
   - Rôle : <RoleBadge role={user.role} />
   - Classes / Matières :
     - STUDENT : Badge variant="outline" avec className
     - TEACHER : Badges outline pour classes + Badges secondary pour matières
     - ADMIN : "—"
   - Actions : DropdownMenu avec Modifier et Supprimer (rouge)
```

---

### 7.6 Hook useUserForm

#### Contexte
Le hook encapsule toute la logique du formulaire utilisateur : états, chargement des classes/matières, pré-remplissage en mode édition, validation et soumission.

#### Description
Créer `src/hooks/admin/useUserForm.ts` avec gestion des états et des appels API.

#### Prompt
```
Crée src/hooks/admin/useUserForm.ts :

1. 'use client'

2. Props interface UseUserFormProps :
   - user?: UserRow | null
   - onSuccess: () => void
   - onClose: () => void

3. Return interface UseUserFormReturn avec tous les états et setters :
   - firstName, lastName, email, password, role
   - phone, address, city, postalCode
   - classId, classIds, classes[], classesLoading (pour classes)
   - subjectIds, subjects[], subjectsLoading (pour matières)
   - loading, error, isEdit
   - handleSubmit

4. useState pour tous les champs + isEdit = !!user

5. useEffect - Charger les classes au montage :
   - fetch('/api/admin/classes')
   - setClasses(data)

6. useEffect - Charger les matières au montage :
   - fetch('/api/admin/subjects')
   - setSubjects(data)

7. useEffect - Pré-remplir si user fourni :
   - Tous les champs depuis user
   - classId, classIds, subjectIds
   - Reset si user est null

8. handleSubmit (useCallback) :
   - Validation : si STUDENT, classId obligatoire
   - Construire payload avec tous les champs
   - Ajouter classId si STUDENT
   - Ajouter classIds et subjectIds si TEACHER
   - Ajouter password si fourni
   - URL : isEdit ? `/api/admin/users/${user.id}` : '/api/admin/users'
   - Method : isEdit ? 'PUT' : 'POST'
   - fetch + gestion erreurs
   - onSuccess() et onClose() si OK
```

---

### 7.7 Composant UserFormModal

#### Contexte
La modale de création/édition utilise le hook useUserForm et affiche conditionnellement :
- Sélecteur de classe (Select) pour STUDENT
- Checkboxes de classes + matières pour TEACHER

#### Description
Créer `src/components/features/admin/UserFormModal.tsx` avec Dialog shadcn/ui.

#### Prompt
```
Crée src/components/features/admin/UserFormModal.tsx :

1. 'use client'

2. Imports :
   - Dialog, DialogContent, DialogHeader, DialogTitle, DialogFooter
   - Button, Input, Label
   - Select, SelectContent, SelectItem, SelectTrigger, SelectValue
   - Separator, Checkbox
   - useUserForm depuis @/hooks/admin/useUserForm
   - UserRow, Role depuis @/types/admin

3. Props interface UserFormModalProps :
   - open: boolean
   - onClose: () => void
   - user?: UserRow | null
   - onSuccess: () => void

4. Utiliser le hook useUserForm({ user, onSuccess, onClose })

5. Fonctions toggle :
   - toggleTeacherClass(id) : ajoute/retire de classIds
   - toggleTeacherSubject(id) : ajoute/retire de subjectIds

6. Formulaire dans Dialog :
   - Si error : afficher message rouge
   - Grille 2 colonnes : Prénom, Nom (Input required minLength=2)
   - Email (Input type=email required)
   - Mot de passe (Input type=password, required seulement si !isEdit)
   - Rôle (Select avec STUDENT, TEACHER, ADMIN)

7. Conditionnel si role === 'STUDENT' :
   - Select pour classId (obligatoire)
   - Options depuis classes[]

8. Conditionnel si role === 'TEACHER' :
   - Label "Classes assignées"
   - Grille de Checkbox pour chaque classe
   - Label "Matières enseignées"
   - Grille de Checkbox pour chaque matière

9. Separator + section contact optionnel :
   - Téléphone, Adresse, Code postal, Ville

10. DialogFooter : Annuler + Submit (disabled si loading)
```

---

### 7.8 Page Admin Users

#### Contexte
La page principale orchestre les composants UsersTable et UserFormModal. Elle gère l'état de la liste, le chargement, et les callbacks pour les actions CRUD.

#### Description
Créer `src/app/(dashboard)/admin/users/page.tsx` avec la gestion complète.

#### Prompt
```
Crée src/app/(dashboard)/admin/users/page.tsx :

1. 'use client'

2. Imports :
   - useState, useEffect, useCallback
   - Button depuis @/components/ui/button
   - UsersTable, UserRow depuis @/components/features/admin/UsersTable
   - UserFormModal depuis @/components/features/admin/UserFormModal
   - Plus depuis lucide-react
   - toast depuis sonner

3. États :
   - users: UserRow[] = []
   - loading: boolean = true
   - modalOpen: boolean = false
   - selectedUser: UserRow | null = null

4. fetchUsers (useCallback async) :
   - fetch('/api/admin/users')
   - setUsers(data)
   - setLoading(false) dans finally

5. useEffect → appeler fetchUsers()

6. Handlers :
   - handleEdit(user) : setSelectedUser(user), setModalOpen(true)
   - handleDelete(user) : confirm(), fetch DELETE, toast.success/error, fetchUsers()
   - handleCreate() : setSelectedUser(null), setModalOpen(true)
   - handleSuccess() : toast.success(), fetchUsers()

7. Rendu :
   - Header : titre "Gestion des utilisateurs" + compteur + Button "Ajouter"
   - Si loading : "Chargement..."
   - Sinon : <UsersTable users={users} onEdit={handleEdit} onDelete={handleDelete} />
   - <UserFormModal open={modalOpen} onClose={() => setModalOpen(false)} user={selectedUser} onSuccess={handleSuccess} />
```

---

## Checklist de validation

- [ ] Types admin.ts créé et exporté
- [ ] API GET /api/admin/users retourne la liste complète avec profils
- [ ] API POST /api/admin/users crée user + StudentProfile/TeacherProfile
- [ ] API GET/PUT/DELETE /api/admin/users/[id] fonctionnels
- [ ] PUT gère correctement les classes/matières via transaction
- [ ] DELETE empêche suppression dernier admin et auto-suppression
- [ ] UsersTable affiche badges rôle + classes + matières
- [ ] UserFormModal affiche Select classe pour STUDENT
- [ ] UserFormModal affiche Checkboxes classes + matières pour TEACHER
- [ ] Hook useUserForm charge classes et matières au montage
- [ ] Page admin/users permet CRUD complet avec toasts

---

## Liens

- [Phase précédente : 06-TYPES-HOOKS.md](06-TYPES-HOOKS.md)
- [Phase suivante : 08-ADMIN-CLASSES.md](08-ADMIN-CLASSES.md)
