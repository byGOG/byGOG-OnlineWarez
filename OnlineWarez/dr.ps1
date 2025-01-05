# Çalışma Dizini Ayarla
$DownloadPath = "$env:USERPROFILE\Downloads"
$ExeFile = "DefenderRemover.exe"
$Url = "https://github.com/ionuttbara/windows-defender-remover/releases/latest/download/$ExeFile"

# İndirilen Dosya Yolu
$LocalFile = Join-Path -Path $DownloadPath -ChildPath $ExeFile

# Güvenlik Politikalarını Ayarla (Yönetici Yetkisi Gerekebilir)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Dosyayı İndir
Write-Host "Dosya indiriliyor: $Url" -ForegroundColor Yellow
Invoke-WebRequest -Uri $Url -OutFile $LocalFile -UseBasicParsing

# Dosya Mevcutsa Çalıştır
if (Test-Path $LocalFile) {
    Write-Host "Dosya indirildi: $LocalFile" -ForegroundColor Green
    Start-Process -FilePath $LocalFile -Wait -Verb RunAs
} else {
    Write-Host "Dosya indirilemedi!" -ForegroundColor Red
}
