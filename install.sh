#!/bin/bash

# Socratico Skill - Installer
# Instala el skill de análisis socrático para Claude Code

set -e

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "=================================================="
echo "   Socratico Skill - Instalador"
echo "=================================================="
echo -e "${NC}"

# Detectar sistema operativo
if [[ "$OSTYPE" == "darwin"* ]]; then
    SKILLS_DIR="$HOME/.claude/skills"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    SKILLS_DIR="$HOME/.claude/skills"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    SKILLS_DIR="$USERPROFILE/.claude/skills"
else
    SKILLS_DIR="$HOME/.claude/skills"
fi

echo -e "${YELLOW}Directorio de skills: ${SKILLS_DIR}${NC}"
echo ""

# Crear directorio si no existe
if [ ! -d "$SKILLS_DIR" ]; then
    echo "Creando directorio de skills..."
    mkdir -p "$SKILLS_DIR"
fi

# Obtener el directorio del script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copiar skill
echo "Instalando socratico skill..."
SKILL_NAME="socratico"
DEST_DIR="$SKILLS_DIR/$SKILL_NAME"

if [ -d "$DEST_DIR" ]; then
    echo -e "${YELLOW}El skill ya existe. Actualizando...${NC}"
    rm -rf "$DEST_DIR"
fi

cp -r "$SCRIPT_DIR/skills/$SKILL_NAME" "$DEST_DIR"

echo ""
echo -e "${GREEN}=================================================="
echo "   Instalación completada!"
echo "==================================================${NC}"
echo ""
echo "El skill está instalado en: $DEST_DIR"
echo ""
echo -e "${BLUE}Uso:${NC}"
echo "  socrático: [tu tarea aquí]"
echo ""
echo "Ejemplo:"
echo "  socrático: implementa autenticación con JWT"
echo ""
echo -e "${YELLOW}Nota: Reinicia Claude Code para cargar el nuevo skill${NC}"
