
## Instalasi
1. tambah user dimysql dengan host docker 172.18.0.2 dan beri hak akses
Cth:
masuk ke mysql melalui CLI
```
CREATE USER 'user-docker'@'172.18.0.2' IDENTIFIED BY 'docker-up';
GRANT ALL PRIVILEGES ON *.* TO 'user-docker'@'172.18.0.2';
```

2. edit konfigurasi mysql bind-address ke 0.0.0.0 agar bisa mendengarkan dari semua sumber
3. ubah konfigurasi database pada .env berdasarkan user baru yang sudah dibuat untuk docker
4. 
```
sudo docker compose up -d --build
```
5. 
```
sudo docker exec -it <namacontainer> bash
```
6. php artisan key:generate 
6. composer install
7. npm install
8. 
```
sudo docker compose down
```
9. edit uncomment dockerfile
```
CMD ["entrypoint.sh"]
```
10. build kembali
```
sudo docker compose up -d --build
```

VOILAA
Happy Code