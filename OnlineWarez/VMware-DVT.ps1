$ErrorActionPreference = "Stop"
# Dosya URL'si
$DownloadURL = "https://github.com/byGOG/byGOG-OnlineWarez/raw/main/OnlineWarez/VMware-DVT.exe"
# Dosya indirme yolu
$FilePath = "$env:TEMP\VMware-DVT.exe"

# Dosyayı indir
Invoke-WebRequest -Uri $DownloadURL -OutFile $FilePath -UseBasicParsing

# Dosyayı çalıştır
Start-Process -FilePath $FilePath -Wait


