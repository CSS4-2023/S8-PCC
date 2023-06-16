#!/bin/bash

IP=$(hostname -I | awk '{print $2}')
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_netbox.log"
DEBIAN_FRONTEND="noninteractive"

echo "=> [1]: Install required packages ..."
DEBIAN_FRONTEND=$DEBIAN_FRONTEND
apt-get install $APT_OPT \
	cron \
	mariadb-server \
	python \
	python3-pip \
  >> $LOG_FILE 2>&1
sudo apt install -y redis-server
sudo apt install -y python3 python3-pip python3-venv python3-dev build-essential libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev
sudo wget https://github.com/netbox-community/netbox/archive/refs/tags/v3.0.0.tar.gz
sudo tar -xzf v3.0.0.tar.gz -C /opt
sudo ln -s /opt/netbox-3.0.0/ /opt/netbox

sudo adduser --system --group netbox
sudo chown --recursive netbox /opt/netbox/netbox/media/
sudo chown --recursive netbox /opt/netbox/netbox/reports/
sudo chown --recursive netbox /opt/netbox/netbox/scripts/

sudo cp /vagrant/data/configuration.py /opt/netbox/netbox/netbox/configuration.py
sudo /opt/netbox/upgrade.sh

source /opt/netbox/venv/bin/activate
cd /opt/netbox/netbox
python3 manage.py createsuperuser
ln -s /opt/netbox/contrib/netbox-housekeeping.sh /etc/cron.daily/netbox-housekeeping

sudo cp /opt/netbox/contrib/gunicorn.py /opt/netbox/gunicorn.py

sudo cp -v /opt/netbox/contrib/*.service /etc/systemd/system/
sudo systemctl daemon-reload

sudo systemctl start netbox netbox-rq
sudo systemctl enable netbox netbox-rq

sudo apt install -y apache2

sudo cp /vagrant/data/netbox.conf /etc/apache2/sites-available/netbox.conf

sudo a2enmod ssl proxy proxy_http headers rewrite
sudo a2ensite netbox
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
