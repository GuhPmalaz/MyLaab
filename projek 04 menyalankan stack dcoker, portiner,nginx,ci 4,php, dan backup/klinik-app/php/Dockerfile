FROM php:8.2-fpm-alpine

# Gunakan repository HTTP biasa untuk menghindari eror TLS/SSL saat download paket
RUN apk add --no-cache \
    curl \
    zip \
    unzip \
    icu-dev \
    libzip-dev \
    libpng-dev \
    oniguruma-dev \
    zlib-dev

# Install ekstensi wajib CodeIgniter 4 (mysqli, intl, mbstring, gd, zip)
RUN docker-php-ext-install -j$(nproc) intl mysqli mbstring gd zip

# Ambil Composer resmi
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY ./www/booking-klinik /var/www/html

# Berikan hak akses ke web server
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/writable

EXPOSE 9000
CMD ["php-fpm"]
