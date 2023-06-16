#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_rsyslog.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Install RSyslog Server - "$IP

echo "=> [1]: Package installation & update"
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1

apt-get install $APT_OPT \
  rsyslog \
  >> $LOG_FILE 2>&1

echo "=> [2]: Rsyslog Configuration"

sed -i 's/^#module(load="imudp")/module(load="imudp")/g' /etc/rsyslog.conf
sed -i 's/^#input(type="imudp" port="514")/input(type="imudp" port="514")/g' /etc/rsyslog.conf

echo " \$template AuthFile,\"/var/log/remote/%HOSTNAME%/Sys/auth.log\"
\$template ApacheFile-error,\"/var/log/remote/%HOSTNAME%/Apache2/error.log\"
\$template ApacheFile-access,\"/var/log/remote/%HOSTNAME%/Apache2/access.log\"

auth,authpriv.* ?AuthFile
local6.error ?ApacheFile-error
local6.info ?ApacheFile-access
" >> /etc/rsyslog.conf
systemctl restart rsyslog


echo "=> [3]: Logrotate Configuration"
echo "/var/log/remote/*/*/*.log {
        daily
        missingok
        rotate 14
        compress
        delaycompress
        notifempty
        create 0640 root adm
        sharedscripts
}" >> /etc/logrotate.d/remote
systemctl restart logrotate

echo "=> [4]: GoAccess Configuration"
wget -O - https://deb.goaccess.io/gnugpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/goaccess.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/goaccess.gpg arch=$(dpkg --print-architecture)] https://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/goaccess.list
sudo apt-get update
sudo apt-get install goaccess

#echo "*/20 * * * * goaccess /var/log/VM-rp-apache/access.log --log-format=COMBINED -o /var/www/html/stats.html" | crontab -
