@echo off
:main
echo 1. Qbus To ESX
echo 2. ESX To Qbus
set /p choice=Enter choice: 
if %choice% == 1 goto qbus
if %choice% == 2 goto esx
goto main
:qbus
set /p file=Enter file url: 
node src/index.js %file% qbustoesx
start output.lua
ping -n 5 localhost >nul
cls
goto main
:esx
set /p file=Enter file url: 
node src/index.js %file% esxtoqbus
start output.lua
ping -n 5 localhost >nul
cls
goto main