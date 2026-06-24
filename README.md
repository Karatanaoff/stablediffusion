# Installation de Stable Diffusion (Automatic1111)

Guide étape par étape pour installer l'interface WebUI d'Automatic1111 pour Stable Diffusion localement sur Windows.

## Prérequis matériels
* Système d'exploitation : Windows 10 / 11
* Carte graphique : NVIDIA avec 6 Go de VRAM minimum
* Espace disque : 30 Go libres (SSD recommandé)

## Étape 1 : Installation des dépendances

### 1. Python 3.10.6
* Télécharger la version exacte 3.10.6 depuis le site officiel de Python. [ici pour le télécharger](https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe)
* Lancer l'installateur.
* **Obligatoire** : Cocher la case "Add Python 3.10 to PATH" en bas de la fenêtre avant de lancer l'installation.

### 2. Git
* Télécharger et installer Git pour Windows. [ici pour le télécharger aussi](https://github.com/git-for-windows/git/releases/download/v2.54.0.windows.1/Git-2.54.0-64-bit.exe)
* Valider toutes les étapes avec les options par défaut.

## Étape 2 : Téléchargement de l'application

1. Créer un dossier vide (ex: `C:\\StableDiffusion`).
2. Ouvrir le dossier, taper `cmd` dans la barre d'adresse de l'explorateur Windows et appuyer sur Entrée.
3. Coller et exécuter la commande suivante :
   ```text
   git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

## Étape 3 : Configuration et initialisation

1. Ouvrir le nouveau dossier `stable-diffusion-webui`.
2. Exécuter le fichier `webui-user.bat`.
3. Patienter durant le téléchargement automatique des dépendances et du premier modèle (10 à 30 minutes selon la connexion).
4. L'initialisation est terminée lorsque le terminal affiche :
```text
   Running on local URL: [http://127.0.0.1:7860](http://127.0.0.1:7860)
```

## Étape 4 : Utilisation quotidienne

1. Maintenir la fenêtre de commande ouverte en arrière-plan.
2. Ouvrir un navigateur et naviguer vers `http://127.0.0.1:7860`.
3. Pour relancer l'application ultérieurement, exécuter à nouveau `webui-user.bat`.
