FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

#RUN mkdir -p /var/run/mysqld \
#&& chown -R mysql:mysql /var/run/mysqld \
#&& chmod 777 /var/run/mysqld

COPY conf/my.cnf /etc/my.cnf
COPY conf/initDB.sh /initDB.sh

RUN chmod +x /initDB.sh

EXPOSE 3306

#ENTRYPOINT ["tail", "-f", "/dev/null"]

ENTRYPOINT ["./initDB.sh"]