#!/usr/bin/env bash
# Mac-PreLinux-Prep Master Interactive CLI Wizard for macOS Users
# Part of Mac-PreLinux-Prep

set -e

BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RED="\033[31m"
RESET="\033[0m"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

show_banner() {
    clear 2>/dev/null || true
    echo -e "${BOLD}${CYAN}"
    echo "================================================================="
    echo "             🍏 MAC-PRELINUX-PREP (macOS Tool) ⚡"
    echo "   Pre-Flight Audit & Partition Assistant for macOS Users"
    echo "================================================================="
    echo -e "${RESET}"
}

main_menu() {
    show_banner
    echo -e "${BOLD}Select a macOS Pre-Linux action:${RESET}\n"
    echo -e " ${CYAN}1)${RESET} Run Pre-Flight Mac Hardware & Security Audit"
    echo -e " ${GREEN}2)${RESET} Safely Shrink APFS Container (Create Free Space for Linux)"
    echo -e " ${GREEN}3)${RESET} Create Bootable Linux USB Flash Drive (diskutil + dd)"
    echo -e " ${GREEN}4)${RESET} T2 Security Chip & Startup Security Utility Assistant"
    echo -e " ${GREEN}5)${RESET} Pre-Install rEFInd Graphical Bootloader on macOS EFI"
    echo -e " ${GREEN}6)${RESET} Trigger Time Machine Backup before Disk Modification"
    echo -e " ${RED}0) Exit${RESET}"
    echo -e "\n================================================================="
    read -p "Enter choice [0-6]: " choice

    case "$choice" in
        1)
            bash "$SCRIPT_DIR/scripts/check_mac_hardware.sh" || true
            ;;
        2)
            bash "$SCRIPT_DIR/scripts/partition_apfs_mac.sh" || true
            ;;
        3)
            bash "$SCRIPT_DIR/scripts/create_bootable_usb.sh" || true
            ;;
        4)
            bash "$SCRIPT_DIR/scripts/t2_secure_boot_guide.sh" || true
            ;;
        5)
            bash "$SCRIPT_DIR/scripts/preinstall_refind_mac.sh" || true
            ;;
        6)
            echo -e "${GREEN}Initiating Time Machine Backup...${RESET}"
            tmutil startbackup 2>/dev/null || echo -e "${YELLOW}Please connect your Time Machine backup drive.${RESET}"
            ;;
        0)
            echo -e "${BOLD}${GREEN}Preparation complete! Boot your Linux USB by holding Option ⌥ key. 🍏⚡${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid selection.${RESET}"
            ;;
    esac

    echo ""
    read -p "Press Enter to return to the main menu..." key
    main_menu
}

main_menu
