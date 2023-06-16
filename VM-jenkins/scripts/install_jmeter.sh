#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_jenkins.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Install JMeter  - "$IP

echo "=> [1]: Install JMeter"
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1

apt-get install $APT_OPT \
  jmeter \
  >> $LOG_FILE 2>&1

echo "=> [2]: Setup jmeter"

wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.5.zip \
>> $LOG_FILE 2>&1

mkdir /usr/jmeter \
>> $LOG_FILE 2>&1
mv apache-jmeter-5.5.zip /usr/jmeter/. 
cd /usr/jmeter/
unzip apache-jmeter-5.5.zip \
>> $LOG_FILE 2>&1

echo "jmeter.save.saveservice.output_format=xml" >> /usr/jmeter/apache-jmeter-5.5/bin/user.properties \
>> $LOG_FILE 2>&1

cat <<EOF

JMeter Installed 

EOF

echo "END - Install JMeter"

