@echo off
title Installateur Automatique Stable Diffusion

echo ========================================================
echo Installation automatique de Stable Diffusion (A1111)
echo ========================================================

:: 1. Verifier et installer Git silencieusement
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [!] Git introuvable. Installation en cours...
    winget install Git.Git --silent --accept-package-agreements --accept-source-agreements
    echo [OK] Git installe. 
    echo IMPORTANT : Fermez cette fenetre et relancez le script pour actualiser le PATH Windows.
    pause
    exit
)

:: 2. Verifier et installer Python 3.10.6 silencieusement
python --version 2>nul | findstr /C:"3.10" >nul
if %errorlevel% neq 0 (
    echo [!] Python 3.10 introuvable. Installation de la version 3.10.6 en cours...
    winget install Python.Python.3.10 --version 3.10.6 --silent --accept-package-agreements --accept-source-agreements
    echo [OK] Python installe. 
    echo IMPORTANT : Fermez cette fenetre et relancez le script pour actualiser le PATH Windows.
    pause
    exit
)

:: 3. Cloner le depot Automatic1111 (s'il n'existe pas deja)
if not exist "stable-diffusion-webui" (
    echo [!] Telechargement de Stable Diffusion...
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
)

:: 4. Lancer le programme
echo [!] Lancement et installation des dependances...
cd stable-diffusion-webui
call webui-user.bat

pause