@ECHO OFF
SETLOCAL
SET "NAME=Defender Control"
TITLE %NAME% Online Installer

SET "URL=https://www.sordum.org/files/downloads.php?st-defender-control"

ECHO -------------------------------------------------------------------------------------------------------
ECHO Creating Tools folder...
mkdir %SYSTEMDRIVE%\tools\

ECHO Adding Windows Defender to the exclusion list...
powershell Start-Process cmd -ArgumentList '/c powershell -Command "Add-MpPreference -ExclusionPath "%SYSTEMDRIVE%\tools\"" ' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Downloading %NAME%...
curl -L#o %SYSTEMDRIVE%\tools\condef.zip "%URL%"

ECHO Downloading and installing UnRAR...
curl -# -L -o "%TEMP%\unrarw32.exe" "https://www.rarlab.com/rar/unrarw32.exe"
start /wait "" "%TEMP%\unrarw32.exe" /S /D%TEMP%

ECHO Extracting condef.zip file...
%TEMP%/unrar x -psordum -y "%SYSTEMDRIVE%\tools\condef.zip" "%SYSTEMDRIVE%\tools"

ECHO Creating a Defender Control shortcut on the desktop......
powershell Start-Process cmd -ArgumentList '/c mklink "%PUBLIC%\Desktop\DefenderControl.lnk" "%SYSTEMDRIVE%\tools\condef\dControl.exe"' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Deleting temporary files...
DEL /q "%SYSTEMDRIVE%\tools\condef.zip"
DEL /q "%TEMP%\unrarw32.exe"
DEL /q "%TEMP%\UnRAR.exe"
DEL /q "%TEMP%\license.txt"

ECHO Installation completed successfully! by GOG [sordum.net]
ECHO -------------------------------------------------------------------------------------------------------