@echo off
setlocal
set NAME=WinRar
TITLE %NAME% Warez Online

ECHO ---------------------------------------------------
echo Downloading %NAME%...
curl -# -L -o "%TEMP%\rarreg.key" "https://github.com/byGOG/WinRAR_key/releases/download/setup/rarreg.key"

echo Installing %NAME%...
POWERSHELL; Start-Process cmd -ArgumentList '/c xcopy /y /f %TEMP%\rarreg.key %SYSTEMDRIVE%\PROGRA~1\WinRAR' -WindowStyle Hidden -Verb RunAs -Wait

echo Cleaning temporary files...
del /q "%TEMP%\rarreg.key"

ECHO Installation completed successfully! by GOG [sordum.net]
ECHO ---------------------------------------------------

TIMEOUT /T 10