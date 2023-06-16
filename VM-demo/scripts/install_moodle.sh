#!/bin/bash

## install Moodle Application
## https://moodle.org/

IP=$(hostname -I | awk '{print $2}')
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_moodle.log"
DEBIAN_FRONTEND="noninteractive"
MOODLE_VERSION="311"

echo "START - Configuration Moodle  - "$IP
a2dissite 000-default.conf
cp /vagrant/data/moodle.conf /etc/apache2/sites-available/moodle.conf
a2ensite moodle.conf
systemctl restart apache2
echo "=> [1]: Download and extract moodle files ..."
# le moteur de moodle
wget -O /tmp/moodle.tgz http://download.moodle.org/download.php/direct/stable${MOODLE_VERSION}/moodle-latest-${MOODLE_VERSION}.tgz


tar xzf /tmp/moodle.tgz -C /var/www/html
rm /tmp/moodle.tgz

echo "=> [2]: Create files and permissions"
mkdir /var/www/data
chown www-data:www-data -R /var/www/data
chown www-data:www-data -R /var/www/html/moodle

echo "=> [3]: Moodle Configuration ..."
rm /var/www/html/moodle/config.php
cp /vagrant/data/config.php /var/www/html/moodle/config.php

chown www-data:www-data -R /var/www/html/moodle/config.php

echo "Restarting Apache..."
systemctl restart apache2

cat <<EOF > /etc/cron.d/moodle
*/30 * * * * www-data /usr/bin/env php /var/www/html/moodle/html/admin/cli/cron.php
EOF

echo "END - Configuration Moodle"
