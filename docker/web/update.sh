#!/usr/bin/env bash
cd /var/www/html/
composer update
composer install
php -f api/minify/minify.php
