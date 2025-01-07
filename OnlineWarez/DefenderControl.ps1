# Script Başlangıcı
$Name = "Defender Control"
$TempPath = "$env:TEMP\DefenderControlSetup"
$ToolsPath = "$env:SYSTEMDRIVE\tools"
$Url = "https://github.com/byGOG/byGOG-OnlineWarez/raw/refs/heads/main/OnlineWarez/DefenderControl.rar"
$LocalRarFile = Join-Path -Path $TempPath -ChildPath "DefenderControl.rar"
$UnrarPath = Join-Path -Path $TempPath -ChildPath "unrarw64.exe"
$UnrarExe = Join-Path -Path $TempPath -ChildPath "UnRAR.exe"

# Yönetici kontrolü
function Check-Admin {
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Write-Host "Bu script, yönetici olarak çalıştırılmalıdır!" -ForegroundColor Red
        exit
    }
}
Check-Admin

# Geçici klasör oluşturuluyor
Write-Host "Geçici klasör oluşturuluyor..." -ForegroundColor Yellow
if (-not (Test-Path $TempPath)) {
    New-Item -Path $TempPath -ItemType Directory | Out-Null
}

# Araçlar klasörü oluşturuluyor
Write-Host "Araçlar klasörü oluşturuluyor..." -ForegroundColor Yellow
if (-not (Test-Path $ToolsPath)) {
    New-Item -Path $ToolsPath -ItemType Directory | Out-Null
}

# Windows Defender hariç tutma listesine ekleniyor
Write-Host "Windows Defender hariç tutma listesine ekleniyor..." -ForegroundColor Yellow
Try {
    Add-MpPreference -ExclusionPath $ToolsPath
} Catch {
    Write-Host "Windows Defender hariç tutma eklenemedi!" -ForegroundColor Red
    exit
}

# Defender Control indiriliyor
Write-Host "$Name indiriliyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $Url -OutFile $LocalRarFile -ErrorAction Stop

# UnRAR indiriliyor ve kuruluyor
Write-Host "UnRAR indiriliyor ve kuruluyor..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://www.rarlab.com/rar/unrarw64.exe" -OutFile $UnrarPath -ErrorAction Stop
& $UnrarPath "/S" "/D$TempPath"

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
Remove-Item -Path $TempPath -Recurse -Force

# Kurulum tamamlandı mesajı
Write-Host "Kurulum başarıyla tamamlandı! by GOG [sordum.net]" -ForegroundColor Green
