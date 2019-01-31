FROM php:7.2-apache
MAINTAINER <WebDevDLo@gmail.com>

WORKDIR /var/www/commons

# Additional packages:
# - Nano for convenience debuging.
# - PDO MySQL for Laravel.
RUN apt-get update && apt-get install -y \
    nano \
    && docker-php-ext-install pdo_mysql

# Source code
COPY --chown=www-data:www-data . /var/www/commons

# Site config
RUN mv web-app-config/commons.local.conf /etc/apache2/sites-available/commons.local.conf
RUN a2ensite commons.local.conf

# Apache modules
RUN a2enmod rewrite

# Configure PHP
# - Start with default development file.
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Container process
# NOTE: CMD is not needed with the php image, which automatically sets the main
#       main process to Apache.
EXPOSE 80