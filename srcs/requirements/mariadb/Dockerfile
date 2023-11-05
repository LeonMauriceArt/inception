FROM debian:buster

RUN apt-get update; \
apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld && \
chown -R mysql:mysql /var/run/mysqld && \
chmod 777 /var/run/mysqld

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/initDB.sh /initDB.sh

RUN chmod +x /initDB.sh && ./initDB.sh


#ENTRYPOINT ["tail", "-f", "/dev/null"]

ENTRYPOINT ["mysqld"]