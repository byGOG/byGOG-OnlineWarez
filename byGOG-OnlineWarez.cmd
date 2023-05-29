@echo off
setlocal enabledelayedexpansion
SET "NAME=by GOG [sordum.net]"
TITLE %NAME%

:menu
cls
echo =================================================================================================================
echo                                                __          __________  ______
echo                                               / /_  __  __/ ____/ __ \/ ____/
echo                                              / __ \/ / / / / __/ / / / / __  
echo                                             / /_/ / /_/ / /_/ / /_/ / /_/ /  
echo                                            /_.___/\__, /\____/\____/\____/   
echo                                                  /____/                      
echo =================================================================================================================
echo                                                     ONLINE WAREZ
echo                                                     [sordum.net] 
echo =================================================================================================================
echo [ud] Disabling User Account Control   [ii] IDM-IAS   
echo [da] Activating Desktop Icon          [vd] VMware-DVT
echo [dr] Defender Remover                 [wd] WinRAR-DFoX    
echo [dc] Defender Control                         
echo                                                       [e] Exit 

echo =================================================================================================================
set choices=
set /p choices="Please select option:"

if not defined choices (
    goto menu
)

set "options=!choices:,= !"
set "options=!options:-= !"
for %%o in (!options!) do (
    set "last_option=%%o"
    if "%%o"=="ii" (
        echo IDM-IAS...
        curl -sL#o "%TEMP%\IDM-IAS.cmd" "https://raw.githubusercontent.com/byGOG/byGOG-OnlineWarez/main/OnlineWarez/IDM-IAS.cmd" && CALL %TEMP%\IDM-IAS.cmd
    )
    if "%%o"=="vd" (
        echo VMware-DVT...
        curl -sL#o "%TEMP%\VMware-DVT.exe" "https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/VMware-DVT.exe" && CALL %TEMP%\VMware-DVT.exe
    )
	if "%%o"=="wd" (
        echo WinRAR-DFoX...
        curl -sL#o "%TEMP%\WinRAR-DFoX.exe" "https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/WinRAR-DFoX.exe" && CALL %TEMP%\WinRAR-DFoX.exe
    )
	if "%%o"=="ud" (
        echo Disabling User Account Control...
        curl -sL#o "%TEMP%\UAC-Disable.cmd" "https://raw.githubusercontent.com/byGOG/byGOG-OnlineWarez/main/OnlineWarez/UAC-Disable.cmd" && CALL %TEMP%\UAC-Disable.cmd
    )
	if "%%o"=="da" (
        echo Activating Desktop Icon...
        curl -sL#o "%TEMP%\DesktopIcon-Activate.cmd" "https://raw.githubusercontent.com/byGOG/byGOG-OnlineWarez/main/OnlineWarez/DesktopIcon-Activate.cmd" && CALL %TEMP%\DesktopIcon-Activate.cmd
    )
	if "%%o"=="dr" (
        echo Defender Remover...
        curl -sL#o "%TEMP%\DefenderRemover.cmd" "https://raw.githubusercontent.com/byGOG/byGOG-OnlineWarez/main/OnlineWarez/DefenderRemover.cmd" && CALL %TEMP%\DefenderRemover.cmd
    )
	if "%%o"=="dc" (
        echo Defender Control...
        curl -sL#o "%TEMP%\DefenderControl.cmd" "https://raw.githubusercontent.com/byGOG/byGOG-OnlineWarez/main/OnlineWarez/DefenderControl.cmd" && CALL %TEMP%\DefenderControl.cmd
    )
)

if not defined last_option (
    goto menu
	TITLE %NAME%
)

if "%last_option%"=="e" (
    echo Exiting...
    exit
)

pause
TITLE %NAME%
goto menu