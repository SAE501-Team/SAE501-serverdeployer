@echo off
cls
chcp 65001 >nul
title ServerDeployerv1.0 - Wonderful tool to deploy shell scripts on your server
color F
mode con cols=105 lines=30

@REM Variables INIT
set root_dir=%~dp0
set is_deployed = false
set deploy_choice = 0

set vps_ip = ""
set vps_user = ""
set vps_pass = ""

setlocal enabledelayedexpansion
@REM Tableau de configs
set "configs[0]="
set config_count=0

@REM Banner INIT
:banner
cls
cd assets/
type banner.txt
cd %root_dir%

@REM /!\ OPTIONS DOCUMENTATION /!\
@REM 1. Settings: met à jour les paramètres de configuration du serveur (VPS creds etc)
@REM 2. Scan Configs: scanne les fichiers de déploiement du serveur (scripts shell)
@REM 3. Deploy: il va déployer les serveurs en fonction des scripts shell que on lui a donné (choix de fichiers config deployment)
@REM 4. Help: explique toutes les fonctionnalitées de cet multitool
@REM 5. Credits: affiche les crédits de cet outil

:menu
echo .
echo .
echo                               ┌────────────────────────────────┐
echo                               │            Options:            │
echo                               │                                │
echo                               │ 1. Settings         4. Help    │
echo                               │                                │
echo                               │ 2. Scan Configs     5. Credits │
echo                               │                                │
echo                               │ 3. Deploy           6. Quit    │
echo                               │                                │
echo                               └────────────────────────────────┘

set /p option=Choose an option:

if /I "%option%"=="1" goto settings
if /I "%option%"=="2" goto scan
if /I "%option%"=="3" goto deploy
if /I "%option%"=="4" goto help
if /I "%option%"=="5" goto credits
if /I "%option%"=="6" goto quit

@REM Si aucune des options valides n'a été choisie
echo Invalid option. Please choose a valid option from the menu.
pause
goto banner

@REM options
:settings
cls
echo [Settings] - Update server configuration parameters:
set /p vps_user=Enter the VPS username:
cls

echo [Settings] - Update server configuration parameters:
set /p vps_ip=Enter the VPS IP address:
cls

echo [Settings] - Update server configuration parameters:
set /p vps_pass=Enter the VPS password (caracters aren't hidden!):
echo %vps_user% %vps_ip% %vps_pass%
pause
goto banner

@REM TODO: Scan server deployment files
:scan
cls
set /p scan_choice= Scan server deployment files? (Y/N)
if /I "%scan_choice%"=="Y" (
    cls
    echo [Scan] - Scanning server deployment files...
    set "config_count=0"
    setlocal enabledelayedexpansion

    for /r "%root_dir%configs" %%f in (*.sh) do (
    set /a config_count+=1
    set "configs[!config_count!]=%%~nxf"
    )

    if "%config_count%"=="0" (
        echo No deployment files found.
        pause
        goto banner
    )

    cls
    echo Found !config_count! configuration file^(s^)^:
    for /L %%i in (1,1,!config_count!) do (
        color 0A
        echo %%i. !configs[%%i]!
    )

pause
goto banner
)
if /I "%scan_choice%"=="N" (
    cls
    echo Scanning cancelled.
    timeout /t 1 >nul
    goto banner
)

echo Invalid choice. Please enter Y or N.
pause
goto banner

:deploy
cls
if "%config_count%"=="0" (
    echo No deployment files found. Please scan for deployment files first.
    pause
    goto banner
)
goto deploading
pause
goto banner

:deploading
echo [Deploy] - Script is deploying on server...
setlocal enabledelayedexpansion
set "is_deployed=false"
for /L %%i in (1,1,3) do (
    set "dots="
    for /L %%j in (1,1,%%i) do set "dots=!dots!."
    cls
    echo [Deploy] - Script is deploying on server!dots!
    timeout /t 1 >nul
    if "!is_deployed!"=="true" goto deployed
)
cd apps/
START putty.exe -ssh %bps_ip% -l %vps_user% -pw "%vps_pass%"

@REM goto deploading

:deployed
endlocal
echo Deployment completed successfully!.
pause
goto banner

:help
cls
cd assets/
type banner.txt
cd %root_dir%
echo.
echo                ┌───────────────────────────────────────────────────────────────────────┐
echo                │                            Command list                               │
echo                ├───────────────────────────────────────────────────────────────────────┤
echo                │ 1. Settings: Update server configuration parameters                   │
echo                │ 2. Scan Configs: Scan server deployment files (shell scripts)         │
echo                │ 3. Deploy: Deploy servers based on provided shell script config files │
echo                │ 4. Help: Explain all functionalities of this multitool                │
echo                │ 5. Credits: Display credits for this tool                             │
echo                │ 6. Quit: Exit the tool                                                │
echo                └───────────────────────────────────────────────────────────────────────┘
echo.
pause
goto banner

:credits
cls
cd assets/
type banner.txt
cd %root_dir%
echo .
echo .
echo              ServerDeployer multitool made by Alex
cd assets/
type katana.txt
cd %root_dir%
echo .
echo                                    https://github.com/YxxgSxxl/
echo .
echo .
pause
goto banner

:quit
set /p exit_choice=Exit the tool? (Y/N):
if /I "%exit_choice%"=="Y" (
    cls
    title cmd
    cmd /k
)
if /I "%exit_choice%"=="N" goto banner
echo Invalid choice. Please enter Y or N.
pause
goto quit