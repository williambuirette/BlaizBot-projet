# Expose Status Script
# Affiche l'etat actuel de la documentation de l'expose
# Usage: .\scripts\expose-status.ps1

param(
    [switch]$Detailed
)

$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

# Chemins
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ProgressFile = Join-Path $ProjectRoot "progress.json"
$ContentDir = Join-Path $ProjectRoot "content"
$ScreenshotsDir = Join-Path $ProjectRoot "assets\screenshots"

# Couleurs
function Write-Success { param($msg) Write-Host $msg -ForegroundColor Green }
function Write-Warn { param($msg) Write-Host $msg -ForegroundColor Yellow }
function Write-Err { param($msg) Write-Host $msg -ForegroundColor Red }
function Write-Info { param($msg) Write-Host $msg -ForegroundColor Cyan }

# Header
Write-Host "`n" -NoNewline
Write-Host "+==============================================================+" -ForegroundColor Cyan
Write-Host "|              EXPOSE VIBECODING - STATUS                      |" -ForegroundColor Cyan
Write-Host "+==============================================================+" -ForegroundColor Cyan
Write-Host ""

# Charger progress.json
if (-not (Test-Path $ProgressFile)) {
    Write-Err "[X] Fichier progress.json introuvable!"
    exit 1
}

$progress = Get-Content $ProgressFile -Raw -Encoding UTF8 | ConvertFrom-Json

# === SECTION 1: METRIQUES ===
Write-Info "[METRIQUES]"
Write-Host "---------------------------------------------"
$metrics = $progress.metrics

$totalHours = $metrics.brainstormingHours + $metrics.wireframeHours + $metrics.architectureHours + $metrics.developmentHours + $metrics.documentationHours

Write-Host "  Brainstorming    : $($metrics.brainstormingHours)h"
Write-Host "  Wireframe        : $($metrics.wireframeHours)h"
Write-Host "  Architecture     : $($metrics.architectureHours)h"
Write-Host "  Developpement    : $($metrics.developmentHours)h"
Write-Host "  Documentation    : $($metrics.documentationHours)h"
Write-Host "  ---------------------"
Write-Host "  TOTAL            : $($totalHours)h" -ForegroundColor Yellow
Write-Host ""

# === SECTION 2: CHAPITRES ===
Write-Info "[CHAPITRES]"
Write-Host "---------------------------------------------"

$statusIcons = @{
    "done" = "[OK]"
    "in-progress" = "[..]"
    "draft" = "[--]"
    "to-fill" = "[!!]"
    "not-started" = "[  ]"
}

$doneCount = 0
$totalChapters = $progress.chapters.Count

foreach ($chapter in $progress.chapters) {
    $icon = $statusIcons[$chapter.status]
    
    if ($chapter.status -eq "done") { 
        $doneCount++
        Write-Success "  $icon $($chapter.id). $($chapter.title)"
    } elseif ($chapter.status -eq "in-progress") {
        Write-Warn "  $icon $($chapter.id). $($chapter.title)"
    } else {
        Write-Host "  $icon $($chapter.id). $($chapter.title)"
    }
}

$progressPercent = [math]::Round(($doneCount / $totalChapters) * 100)
Write-Host ""
Write-Host "  Progression : $doneCount/$totalChapters chapitres ($progressPercent pct)" -ForegroundColor Yellow
Write-Host ""

# === SECTION 3: ANNEXES ===
Write-Info "[ANNEXES]"
Write-Host "---------------------------------------------"

foreach ($annexe in $progress.annexes) {
    $icon = $statusIcons[$annexe.status]
    Write-Host "  $icon Annexe $($annexe.id): $($annexe.title)"
}
Write-Host ""

# === SECTION 4: CAPTURES ===
Write-Info "[CAPTURES D'ECRAN]"
Write-Host "---------------------------------------------"

$requiredCaptures = @(
    "phase-01-hello.png",
    "phase-02-layout.png",
    "phase-03-slice.png",
    "phase-04-prisma.png",
    "phase-05-auth.png",
    "phase-06-admin.png",
    "phase-07-teacher.png",
    "phase-08-student.png",
    "phase-09-ai-chat.gif"
)

$capturesFound = 0
foreach ($capture in $requiredCaptures) {
    $capturePath = Join-Path $ScreenshotsDir $capture
    if (Test-Path $capturePath) {
        Write-Success "  [OK] $capture"
        $capturesFound++
    } else {
        Write-Host "  [  ] $capture"
    }
}

Write-Host ""
Write-Host "  Captures : $capturesFound/$($requiredCaptures.Count)" -ForegroundColor Yellow
Write-Host ""

# === SECTION 5: PHASES (depuis mapping) ===
if ($progress.automation.phaseMapping) {
    Write-Info "[MAPPING PHASES -> HEURES]"
    Write-Host "---------------------------------------------"
    
    $totalPhaseHours = 0
    foreach ($phase in $progress.automation.phaseMapping.PSObject.Properties) {
        $hours = $phase.Value.hours
        $totalPhaseHours += $hours
        Write-Host "  $($phase.Name): $($hours)h -> Chapitre $($phase.Value.chapter)"
    }
    Write-Host "  ---------------------"
    Write-Host "  Total estime : $($totalPhaseHours)h" -ForegroundColor Yellow
    Write-Host ""
}

# === SECTION 6: ACTIONS REQUISES ===
Write-Info "[ACTIONS REQUISES]"
Write-Host "---------------------------------------------"

$actions = @()

# Chapitres a completer
$inProgress = $progress.chapters | Where-Object { $_.status -eq "in-progress" }
foreach ($ch in $inProgress) {
    $actions += "[..] Completer chapitre $($ch.id): $($ch.title)"
}

# Chapitres a remplir
$toFill = $progress.chapters | Where-Object { $_.status -eq "to-fill" }
foreach ($ch in $toFill) {
    $actions += "[!!] Retro-documenter chapitre $($ch.id): $($ch.title)"
}

# Captures manquantes
foreach ($capture in $requiredCaptures) {
    $capturePath = Join-Path $ScreenshotsDir $capture
    if (-not (Test-Path $capturePath)) {
        $phaseNum = $capture -replace "phase-(\d+).*", '$1'
        $actions += "[  ] Capturer phase-$phaseNum"
    }
}

if ($actions.Count -eq 0) {
    Write-Success "  [OK] Aucune action requise!"
} else {
    foreach ($action in $actions) {
        Write-Warn "  $action"
    }
}

Write-Host ""

# === FOOTER ===
Write-Host "---------------------------------------------"
Write-Host "Derniere MAJ: $($progress.lastUpdate)" -ForegroundColor DarkGray
Write-Host "Version: $($progress.version)" -ForegroundColor DarkGray
Write-Host ""
