#!/usr/bin/env bash
npm install
npm run build
composer global require "laravel/installer"
composer install -o