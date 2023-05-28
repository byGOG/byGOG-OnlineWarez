@echo off
if not "%1"=="admin" (powershell start -verb runas '%0' admin & exit /b)
TITLE UAC

ECHO ---------------------------------------------------
echo Disabling User Account Control settings....

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f

ECHO Installation completed successfully! by GOG [sordum.net]
ECHO ---------------------------------------------------

TIMEOUT /T 10