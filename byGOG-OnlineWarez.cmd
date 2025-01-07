@echo off
setlocal enabledelayedexpansion
SET "NAME=by GOG [sordum.net]"
TITLE %NAME%

:menu
cls
echo ========================================================================
echo                       __          __________  ______
echo                      / /_  __  __/ ____/ __ \/ ____/
echo                     / __ \/ / / / / __/ / / / / __  
echo                    / /_/ / /_/ / /_/ / /_/ / /_/ /  
echo                   /_.___/\__, /\____/\____/\____/   
echo                         /____/                      
echo ========================================================================
echo                             ONLINE WAREZ
echo                             [sordum.net] 
echo ========================================================================
echo [ud] Disabling User Account Control   [ii] IDM-IAS   
echo [da] Activating Desktop Icon          [vd] VMware-DVT
echo [dr] Defender Remover                 [wd] WinRAR-DFoX    
echo [dc] Defender Control                 [ma] Microsoft Activation Scripts        
echo                             [e] Exit 

echo ========================================================================
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
        echo IDM Activation Script...
        POWERSHELL -Command "irm https://massgrave.dev/ias | iex"
    )
    if "%%o"=="vd" (
        echo VMware-DVT...
        POWERSHELL -Command "irm https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/VMware-DVT.ps1| iex"
    )
	if "%%o"=="wd" (
        echo WinRAR-DFoX...
        POWERSHELL -Command "irm https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/WinRAR-DFoX.ps1 | iex"
    )
	if "%%o"=="ud" (
        echo Disabling User Account Control...
        POWERSHELL -Command "irm https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/UAC-Disable.ps1 | iex"
    )
	if "%%o"=="da" (
        echo Activating Desktop Icon...
        POWERSHELL -Command "irm https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/DesktopIcon-Activate.ps1 | iex"
    )
	if "%%o"=="dr" (
        echo Defender Remover...
        POWERSHELL -Command "irm https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/DefenderRemover.ps1 | iex"
    )
	if "%%o"=="dc" (
        echo Defender Control...
        POWERSHELL -Command "irm https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/DefenderControl.ps1 | iex"
    )
	if "%%o"=="ma" (
        echo Microsoft Activation Scripts...
		POWERSHELL -Command "irm https://get.activated.win | iex)"
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