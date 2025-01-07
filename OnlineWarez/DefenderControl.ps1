# Script Başlangıcı
$Name = "Defender Control"
$TempPath = "$env:TEMP"
$Url = "https://github.com/byGOG/byGOG-OnlineWarez/raw/refs/heads/main/OnlineWarez/DefenderControl.rar"
$LocalRarFile = Join-Path -Path $TempPath -ChildPath "DefenderControl.rar"
$UnrarPath = Join-Path -Path $TempPath -ChildPath "unrarw64.exe"
$ToolsPath = "$env:SYSTEMDRIVE\tools"

# Geçici dizine geçiş
Write-Host "Geçici klasöre geçiliyor: $TempPath" -ForegroundColor Yellow
Set-Location -Path $TempPath

# Araçlar klasörü oluşturuluyor
Write-Host "Araçlar klasörü oluşturuluyor: $ToolsPath" -ForegroundColor Yellow
if (-not (Test-Path $ToolsPath)) {
    New-Item -Path $ToolsPath -ItemType Directory | Out-Null
}

# Windows Defender hariç tutma listesine ekleniyor
Write-Host "Windows Defender hariç tutma listesine ekleniyor..." -ForegroundColor Yellow
Try {
    Add-MpPreference -ExclusionPath $ToolsPath
    Write-Host "Windows Defender hariç tutma işlemi tamamlandı." -ForegroundColor Green
} Catch {
    Write-Host "Windows Defender hariç tutma işlemi başarısız oldu. Yönetici olarak çalıştırmanız gerekebilir!" -ForegroundColor Red
}

# Defender Control indiriliyor
Write-Host "$Name indiriliyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $Url -OutFile $LocalRarFile -ErrorAction Stop

# UnRAR indiriliyor ve kuruluyor
Write-Host "UnRAR indiriliyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://www.rarlab.com/rar/unrarw64.exe" -OutFile $UnrarPath -ErrorAction Stop
& $UnrarPath "/S" "/D$TempPath"

# RAR dosyasını çıkarma işlemi
Write-Host "DefenderControl.rar dosyası çıkarılıyor..." -ForegroundColor Yellow
$UnrarExe = Join-Path -Path $TempPath -ChildPath "UnRAR.exe"
& $UnrarExe e -p"psordum" -y $LocalRarFile "$ToolsPath\DefenderControl\"

# Masaüstünde kısayol oluşturuluyor
Write-Host "Masaüstünde kısayol oluşturuluyor..." -ForegroundColor Yellow
$ShortcutPath = "$env:PUBLIC\Desktop\DefenderControl.lnk"
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

# Kurulum tamamlandı
Write-Host "Kurulum başarıyla tamamlandı! by GOG [sordum.net]" -ForegroundColor Green
