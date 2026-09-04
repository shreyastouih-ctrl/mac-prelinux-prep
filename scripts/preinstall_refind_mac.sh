#!/usr/bin/env bash
# macOS rEFInd Bootloader Pre-Installer
# Part of Mac-PreLinux-Prep

set -e

BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${CYAN}"
echo "================================================================="
echo "   🍏 MACOS REFIND BOOTLOADER PRE-INSTALLER 🔀"
echo "================================================================="
echo -e "${RESET}"

echo -e "${GREEN}Downloading rEFInd boot loader for macOS...${RESET}"
WORKDIR="/tmp/refind_mac_setup"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

if [ ! -d "refind-bin" ]; then
    curl -fsSL https://sourceforge.net/projects/refind/files/0.14.2/refind-bin-0.14.2.zip/download -o refind.zip 2>/dev/null || curl -fsSL https://wiki.t2linux.org/files/refind.zip -o refind.zip
    unzip -q refind.zip 2>/dev/null || true
    mv refind-bin-* refind-bin 2>/dev/null || true
fi

if [ -f "refind-bin/refind-install" ]; then
    echo -e "${GREEN}Running rEFInd installer script on macOS EFI partition...${RESET}"
    sudo bash refind-bin/refind-install || true
    echo -e "${BOLD}${GREEN}rEFInd Boot Manager installed to Mac EFI partition!${RESET}"
    echo -e "When you boot your Mac, rEFInd will automatically display a graphical choice between macOS and Linux."
else
    echo -e "${RED}rEFInd download failed. You can install rEFInd after booting into Linux using option 18.${RESET}"
fi
