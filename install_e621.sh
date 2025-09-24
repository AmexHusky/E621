#!/bin/bash
# --------------------------------------------
# E621 Repository Installer
# Created by Amex Husky
# Copyright © 2025 Amex Husky
# --------------------------------------------

REPO_URL="https://github.com/AmexHusky/E621.git"
INSTALL_DIR="/opt/E621"

echo "--------------------------------------------"
echo "      Willkommen zum E621 Installer"
echo "      Created by Amex Husky"
echo "--------------------------------------------"

# Prüfen auf Root
if [ "$(id -u)" -ne 0 ]; then
    echo "Bitte mit sudo ausführen!"
    exit 1
fi

# Repository klonen oder aktualisieren
if [ ! -d "$INSTALL_DIR" ]; then
    git clone "$REPO_URL" "$INSTALL_DIR"
    echo "Repository wurde geklont nach $INSTALL_DIR."
else
    cd "$INSTALL_DIR" || exit
    git pull
    echo "Repository wurde aktualisiert."
fi

# E621 Befehl global verfügbar machen
echo '#!/bin/bash' > /usr/local/bin/E621
echo "sudo $INSTALL_DIR/E621.sh \"\$@\"" >> /usr/local/bin/E621
chmod +x /usr/local/bin/E621

echo "--------------------------------------------"
echo "Alles bereit! Du kannst jetzt mit folgendem Befehl starten:"
echo "  sudo E621"
echo "--------------------------------------------"
