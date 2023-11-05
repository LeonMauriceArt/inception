FROM debian:buster

RUN apt-get update -y && \
apt-get install -y wget curl php7.3 php-fpm php-cli php-redis php-mysql mariadb-client

#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
#RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY conf/wordpress_config.sh .
RUN chmod +x ./wordpress_config.sh && \
mkdir -p /var/www/wordpress && \
chown -R root:root /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["./wordpress_config.sh"]