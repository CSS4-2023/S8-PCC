#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_dhcp.log"
DEBIAN_FRONTEND=noninteractive

echo "=> [4]: configuration DHCP"

apt install $APT_OPT \
  isc-dhcp-server \
  >> $LOG_FILE 2>&1

# Creating key folder and add the common key
mkdir /etc/dhcp/rndc-keys/ >> $LOG_FILE 2>&1
cp /vagrant/files/rndc.key /etc/dhcp/rndc-keys/rndc.key >> $LOG_FILE 2>&1

# Dhcpd listen to the enp0s8 interface
sudo rm /etc/default/isc-dhcp-server >> $LOG_FILE 2>&1
cp /vagrant/files/isc-dhcp-server /etc/default/isc-dhcp-server >> $LOG_FILE 2>&1

# Dhcpd conf file
sudo rm /etc/dhcp/dhcpd.conf >> $LOG_FILE 2>&1
cp /vagrant/files/dhcpd.conf /etc/dhcp/dhcpd.conf >> $LOG_FILE 2>&1

sudo rm /etc/apparmor.d/usr.sbin.named >> $LOG_FILE 2>&1
cp /vagrant/files/usr.sbin.named /etc/apparmor.d/usr.sbin.named >> $LOG_FILE 2>&1

# Change owner of /etc/bind
sudo chown -R bind /etc/bind >> $LOG_FILE 2>&1

service isc-dhcp-server restart >> $LOG_FILE 2>&1
service bind9 restart >> $LOG_FILE 2>&1
service apparmor restart >> $LOG_FILE 2>&1

echo "END - Install DHCP on "$IP