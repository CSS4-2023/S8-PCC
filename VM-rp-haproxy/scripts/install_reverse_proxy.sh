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
  haproxy \
  python3 \
  python3-pip \
  >> $LOG_FILE 2>&1
sudo pip3 install psutil
bash /vagrant/data/ansible_user.sh

echo "=> [2]: Ajout Config"

rm /etc/haproxy/haproxy.cfg
cp /vagrant/data/haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl restart haproxy

echo "=> [3]: Rsyslog configuration"
echo "*.*     @Supervision.e4.sirt.tp:514 " >> /etc/rsyslog.conf
systemctl restart rsyslog

sudo ip route del default
sudo ip route add default via 172.16.2.18
echo "END - Install Base System on "$IP
