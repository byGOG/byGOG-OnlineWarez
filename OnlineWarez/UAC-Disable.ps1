$ErrorActionPreference = "Stop"

# CMD dosyasının URL'si
$DownloadURL = "https://raw.githubusercontent.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/UAC-Disable.cmd"

# İndirme yolu (Geçici klasör)
$FilePath = "$env:TEMP\UAC-Disable.cmd"

# Dosyayı indir
Invoke-WebRequest -Uri $DownloadURL -OutFile $FilePath -UseBasicParsing

# CMD dosyasını yönetici olarak çalıştır
Start-Process -FilePath $FilePath -Verb RunAs -Wait