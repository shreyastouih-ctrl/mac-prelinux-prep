#!/usr/bin/env bash
# macOS APFS Container Resizer & Dual-Boot Partition Assistant
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
echo "   🍏 MACOS APFS CONTAINER RESIZER & PARTITION ASSISTANT 💾"
echo "================================================================="
echo -e "${RESET}"

echo -e "${BOLD}Current Storage Layout:${RESET}"
diskutil list 2>/dev/null | grep -E "Container|APFS Volume|GUID_partition_scheme" || true

CONTAINER_ID=$(diskutil list 2>/dev/null | grep "APFS Container Scheme" | awk '{print $NF}' || echo "disk0s2")

echo -e "\nTarget APFS Container: ${YELLOW}/dev/$CONTAINER_ID${RESET}"
echo -e "Enter desired size for your macOS partition (e.g. 150g or 200g):"
read -p "macOS New Size (e.g. 150g): " MAC_SIZE

if [ -z "$MAC_SIZE" ]; then
    echo -e "${RED}No size entered. Cancelled.${RESET}"
    exit 1
fi

echo -e "\n${YELLOW}Command to execute:${RESET}"
echo -e "  sudo diskutil apfs resizeContainer /dev/$CONTAINER_ID $MAC_SIZE FAT32 LINUX 0b"
echo ""
read -p "Proceed with APFS container resize? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}Resizing APFS Container... Do not turn off your Mac!${RESET}"
    sudo diskutil apfs resizeContainer "/dev/$CONTAINER_ID" "$MAC_SIZE" FAT32 LINUX 0b
    echo -e "${BOLD}${GREEN}APFS Container resized successfully! Free partition 'LINUX' created.${RESET}"
fi
