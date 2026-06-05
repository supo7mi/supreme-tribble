const { app, BrowserWindow, Menu, shell } = require('electron');
const path = require('path');

// Hide default menu
Menu.setApplicationMenu(null);

function createWindow() {
  const win = new BrowserWindow({
    width: 1280,
    height: 800,
    minWidth: 400,
    minHeight: 600,
    title: 'Dashboard Diario',
    icon: path.join(__dirname, 'src', 'icons', 'icon-512.png'),
    backgroundColor: '#0e0e12',
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      // Allow geolocation and other APIs
    },
    show: false, // wait for ready-to-show
    titleBarStyle: process.platform === 'darwin' ? 'hiddenInset' : 'default',
  });

  win.loadFile(path.join(__dirname, 'src', 'index.html'));

  // Show when ready (avoids white flash)
  win.once('ready-to-show', () => {
    win.show();
  });

  // Open external links in browser
  win.webContents.setWindowOpenHandler(({ url }) => {
    shell.openExternal(url);
    return { action: 'deny' };
  });
}

app.whenReady().then(() => {
  createWindow();
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
