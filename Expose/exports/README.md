# Exports de l'exposé

Ce dossier contient les versions exportées de l'exposé et les outils de conversion.

## 📁 Structure

```
exports/
├── README.md           ← Ce fichier
├── expose.docx         ← Version Word (à déposer ici)
├── expose.pdf          ← Version PDF (à déposer ici)
├── extracted/          ← Contenu extrait (images, texte)
│   ├── images/         ← Images extraites du Word
│   └── content.md      ← Texte converti en Markdown
└── scripts/
    └── extract.ps1     ← Script d'extraction
```

## 🔧 Outils de conversion

### Option 1 : Pandoc (conversion Word → Markdown)
```powershell
# Installer pandoc via winget
winget install JohnMacFarlane.Pandoc

# Convertir Word en Markdown avec images
pandoc expose.docx -o extracted/content.md --extract-media=extracted/images
```

### Option 2 : Extraction manuelle des images
```powershell
# Renommer .docx en .zip et extraire
Copy-Item "expose.docx" "expose.zip"
Expand-Archive "expose.zip" -DestinationPath "extracted/docx-content"
# Les images sont dans : extracted/docx-content/word/media/
```

## 📋 Checklist après dépôt

- [ ] Déposer `expose.docx` dans ce dossier
- [ ] Déposer `expose.pdf` dans ce dossier
- [ ] Lancer le script d'extraction : `.\scripts\extract.ps1`
- [ ] Vérifier les images extraites dans `extracted/images/`
- [ ] Comparer avec les fichiers Markdown existants

## 🖼️ Inventaire des images attendues

| Chapitre | Image | Fichier | Statut |
|:---|:---|:---|:---|
| 4.1 | Workflow kickoff | `4-1-workflow.png` | ⬜ |
| 4.2 | Layout structure | `4-2-layout.png` | ⬜ |
| 4.3 | Wireframe login | `4-3-login.png` | ⬜ |
| 4.3 | Dashboard élève | `4-3-student.png` | ⬜ |
| 4.3 | Dashboard prof | `4-3-teacher.png` | ⬜ |
| 4.3 | Dashboard admin | `4-3-admin.png` | ⬜ |
| 4.7 | Phases avant/après | `4-7-phases.png` | ⬜ |
| 4.8 | Backlog TODO | `4-8-backlog.png` | ⬜ |
| 4.9 | Gabarit prompt | `4-9-prompt.png` | ⬜ |
| 4.10 | Kickoff complet | `4-10-kickoff.png` | ⬜ |
