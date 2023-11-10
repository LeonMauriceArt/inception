#!/bin/bash

echo "---Starting mysql---"
service mysql start;
echo "---Done!---"

echo "---Configuring database and users---"
mysql -u root -p$SQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};
CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
EOF
echo "---Done!---"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

mysqld_safe --syslog