#!/bin/bash
echo "HI"

/bin/rm -rf /var/www/default/*

/bin/rm -rf /var/www/default/.[^.] /var/www/default/.??*

/bin/cp -rf /var/app/. /var/www/default

cd /var/www/default
/usr/local/.nvm/nvm.sh

/usr/bin/composer install

nvm use
yarn install

/usr/local/bin/gulp

php artisan migrate
