FROM php:7.3-apache

RUN apt-get update && \
    apt-get install -y \
    curl \
    nano \
    git \
    iproute2 \
    libzip-dev \
    zip \
    libxml2-dev \
    iputils-ping \
    gnupg2 \
    nodejs \
    npm

RUN docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql \
    xml \
    soap \
    zip && \
    a2enmod rewrite && \
    pecl install xdebug 2.7.0rc1 && \
    docker-php-ext-enable xdebug

ADD php.ini /usr/local/etc/php/

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#RUN curl -s https://getcomposer.org/installer | php && \
#    mv composer.phar /usr/local/bin/composer

ARG uid
RUN useradd -G www-data,root -u $uid -d /home/devuser devuser
RUN mkdir -p /home/devuser/.composer && \
    chown -R devuser:devuser /home/devuser

COPY bash.bashrc /etc/

ARG webhost
COPY $webhost.conf /etc/apache2/sites-available/
COPY $webhost-ssl.conf /etc/apache2/sites-available/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=NL/ST=Zuid-Holland/L=Rotterdam/O=Grumpy Corp/OU=Go away!/CN=www.GrumpyIpsum.com" && \
    a2enmod ssl && \
    a2dissite 000-default && \
    a2dissite default-ssl && \
    a2ensite $webhost && \
    a2ensite $webhost-ssl

CMD echo "`/sbin/ip route|awk '/default/ { print $3 }'`\tdocker.host.internal" | tee -a /etc/hosts > /dev/null && \
    apachectl -D FOREGROUND

EXPOSE 80
EXPOSE 443