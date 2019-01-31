FROM php:7.2-apache
MAINTAINER <WebDevDLo@gmail.com>

# Additional packages:
# - Nano for convenience debuging.
# - PDO MySQL for Laravel.
RUN apt-get update && apt-get install -y \
    nano \
    && docker-php-ext-install pdo_mysql

# Apache modules
RUN a2enmod rewrite

# Configure PHP
# - Start with default development file.
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# Container process
# NOTE: CMD is not needed with the php image, which automatically sets the main
#       main process to Apache.
EXPOSE 80