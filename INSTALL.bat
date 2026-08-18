@echo off
setlocal EnableExtensions
set "CHROMAPPER_DIR=C:\Users\pcden\Desktop\chromapper"
set "PLUGIN_DIR=%CHROMAPPER_DIR%\Plugins"
set "URL=https://github.com/nkdu3130/ChroMapper-RandomLightStrobe/releases/latest/download/RandomLightStrobe.zip"
if not exist "%CHROMAPPER_DIR%\ChroMapper.exe" (echo ChroMapper introuvable: %CHROMAPPER_DIR% & pause & exit /b 1)
if not exist "%PLUGIN_DIR%" mkdir "%PLUGIN_DIR%"
set "TMP=%TEMP%\RandomLightStrobe.zip"
set "TMPDIR=%TEMP%\RandomLightStrobeInstall"
if exist "%TMP%" del /f /q "%TMP%"
if exist "%TMPDIR%" rmdir /s /q "%TMPDIR%"
where curl.exe >nul 2>&1
if errorlevel 1 (echo curl.exe introuvable. & pause & exit /b 1)
echo Telechargement de la derniere release...
curl.exe -L --fail --retry 3 --retry-all-errors --tlsv1.2 -o "%TMP%" "%URL%"
if errorlevel 1 (echo Echec du telechargement. Verifie qu'une Release existe sur GitHub. & pause & exit /b 1)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -LiteralPath '%TMP%' -DestinationPath '%TMPDIR%' -Force"
if errorlevel 1 (echo Archive invalide. & pause & exit /b 1)
if not exist "%TMPDIR%\RandomLightStrobe.dll" (echo DLL absente de la release. & pause & exit /b 1)
copy /Y "%TMPDIR%\RandomLightStrobe.dll" "%PLUGIN_DIR%\RandomLightStrobe.dll" >nul
if errorlevel 1 (echo Impossible de copier la DLL. & pause & exit /b 1)
echo.
echo INSTALLATION TERMINEE.
echo Plugin installe dans : %PLUGIN_DIR%
pause
