FROM debian:buster

COPY ../tools/nginxInstall.sh .
RUN apt-update
RUN ./nginxInstall.sh

#Installing zsh and ohmyzsh
RUN apt install zsh -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]