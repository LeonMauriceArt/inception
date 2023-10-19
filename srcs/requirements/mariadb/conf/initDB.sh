#!/bin/bash

echo "---Starting mysql---"
service mysql start;
echo "---Done!---"


echo "---Configuring database and users---"
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE; \
GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD'; \
FLUSH PRIVILEGES; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" | mysql -u root
echo "---Done!---"


#echo "---Shutdown---"
service mysql -u root -p$SQL_ROOT_PASSWORD status
service mysql -u root -p$SQL_ROOT_PASSWORD restart
#echo "---Done!---"

#echo "---Starting mysqld_safe---"
mysqld_safe