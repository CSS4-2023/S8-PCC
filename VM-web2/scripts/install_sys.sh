#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_sys.log"
DEBIAN_FRONTEND=noninteractive

echo "START - Install Base System on "$IP

echo "=> [1]: Installing required packages..."
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1

apt upgrade -y

apt-get install $APT_OPT \
  wget \
  gnupg \
  unzip \
  python3 \
  python3-pip \
  >> $LOG_FILE 2>&1
sudo pip3 install psutil

echo "=> [2]: Server configuration"
# Ajout de contrib et non-free pour les depots
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
# Ajout de la ligne pour le proxy ESEO mais descativé par défaut
echo "#Acquire::http::Proxy \"http://scully.eseo.fr:9999\";" >> /etc/apt/apt.conf

/usr/bin/localectl set-keymap fr

python3 /vagrant/data/netbox.py

echo "=> [3]: Rsyslog configuration"
echo "*.*     @Supervision.e4.sirt.tp:514 " >> /etc/rsyslog.conf
systemctl restart rsyslog

echo "END - Install Base System on "$IP
