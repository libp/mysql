#!/bin/bash

set -e

# if [ `mysqlshow|wc -l` -eq 8 ]; then
if [ -z "$(ls -A /var/lib/mysql)" ]; then
    echo "mariadb data dir is null, exec sql init"
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    sleep 3
    mysqld_safe &
    sleep 3
    mysqladmin -u "$MARIADB_USER" password "$MARIADB_PASS"
    mysql -e "grant all privileges on *.* to '$MARIADB_USER'@'%' identified by '$MARIADB_PASS' with grant option;"
    mysql -u "$MARIADB_USER" -p"$MARIADB_PASS" -e "flush privileges;"
    echo "keep program running in the background"
    tail -f /dev/null
else
    echo "mariadb had data dir,just start mysqld"
    mysqld_safe
fi

# echo "keep program running in the background"
# tail -f /dev/null
