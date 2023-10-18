FROM debian:buster

COPY conf/nginxInstall.sh .
RUN apt-get update
RUN ./nginxInstall.sh

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]