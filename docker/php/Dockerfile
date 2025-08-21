FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libicu-dev \
    dnsutils \
    procps \
    redis \
    libevent-dev \
    libpng-dev libfreetype6-dev libjpeg62-turbo-dev libwebp-dev libxpm-dev zlib1g-dev

RUN docker-php-ext-install mysqli pdo pdo_mysql soap bcmath intl && docker-php-ext-enable mysqli pdo_mysql soap bcmath intl

RUN docker-php-ext-configure gd --enable-gd --with-webp --with-jpeg --with-xpm --with-freetype
RUN docker-php-ext-install -j$(nproc) gd

COPY php-fpm.conf /usr/local/etc/php-fpm.d/zzz-app_php-fpm.conf
COPY php.ini /usr/local/etc/php/conf.d/zzz-app_php.ini

WORKDIR /var/www/public
