$ErrorActionPreference = "Stop"
# Dosya URL'si
$DownloadURL = "https://github.com/byGOG/byGOG-OnlineWarez/raw/main/byGOG-OnlineWarez.cmd"
# Dosya indirme yolu
$FilePath = "$env:TEMP\byGOG-OnlineWarez.cmd"

# Dosyayı indir
Invoke-WebRequest -Uri $DownloadURL -OutFile $FilePath -UseBasicParsing

# Dosyayı çalıştır
Start-Process -FilePath $FilePath -Wait