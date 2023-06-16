#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_sys.log"
DEBIAN_FRONTEND=noninteractive

echo "START - Install Base System on "$IP

echo "=> [1]: Installing required packages..."
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1
apt install $APT_OPT \
  wget \
  gnupg \
  unzip \
  apache2 \
  python3 \
  python3-pip \
  >> $LOG_FILE 2>&1
sudo pip3 install psutil
bash /vagrant/data/ansible_user.sh
echo "=> [2]: Ajout config"

rm /etc/apache2/apache2.conf
cp /vagrant/data/apache.conf /etc/apache2/apache2.conf
rm /etc/apache2/sites-enabled/*
rm /etc/apache2/sites-available/*
a2enmod proxy proxy_http

cd /etc/apache2
mkdir ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 -subj "/C=FR/L=Angers/O=ESEO/CN=192.168.4.25" -out /etc/apache2/ssl/css.e4.sirt.tp.crt -keyout /etc/apache2/ssl/css.e4.sirt.tp.key
chmod 440 /etc/apache2/ssl/css.e4.sirt.tp.crt
a2enmod ssl
systemctl restart apache2

echo "=> [3]: Rsyslog configuration"
echo "*.*     @Supervision.e4.sirt.tp:514 " >> /etc/rsyslog.conf
systemctl restart rsyslog

sudo ip route del default
sudo ip route add default via 172.16.2.18
echo "END - Install Base System on "$IP
