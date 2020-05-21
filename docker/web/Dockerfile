FROM php:7.2-apache
RUN apt-get update && \
    apt-get install -y nano git zip unzip libxml2-dev iputils-ping
RUN docker-php-ext-install mysqli pdo pdo_mysql xml soap && \
    a2enmod rewrite && \
    pecl install xdebug 2.7.0rc1 && \
    docker-php-ext-enable xdebug
ADD php.ini /usr/local/etc/php/
RUN curl -s https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
RUN apt-get install -y gnupg2 && \
    curl -sL https://deb.nodesource.com/setup_9.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh
RUN apt-get install -y nodejs

COPY bash.bashrc /etc/

COPY build-composer.sh /var/www/
RUN chmod +x /var/www/build-composer.sh

COPY build.sh /var/www/
RUN chmod +x /var/www/build.sh

COPY www.grumpyipsum.com.conf /etc/apache2/sites-available/
COPY www.grumpyipsum.com-ssl.conf /etc/apache2/sites-available/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=NL/ST=Zuid-Holland/L=Rotterdam/O=Grumpy Corp/OU=Go away!/CN=www.GrumpyIpsum.com" && \
    a2enmod ssl && \
    a2dissite 000-default && \
    a2dissite default-ssl && \
    a2ensite www.grumpyipsum.com && \
    a2ensite www.grumpyipsum.com-ssl
EXPOSE 80
EXPOSE 443



