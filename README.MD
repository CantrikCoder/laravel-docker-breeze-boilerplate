docker-compose up -d

docker exec -it laravel_app bash
composer create-project --prefer-dist laravel/laravel .
npm install
npm run dev