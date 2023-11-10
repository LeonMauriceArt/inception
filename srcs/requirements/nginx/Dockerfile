FROM debian:buster

RUN apt-get update
RUN apt-get update -y
RUN apt-get install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=lmaurin-.42.fr/UID=lmaurin-" 
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /var/www/html && \
    chmod 755 /var/lib/nginx/

CMD [ "nginx", "-g", "daemon off;" ]