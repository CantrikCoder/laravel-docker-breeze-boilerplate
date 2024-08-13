
## Instalasi
1. npm install
2. composer install
3. tambah user dimysql dengan host docker 172.18.0.2
4. edit konfigurasi bind-address ke 0.0.0.0 agar bisa mendengarkan dari semua sumber
5. ubah konfigurasi database pada .env berdasarkan user baru yang sudah dibuat untuk docker
6. 
```
sudo docker compose -d
```