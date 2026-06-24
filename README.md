# Installation Automatique de Stable Diffusion (A1111)

Ce projet permet d'installer automatiquement l'interface WebUI d'Automatic1111 pour Stable Diffusion sur Windows. Le script gère le téléchargement des prérequis et applique de lui-même les correctifs nécessaires pour garantir un lancement sans erreur.

## Prérequis matériels
* Système d'exploitation : Windows 10 / 11
* Espace disque : 30 Go libres recommandés (SSD de préférence)
* Connexion internet active

## Étape 1 : Installation rapide

1. Créez un dossier vide à l'emplacement où vous souhaitez installer le logiciel (ex: `C:\StableDiffusion`).
2. Ouvrez ce dossier, tapez `cmd` dans la barre d'adresse de l'explorateur Windows et appuyez sur Entrée.
3. Copiez-collez la commande suivante dans l'invite de commande et appuyez sur Entrée :

```cmd
curl -L -o install.bat https://raw.githubusercontent.com/Karatanaoff/stablediffusion/main/install.bat && install.bat
```

4. Patientez durant le processus. Le script va vérifier vos prérequis (Git, Python), télécharger les fichiers, construire l'environnement et contourner les erreurs classiques de premier lancement.
5. L'interface s'ouvrira automatiquement dans votre navigateur à la fin de l'installation.

## Étape 2 : Lancement quotidien

La commande d'installation ne sert qu'une seule fois. Pour vos futures utilisations :

1. Ouvrez le dossier `stable-diffusion-webui` nouvellement créé sur votre disque.
2. Double-cliquez sur le fichier `webui-user.bat`.
3. Laissez la fenêtre de commande ouverte en arrière-plan.
4. Accédez à l'interface via votre navigateur à l'adresse : `http://127.0.0.1:7860`
