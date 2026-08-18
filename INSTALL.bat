@echo off
setlocal EnableExtensions
set "CHROMAPPER_DIR=C:\Users\pcden\Desktop\chromapper"
set "PLUGIN_DIR=%CHROMAPPER_DIR%\Plugins"
set "URL=https://github.com/nkdu3130/ChroMapper-RandomLightStrobe/releases/latest/download/RandomLightStrobe.dll"
if not exist "%CHROMAPPER_DIR%\ChroMapper.exe" (echo ChroMapper introuvable: %CHROMAPPER_DIR% & pause & exit /b 1)
if not exist "%PLUGIN_DIR%" mkdir "%PLUGIN_DIR%"
if exist "%PLUGIN_DIR%\RandomLightStrobe.dll" del /f /q "%PLUGIN_DIR%\RandomLightStrobe.dll"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%PLUGIN_DIR%\RandomLightStrobe.dll'"
if errorlevel 1 (echo Echec du telechargement. & pause & exit /b 1)
echo Installation terminee.
