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

:: 4. VACCIN : Preparer l'environnement et corriger le bug CLIP automatiquement
cd stable-diffusion-webui
if not exist "venv" (
    echo [!] Application du correctif Python en arriere-plan...
    python -m venv venv
    call venv\Scripts\activate.bat
    python -m pip install --upgrade pip >nul 2>nul
    pip install setuptools==69.5.1 wheel >nul 2>nul
    pip install https://github.com/openai/CLIP/archive/d50d76daa670286dd6cacf3bcd80b5e4823fc8e1.zip --no-build-isolation >nul 2>nul
    call venv\Scripts\deactivate.bat
)

:: 5. Lancer le programme
echo [!] Lancement final...
call webui-user.bat

pause
