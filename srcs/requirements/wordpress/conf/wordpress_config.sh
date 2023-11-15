#!/bin/bash

echo "---Downloading wordpress core---"
wp core download --allow-root --path='/var/www/wordpress'
echo "---Done!---"

sleep 10

if [ ! -d "/run/php" ]; then mkdir -p "/run/php" && chmod +w /run/php; fi

echo "---Configuring wordpress DB---"
cd /var/www/wordpress
wp config create --allow-root \
        --dbname=$WORDPRESS_DB_NAME \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path=$WORDPRESS_PATH
echo "---Done!---"

echo "---Core install wordpress---"
wp core install --allow-root \
        --path=$WORDPRESS_PATH \
        --url=$WORDPRESS_URL \
        --title="Inception lmaurin-" \
        --admin_user=$WORDPRESS_ADMIN \
        --admin_password=$WORDPRESS_ADMIN_PASSWORD \
        --admin_email=$WORDPRESS_ADMIN_EMAIL
wp theme activate twentytwentytwo --allow-root
echo "---Done!---"

echo "---Creating new user...---"
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
echo "---Done!---"


/usr/sbin/php-fpm7.3 -F
