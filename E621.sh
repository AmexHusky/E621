#!/bin/bash
# E621 Installer & Starter mit GUI oder Terminal-Auswahl
# Autor: AmexHusky
# Copyright (c) 2025 AmexHusky. Alle Rechte vorbehalten.
# Version: 1.0

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

# -------------------------
# GUI-Funktion
# -------------------------
run_gui() {
  if ! command -v zenity &> /dev/null; then
    echo "[!] Zenity nicht gefunden – wechsle in Terminal-Auswahl..."
    run_terminal_menu
    return
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
# Terminal-Menü-Funktion
# -------------------------
run_terminal_menu() {
  echo "E621 Installer (Terminal-Auswahl)"
  echo "-------------------------------"
  options=("all" "core" "extras" "y" "quit")

  select opt in "${options[@]}"
  do
    case $opt in
      all)
        echo "Du hast 'all' gewählt"
        bash "$HOME/E621/install_e621.sh" -a
        break
        ;;
      core)
        echo "Du hast 'core' gewählt"
        bash "$HOME/E621/install_e621.sh" -c
        break
        ;;
      extras)
        echo "Du hast 'extras' gewählt"
        bash "$HOME/E621/install_e621.sh" -e
        break
        ;;
      y)
        echo "Du hast 'y' gewählt (alles automatisch)"
        bash "$HOME/E621/install_e621.sh" -y
        break
        ;;
      quit)
        echo "Abbruch"
        break
        ;;
      *)
        echo "Ungültige Auswahl $REPLY"
        ;;
    esac
  done
}

# -------------------------
# Hauptlogik
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
    # Keine Parameter = Terminal-Menü
    echo "E621 Installer"
    echo "Keine Parameter angegeben – Terminal-Auswahl wird gestartet..."
    run_terminal_menu
    ;;
esac
