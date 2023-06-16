#!/bin/bash

## install web server with php

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_web.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - install web Server - "$IP

echo "=> [1]: Installing required packages..."
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1

apt-get install $APT_OPT \
  apache2 \
  php \
  libapache2-mod-php \
  php-mysql \
  php-intl \
  php-curl \
  php-xmlrpc \
  php-soap \
  php-gd \
  php-json \
  php-cli \
  php-pear \
  php-xsl \
  php-zip \
  php-mbstring \
  mariadb-server \
  >> $LOG_FILE 2>&1

echo "=> [2]: Apache2 configuration"
	# Add configuration of /etc/apache2

a2enmod rewrite
a2enmod ssl
a2enmod deflate
a2enmod headers

systemctl restart apache2

#Configuration wordpress

wget https://wordpress.org/latest.zip


rm /var/www/html/index.html

apt-get update

unzip latest.zip -d /var/www/html/
mv /var/www/html/wordpress/* /var/www/html/
rm /var/www/html/wordpress/ -Rf
chown -R www-data:www-data /var/www/html/

rm /var/www/html/wp-config.php
cp /vagrant/data/wp-config.php /var/www/html/wp-config.php

# Rsyslog apache config
sed -i 's/^[[:space:]]*ErrorLog.*/ErrorLog "| \/usr\/bin\/logger -t httpderr -i -p local6.error/g' /etc/apache2/sites-available/000-default.conf
sed -i 's/^[[:space:]]*CustomLog.*/CustomLog "| \/usr\/bin\/logger -t apache -i -p local6.info" combined/g' /etc/apache2/sites-available/000-default.conf

echo "END - install web Server"

