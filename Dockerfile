# Menggunakan image PHP versi 8.x yang sudah mendukung Vite.js
FROM php:8.2-fpm

# Instal dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl \
    npm

# Install PHP extensions yang dibutuhkan
RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Install Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Install Node.js (untuk menjalankan Vite.js)
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Setting up the working directory
WORKDIR /home/dockerProjects/company-profile

# Berikan hak akses ke direktori
RUN chown -R www-data:www-data /home/dockerProjects/company-profile \
    && chmod -R 755 /home/dockerProjects/company-profile

# Expose port 8000 untuk menjalankan PHP development server
EXPOSE 8000

# Perintah default untuk container
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
