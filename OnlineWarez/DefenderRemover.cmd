@ECHO OFF
SETLOCAL
SET "OUTPUT=DefenderRemover.exe"
SET "NAME=Defender Remover"
TITLE %NAME% Warez Online

SET "URL=https://github.com/jbara2002/windows-defender-remover/releases/latest/download/DefenderRemover.exe"

ECHO -------------------------------------------------------------------------------------------------------
ECHO Creating tools folder...
mkdir %SYSTEMDRIVE%\tools\DefenderRemover

ECHO Adding Windows Defender exclusion list...
powershell Start-Process cmd -ArgumentList '/c powershell -Command "Add-MpPreference -ExclusionPath \"%SYSTEMDRIVE%\tools\DefenderRemover\"" ' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Downloading %NAME%:
curl -L#o %SYSTEMDRIVE%\tools\DefenderRemover\%OUTPUT% "%URL%"

ECHO Starting %NAME%...
start /wait %SYSTEMDRIVE%\tools\DefenderRemover\%OUTPUT%

ECHO Installation completed successfully! by GOG [sordum.net]
ECHO -------------------------------------------------------------------------------------------------------

TIMEOUT /T 10