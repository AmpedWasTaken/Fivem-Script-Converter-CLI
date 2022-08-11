@echo off
node -v 2> Nul
if "%errorlevel%" == "9009" (
    echo node could not be found
    echo make sure node is installed
    pause
) else (
    npm i fivem-script-converter
)
