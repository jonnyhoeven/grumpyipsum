FROM php:7.2
RUN apt-get update && apt-get install -y nano git zip unzip libxml2-dev iputils-ping
RUN docker-php-ext-install mysqli pdo pdo_mysql xml soap && \
    pecl install xdebug 2.7.0rc1 && docker-php-ext-enable xdebug
