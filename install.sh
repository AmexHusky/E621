#!/bin/bash
# E621 Installer by AmexHusky

BLUE='\033[1;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}Starting E621 Installer...${NC}"

# Liste nützlicher Tools
TOOLS=("git" "npm" "nodejs" "curl" "wget" "htop" "vim" "python3" "python3-pip" "figlet" "lolcat")

# Tools installieren, falls nicht vorhanden
for tool in "${TOOLS[@]}"; do
    if ! command -v $tool &> /dev/null
    then
        echo -e "${YELLOW}Installing $tool...${NC}"
        sudo apt install -y $tool
    else
        echo -e "${GREEN}$tool is already installed${NC}"
    fi
done

# Installationsziel
INSTALL_DIR="/opt/e621_installer"
sudo mkdir -p "$INSTALL_DIR"
sudo cp -r husky_frames "$INSTALL_DIR"
sudo cp start.sh "$INSTALL_DIR"

# Symlink erstellen
sudo ln -sf "$INSTALL_DIR/start.sh" /usr/local/bin/E621

echo -e "${GREEN}Installation complete!${NC}"
echo -e "${GREEN}Use the command 'E621' to start your Husky animation.${NC}"

