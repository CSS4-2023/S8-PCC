#!/bin/bash

## install Mariadb server (ex Mysql))

IP=$(hostname -I | awk '{print $2}')
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_bdd.log"
DEBIAN_FRONTEND="noninteractive"

#Utilisateur a créer (si un vide alors pas de création)
DBNAME="moodle"
DBUSER="moodle"
DBPASSWD="(!css4!)"
#Fichier sql à injecter (présent dans un sous répertoire)
DBFILE="files/creation_bdd.sql"

echo "START - install MariaDB - "$IP

echo "=> [1]: Install required packages ..."
DEBIAN_FRONTEND=noninteractive
apt-get install -o Dpkg::Progress-Fancy="0" -q -y \
        cron \
        mariadb-server \
        python \
  python3-pip \

   >> $LOG_FILE 2>&1

echo "=> [2]: Configuration du service"
if [ -n "$DBNAME" ] && [ -n "$DBUSER" ];then
  mysql -e "CREATE DATABASE $DBNAME"
  sudo mysql -e "CREATE USER '$DBUSER'@'Demo.e4.sirt.tp' identified by '$DBPASSWD'"
  sudo mysql -e "CREATE USER '$DBUSER'@'localhost' identified by '$DBPASSWD'"
  sudo mysql -e "CREATE USER '$DBUSER'@'Cauchy17.e4.sirt.tp' identified by '$DBPASSWD'"
  sudo mysql -e "CREATE USER 'grafana'@'Supervision.e4.sirt.tp' identified by '$DBPASSWD'"
  sudo mysql -e "grant all privileges on $DBNAME.* to '$DBUSER'@'Demo.e4.sirt.tp'"
  sudo mysql -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost'"
  sudo mysql -e "grant all privileges on $DBNAME.* to '$DBUSER'@'Cauchy17.e4.sirt.tp'"
  sudo mysql -e "FLUSH PRIVILEGES"
  echo "BDD CREER ET PRIVILEGES DONNEES"
fi


# configaration mariaDb
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/# port = 3306/port = 3306/g' /etc/mysql/my.cnf

systemctl restart mariadb

pathmysqldump=$(ssh -o "StrictHostKeyChecking=no" -i /vagrant/data/backup_key root@192.168.4.110 'ls -t /root/demo/bup_hour_db_web/* | head -1')


# Copy the gitea file to the local directory
scp -i /vagrant/data/backup_key root@192.168.4.110:"$pathmysqldump" .

mysqldump=$(basename "$pathmysqldump")


echo "=> [6]: Restore mysql database"

mysql --default-character-set=utf8mb4 --host=localhost --user=$DBUSER --password=$DBPASSWD $DBNAME </home/vagrant/$mysqldump

echo "=> [3]: Configuration de BDD"
if [ -f "$DBFILE" ] ;then
  mysql < /vagrant/$DBFILE \
  >> $LOG_FILE 2>&1
fi

echo "END - install MariaDB"

