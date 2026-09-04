# Mac-PreLinux-Prep 🍏⚡

![Mac Pre-Linux Preparation Banner](assets/mac_prelinux_banner.jpg)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: macOS](https://img.shields.io/badge/Platform-macOS-lightgrey.svg)](https://www.apple.com/macos/)

**Mac-PreLinux-Prep** is an all-in-one macOS preparation utility and pre-flight toolkit designed to run directly inside **macOS** before installing Linux. It inspects Mac hardware, recommends the best Linux distribution, automates APFS container shrinking, bootable USB creation, T2 Security Chip setup, Time Machine backups, rEFInd bootloader installation, and self-updates automatically.

---

> [!CAUTION]
> ### ⚠️ DISCLAIMER OF LIABILITY (USE AT YOUR OWN RISK)
> THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. THE REPOSITORY MAINTAINERS, AUTHORS, AND CONTRIBUTORS ARE **NOT RESPONSIBLE OR LIABLE** FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES, INCLUDING BUT NOT LIMITED TO:
> - **BRICKING OR UNBOOTABLE STATES** OF YOUR MAC, PC, PHONE, TABLET, OR HARDWARE.
> - **DATA LOSS OR DATA CORRUPTION** ON ANY CONNECTED STORAGE MEDIA OR APFS CONTAINERS.
> - **HARDWARE OVERHEATING OR PHYSICAL DAMAGE**.
> 
> ALWAYS BACK UP YOUR PERSONAL DATA (VIA TIME MACHINE OR EXTERNAL DRIVE) BEFORE ATTEMPTING DISK PARTITIONING, DRIVER INSTALLATION, OR SYSTEM MODIFICATIONS.

---

## 🌟 Features

* 🎯 **Hardware Inspector & OS Recommender**: Runs directly on macOS Terminal (`sysctl`, `system_profiler`) to inspect CPU, RAM, T2 chip, and GPU, recommending the best Linux distribution before installation.
* 🔄 **macOS Auto-Updater**: Automatically checks GitHub and updates `Mac-PreLinux-Prep` to the latest release with one click.
* 💾 **1-Click APFS Partition Assistant**: Safely resizes `Macintosh HD` using macOS `diskutil apfs resizeContainer` to make room for Linux dual-boot without losing macOS data.
* 📀 **Bootable USB Creator for macOS**: Downloads & flashes any Linux ISO (Ubuntu, Fedora, Arch, Linux Mint, Pop!_OS) to a USB drive using native `diskutil` & `dd`.
* 🛡️ **T2 & Startup Security Assistant**: Provides automated instructions for 2018-2020 T2 Macs (disabling Secure Boot & enabling external boot in macOS Recovery).
* 🔀 **rEFInd Bootloader Installer**: Installs `rEFInd` directly from macOS into the EFI partition before installing Linux.
* ⏱️ **Time Machine Trigger**: Initiates a safety backup of macOS before disk modifications.

---

## 🚀 Quick Start on macOS

Open **Terminal** on macOS (`Cmd + Space` $\rightarrow$ type `Terminal` $\rightarrow$ press Enter) and run:

```bash
git clone https://github.com/shreyastouih-ctrl/mac-prelinux-prep.git
cd mac-prelinux-prep
chmod +x mac_prep.sh scripts/*.sh
./mac_prep.sh
```

---

## 🎛️ macOS Pre-Linux Menu (`mac_prep.sh`)

```
=================================================================
             🍏 MAC-PRELINUX-PREP (macOS Tool) ⚡
   Pre-Flight Audit & Partition Assistant for macOS Users
=================================================================
 1) Inspect Mac Hardware & Get Recommended Linux OS
 2) Run Pre-Flight Mac Hardware & Security Audit
 3) Safely Shrink APFS Container (Create Free Space for Linux)
 4) Create Bootable Linux USB Flash Drive (diskutil + dd)
 5) T2 Security Chip & Startup Security Utility Assistant
 6) Pre-Install rEFInd Graphical Bootloader on macOS EFI
 7) Trigger Time Machine Backup before Disk Modification
 8) Auto-Update Mac-PreLinux-Prep Suite
 0) Exit
=================================================================
```

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for details.
