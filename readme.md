Ganti nama akun di folder accounts/nama-akun-mu
Lalu ganti username di config.yml
Terakhir ganti blogger-followers dan blogger-following sesuaikan dengan minat mu

Cara run :

https://docs.gramaddict.org/#/quickstart

1. Buat virtual env : py -m venv venv
2. Aktivasi venv : ./venv/Scripts/activate
3. install requirements : pip3 install gramaddict
(Optional)
## Jika dependensi anda rusak coba install python 3.8 Lalu pakai requirements ini : pip install -r ./requirements.txt
4. Pastikan adb telah terinstall dengan cara : adb devices
5. Jika belum coba lakukan tutorial berikut https://docs.gramaddict.org/#/quickstart?id=step-3-install-adb
6. Pada saat menjalankan pertama kali lakukan : py -m uiautomator2 init
7. Terakhir : py run.py --config accounts/nama-akun-mu/config.yml

Jika ingin menjalankan script ini tanpa perlu di awasi, pastikan kunci layar dimatikan agar script dapat
menghidupkan secara otomatis