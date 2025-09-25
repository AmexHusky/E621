#!/bin/bash
# E621 Hauptskript mit GUI
# Autor: AmexHusky (angepasst)

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
      all)    bash "$HOME/E621/install_e621.sh" -a ;;
      core)   bash "$HOME/E621/install_e621.sh" -c ;;
      extras) bash "$HOME/E621/install_e621.sh" -e ;;
    esac
  done

  zenity --info --text="E621 wurde erfolgreich eingerichtet! Starte mit:\nsudo E621 -Y"
}

# -------------------------
# CLI-Steuerung
# -------------------------
case "$1" in
  --gui)
    run_gui
    ;;
  -a|--all|-y|-Y)
    bash "$HOME/E621/install_e621.sh" -a
    ;;
  -c|--core)
    bash "$HOME/E621/install_e621.sh" -c
    ;;
  -e|--extras)
    bash "$HOME/E621/install_e621.sh" -e
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
