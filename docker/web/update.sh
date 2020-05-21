#!/usr/bin/env bash
cd /var/www/html/
npm update
npm install
composer update
composer install
php -f api/minify/minify.php
