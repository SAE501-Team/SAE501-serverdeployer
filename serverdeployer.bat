@echo off
cls
chcp 65001 >nul
title ServerDeployer - Batch Script to Deploying Servers
color D

:banner
echo   _________                              ________                .__                             
echo  /   _____/ ______________  __ __________\______ \   ____ ______ |  |   ____ ___.__. ___________ 
echo  \_____  \_/ __ \_  __ \  \/ // __ \_  __ \    |  \_/ __ \\____ \|  |  /  _ <   |  |/ __ \_  __ \
echo  /        \  ___/|  | \/\   /\  ___/|  | \/    `   \  ___/|  |_> >  |_(  <_> )___  \  ___/|  | \/
echo /_______  /\___  >__|    \_/  \___  >__| /_______  /\___  >   __/|____/\____// ____|\___  >__|   
echo         \/     \/                 \/             \/     \/|__|               \/         \/       
echo .
echo ┍─────────────────────┑
echo │      Options:       │
echo │                     │
echo │ 1. scan configs     │
echo │                     │
echo │ 2. Deploy           │
echo │                     │
echo │ 3. Credits          │
echo │                     │
echo ┕─────────────────────┙