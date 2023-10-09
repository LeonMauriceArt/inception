FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

#install ohmyzsh
RUN apt-get install zsh -y
RUN apt-get install curl -y
RUN apt-get install git -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

RUN apt-get -y install wget

RUN apt-get install -y php7.3 \
php-fpm \
php-mysql \
mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
#RUN chown -R root:root /var/www/wordpress