FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/my.cnf /etc/my.cnf
COPY conf/createDB.sh .

EXPOSE 3306

ENTRYPOINT ["sh", "./createDB.sh"]