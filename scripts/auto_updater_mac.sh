#!/usr/bin/env bash
# macOS Auto-Updater for Mac-PreLinux-Prep
# Part of Mac-PreLinux-Prep (Runs inside macOS Terminal)

set -e

BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo -e "${BOLD}${CYAN}"
echo "================================================================="
echo "   🍏 MAC-PRELINUX-PREP MACOS AUTO-UPDATER 🔄"
echo "================================================================="
echo -e "${RESET}"

cd "$ROOT_DIR"

if [ -d ".git" ] && command -v git &>/dev/null; then
    echo -e "${GREEN}Checking GitHub for latest macOS preparation updates...${RESET}"
    git pull origin main || git pull origin master || true
    chmod +x mac_prep.sh scripts/*.sh 2>/dev/null || true
    echo -e "\n${BOLD}${GREEN}✅ Mac-PreLinux-Prep is updated to the latest version!${RESET}"
else
    echo -e "${YELLOW}Not a git repository directory. Skipping git pull...${RESET}"
fi
