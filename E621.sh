#!/bin/bash
# E621 Installer & Starter
# Autor: AmexHusky (angepasst mit GUI)

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

run_gui() {
  if ! command -v zenity &> /dev/null; then
    echo "[!] Zenity nicht gefunden – installiere..."
    sudo apt-get update
    sudo apt-get install -y zenity
  fi

  CHOICES=$(zenity --list --checklist \
    --title="E621 Installer" \
    --text="Wähle, welche Komponenten du installieren möchtest:" \
    --column="Installieren" --column="Option" --column="Beschreibung" \
    TRUE "all"    "Alles (Core + Extras)" \
    FALSE "core"  "Kern (Git, Python, Pip)" \
    FALSE "extras" "Zusatztools (Docker, htop, etc.)" \
    --separator=" ")

  if [ -z "$CHOICES" ]; then
    zenity --warning --text="Keine Auswahl getroffen. Abbruch."
    exit 1
  fi

  zenity --info --text="Installiere: $CHOICES"

  for choice in $CHOICES; do
    case "$choice" in
      all)    install_all ;;
      core)   install_core ;;
      extras) install_extras ;;
    esac
  done

  zenity --info --text="E621 wurde erfolgreich eingerichtet! Starte mit:\nsudo E621 -Y"
}

# -------------------
# Hauptlogik
# -------------------

case "$1" in
  -a|--all)
    install_all
    ;;
  -c|--core)
    install_core
    ;;
  -e|--extras)
    install_extras
    ;;
  --gui)
    run_gui
    ;;
  -y|-Y)
    echo "[✓] Update/Installation wird automatisch durchgeführt..."
    install_all
    ;;
  *)
    echo "E621 Installer"
    echo "Verwendung:"
    echo "  sudo E621 -a       # Alles installieren"
    echo "  sudo E621 -c       # Nur Kern installieren"
    echo "  sudo E621 -e       # Nur Extras installieren"
    echo "  sudo E621 --gui    # Grafische Oberfläche starten"
    echo "  sudo E621 -y       # Automatisch alles (Standard)"
    ;;
esac
