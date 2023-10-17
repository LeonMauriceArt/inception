FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/my.cnf /etc/my.cnf
COPY conf/initDB.sh /initDB.sh
COPY conf/createDB.sql /createDB.sql

RUN chmod +x /initDB.sh

EXPOSE 3306

ENTRYPOINT ["./initDB.sh", "mysqld"]