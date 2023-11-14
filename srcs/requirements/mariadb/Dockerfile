FROM debian:buster

RUN apt-get update; \
apt-get install -y mariadb-server mariadb-client procps

#RUN			rm -f	/etc/mysql/my.cnf \
#					/etc/my.cnf \
#					~/my.cnf

RUN mkdir -p /var/run/mysqld && \
chown -R mysql /var/run/mysqld && \
chmod 777 /var/run/mysqld

RUN chown -R mysql /var/lib/mysql && \
chmod 777 /var/lib/mysql

COPY		conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY		conf/50-server.cnf /etc/mysql/my.cnf
# COPY		conf/50-server.cnf /etc/my.cnf
# COPY		conf/50-server.cnf ~/my.cnf
COPY        conf/initDB.sh /initDB.sh

RUN chmod +x /initDB.sh


#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["./initDB.sh"]

EXPOSE 3306