#!/bin/bash

sleep 10

echo "---Downloading wordpress core---"
wp core download --allow-root --path='/var/www/wordpress'
echo "---Done!---"

echo "---Configuring wordpress DB---"
wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'
echo "---Done!---"

echo "---Core install wordpress---"
wp core install --allow-root \
        --path='/var/www/wordpress' \
        --url=wpclidemo.dev \
        --title="WP-CLI" \
        --admin_user=$WORDPRESS_ADMIN \
        --admin_password=$WORDPRESS_ADMIN_PASSWORD \
        --admin_email=info@wp-cli.org

echo "---Done!---"
