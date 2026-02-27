# Socratico Skill - Installer (PowerShell)
# Instala el skill de análisis socrático para Claude Code

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "==================================================" -ForegroundColor Blue
Write-Host "   Socratico Skill - Instalador" -ForegroundColor Blue
Write-Host "==================================================" -ForegroundColor Blue
Write-Host ""

# Directorio de skills
$SkillsDir = Join-Path $env:USERPROFILE ".claude\skills"
Write-Host "Directorio de skills: $SkillsDir" -ForegroundColor Yellow
Write-Host ""

# Crear directorio si no existe
if (!(Test-Path $SkillsDir)) {
    Write-Host "Creando directorio de skills..."
    New-Item -ItemType Directory -Path $SkillsDir -Force | Out-Null
}

# Obtener directorio del script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Copiar skill
Write-Host "Instalando socratico skill..."
$SkillName = "socratico"
$DestDir = Join-Path $SkillsDir $SkillName

if (Test-Path $DestDir) {
    Write-Host "El skill ya existe. Actualizando..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $DestDir
}

Copy-Item -Recurse (Join-Path $ScriptDir "skills\$SkillName") $DestDir

Write-Host ""
Write-Host "==================================================" -ForegroundColor Green
Write-Host "   Instalación completada!" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host ""
Write-Host "El skill está instalado en: $DestDir"
Write-Host ""
Write-Host "Uso:" -ForegroundColor Blue
Write-Host "  socrático: [tu tarea aquí]"
Write-Host ""
Write-Host "Ejemplo:"
Write-Host "  socrático: implementa autenticación con JWT"
Write-Host ""
Write-Host "Nota: Reinicia Claude Code para cargar el nuevo skill" -ForegroundColor Yellow
