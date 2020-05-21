#!/usr/bin/env bash
cd /var/www/html/
composer install -o
php -f api/minify/minify.php
#npm install
#npm run build