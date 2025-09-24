#!/bin/bash
# --------------------------------------------
# E621 Installer / Updater
# Created by Amex Husky
# Copyright © 2025 Amex Husky
# --------------------------------------------

REPO_URL="https://github.com/AmexHusky/E621.git"
INSTALL_DIR="/opt/E621"
VENV_DIR="$INSTALL_DIR/venv"
BINARY="$INSTALL_DIR/dist/main"

# Anzeige des Headers
echo "--------------------------------------------"
echo "      E621 Installer / Updater"
echo "      Created by Amex Husky"
echo "      Copyright © 2025 Amex Husky"
echo "--------------------------------------------"

# Prüfen, ob root
if [ "$(id -u)" -ne 0 ]; then
    echo "Bitte mit sudo ausführen!"
    exit 1
fi

# 1. Systempakete installieren
apt update && apt install -y git python3 python3-venv python3-pip curl

# 2. Repository klonen oder aktualisieren
if [ ! -d "$INSTALL_DIR" ]; then
    git clone "$REPO_URL" "$INSTALL_DIR"
else
    cd "$INSTALL_DIR" || exit
    git pull
fi

# 3. Virtuelle Umgebung einrichten
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi
source "$VENV_DIR/bin/activate"

# 4. Python-Abhängigkeiten installieren
pip install --upgrade pip
pip install -r "$INSTALL_DIR/requirements.txt"

# 5. PyInstaller erstellen
pip install pyinstaller
cd "$INSTALL_DIR" || exit
pyinstaller --onefile main.py

# 6. E621 als globaler Befehl verfügbar machen
echo '#!/bin/bash' > /usr/local/bin/E621
echo "sudo $BINARY \"\$@\"" >> /usr/local/bin/E621
chmod +x /usr/local/bin/E621

echo "--------------------------------------------"
echo "Installation abgeschlossen!"
echo "Nun kannst du 'sudo E621' ausführen."
echo "--------------------------------------------"
