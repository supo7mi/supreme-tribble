@echo off
title Dashboard Diario - Generador de .EXE
color 0A

echo.
echo  ========================================
echo   DASHBOARD DIARIO - Generador de .EXE
echo   por Gustavo Jose Molero
echo  ========================================
echo.

:: Check Node.js
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Node.js no esta instalado.
    echo.
    echo  Descargalo en: https://nodejs.org
    echo  Instala la version LTS y vuelve a ejecutar este script.
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VER=%%i
echo  [OK] Node.js encontrado: %NODE_VER%

:: Check npm
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] npm no encontrado.
    pause
    exit /b 1
)

echo  [OK] npm listo
echo.
echo  [1/3] Instalando dependencias (Electron)...
echo        Esto puede tardar 2-5 minutos la primera vez...
echo.

npm install --save-dev electron electron-builder 2>&1

if %errorlevel% neq 0 (
    echo.
    echo  [ERROR] Fallo la instalacion. Verifica tu conexion a internet.
    pause
    exit /b 1
)

echo.
echo  [OK] Dependencias instaladas
echo.
echo  [2/3] Compilando el .EXE para Windows...
echo.

npx electron-builder --win --x64 2>&1

if %errorlevel% neq 0 (
    echo.
    echo  [ERROR] Fallo la compilacion.
    pause
    exit /b 1
)

echo.
echo  [3/3] Listo!
echo.
echo  ========================================
echo   Tu .EXE esta en la carpeta: dist\
echo   Busca el archivo "Dashboard Diario Setup.exe"
echo  ========================================
echo.

:: Open the dist folder
explorer dist

pause
