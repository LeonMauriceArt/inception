FROM debian:buster

COPY conf/nginxInstall.sh .
RUN apt-get update
RUN ./nginxInstall.sh

#Installing zsh and ohmyzsh
RUN apt-get install zsh -y
RUN apt-get install curl -y
RUN apt-get install git -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]