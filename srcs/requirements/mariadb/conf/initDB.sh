#!/bin/bash

echo "---Starting mysql---"
service mysql start;
echo "---Done!---"

echo "---Configuring database and users---"
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" > db.sql
echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> db.sql
mysql < db.sql
echo "---Done!---"