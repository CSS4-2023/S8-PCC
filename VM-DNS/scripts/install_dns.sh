#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_dns.log"
DEBIAN_FRONTEND=noninteractive

echo "START - Install Base System on "$IP

echo "=> [1]: Installing required packages..."
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1
apt-get upgrade $APT_OPT >> $LOG_FILE 2>&1
apt install $APT_OPT \
  wget \
  gnupg \
  unzip \
  nginx \
  bind9 \
  bind9utils \
  python3 \
  python3-pip \
  >> $LOG_FILE 2>&1

bash /vagrant/data/ansible_user.sh
sudo pip3 install psutil

# config réseau
ip route del default >> $LOG_FILE 2>&1
ip route add default via 172.16.2.33 >> $LOG_FILE 2>&1

echo "=> [4]: configuration DNS"

rm /etc/hostname >> $LOG_FILE 2>&1
cp /vagrant/files/hostname /etc/hostname >> $LOG_FILE 2>&1

rm /etc/hosts >> $LOG_FILE 2>&1
cp /vagrant/files/hosts /etc/hosts >> $LOG_FILE 2>&1

rm /etc/resolv.conf >> $LOG_FILE 2>&1
cp /vagrant/files/resolv.conf /etc/resolv.conf >> $LOG_FILE 2>&1

sudo rm /etc/bind/named.conf.options >> $LOG_FILE 2>&1
sudo cp /vagrant/files/named.conf.options /etc/bind/named.conf.options >> $LOG_FILE 2>&1

sudo rm /etc/bind/named.conf.local >> $LOG_FILE 2>&1
sudo cp /vagrant/files/named.conf.local /etc/bind/named.conf.local >> $LOG_FILE 2>&1

sudo cp /vagrant/files/db.css4.lan /etc/bind/db.css4.lan >> $LOG_FILE 2>&1
sudo cp /vagrant/files/db.16.172.in-addr.arpa /etc/bind/db.16.172.in-addr.arpa >> $LOG_FILE 2>&1

cp /vagrant/files/rndc.keys /etc/bind/rndc.keys >> $LOG_FILE 2>&1

service bind9 restart >> $LOG_FILE 2>&1

service bind9 status >> $LOG_FILE 2>&1


echo "=> [5]: Rsyslog configuration"
echo "*.*     @Supervision.e4.sirt.tp:514 " >> /etc/rsyslog.conf
systemctl restart rsyslog

echo "END - Install DNS on "$IP
