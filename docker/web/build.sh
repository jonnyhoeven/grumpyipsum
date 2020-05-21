#!/usr/bin/env bash
cd /var/www/html/
composer install -o
composer global require "laravel/installer"
npm install
npm run build