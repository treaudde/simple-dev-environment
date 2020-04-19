#SIMPLE PRODUCTION ENVIRONMENT
FROM php:7.3.13-apache-stretch

#INSTALL Additional PHP Extensions
RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libzip-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-source extract \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-source delete

#Enable mod_rewrite
RUN a2enmod rewrite

#Copy PHP INI
COPY config/php.ini /usr/local/etc/php/
