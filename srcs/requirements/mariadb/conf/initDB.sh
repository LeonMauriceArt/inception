#!/bin/bash

echo "---Starting mysql---"
service mysql start;
echo "---Done!---"

echo "---Configuring database and users---"
echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;" > db.sql
echo "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> db.sql
echo "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql
mysql < db.sql
echo "---Done!---"
