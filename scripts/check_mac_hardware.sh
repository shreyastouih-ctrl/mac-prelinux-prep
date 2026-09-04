#!/usr/bin/env bash
# macOS Pre-Flight Hardware & Security Audit Script
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
echo "   🍏 MACOS PRE-FLIGHT HARDWARE & SECURITY AUDIT 📋"
echo "================================================================="
echo -e "${RESET}"

# 1. Mac Model & CPU
MODEL=$(sysctl -n hw.model 2>/dev/null || echo "Macintosh")
CPU_NAME=$(sysctl -n machdep.cpu.brand_string 2>/dev/null || echo "Apple Processor")
ARCH=$(uname -m)

echo -e "${BOLD}1. Hardware Identification:${RESET}"
echo -e "   • Model ID: ${YELLOW}$MODEL${RESET}"
echo -e "   • Processor: ${YELLOW}$CPU_NAME${RESET}"
echo -e "   • Architecture: ${YELLOW}$ARCH${RESET}"

if [ "$ARCH" == "arm64" ]; then
    echo -e "   • Type: ${GREEN}Apple Silicon (M1/M2/M3/M4) -> Requires Asahi Linux${RESET}"
else
    echo -e "   • Type: ${GREEN}Intel Mac (Fully compatible with all Linux distros)${RESET}"
fi

# 2. Storage & APFS Container Space
echo -e "\n${BOLD}2. Disk Storage & APFS Container:${RESET}"
diskutil list 2>/dev/null | grep -E "Container|APFS Volume|GUID_partition_scheme" || true

# 3. FileVault Encryption Status
echo -e "\n${BOLD}3. FileVault Encryption Status:${RESET}"
if command -v fdesetup &>/dev/null; then
    FV_STATUS=$(fdesetup status 2>/dev/null || echo "FileVault status unavailable")
    echo -e "   • FileVault: ${YELLOW}$FV_STATUS${RESET}"
fi

# 4. System Integrity Protection (SIP) Status
echo -e "\n${BOLD}4. System Integrity Protection (SIP):${RESET}"
if command -v csrutil &>/dev/null; then
    SIP_STATUS=$(csrutil status 2>/dev/null || echo "SIP status unavailable")
    echo -e "   • SIP Status: ${YELLOW}$SIP_STATUS${RESET}"
fi

# 5. T2 Security Chip Detection
echo -e "\n${BOLD}5. Apple T2 Security Chip Audit:${RESET}"
if system_profiler SPiBridgeDataType 2>/dev/null | grep -iq "T2"; then
    echo -e "   • T2 Chip: ${YELLOW}Detected! (Requires disabling Secure Boot in Recovery before external boot).${RESET}"
else
    echo -e "   • T2 Chip: ${GREEN}Not detected / Pre-2018 or Apple Silicon Mac.${RESET}"
fi

echo -e "\n${BOLD}${CYAN}=================================================================${RESET}"
echo -e "${GREEN}Pre-flight hardware check complete! Run option 2 to shrink APFS container.${RESET}"
