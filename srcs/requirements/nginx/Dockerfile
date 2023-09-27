FROM debian:buster

COPY conf/nginxInstall.sh .
RUN apt-update
RUN ./nginxInstall.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf
