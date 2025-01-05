$ErrorActionPreference = "Stop"

# CMD dosyasının URL'si
$DownloadURL = "https://raw.githubusercontent.com/byGOG/byGOG-OnlineWarez/main/OnlineWarez/DesktopIcon-Activate.cmd"

# İndirme yolu (Geçici klasör)
$FilePath = "$env:TEMP\DesktopIcon-Activate.cmd"

# Dosyayı indir
Invoke-WebRequest -Uri $DownloadURL -OutFile $FilePath -UseBasicParsing

# CMD dosyasını yönetici olarak çalıştır
Start-Process -FilePath $FilePath -Verb RunAs -Wait
