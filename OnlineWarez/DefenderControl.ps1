# Script Başlangıcı
$Name = "Defender Control"
$Url = "https://github.com/byGOG/byGOG-OnlineWarez/raw/refs/heads/main/OnlineWarez/DefenderControl.rar"
$ToolsPath = "$env:SYSTEMDRIVE\tools"
$LocalRarFile = Join-Path -Path $ToolsPath -ChildPath "DefenderControl.rar"
$UnrarPath = "$env:TEMP\unrarw64.exe"
$UnrarExe = "$env:TEMP\UnRAR.exe"

# Araçlar klasörü oluşturuluyor
Write-Host "Araçlar klasörü oluşturuluyor..." -ForegroundColor Yellow
New-Item -Path $ToolsPath -ItemType Directory -Force | Out-Null

# Windows Defender hariç tutma listesine ekleniyor
Write-Host "Windows Defender hariç tutma listesine ekleniyor..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "Add-MpPreference -ExclusionPath '$ToolsPath'" -Verb RunAs -Wait

# Defender Control indiriliyor
Write-Host "$Name indiriliyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $Url -OutFile $LocalRarFile

# UnRAR indiriliyor ve kuruluyor
Write-Host "UnRAR indiriliyor ve kuruluyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://www.rarlab.com/rar/unrarw64.exe" -OutFile $UnrarPath
Start-Process -FilePath $UnrarPath -ArgumentList "/S", "/D%TEMP%" -Wait

# DefenderControl.rar dosyası çıkarılıyor
Write-Host "DefenderControl.rar dosyası çıkarılıyor..." -ForegroundColor Yellow
& $UnrarExe e -p"psordum" -y $LocalRarFile "$ToolsPath\DefenderControl\"

# Masaüstünde kısayol oluşturuluyor
Write-Host "Masaüstünde kısayol oluşturuluyor..." -ForegroundColor Yellow
$ShortcutPath = "$env:PUBLIC\Desktop\DefenderControl.lnk"
$TargetPath = "$ToolsPath\DefenderControl\dControl.exe"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.Save()

# Geçici dosyalar siliniyor
Write-Host "Geçici dosyalar siliniyor..." -ForegroundColor Yellow
Remove-Item -Path $LocalRarFile -Force
Remove-Item -Path $UnrarPath -Force
Remove-Item -Path $UnrarExe -Force

# Kurulum tamamlandı mesajı
Write-Host "Kurulum başarıyla tamamlandı! by GOG [sordum.net]" -ForegroundColor Green
