#!/bin/bash
# Startet die Husky-Animation

BLUE='\033[1;34m'
NC='\033[0m'

FRAME_DIR="$(dirname "$0")/husky_frames"
FRAME_FILES=("$FRAME_DIR/frame_"*.txt)

ROUNDS=5
SPEED=0.2

for ((r=1; r<=ROUNDS; r++)); do
    for frame_file in "${FRAME_FILES[@]}"; do
        clear
        echo -e "${BLUE}$(cat "$frame_file")${NC}"
        sleep $SPEED
    done
done

echo -e "${BLUE}Created by AmexHusky! 🐾${NC}"

