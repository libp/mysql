#!/bin/bash

MARIADB_USER=$MARIADB_USER
MARIADB_PASS=$MARIADB_PASS

echo $MARIADB_PASS
echo $MARIADB_USER

# boot
mysql_install_db --user=mysql
mysqladmin -u "$MARIADB_USER" password "$MARIADB_PASS"

# grant option
mysql -e "grant all privileges on *.* to '$MARIADB_USER'@'%' identified by '$MARIADB_PASS' with grant option;"
mysql -u "$MARIADB_USER" -p"$MARIADB_PASS" -e "flush privileges;"

tail -f /dev/null