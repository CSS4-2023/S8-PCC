#!/bin/bash

IP=$(hostname -I | awk '{print $2}')
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_bdd.log"
DEBIAN_FRONTEND="noninteractive"


DBNAME="netbox"
DBUSER="netbox"
DBPASSWD="$(cat /vagrant/data/passwd)"
echo "START - install PostgreSQL - "$IP

echo "=> [1]: Install required packages ..."
DEBIAN_FRONTEND=$DEBIAN_FRONTEND
apt-get install $APT_OPT \
	cron \
	postgresql \
	python \
  	python3-pip \
  >> $LOG_FILE 2>&1


echo "=> [2]: Configuration du service"

if [ -n "$DBNAME" ] && [ -n "$DBUSER" ];then
	sudo -u postgres bash -c "psql -c \"CREATE USER ${DBUSER} WITH PASSWORD '${DBPASSWD}';\""
	sudo -u postgres bash -c "psql -c \"CREATE DATABASE ${DBNAME} OWNER ${DBUSER};\""
fi

export PGPASSWORD="$(cat /vagrant/data/passwd)"
psql -U netbox -h localhost -d netbox -f /vagrant/data/bup.dump

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/13/main/postgresql.conf
sed -i "s/127.0.0.1\/32/0.0.0.0\/0/g" /etc/postgresql/13/main/pg_hba.conf
systemctl restart postgresql

echo "END - install Postgresql"
