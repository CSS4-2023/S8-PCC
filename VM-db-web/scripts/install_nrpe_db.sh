#!/bin/bash
IP=$(hostname -I | awk '{print $2}')

LOG_FILE="/vagrant/logs/install_nrpe_db.log"
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - Install NRPE on Database Server - "$IP

echo "=> [1]: Install required packages ..."
apt-get install $APT_OPT \
  autoconf \
  make \
  automake \
  gcc \
  libc6 \
  libmcrypt-dev \
  libssl-dev wget \
  libdbd-mysql-perl \
  >> $LOG_FILE 2>&1
  
echo "=> [2]: NRPE configuration"
cd /tmp
wget --no-check-certificate -O nrpe.tar.gz https://github.com/NagiosEnterprises/nrpe/archive/nrpe-4.1.0.tar.gz >> $LOG_FILE 2>&1
tar xzf nrpe.tar.gz >> $LOG_FILE 2>&1

cd /tmp/nrpe-nrpe-4.1.0/
./configure --enable-command-args >> $LOG_FILE 2>&1
make all >> $LOG_FILE 2>&1
make install-groups-users >> $LOG_FILE 2>&1
make install >> $LOG_FILE 2>&1
make install-config >> $LOG_FILE 2>&1

echo >> /etc/services
echo '# Nagios services' >> /etc/services
echo 'nrpe    5666/tcp' >> /etc/services

make install-init >> $LOG_FILE 2>&1
systemctl enable nrpe.service >> $LOG_FILE 2>&1

iptables -I INPUT -p tcp --destination-port 5666 -j ACCEPT >> $LOG_FILE 2>&1

iptables-save >> $LOG_FILE 2>&1

sed -i '/^allowed_hosts=/s/$/,Supervision.e4.sirt.tp/' /usr/local/nagios/etc/nrpe.cfg >> $LOG_FILE 2>&1
sed -i 's/^dont_blame_nrpe=.*/dont_blame_nrpe=1/g' /usr/local/nagios/etc/nrpe.cfg >> $LOG_FILE 2>&1

systemctl start nrpe.service

echo "=> [3]: Nagios Plugins configuration"
cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz >> $LOG_FILE 2>&1
tar zxf nagios-plugins.tar.gz >> $LOG_FILE 2>&1

cd /tmp/nagios-plugins-release-2.2.1/
./tools/setup >> $LOG_FILE 2>&1
./configure >> $LOG_FILE 2>&1
make >> $LOG_FILE 2>&1
make install >> $LOG_FILE 2>&1

echo "=> [4]: NRPE Commands Configuration"
cd /usr/local/nagios/libexec/

# Add check_memory to the nagios library command
wget https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl >> $LOG_FILE 2>&1
chmod +x check_mem.pl

# Add check_mysqld to the nagios library command
cp /vagrant/data/check_mysqld.pl /usr/local/nagios/libexec/
chmod +x check_mysqld.pl

echo "
command[check_load2]=/usr/local/nagios/libexec/check_load -w 5.0,4.0,3.0 -c 10.0,6.0,4.0
command[check_disk]=/usr/local/nagios/libexec/check_disk -w 20% -c 10%
command[check_mem]=/usr/local/nagios/libexec/check_mem.pl -f -w 20 -c 10
command[check_tcp]=/usr/local/nagios/libexec/check_tcp -p 3306
command[check_mysqld]=/usr/local/nagios/libexec/check_mysqld.pl -T -a uptime,threads_connected,questions,slow_queries,open_tables -q \"SHOW GLOBAL STATUS;\" -w \",,,,\" -c \",,,,\"
" >> /usr/local/nagios/etc/nrpe.cfg

systemctl restart nrpe.service >> $LOG_FILE 2>&1
systemctl status nrpe.service >> $LOG_FILE 2>&1

echo "END - Install NRPE on Database Server"
