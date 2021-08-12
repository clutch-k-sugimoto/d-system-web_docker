#!/bin/sh

if [ ! -e {/var/www/html/app/tmp/cache/cache_data} ]; then
    mkdir -p /var/www/html/app/tmp/cache/cache_data
fi

if [ ! -e {/var/www/html/app/tmp/cache/db_cache} ]; then
    mkdir -p /var/www/html/app/tmp/cache/db_cache
fi

if [ ! -e {/var/www/html/app/tmp/cache/less} ]; then
    mkdir -p /var/www/html/app/tmp/cache/less
fi

if [ ! -e {/var/www/html/app/tmp/cache/modules} ]; then
    mkdir -p /var/www/html/app/tmp/cache/modules
fi

if [ ! -e {/var/www/html/app/tmp/cache/models} ]; then
    mkdir -p /var/www/html/app/tmp/cache/models
fi

if [ ! -e {/var/www/html/app/tmp/cache/persistent} ]; then
    mkdir -p /var/www/html/app/tmp/cache/persistent
fi

if [ ! -e {/var/www/html/app/tmp/cache/views} ]; then
    mkdir -p /var/www/html/app/tmp/cache/views
fi

chown -R www-data:www-data /var/www/html/app/tmp/
chmod -R 777 /var/www/html/app/tmp/

if [ -z "$(ls /var/www/html/app/Plugin/CakePdf)" ]; then
    git clone https://github.com/FriendsOfCake/CakePdf -b 1.0.3 /var/www/html/app/Plugin/CakePdf
fi

if [ -z "$(ls /var/www/html/app/Plugin/DebugKit)" ]; then
    git clone https://github.com/cakephp/debug_kit -b 2.2 /var/www/html/app/Plugin/DebugKit
fi

if [ -z "$(ls /var/www/html/app/Plugin/Less)" ]; then
    git clone https://github.com/Hyra/less.git /var/www/html/app/Plugin/Less
fi

if [ -z "$(ls /var/www/html/app/Plugin/Less/Vendor/lessphp)" ]; then
    git clone https://github.com/leafo/lessphp.git /var/www/html/app/Plugin/Less/Vendor/lessphp
fi

cd /var/www/html
composer install

cd /var/www/html/app
composer install

exec "$@"