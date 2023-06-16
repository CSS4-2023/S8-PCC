#!/bin/bash
IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_nagios.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Install Supervision Server - "$IP
debconf-set-selections <<< "postfix postfix/mailname string VM-nagios"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
echo "=> [1]: Installing required packages..."
apt-get install $APT_OPT \
  vim \
  autoconf \
  gcc \
  libc6 \
  make \
  automake \
  unzip \
  curl \
  build-essential \
  unzip openssl \
  libssl-dev \
  libmcrypt-dev \
  apache2 \
  apache2-utils \
  php \
  libapache2-mod-php \
  php-gd \
  openssl \
  libgd-dev \
  bc \
  gawk \
  dc \
  build-essential \
  libnet-snmp-perl \
  gettext \
  iptables \
  rrdtool \
  librrds-perl \
  php-gd \
  php-xml \
  snmp \
  snmpd \
  postfix \
  bsd-mailx \
  mailutils \
  cron \
  >> $LOG_FILE 2>&1

echo "=> [2]: Nagios Configuration"
cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.6.tar.gz >> $LOG_FILE 2>&1
tar xzf nagioscore.tar.gz >> $LOG_FILE 2>&1

cd /tmp/nagioscore-nagios-4.4.6/
./configure --with-httpd-conf=/etc/apache2/sites-enabled >> $LOG_FILE 2>&1
make all >> $LOG_FILE 2>&1
make install-groups-users >> $LOG_FILE 2>&1
usermod -a -G nagios www-data >> $LOG_FILE 2>&1
make install >> $LOG_FILE 2>&1
make install-daemoninit >> $LOG_FILE 2>&1
make install-commandmode >> $LOG_FILE 2>&1
make install-config >> $LOG_FILE 2>&1

make install-webconf >> $LOG_FILE 2>&1
a2enmod rewrite >> $LOG_FILE 2>&1
a2enmod cgi >> $LOG_FILE 2>&1

iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT  >> $LOG_FILE 2>&1
iptables-save >> $LOG_FILE 2>&1

htpasswd -c -b /usr/local/nagios/etc/htpasswd.users nagiosadmin "(!css4!)" \
>> $LOG_FILE 2>&1

# Rsyslog apache config
sed -i 's/^[[:space:]]*ErrorLog.*/ErrorLog "| \/usr\/bin\/logger -t httpderr -i -p local6.error"/g' /etc/apache2/sites-available/000-default.conf
sed -i 's/^[[:space:]]*CustomLog.*/CustomLog "| \/usr\/bin\/logger -t apache -i -p local6.info" combined/g' /etc/apache2/sites-available/000-default.conf

# Ajout de la commande cron : toutes les 30 minutes le script de backup va s'exécuter
echo "*/30 * * * * bash /vagrant/scripts/backup.sh" | crontab -

echo "=> [3]: Nagios Plugins Configuration"

cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.3.3.tar.gz >> $LOG_FILE 2>&1
tar zxf nagios-plugins.tar.gz >> $LOG_FILE 2>&1

cd /tmp/nagios-plugins-release-2.3.3/
./tools/setup >> $LOG_FILE 2>&1
./configure >> $LOG_FILE 2>&1
make >> $LOG_FILE 2>&1
make install >> $LOG_FILE 2>&1

systemctl start nagios.service >> $LOG_FILE 2>&1

echo "=> [4]: Install NRPE"
cd /tmp
wget --no-check-certificate -O nrpe.tar.gz https://github.com/NagiosEnterprises/nrpe/archive/nrpe-4.1.0.tar.gz >> $LOG_FILE 2>&1
tar xzf nrpe.tar.gz >> $LOG_FILE 2>&1

cd /tmp/nrpe-nrpe-4.1.0/
./configure --enable-command-args >> $LOG_FILE 2>&1
make check_nrpe >> $LOG_FILE 2>&1
make install-plugin >> $LOG_FILE 2>&1

echo "=> [5]: Services Configuration"
# Add check_nrpe command
echo "
define command{
    command_name           check_nrpe
    command_line           /usr/local/nagios/libexec/check_nrpe -H \$HOSTADDRESS$ -c \$ARG1$
}" >> /usr/local/nagios/etc/objects/commands.cfg

cat /vagrant/data/check_snmp.cfg >> /usr/local/nagios/etc/objects/commands.cfg

# Modification of the local server configuration file 
sed -i 's/address\s\+127.0.0.1/address 127.0.0.1\n    parents Switch/' /usr/local/nagios/etc/objects/localhost.cfg
sed -i 's/define hostgroup {/#define hostgroup {/g' /usr/local/nagios/etc/objects/localhost.cfg
sed -i 's/hostgroup_name/#hostgroup_name {/g' /usr/local/nagios/etc/objects/localhost.cfg
sed -i 's/alias\s\+Linux Servers/#alias Linux Servers/g' /usr/local/nagios/etc/objects/localhost.cfg
sed -i 's/members *localhost.*$/#&/g' /usr/local/nagios/etc/objects/localhost.cfg
sed -i '/members\s\+localhost\s\+;/ { N; s/}/#}/ }' /usr/local/nagios/etc/objects/localhost.cfg
sed -i 's/localhost/Supervision_Server/g' /usr/local/nagios/etc/objects/localhost.cfg

# Add a new repository for Nagios configuration
sudo sed -i 's|#cfg_dir=/usr/local/nagios/etc/servers|cfg_dir=/usr/local/nagios/etc/services|g' /usr/local/nagios/etc/nagios.cfg

cd /usr/local/nagios/etc
mkdir services

cp /vagrant/data/servers_services.cfg /usr/local/nagios/etc/services/servers.cfg
cp /vagrant/data/network_services.cfg /usr/local/nagios/etc/services/network.cfg
cp /vagrant/data/hostgroups.cfg /usr/local/nagios/etc/services/hostgroups.cfg
cp /vagrant/data/demo.cfg /usr/local/nagios/etc/services/demo.cfg

echo "=> [6]: Contacts Configuration"
sed -i 's/email\s\+nagios@localhost.*/email                   incoming@localhost/g' /usr/local/nagios/etc/objects/contacts.cfg

echo "=> [7]: PNP4Nagios Configuration"
cd /tmp
wget -O pnp4nagios.tar.gz https://github.com/lingej/pnp4nagios/archive/0.6.26.tar.gz >> $LOG_FILE 2>&1
tar xzf pnp4nagios.tar.gz >> $LOG_FILE 2>&1

cd pnp4nagios-0.6.26
./configure --with-httpd-conf=/etc/apache2/sites-enabled >> $LOG_FILE 2>&1
make all >> $LOG_FILE 2>&1
make install >> $LOG_FILE 2>&1
make install-webconf >> $LOG_FILE 2>&1
make install-config >> $LOG_FILE 2>&1
make install-init >> $LOG_FILE 2>&1
systemctl daemon-reload >> $LOG_FILE 2>&1
systemctl enable npcd.service >> $LOG_FILE 2>&1
systemctl start npcd.service >> $LOG_FILE 2>&1
systemctl restart apache2.service >> $LOG_FILE 2>&1

sed -i 's/process_performance_data=0/process_performance_data=1/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/#host_perfdata_file=/host_perfdata_file=/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^host_perfdata_file=.*/host_perfdata_file=\/usr\/local\/pnp4nagios\/var\/service-perfdata/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^#host_perfdata_file_template=.*/host_perfdata_file_template=DATATYPE::HOSTPERFDATA\\tTIMET::$TIMET$\\tHOSTNAME::$HOSTNAME$\\tHOSTPERFDATA::$HOSTPERFDATA$\\tHOSTCHECKCOMMAND::$HOSTCHECKCOMMAND$\\tHOSTSTATE::$HOSTSTATE$\\tHOSTSTATETYPE::$HOSTSTATETYPE$/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/#host_perfdata_file_mode=/host_perfdata_file_mode=/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^#host_perfdata_file_processing_interval=.*/host_perfdata_file_processing_interval=15/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^#host_perfdata_file_processing_command=.*/host_perfdata_file_processing_command=process-host-perfdata-file-bulk-npcd/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/#service_perfdata_file=/service_perfdata_file=/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^service_perfdata_file=.*/service_perfdata_file=\/usr\/local\/pnp4nagios\/var\/service-perfdata/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^#service_perfdata_file_template=.*/service_perfdata_file_template=DATATYPE::SERVICEPERFDATA\\tTIMET::$TIMET$\\tHOSTNAME::$HOSTNAME$\\tSERVICEDESC::$SERVICEDESC$\\tSERVICEPERFDATA::$SERVICEPERFDATA$\\tSERVICECHECKCOMMAND::$SERVICECHECKCOMMAND$\\tHOSTSTATE::$HOSTSTATE$\\tHOSTSTATETYPE::$HOSTSTATETYPE$\\tSERVICESTATE::$SERVICESTATE$\\tSERVICESTATETYPE::$SERVICESTATETYPE$/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/#service_perfdata_file_mode=/service_perfdata_file_mode=/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^#service_perfdata_file_processing_interval=.*/service_perfdata_file_processing_interval=15/g' /usr/local/nagios/etc/nagios.cfg
sed -i 's/^#service_perfdata_file_processing_command=.*/service_perfdata_file_processing_command=process-service-perfdata-file-bulk-npcd/g' /usr/local/nagios/etc/nagios.cfg

echo '
define command {
    command_name    process-service-perfdata-file-bulk-npcd
    command_line    /bin/mv /usr/local/pnp4nagios/var/service-perfdata /usr/local/pnp4nagios/var/spool/service-perfdata.$TIMET$
    }

define command {
    command_name    process-host-perfdata-file-bulk-npcd
    command_line    /bin/mv /usr/local/pnp4nagios/var/host-perfdata /usr/local/pnp4nagios/var/spool/host-perfdata.$TIMET$
}' >> /usr/local/nagios/etc/objects/commands.cfg

rm -f /usr/local/pnp4nagios/share/install.php

sed -i "s|magic_quotes_runtime is enabled|magic_quotes_runtime is enabled\n                  if (version_compare(PHP_VERSION, '5.3.0', '<')) {|g" /usr/local/pnp4nagios/lib/kohana/system/libraries/Input.php
sed -i "s|Kohana::log('debug', 'Disable magic_quotes_gpc! It is evil and deprecated: http://php.net/magic_quotes');|Kohana::log('debug', 'Disable magic_quotes_gpc! It is evil and deprecated: http://php.net/magic_quotes');\n                  }\n|g" /usr/local/pnp4nagios/lib/kohana/system/libraries/Input.php

sed -i 's/if(sizeof($pages)>0)/if(is_array($pages) \&\& sizeof($pages)>0)/g' /usr/local/pnp4nagios/share/application/models/data.php
sed -i 's/if(sizeof($pages) > 0 )/if(is_array($pages) \&\& sizeof($pages)>0)/g' /usr/local/pnp4nagios/share/application/models/data.php

echo '
define host {
   name       host-pnp
   action_url /pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=_HOST_
   register   0
}

define service {
   name       service-pnp
   action_url /pnp4nagios/index.php/graph?host=$HOSTNAME$&srv=$SERVICEDESC$
   register   0
}' >> /usr/local/nagios/etc/objects/templates.cfg

sed -i '/name.*generic-host/a\        use                             host-pnp' /usr/local/nagios/etc/objects/templates.cfg
sed -i '/name.*generic-service/a\        use                             service-pnp' /usr/local/nagios/etc/objects/templates.cfg

# Mise en place des anciens dossiers avec les données de performances
rm -rf /usr/local/pnp4nagios/var/perfdata
perfdata=$(ssh -o "StrictHostKeyChecking=no" -i /vagrant/data/backup_key "root@192.168.4.110" "ls -t /root/nagios | head -n 1")
scp -i /vagrant/data/backup_key root@192.168.4.110:/root/nagios/$perfdata /tmp/perfdata.zip
cd /tmp
unzip perfdata.zip
cp -rf perfdata /usr/local/pnp4nagios/var/perfdata
chown -R nagios:nagios /usr/local/pnp4nagios/var/perfdata

systemctl restart apache2.service
systemctl restart nagios.service >> $LOG_FILE 2>&1
systemctl status nagios.service >> $LOG_FILE 2>&1

## SNMP Gitea
# apt-get install snmp snmpd
# sed -i 's/agentaddress.*/agentAddress udp:161,udp6:[::1]:161/' /etc/snmp/snmpd.conf
# net-snmp-create-v3-user -ro -A '(!css4!)' -a SHA -X '(!css4!)' -x AES admin
# sed -i 's/^rocommunity/#rocommunity/g' /etc/snmp/snmpd.conf
# sed -i 's/^rocommunity6/#rocommunity6/g' /etc/snmp/snmpd.conf

## SNMP Nagios
##snmp gitea RAM
#snmpwalk -v3 -l authPriv -u admin -a SHA -A '(!css4!)' -x AES -X '(!css4!)' 172.16.2.3 1.3.6.1.2.1.25.2.2
##snmp switch linkup linkdown
#snmpwalk -v 2c -c private 172.16.2.34 1.3.6.1.2.1.2.2.1.8

echo "=> [8]: Mail Server Configuration"
sudo useradd -m -s /bin/bash incoming
systemctl restart postfix >> $LOG_FILE 2>&1