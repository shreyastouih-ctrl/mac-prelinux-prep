#!/usr/bin/env bash
# T2 Security Chip & Startup Security Utility Assistant for macOS
# Part of Mac-PreLinux-Prep

set -e

BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RESET="\033[0m"

echo -e "${BOLD}${CYAN}"
echo "================================================================="
echo "   🍏 APPLE T2 CHIP & STARTUP SECURITY UTILITY ASSISTANT 🛡️"
echo "================================================================="
echo -e "${RESET}"

echo -e "${BOLD}For Macs with Apple T2 Security Chip (2018-2020 MacBook Pro/Air/Mac mini):${RESET}"
echo -e "By default, Apple T2 security blocks booting from external USB drives and non-macOS operating systems.\n"

echo -e "${BOLD}Follow these steps to unlock external USB boot on macOS:${RESET}"
echo -e " 1. Turn off your Mac completely."
echo -e " 2. Press and hold ${YELLOW}Cmd + R${RESET} immediately after turning on your Mac until the Apple logo appears."
echo -e " 3. In macOS Recovery, click ${CYAN}Utilities${RESET} in the menu bar -> ${CYAN}Startup Security Utility${RESET}."
echo -e " 4. When prompted, click ${YELLOW}Enter macOS Password${RESET}."
echo -e " 5. Under ${BOLD}Secure Boot${RESET}, select: ${GREEN}No Security${RESET}."
echo -e " 6. Under ${BOLD}Allowed Boot Media${RESET}, select: ${GREEN}Allow booting from external or removable media${RESET}."
echo -e " 7. Close Startup Security Utility and restart your Mac normally."

echo -e "\n${BOLD}${GREEN}Once these 2 settings are changed, your Mac can boot any Linux USB drive!${RESET}"
