#!/bin/sh
set -e
# set timezone
cp /usr/share/zoneinfo/$TZ /etc/localtime && echo "$TZ" > /etc/timezone

# init nginx
if [ ! -d /run/nginx ]; then
    mkdir -p /run/nginx /var/tmp/nginx 
fi

sed -i "s@listen = 127.0.0.1:9000@listen = /var/run/php-fpm.socket@g" /etc/php7/php-fpm.d/www.conf
sed -i "s@;clear_env = no@clear_env = no@g" /etc/php7/php-fpm.d/www.conf
sed -i "s@;listen.mode = 0660@listen.mode = 0666@g" /etc/php7/php-fpm.d/www.conf

php-fpm7
nginx -g "daemon off;"