# UAC kapat
# "ConsentPromptBehaviorAdmin" anahtarını 0 olarak ayarlıyoruz. (Yönetici onay istemini kapatır)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 0 -Type DWord -Force

# Kullanıcıya bilgi mesajı göster
Write-Host "Yönetici onay istemi kapatıldı. UAC ayarları başarıyla güncellendi."