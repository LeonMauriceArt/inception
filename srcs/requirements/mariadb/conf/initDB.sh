#!/bin/bash

mysql_install_db
/etc/init.d/mysql start;

mysql_secure_installation << eof

Y
$SQL_ROOT_PASSWORD
$SQL_ROOT_PASSWORD
Y
n
Y
Y
eof

echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
FLUSH PRIVILEGES;" | mysql -u root -p$SQL_ROOT_PASSWORD

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe