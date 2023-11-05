#!/bin/bash

echo "---Starting mysql---"
service mysql start;
echo "---Done!---"

echo "---Configuring database and users---"
mysql << EOF
CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};
CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALTER ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
EOF

echo "---Done!---"
