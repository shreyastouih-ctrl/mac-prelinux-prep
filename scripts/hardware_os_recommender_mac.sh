#!/usr/bin/env bash
# macOS Hardware Inspector & Linux OS Recommender Tool
# Part of Mac-PreLinux-Prep (Runs directly inside macOS Terminal)

set -e

BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BOLD}${CYAN}"
echo "================================================================="
echo "   🍏 MACOS HARDWARE INSPECTOR & LINUX OS RECOMMENDER 🐧"
echo "================================================================="
echo -e "${RESET}"

# 1. macOS System Profiler & Sysctl Audit
MODEL_ID=$(sysctl -n hw.model 2>/dev/null || echo "MacBookPro")
CPU_NAME=$(sysctl -n machdep.cpu.brand_string 2>/dev/null || sysctl -n hw.machdep.cpu.brand_string 2>/dev/null || echo "Apple Processor")
ARCH=$(uname -m)

# RAM Memory in GB
RAM_BYTES=$(sysctl -n hw.memsize 2>/dev/null || echo "8589934592")
RAM_GB=$((RAM_BYTES / 1073741824))

# T2 Security Chip
T2_CHIP=false
if system_profiler SPiBridgeDataType 2>/dev/null | grep -iq "T2"; then
    T2_CHIP=true
fi

# GPUs
GPU_INFO=$(system_profiler SPDisplaysDataType 2>/dev/null | grep "Chipset Model" | cut -d':' -f2 | xargs || echo "Integrated Graphics")

echo -e "${BOLD}Detected Mac Hardware Specs (from macOS):${RESET}"
echo -e "  • Model Identifier: ${YELLOW}$MODEL_ID${RESET}"
echo -e "  • Architecture: ${YELLOW}$ARCH${RESET}"
echo -e "  • Processor: ${YELLOW}$CPU_NAME${RESET}"
echo -e "  • Memory: ${YELLOW}${RAM_GB} GB RAM${RESET}"
echo -e "  • T2 Security Chip: ${YELLOW}$([ "$T2_CHIP" = true ] && echo 'Yes (2018-2020 Mac)' || echo 'No')${RESET}"
echo -e "  • Graphics Adapters: ${YELLOW}$GPU_INFO${RESET}\n"

echo -e "${BOLD}${CYAN}=================================================================${RESET}"
echo -e "${BOLD}${GREEN}🎯 RECOMMENDED LINUX OS FOR YOUR MAC:${RESET}"
echo -e "${BOLD}${CYAN}=================================================================${RESET}\n"

if [ "$ARCH" == "arm64" ]; then
    echo -e "🏆 ${BOLD}TOP RECOMMENDATION: Asahi Linux / Fedora Asahi Remix${RESET}"
    echo -e "   • Reason: Your Mac uses an Apple Silicon M1/M2/M3/M4 ARM chip."
    echo -e "   • Website: https://asahilinux.org"
    echo -e "   • Install Command in macOS Terminal:"
    echo -e "     ${YELLOW}curl https://alx.sh | sh${RESET}"

elif [ "$T2_CHIP" = true ]; then
    echo -e "🏆 ${BOLD}TOP RECOMMENDATION: Fedora T2 Linux / Ubuntu T2 Linux${RESET}"
    echo -e "   • Reason: Your Mac has an Apple T2 Security Chip (2018-2020 model)."
    echo -e "   • Website: https://wiki.t2linux.org"
    echo -e "   • Installation Note: Use option 4 to disable Secure Boot in macOS Recovery."

elif [ "$RAM_GB" -lt 4 ]; then
    echo -e "🏆 ${BOLD}TOP RECOMMENDATION: Linux Mint XFCE / Zorin OS Lite / Debian 12${RESET}"
    echo -e "   • Reason: Legacy Intel Mac with < 4GB RAM."
    echo -e "   • Features: Lightweight performance, fast desktop responsiveness."

elif echo "$GPU_INFO" | grep -iq "NVIDIA"; then
    echo -e "🏆 ${BOLD}TOP RECOMMENDATION: Pop!_OS (NVIDIA Edition)${RESET}"
    echo -e "   • Reason: Dual-GPU Mac with discrete NVIDIA graphics."
    echo -e "   • Features: Pre-installed graphics drivers & automatic GPU switching."

else
    echo -e "🏆 ${BOLD}TOP RECOMMENDATION: Linux Mint Cinnamon / Ubuntu 24.04 LTS${RESET}"
    echo -e "   • Reason: Standard Intel Mac (2012–2017 MacBook Air / Pro / iMac / Mac mini)."
    echo -e "   • Features: 100% stable, huge repository, hassle-free dual boot."
    echo -e "\n🥈 ${BOLD}ALTERNATIVES: Pop!_OS / Fedora Workstation / Arch Linux${RESET}"
fi

echo -e "\n${BOLD}${CYAN}=================================================================${RESET}"
