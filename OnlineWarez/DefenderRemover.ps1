# Klasör Yolu
$FolderPath = "C:\tools\DefenderRemover"
$ExeFile = "DefenderRemover.exe"
$Url = "https://github.com/ionuttbara/windows-defender-remover/releases/latest/download/$ExeFile"
$LocalFile = Join-Path -Path $FolderPath -ChildPath $ExeFile

# Klasörü Oluştur
if (-not (Test-Path $FolderPath)) {
    New-Item -Path $FolderPath -ItemType Directory -Force | Out-Null
    Write-Host "Klasör oluşturuldu: $FolderPath" -ForegroundColor Green
} else {
    Write-Host "Klasör zaten mevcut: $FolderPath" -ForegroundColor Yellow
}

# Dosyayı İndir
Write-Host "Dosya indiriliyor: $Url" -ForegroundColor Yellow
try {
    Invoke-WebRequest -Uri $Url -OutFile $LocalFile -UseBasicParsing
    Write-Host "Dosya indirildi: $LocalFile" -ForegroundColor Green
} catch {
    Write-Host "İndirme sırasında bir hata oluştu: $_" -ForegroundColor Red
    exit
}

# Dosya Mevcutsa Çalıştır
if (Test-Path $LocalFile) {
    Write-Host "İndirilen dosya çalıştırılıyor: $LocalFile" -ForegroundColor Yellow
    Start-Process -FilePath $LocalFile -Wait -Verb RunAs
} else {
    Write-Host "Dosya indirilemedi!" -ForegroundColor Red
}
