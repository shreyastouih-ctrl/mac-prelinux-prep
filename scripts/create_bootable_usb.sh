#!/usr/bin/env bash
# Bootable Linux USB Creator for macOS
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
echo "   🍏 BOOTABLE LINUX USB CREATOR FOR MACOS 📀"
echo "================================================================="
echo -e "${RESET}"

echo -e "${BOLD}Available USB Flash Drives:${RESET}\n"
diskutil list 2>/dev/null | grep -E "external, physical" -B 2 || true

echo -e "\nEnter the target USB disk identifier (e.g. disk2 or disk3):"
read -p "USB Identifier [diskX]: " DISK_ID

if [ -z "$DISK_ID" ]; then
    echo -e "${RED}No disk specified. Exiting.${RESET}"
    exit 1
fi

RAW_DISK="/dev/r$DISK_ID"

echo -e "\nEnter the full path to your downloaded Linux .iso file:"
read -e -p "ISO Path: " ISO_PATH

if [ ! -f "$ISO_PATH" ]; then
    echo -e "${RED}File not found at '$ISO_PATH'!${RESET}"
    exit 1
fi

echo -e "\n${RED}WARNING: ALL DATA ON /dev/$DISK_ID WILL BE ERASED!${RESET}"
read -p "Are you sure you want to flash $ISO_PATH to /dev/$DISK_ID? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 0
fi

echo -e "${GREEN}Unmounting /dev/$DISK_ID...${RESET}"
diskutil unmountDisk "/dev/$DISK_ID" || true

echo -e "${GREEN}Flashing $ISO_PATH to $RAW_DISK (this may take 2-5 minutes)...${RESET}"
sudo dd if="$ISO_PATH" of="$RAW_DISK" bs=4m status=progress 2>/dev/null || sudo dd if="$ISO_PATH" of="$RAW_DISK" bs=4m

echo -e "${GREEN}Ejecting /dev/$DISK_ID...${RESET}"
diskutil eject "/dev/$DISK_ID" || true

echo -e "${BOLD}${GREEN}=================================================================${RESET}"
echo -e "${BOLD}${GREEN}   ✅ Bootable Linux USB created successfully!${RESET}"
echo -e "You can now reboot your Mac and hold the ${YELLOW}Option ⌥ (Alt)${RESET} key to boot from USB."
