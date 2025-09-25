#!/bin/bash
# Installer-Skript für E621
# Unterstützt verschiedene Modi: core, extras, all
# Autor: AmexHusky angepasst mit GUI-Support

install_core() {
  echo "[+] Installiere Kernkomponenten..."
  sudo apt-get update
  sudo apt-get install -y git python3 python3-pip
}

install_extras() {
  echo "[+] Installiere Zusatztools..."
  sudo apt-get install -y docker.io htop tmux curl wget build-essential
}

install_all() {
  install_core
  install_extras
}

# Standardmodus = all
MODE="all"

while [[ $# -gt 0 ]]; do
  case "$1" in
    -a|--all|-A)
      MODE="all"
      ;;
    -c|--core|-C)
      MODE="core"
      ;;
    -e|--extras|-E)
      MODE="extras"
      ;;
    -y|-Y)
      AUTO_YES="true"
      ;;
  esac
  shift
done

case "$MODE" in
  all)
    install_all
    ;;
  core)
    install_core
    ;;
  extras)
    install_extras
    ;;
esac

# Am Ende dein Repo aktualisieren und E621 verlinken
echo "[+] Klone/aktualisiere Repository..."
if [ ! -d "$HOME/E621" ]; then
  git clone https://github.com/AmexHusky/E621.git "$HOME/E621"
else
  cd "$HOME/E621" && git pull
fi

echo "[+] Verknüpfe E621 ins System..."
sudo ln -sf "$HOME/E621/E621.sh" /usr/local/bin/E621
sudo chmod +x "$HOME/E621/E621.sh"

echo "[✓] Installation abgeschlossen! Starte mit: sudo E621 -Y"
