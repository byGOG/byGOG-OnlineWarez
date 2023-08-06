@ECHO OFF
SETLOCAL
SET "OUTPUT=DefenderRemover.exe"
SET "NAME=Defender Remover"
TITLE %NAME% Online Installer

SET "URL=https://github.com/jbara2002/windows-defender-remover/releases/latest/download/DefenderRemover.exe"

ECHO -------------------------------------------------------------------------------------------------------
ECHO Creating tools folder...
mkdir %SYSTEMDRIVE%\tools\DefenderRemover

ECHO Adding Windows Defender exclusion list...
powershell Start-Process cmd -ArgumentList '/c powershell -Command "Add-MpPreference -ExclusionPath \"%SYSTEMDRIVE%\tools\DefenderRemover\"" ' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Downloading %NAME%:
curl -L#o %SYSTEMDRIVE%\tools\DefenderRemover\%OUTPUT% "%URL%"

ECHO Creating a Defender Control shortcut on the desktop......
powershell Start-Process cmd -ArgumentList '/c mklink "%PUBLIC%\Desktop\DefenderRemover.lnk" "%SYSTEMDRIVE%\tools\DefenderRemover\%OUTPUT%"' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Installation completed successfully! by GOG [sordum.net]
ECHO -------------------------------------------------------------------------------------------------------