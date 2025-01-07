# Script Başlangıcı
$Name = "Defender Control"
$ToolsPath = "C:\tools"
$Url = "https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/DefenderControl.rar"
$LocalRarFile = Join-Path -Path $ToolsPath -ChildPath "DefenderControl.rar"
$UnrarPath = Join-Path -Path $ToolsPath -ChildPath "unrarw64.exe"
$UnrarExe = Join-Path -Path $ToolsPath -ChildPath "UnRAR.exe"
$LicenseFile = Join-Path -Path $ToolsPath -ChildPath "license.txt"

# Araçlar klasörü oluşturuluyor
Write-Host "Araçlar klasörü oluşturuluyor: $ToolsPath" -ForegroundColor Yellow
if (-not (Test-Path $ToolsPath)) {
    New-Item -Path $ToolsPath -ItemType Directory | Out-Null
}

# Windows Defender hariç tutma listesine ekleniyor
Write-Host "Windows Defender hariç tutma listesine ekleniyor..." -ForegroundColor Yellow
$cmdArguments = '/c powershell -Command "Add-MpPreference -ExclusionPath \"' + $ToolsPath + '\""'
Start-Process cmd -ArgumentList $cmdArguments -WindowStyle Hidden -Verb RunAs -Wait

# Defender Control indiriliyor
Write-Host "$Name indiriliyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $Url -OutFile $LocalRarFile -ErrorAction Stop

# UnRAR indiriliyor ve kuruluyor
Write-Host "UnRAR indiriliyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://www.rarlab.com/rar/unrarw64.exe" -OutFile $UnrarPath -ErrorAction Stop
Start-Process -FilePath $UnrarPath -ArgumentList "/S", "/D$ToolsPath" -Wait

# RAR dosyasını çıkarma işlemi
Write-Host "DefenderControl.rar dosyası çıkarılıyor..." -ForegroundColor Yellow
& $UnrarExe e -p"sordum" -y $LocalRarFile "$ToolsPath\DefenderControl\"

# Kullanıcının masaüstü yolunu al
$UserDesktop = [System.Environment]::GetFolderPath('Desktop')
$ShortcutPath = Join-Path -Path $UserDesktop -ChildPath "Defender Control.lnk"

Write-Host "Masaüstünde kısayol oluşturuluyor..." -ForegroundColor Yellow
$TargetPath = "$ToolsPath\DefenderControl\dControl.exe"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.Save()

# Geçici dosyalar temizleniyor
Write-Host "Geçici dosyalar temizleniyor..." -ForegroundColor Yellow
Remove-Item -Path $LocalRarFile -Force
Remove-Item -Path $UnrarPath -Force
Remove-Item -Path $UnrarExe -Force
Remove-Item -Path $LicenseFile -Force

# Kurulum tamamlandı
Write-Host "Kurulum başarıyla tamamlandı! by GOG [sordum.net]" -ForegroundColor Green