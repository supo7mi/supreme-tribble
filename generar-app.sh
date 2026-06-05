#!/bin/bash
echo ""
echo " ========================================"
echo "  DASHBOARD DIARIO - Generador de App"
echo "  por Gustavo Jose Molero"
echo " ========================================"
echo ""

# Check Node
if ! command -v node &> /dev/null; then
    echo " [ERROR] Node.js no instalado."
    echo " Descargalo en: https://nodejs.org"
    exit 1
fi
echo " [OK] Node.js: $(node --version)"

echo ""
echo " [1/3] Instalando dependencias..."
npm install --save-dev electron electron-builder

echo ""
echo " [2/3] Compilando..."

if [[ "$OSTYPE" == "darwin"* ]]; then
    npx electron-builder --mac
else
    npx electron-builder --linux
fi

echo ""
echo " [3/3] Listo! Tu app esta en la carpeta: dist/"
echo ""
