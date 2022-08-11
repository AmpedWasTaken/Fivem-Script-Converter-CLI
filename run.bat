@echo off
:main
echo 1. Qbus To ESX
echo 2. ESX To Qbus
set /p choice=Enter choice: 
if %choice% == 1 goto qbus
if %choice% == 2 goto esx
goto main
:qbus
@REM set /p file=Enter file url: 
call :filedialog file
node src/index.js %file% qbustoesx
start output.lua
ping -n 5 localhost >nul
cls
goto main
:esx
@REM set /p file=Enter file url: 
call :filedialog file
node src/index.js %file% esxtoqbus
start output.lua
ping -n 5 localhost >nul
cls
goto main

:filedialog :: &file
setlocal 
set dialog="about:<input type=file id=FILE accept='.lua,.txt'><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"
for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "file=%%p"
endlocal  & set %1=%file%

