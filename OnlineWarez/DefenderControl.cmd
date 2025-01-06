# Script Başlangıcı
$Name = "Defender Control"
$Url = "https://github.com/byGOG/byGOG-OnlineWarez/raw/refs/heads/main/OnlineWarez/DefenderControl.rar"
$ToolsPath = "$env:SYSTEMDRIVE\tools"
$LocalRarFile = Join-Path -Path $ToolsPath -ChildPath "DefenderControl.rar"
$UnrarPath = "$env:TEMP\unrarw64.exe"
$UnrarExe = "$env:TEMP\UnRAR.exe"

# Bilgilendirme
Write-Host "-------------------------------------------------------------------------------------------------------"
Write-Host "Araçlar klasörü oluşturuluyor..."
New-Item -Path $ToolsPath -ItemType Directory -Force | Out-Null

Write-Host "Windows Defender hariç tutma listesine ekleniyor..."
Start-Process powershell -ArgumentList "Add-MpPreference -ExclusionPath '$ToolsPath'" -Verb RunAs -Wait

Write-Host "$Name indiriliyor..."
Invoke-WebRequest -Uri $Url -OutFile $LocalRarFile

Write-Host "UnRAR indiriliyor ve kuruluyor..."
Invoke-WebRequest -Uri "https://www.rarlab.com/rar/unrarw64.exe" -OutFile $UnrarPath
Start-Process -FilePath $UnrarPath -ArgumentList "/S", "/D=$env:TEMP" -Wait

Write-Host "DefenderControl.rar dosyası çıkarılıyor..."
& $UnrarExe e -p"psordum" -y $LocalRarFile "$ToolsPath\DefenderControl\"

Write-Host "Masaüstünde Defender Control kısayolu oluşturuluyor..."
$ShortcutPath = "$env:PUBLIC\Desktop\DefenderControl.lnk"
$TargetPath = "$ToolsPath\DefenderControl\dControl.exe"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.Save()

Write-Host "Geçici dosyalar siliniyor..."
Remove-Item -Path $LocalRarFile -Force
Remove-Item -Path $UnrarPath -Force
Remove-Item -Path $UnrarExe -Force

Write-Host "Kurulum başarıyla tamamlandı! by GOG [sordum.net]"
Write-Host "-------------------------------------------------------------------------------------------------------"
