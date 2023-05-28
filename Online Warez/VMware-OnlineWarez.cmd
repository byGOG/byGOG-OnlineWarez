@echo off
setlocal
set NAME=VMware
TITLE %NAME% Warez Online

ECHO ---------------------------------------------------
echo Installing %NAME%...
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "Field2" /t REG_SZ /d "Option, Epoch" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "Cpt" /t REG_SZ /d "COPYRIGHT (c) VMware, Inc. 1999-2022" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "ProductID" /t REG_SZ /d "VMware Workstation" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "LicenseVersion" /t REG_SZ /d "17.0" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "LicenseType" /t REG_SZ /d "Site" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "LicenseEdition" /t REG_SZ /d "ws.fusion.pro.vl" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "Epoch" /t REG_SZ /d "2022-08-01" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "Option" /t REG_SZ /d "31" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "DataHash" /t REG_SZ /d "8c820ac5-2afd8aaa-e65012ae-0d3a123a-11c62de7" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "Hash" /t REG_SZ /d "cbd7a9ae-8a621be2-ceee1851-b59f78d8-9cf91eb9" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "Hash2" /t REG_SZ /d "6de5e501-51c541a0-fa5a157e-a56bae61-0cc65e86" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c Reg.exe add "HKLM\SOFTWARE\WOW6432Node\VMware, Inc.\VMware Workstation\License.ws.17.0.e2.202208" /v "Serial" /t REG_SZ /d "MC60H-DWHD5-H80U9-6V85M-8280D" /f' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c xcopy /y /f %TEMP%\rarreg.key %SYSTEMDRIVE%\PROGRA~1\WinRAR' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c xcopy /y /f %TEMP%\rarreg.key %SYSTEMDRIVE%\PROGRA~1\WinRAR' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c xcopy /y /f %TEMP%\rarreg.key %SYSTEMDRIVE%\PROGRA~1\WinRAR' -WindowStyle Hidden -Verb RunAs -Wait
POWERSHELL; Start-Process cmd -ArgumentList '/c xcopy /y /f %TEMP%\rarreg.key %SYSTEMDRIVE%\PROGRA~1\WinRAR' -WindowStyle Hidden -Verb RunAs -Wait

ECHO Installation completed successfully! by GOG [sordum.net]
ECHO ---------------------------------------------------

TIMEOUT /T 10













