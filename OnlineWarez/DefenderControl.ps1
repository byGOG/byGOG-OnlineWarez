# Script Başlangıcı
$Name = "Defender Control"
$Url = "https://github.com/byGOG/byGOG-OnlineWarez/raw/refs/heads/main/OnlineWarez/DefenderControl.rar"
$ToolsPath = "$env:SYSTEMDRIVE\tools"
$LocalRarFile = Join-Path -Path $ToolsPath -ChildPath "DefenderControl.rar"
$UnrarPath = "$env:TEMP\unrarw64.exe"
$UnrarExe = "$env:TEMP\UnRAR.exe"

# Araçlar klasörü oluşturuluyor
New-Item -Path $ToolsPath -ItemType Directory -Force | Out-Null

# Windows Defender hariç tutma listesine ekleniyor
Start-Process powershell -ArgumentList "Add-MpPreference -ExclusionPath '$ToolsPath'" -Verb RunAs -Wait

# Defender Control indiriliyor
Invoke-WebRequest -Uri $Url -OutFile $LocalRarFile

# UnRAR indiriliyor ve kuruluyor
Invoke-WebRequest -Uri "https://www.rarlab.com/rar/unrarw64.exe" -OutFile $UnrarPath
Start-Process -FilePath $UnrarPath -ArgumentList "/S", "/D=$env:TEMP" -Wait

# DefenderControl.rar dosyası çıkarılıyor
& $UnrarExe e -p"psordum" -y $LocalRarFile "$ToolsPath\DefenderControl\"

# Masaüstünde kısayol oluşturuluyor
$ShortcutPath = "$env:PUBLIC\Desktop\DefenderControl.lnk"
$TargetPath = "$ToolsPath\DefenderControl\dControl.exe"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.Save()

# Geçici dosyalar siliniyor
Remove-Item -Path $LocalRarFile -Force
Remove-Item -Path $UnrarPath -Force
Remove-Item -Path $UnrarExe -Force

# Kurulum tamamlandı mesajı
Write-Host "Kurulum başarıyla tamamlandı! by GOG [sordum.net]"
