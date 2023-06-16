#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_sys.log"
DEBIAN_FRONTEND=noninteractive

echo "START - Install Base System on "$IP

echo "=> [1]: Installing required packages..."
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1

apt-get install $APT_OPT \
  unzip \
  wget \
  git \
  >> $LOG_FILE 2>&1

echo "=> [2]: Server configuration"
# Ajout de contrib et non-free pour les depots
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
# Ajout de la ligne pour le proxy ESEO mais descativé par défaut
echo "#Acquire::http::Proxy \"http://scully.eseo.fr:9999\";" >> /etc/apt/apt.conf

/usr/bin/localectl set-keymap fr

sudo timedatectl set-timezone Europe/Paris
echo "END - Install Base System on "$IP
