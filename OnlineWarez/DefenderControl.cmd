@ECHO OFF
SETLOCAL
SET "NAME=Defender Control"
TITLE %NAME% Online Installer

SET "URL=https://github.com/byGOG/byGOG-OnlineWarez/raw/refs/heads/main/OnlineWarez/DefenderControl.rar"

ECHO -------------------------------------------------------------------------------------------------------
ECHO Creating Tools folder...
mkdir %SYSTEMDRIVE%\tools\

ECHO Adding Windows Defender to the exclusion list...
powershell Start-Process cmd -ArgumentList '/c powershell -Command "Add-MpPreference -ExclusionPath "%SYSTEMDRIVE%\tools\"" ' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Downloading %NAME%...
curl -L#o %SYSTEMDRIVE%\tools\DefenderControl.rar "%URL%"

ECHO Downloading and installing UnRAR...
curl -# -L -o "%TEMP%\unrarw64.exe" "https://www.rarlab.com/rar/unrarw64.exe"
start /wait "" "%TEMP%\unrarw64.exe" /S /D%TEMP%

ECHO Extracting DefenderControl.rar file...
%TEMP%/unrar e -psordum -y "%SYSTEMDRIVE%\tools\DefenderControl.rar" "%SYSTEMDRIVE%\tools\DefenderControl\"

ECHO Creating a Defender Control shortcut on the desktop......
powershell Start-Process cmd -ArgumentList '/c mklink "%PUBLIC%\Desktop\DefenderControl" "%SYSTEMDRIVE%\tools\DefenderControl\dControl.exe"' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Deleting temporary files...
DEL /q "%SYSTEMDRIVE%\tools\DefenderControl.rar"
DEL /q "%TEMP%\unrarw64.exe"
DEL /q "%TEMP%\UnRAR.exe"
DEL /q "%TEMP%\license.txt"

ECHO Installation completed successfully! by GOG [sordum.net]
ECHO -------------------------------------------------------------------------------------------------------