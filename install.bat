@echo off
title Installateur Automatique Stable Diffusion

echo ========================================================
echo Installation automatique de Stable Diffusion (A1111)
echo ========================================================

:: 1. Verifier et installer Git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [!] Git introuvable. Installation en cours...
    winget install Git.Git --silent --accept-package-agreements --accept-source-agreements
    echo [OK] Git installe. Fermez cette fenetre et relancez.
    pause
    exit
)

:: 2. Verifier et installer Python 3.10.6
python --version 2>nul | findstr /C:"3.10" >nul
if %errorlevel% neq 0 (
    echo [!] Python 3.10 introuvable. Installation en cours...
    winget install Python.Python.3.10 --version 3.10.6 --silent --accept-package-agreements --accept-source-agreements
    echo [OK] Python installe. Fermez cette fenetre et relancez.
    pause
    exit
)

:: 3. Cloner le depot Automatic1111
if not exist "stable-diffusion-webui" (
    echo [!] Telechargement de Stable Diffusion...
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
)

:: 4. VACCIN 1 : Environnement et bug CLIP
cd stable-diffusion-webui
if not exist "venv" (
    echo [!] Application du correctif Python...
    python -m venv venv
    call venv\Scripts\activate.bat
    python -m pip install --upgrade pip >nul 2>nul
    pip install setuptools==69.5.1 wheel >nul 2>nul
    pip install https://github.com/openai/CLIP/archive/d50d76daa670286dd6cacf3bcd80b5e4823fc8e1.zip --no-build-isolation >nul 2>nul
    call venv\Scripts\deactivate.bat
)

:: 5. VACCIN 2 : Creation d'un fichier de lancement parfait
echo [!] Configuration de l'anti-crash et du depot miroir...
echo @echo off> webui-user.bat
echo set PYTHON=>> webui-user.bat
echo set GIT=>> webui-user.bat
echo set VENV_DIR=>> webui-user.bat
echo set COMMANDLINE_ARGS=--skip-torch-cuda-test --precision full --no-half>> webui-user.bat
echo set STABLE_DIFFUSION_REPO=https://github.com/w-e-w/stablediffusion.git>> webui-user.bat
echo call webui.bat>> webui-user.bat

:: 6. Lancement
echo [!] Lancement final...
call webui-user.bat

pause
