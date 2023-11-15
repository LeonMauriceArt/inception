FROM debian:buster

RUN apt-get update -y && \
apt-get install -y wget curl php7.3 php-fpm php-cli php-redis php-mysql mariadb-client sendmail

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

COPY conf/wordpress_config.sh .
RUN chmod +x ./wordpress_config.sh && \
mkdir -p /var/www/wordpress && \
chown -R www-data:www-data /var/www/wordpress

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ["./wordpress_config.sh"]