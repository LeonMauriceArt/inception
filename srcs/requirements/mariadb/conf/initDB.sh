#!/bin/bash

service mysql start;
mysql -u root -e "CREATE DATABASE ${SQL_DATABASE};"
mysql -u root $SQL_DATABASE < /createDB.sql 
mysqladmin -u root shutdown
exec mysqld_safe