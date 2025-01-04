$ErrorActionPreference = "Stop"
# Dosya URL'si
$DownloadURL = "https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/WinRAR-DFoX.exe"
# Dosya indirme yolu
$FilePath = "$env:TEMP\WinRAR-DFoX.exe"

# Dosyayı indir
Invoke-WebRequest -Uri $DownloadURL -OutFile $FilePath -UseBasicParsing

# Dosyayı çalıştır
Start-Process -FilePath $FilePath -Wait
