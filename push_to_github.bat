@echo off
TITLE Mac-PreLinux-Prep One-Click GitHub Publisher
COLOR 0A
echo =================================================================
echo    🍏 MAC-PRELINUX-PREP ONE-CLICK GITHUB PUBLISHER ⚡
echo =================================================================
echo.

git init
git add .
git commit -m "Initial release of Mac-PreLinux-Prep"
git branch -M main
git remote remove origin >nul 2>&1
git remote add origin https://github.com/shreyastouih-ctrl/mac-prelinux-prep.git

echo.
echo Pushing repository to https://github.com/shreyastouih-ctrl/mac-prelinux-prep.git...
echo.

git push -u origin main

pause
