$ErrorActionPreference = "Stop"

# CMD dosyasının URL'si
$DownloadURL = "https://github.com/byGOG/byGOG-OnlineWarez/raw/refs/heads/main/OnlineWarez/DefenderControl.cmd"

# İndirme yolu (Geçici klasör)
$FilePath = "$env:TEMP\DefenderControl.cmd"

# Dosyayı indir
Invoke-WebRequest -Uri $DownloadURL -OutFile $FilePath -UseBasicParsing

# CMD dosyasını yönetici olarak çalıştır
Start-Process -FilePath $FilePath -Verb RunAs -Wait


