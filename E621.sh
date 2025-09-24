#!/bin/bash
# --------------------------------------------
# E621 Interaktiver Tool-Installer
# Created by Amex Husky
# --------------------------------------------

TOOLS=(
"htop"
"tmux"
"ncdu"
"wget"
"curl"
"git"
"vim nano"
"ssh"
"rsync"
"screen"
"tree"
"net-tools iproute2"
"ufw iptables"
"nc"
"jq"
"grep ack ripgrep"
"sed awk"
"docker"
"lsof"
"tmuxinator taskwarrior"
)

echo "--------------------------------------------"
echo "      E621 Tool Installer"
echo "      Created by Amex Husky"
echo "--------------------------------------------"

# Zeige Tools zur Auswahl
echo ""
echo "Welche Tools willst du installieren?"
echo "Tippe die Zahlen getrennt durch Kommas oder 'all' für alle Tools:"
for i in "${!TOOLS[@]}"; do
    printf "%2d) %s\n" $((i+1)) "${TOOLS[$i]}"
done

# Nutzerauswahl einlesen
read -p "Auswahl: " selection

# Pakete in ein Array packen
PACKAGES=()
if [[ "$selection" == "all" ]]; then
    for t in "${TOOLS[@]}"; do PACKAGES+=($t); done
else
    IFS=',' read -ra nums <<< "$selection"
    for n in "${nums[@]}"; do
        idx=$((n-1))
        if [[ $idx -ge 0 && $idx -lt ${#TOOLS[@]} ]]; then
            PACKAGES+=(${TOOLS[$idx]})
        fi
    done
fi

# Installation starten
echo ""
echo "Installiere ausgewählte Pakete: ${PACKAGES[@]}"
apt update
apt install -y ${PACKAGES[@]}

echo ""
echo "--------------------------------------------"
echo "Fertig! Die ausgewählten Tools wurden installiert."
echo "--------------------------------------------"
