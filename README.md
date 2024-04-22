# Laracourse
Laracourse website kursus sederhana, dibangun menggunakan client-server arsitektur, client(vue) dan server(laravel)

# How to Use
1. Clone Laracourse Repository
```bash
    git clone https://github.com/rholanddeo/laracourse.git
```

2. Buka File laracourse-backend copy `env` ke `.env`
3. kemudian jalankan perintah sebagaimana kita mengkonfigurasi laravel baru pada umumnya
```bash
composer install
```
```bash
composer install
```
```bash
php artisan migrate --seed
```
```bash
php artisan key:generate
```

3. Jalankan server laracourse-backend : 
```bash
php artisan serve
```

4. Buka File Laracourse-frontend kemudian jalankan
```bash
npm install
```

5. Jalankan client laracourse-frontend:
```bash
npm run dev
```

6. Pastikan pada `SANCTUM_STATEFUL_DOMAINS = ` dalam `.env` pada laracourse-backend sama dengan port localhost server laracourse-frontend, misal `SANCTUM_STATEFUL_DOMAINS = localhost:5173`

7. Maka aplikasi siap dioperasikan

# Previews
![Laracourse-home](https://github.com/rholanddeo/Laracourse/assets/121206148/43248925-cb10-4dc8-88e4-86d66c2cf7d6)
#
![Laracourse-register](https://github.com/rholanddeo/Laracourse/assets/121206148/5f805bc5-fa00-4cfc-b119-d1b39c059a15)
#
![Laracourse-login](https://github.com/rholanddeo/Laracourse/assets/121206148/64b4af01-b74f-4a3b-875a-9bb11df6a784)
#
![Laracourse-course](https://github.com/rholanddeo/Laracourse/assets/121206148/54b5c776-0769-4a47-ba3c-fa80bcc4212e)
#
![Laracourse-edit_detail_add-materi](https://github.com/rholanddeo/Laracourse/assets/121206148/cbdd331c-2d7c-440f-acc7-12fe6435ac6c)
#
![Laracourse-materi](https://github.com/rholanddeo/Laracourse/assets/121206148/71d3119a-7d4d-4fff-9dcb-7799a8584bff)
#
![mobile](https://github.com/rholanddeo/Laracourse/assets/121206148/a6630664-e198-43ca-9892-ee30fdf3b42a)
#
![mobile (1)](https://github.com/rholanddeo/Laracourse/assets/121206148/265a84d7-5a0b-4173-ad18-857a934aa22c)


