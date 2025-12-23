# Build Expose Script
# Génère les versions HTML et Word de l'exposé à partir des fichiers Markdown

param(
    [ValidateSet('html', 'word', 'all')]
    [string]$Format = 'html',
    [switch]$Open
)

$ErrorActionPreference = "Stop"

# Chemins
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ContentDir = Join-Path $ProjectRoot "content"
$ExportsDir = Join-Path $ProjectRoot "exports"
$AssetsDir = Join-Path $ProjectRoot "assets"
$TemplatesDir = Join-Path $ProjectRoot "templates"

# Créer les dossiers de sortie
$HtmlExportDir = Join-Path $ExportsDir "html"
$WordExportDir = Join-Path $ExportsDir "word"

New-Item -ItemType Directory -Path $HtmlExportDir -Force | Out-Null
New-Item -ItemType Directory -Path $WordExportDir -Force | Out-Null

# Liste des fichiers dans l'ordre (correspond à content/)
$chapters = @(
    "00-cadre-travail.md",
    "01-idee-problematique.md",
    "02-organisation-chatgpt.md",
    "03-choix-outils.md",
    "04-specifications-prd.md",
    "05-wireframe-ux.md",
    "06-architecture.md",
    "07-prompts-agents.md",
    "08-developpement.md",
    "09-demo-stabilisation.md",
    "10-analyse-resultats.md",
    "11-limites-risques.md",
    "12-conclusion.md"
)

$annexes = @(
    "annexes/A-glossaire.md",
    "annexes/B-code-samples.md",
    "annexes/C-screenshots.md",
    "annexes/D-references.md"
)

Write-Host "=== Build Expose ===" -ForegroundColor Cyan
Write-Host "Format: $Format" -ForegroundColor Yellow

# Fonction pour générer HTML
function Build-HTML {
    Write-Host "`n[HTML] Génération en cours..." -ForegroundColor Yellow
    
    $outputFile = Join-Path $HtmlExportDir "expose-vibecoding.html"
    
    # Header HTML
    $htmlContent = @"
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Le Paradigme du Vibecoding - Exposé</title>
    <style>
        :root {
            --primary: #3498db;
            --dark: #2c3e50;
            --light: #ecf0f1;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.8;
            max-width: 900px;
            margin: 0 auto;
            padding: 40px 20px;
            color: var(--dark);
        }
        h1 { color: var(--primary); border-bottom: 3px solid var(--primary); padding-bottom: 10px; }
        h2 { color: var(--dark); margin-top: 40px; }
        h3 { color: #555; }
        code { background: var(--light); padding: 2px 6px; border-radius: 4px; font-size: 0.9em; }
        pre { background: #1e1e1e; color: #d4d4d4; padding: 20px; border-radius: 8px; overflow-x: auto; }
        pre code { background: none; color: inherit; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background: var(--primary); color: white; }
        tr:nth-child(even) { background: var(--light); }
        blockquote { border-left: 4px solid var(--primary); margin: 20px 0; padding-left: 20px; color: #666; font-style: italic; }
        .page-break { page-break-after: always; }
        @media print {
            body { max-width: none; }
            pre { white-space: pre-wrap; }
        }
    </style>
</head>
<body>
"@
    
    # Ajouter les chapitres
    foreach ($chapter in $chapters) {
        $filePath = Join-Path $ContentDir $chapter
        if (Test-Path $filePath) {
            $content = Get-Content $filePath -Raw -Encoding UTF8
            # Conversion basique MD -> HTML (simplifiée)
            $htmlContent += "<div class='chapter'>`n"
            $htmlContent += "<div class='page-break'></div>`n"
            $htmlContent += "<!-- $chapter -->`n"
            $htmlContent += ConvertFrom-Markdown -InputObject $content | Select-Object -ExpandProperty Html
            $htmlContent += "`n</div>`n"
            Write-Host "  ✓ $chapter" -ForegroundColor Green
        } else {
            Write-Host "  ✗ $chapter (non trouvé)" -ForegroundColor Red
        }
    }
    
    # Ajouter les annexes
    $htmlContent += "<h1>Annexes</h1>`n"
    foreach ($annexe in $annexes) {
        $filePath = Join-Path $ContentDir $annexe
        if (Test-Path $filePath) {
            $content = Get-Content $filePath -Raw -Encoding UTF8
            $htmlContent += "<div class='annexe'>`n"
            $htmlContent += ConvertFrom-Markdown -InputObject $content | Select-Object -ExpandProperty Html
            $htmlContent += "`n</div>`n"
            Write-Host "  ✓ $annexe" -ForegroundColor Green
        }
    }
    
    # Footer HTML
    $htmlContent += @"
</body>
</html>
"@
    
    # Sauvegarder
    $htmlContent | Out-File -FilePath $outputFile -Encoding UTF8
    Write-Host "`n[HTML] Généré: $outputFile" -ForegroundColor Green
    
    return $outputFile
}

# Fonction pour préparer Word (nécessite Pandoc)
function Build-Word {
    Write-Host "`n[WORD] Vérification de Pandoc..." -ForegroundColor Yellow
    
    $pandocInstalled = Get-Command pandoc -ErrorAction SilentlyContinue
    if (-not $pandocInstalled) {
        Write-Host "  ⚠ Pandoc non installé. Installez-le avec: winget install pandoc" -ForegroundColor Yellow
        Write-Host "  → Le fichier combiné Markdown sera créé à la place." -ForegroundColor Yellow
        
        # Créer un fichier MD combiné
        $combinedMd = ""
        foreach ($chapter in $chapters) {
            $filePath = Join-Path $ContentDir $chapter
            if (Test-Path $filePath) {
                $combinedMd += Get-Content $filePath -Raw -Encoding UTF8
                $combinedMd += "`n`n---`n`n"
            }
        }
        foreach ($annexe in $annexes) {
            $filePath = Join-Path $ContentDir $annexe
            if (Test-Path $filePath) {
                $combinedMd += Get-Content $filePath -Raw -Encoding UTF8
                $combinedMd += "`n`n---`n`n"
            }
        }
        
        $mdOutput = Join-Path $WordExportDir "expose-vibecoding-combined.md"
        $combinedMd | Out-File -FilePath $mdOutput -Encoding UTF8
        Write-Host "[WORD] Fichier MD combiné: $mdOutput" -ForegroundColor Green
        return $mdOutput
    }
    
    # Avec Pandoc
    $mdFiles = ($chapters + $annexes) | ForEach-Object { Join-Path $ContentDir $_ }
    $outputFile = Join-Path $WordExportDir "expose-vibecoding.docx"
    
    $pandocArgs = $mdFiles + @("-o", $outputFile, "--toc", "--toc-depth=2")
    & pandoc $pandocArgs
    
    Write-Host "[WORD] Généré: $outputFile" -ForegroundColor Green
    return $outputFile
}

# Exécution
switch ($Format) {
    'html' { 
        $output = Build-HTML 
        if ($Open) { Start-Process $output }
    }
    'word' { 
        $output = Build-Word 
        if ($Open) { Start-Process $output }
    }
    'all' {
        Build-HTML
        Build-Word
    }
}

Write-Host "`n=== Build terminé ===" -ForegroundColor Cyan
