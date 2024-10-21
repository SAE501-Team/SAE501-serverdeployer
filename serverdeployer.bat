@echo off
cls
chcp 65001 >nul
title ServerDeployer - Wonderful tool to deploy shell scripts on your server
color E

@REM Variables
set vps_ip = ""
set vps_user = ""
set vps_pass = "" 

@REM Banner
:banner

@REM 1. Settings: met à jour les paramètres de configuration du serveur (VPS creds etc)
@REM 2. Scan Configs: scanne les fichiers de déploiement du serveur (scripts shell)
@REM 3. Deploy: il va déployer les serveurs en fonction des scripts shell que on lui a donné (choix de fichiers config deployment)
@REM 4. Help: explique toutes les fonctionnalitées de cet multitool
@REM 5. Credits: affiche les crédits de cet outil

echo.
cd assets/
type banner.txt
echo .
echo ┌────────────────────────────────┐
echo │            Options:            │
echo │                                │
echo │ 1. Settings         3. Deploy  │
echo │                                │
echo │ 2. Scan Configs     4. Help    │
echo │                                │
echo │          5. Credits            │
echo │                                │
echo └────────────────────────────────┘
echo .

set /p option=Choose an option:

if /I "%option%"=="1" goto settings
if /I "%option%"=="2" goto scan
if /I "%option%"=="3" goto deploy
if /I "%option%"=="4" goto help
if /I "%option%"=="5" goto credits

pause
goto banner


:settings
echo [Settings] - Mise à jour des paramètres...
pause
goto banner

:scan
echo [Scan Configs] - Scan des configurations de déploiement...
pause
goto banner

:deploy
echo [Deploy] - Script is deploying on server...
pause
goto banner

:help
echo [Help] - Help desk
pause
goto banner

:credits
echo [Credits] - Outil créé par [Ton nom]...
pause
goto banner