# Dashboard Diario — Instrucciones para generar el .EXE

## Requisitos
- **Node.js** instalado → https://nodejs.org (versión LTS)
- Conexión a internet (solo la primera vez)

---

## En Windows → genera el .EXE

1. Haz doble clic en **`GENERAR-EXE.bat`**
2. Espera 2-5 minutos (descarga Electron ~100MB la 1ra vez)
3. Tu instalador estará en la carpeta **`dist/`**
   → `Dashboard Diario Setup.exe`

## En Mac → genera el .DMG

```bash
chmod +x generar-app.sh
./generar-app.sh
```

## En Linux → genera el .AppImage

```bash
chmod +x generar-app.sh
./generar-app.sh
```

---

## Probar sin compilar (modo desarrollo)

```bash
npm install
npm start
```

---

Autor: Gustavo José Molero
