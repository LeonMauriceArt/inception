FROM debian:buster

RUN apt-get update
RUN apt-get update -y

RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/www/wordpress


RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=lmaurin-.42.fr/UID=lmaurin-" 
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]