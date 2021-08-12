#!/bin/sh

mkdir -p /var/www/html/app/tmp/cache/cache_data
mkdir -p /var/www/html/app/tmp/cache/db_cache
mkdir -p /var/www/html/app/tmp/cache/less
mkdir -p /var/www/html/app/tmp/cache/modules
mkdir -p /var/www/html/app/tmp/cache/models
mkdir -p /var/www/html/app/tmp/cache/persistent
mkdir -p /var/www/html/app/tmp/cache/views

chown -R www-data:www-data /var/www/html/app/tmp/
chmod -R 777 /var/www/html/app/tmp/

git clone https://github.com/FriendsOfCake/CakePdf -b 1.0.3 /var/www/html/app/Plugin/CakePdf
git clone https://github.com/cakephp/debug_kit -b 2.2 /var/www/html/app/Plugin/DebugKit
git clone https://github.com/Hyra/less.git /var/www/html/app/Plugin/Less
git clone https://github.com/leafo/lessphp.git /var/www/html/app/Plugin/Less/Vendor/lessphp

