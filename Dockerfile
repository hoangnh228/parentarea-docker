FROM php:5.6.30-fpm-alpine

LABEL maintainer="Hoang Nguyen (hoang.nguyen@twentyci.asia)"

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    php5-common \
    php5-pdo \
    libpng-dev

# Add and Enable PHP-PDO Extenstions for PHP connect Mysql
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql
RUN docker-php-ext-install gd

# Remove Cache
RUN rm -rf /var/cache/apk/*
