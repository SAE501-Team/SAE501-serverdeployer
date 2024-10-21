@echo off
cls
chcp 65001 >nul
title ServerDeployer - Wonderful tool to deploy shell scripts on your server
color D

@REM Variables
set 

@REM Banner
:banner
echo   _________                              ________                .__                             
echo  /   _____/ ______________  __ __________\______ \   ____ ______ |  |   ____ ___.__. ___________ 
echo  \_____  \_/ __ \_  __ \  \/ // __ \_  __ \    |  \_/ __ \\____ \|  |  /  _ <   |  |/ __ \_  __ \
echo  /        \  ___/|  | \/\   /\  ___/|  | \/    `   \  ___/|  |_> >  |_(  <_> )___  \  ___/|  | \/
echo /_______  /\___  >__|    \_/  \___  >__| /_______  /\___  >   __/|____/\____// ____|\___  >__|   
echo         \/     \/                 \/             \/     \/|__|               \/         \/      v1.0 
echo .
echo ┍─────────────────────┑
echo │      Options:       │
echo │                     │
echo │ 1. Settings         │ @REM met à jour les paramètres de configuration du serveur (VPS creds etc)
echo │                     │
echo │ 2. Scan Configs     │ @REM scanne les fichiers de déploiement du serveur (scripts shell)
echo │                     │
echo │ 3. Deploy           │ @REM il va déployer les serveurs en fonction des scripts shell que on lui a donné (choix de fichiers config deployment)
echo │                     │
echo │ 4. Help             │ @REM explique toutes les fonctionnalitées de cet multitool
echo │                     │
echo │ 5. Credits          │ @REM affiche les crédits de cet outil
echo │                     │
echo ┕─────────────────────┙

set /p option=Choose an option:

:settings
echo [Settings] - Mise à jour des paramètres...
pause
goto banner

:scan
echo [Scan Configs] - Scan des configurations de déploiement...
pause
goto banner

:deploy
echo [Deploy] - Déploiement des serveurs...
pause
goto banner

:help
echo [Help] - Voici comment utiliser cet outil...
pause
goto banner

:credits
echo [Credits] - Outil créé par [Ton nom]...
pause
goto banner