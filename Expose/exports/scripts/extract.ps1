# Script d'extraction Word → Markdown + Images
# Usage : .\extract.ps1

$exportDir = Split-Path -Parent $PSScriptRoot
$docxFile = Join-Path $exportDir "expose.docx"
$extractedDir = Join-Path $exportDir "extracted"

# Vérifier que le fichier existe
if (-not (Test-Path $docxFile)) {
    Write-Host "❌ Fichier expose.docx non trouvé dans exports/" -ForegroundColor Red
    Write-Host "   Déposez le fichier Word puis relancez ce script." -ForegroundColor Yellow
    exit 1
}

# Créer les dossiers
New-Item -ItemType Directory -Path "$extractedDir\images" -Force | Out-Null
New-Item -ItemType Directory -Path "$extractedDir\docx-content" -Force | Out-Null

Write-Host "📄 Extraction de $docxFile..." -ForegroundColor Cyan

# Méthode 1 : Pandoc (si installé)
$pandocInstalled = Get-Command pandoc -ErrorAction SilentlyContinue
if ($pandocInstalled) {
    Write-Host "✅ Pandoc détecté - Conversion en Markdown..." -ForegroundColor Green
    pandoc $docxFile -o "$extractedDir\content.md" --extract-media="$extractedDir\images"
    Write-Host "   → $extractedDir\content.md créé" -ForegroundColor Green
    Write-Host "   → Images extraites dans $extractedDir\images\" -ForegroundColor Green
} else {
    Write-Host "⚠️ Pandoc non installé - Extraction manuelle des images..." -ForegroundColor Yellow
    
    # Méthode 2 : Extraction ZIP
    $zipFile = Join-Path $exportDir "expose.zip"
    Copy-Item $docxFile $zipFile -Force
    Expand-Archive $zipFile -DestinationPath "$extractedDir\docx-content" -Force
    Remove-Item $zipFile
    
    # Copier les images
    $mediaPath = "$extractedDir\docx-content\word\media"
    if (Test-Path $mediaPath) {
        Copy-Item "$mediaPath\*" "$extractedDir\images\" -Force
        $imageCount = (Get-ChildItem "$extractedDir\images").Count
        Write-Host "   → $imageCount images extraites dans $extractedDir\images\" -ForegroundColor Green
    } else {
        Write-Host "   → Aucune image trouvée dans le document" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "💡 Pour convertir le texte en Markdown, installez Pandoc :" -ForegroundColor Cyan
    Write-Host "   winget install JohnMacFarlane.Pandoc" -ForegroundColor White
}

Write-Host ""
Write-Host "✅ Extraction terminée !" -ForegroundColor Green
Write-Host ""
Write-Host "Prochaines étapes :" -ForegroundColor Cyan
Write-Host "1. Vérifier les images dans exports/extracted/images/" -ForegroundColor White
Write-Host "2. Renommer les images selon la convention (4-1-workflow.png, etc.)" -ForegroundColor White
Write-Host "3. Déplacer vers Expose/assets/images/" -ForegroundColor White
