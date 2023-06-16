#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

LOG_FILE="/vagrant/logs/install_wazuh.log"
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - Install VM Wazuh - "$IP

echo "=> [1]: Installing required packages..."

apt-get update $APT_OPT >> $LOG_FILE 2>&1
apt upgrade -y >> $LOG_FILE 2>&1

echo "=> [2]: Wazuh Start Configuration"

curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && chmod 644 /usr/share/keyrings/wazuh.gpg >> $LOG_FILE 2>&1
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list >> $LOG_FILE 2>&1

apt-get update >> $LOG_FILE 2>&1

echo "=> [3]: Installation gestionnaire Wazuh"

apt-get install wazuh-manager >> $LOG_FILE 2>&1

echo "=> [4]: Activation et démarrage service Wazuh"

systemctl daemon-reload >> $LOG_FILE 2>&1
systemctl enable wazuh-manager >> $LOG_FILE 2>&1
systemctl start wazuh-manager >> $LOG_FILE 2>&1

echo "=> [5]: Ajout du référentiel Elastic Stack"

curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/elasticsearch.gpg --import && chmod 644 /usr/share/keyrings/elasticsearch.gpg >> $LOG_FILE 2>&1

echo "deb [signed-by=/usr/share/keyrings/elasticsearch.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list >> $LOG_FILE 2>&1

apt-get update

echo "=> [6]: Installation et configuration de Filebeat"

apt-get install filebeat=7.17.9 >> $LOG_FILE 2>&1

curl -so /etc/filebeat/filebeat.yml https://packages.wazuh.com/4.4/tpl/elastic-basic/filebeat.yml >> $LOG_FILE 2>&1
curl -so /etc/filebeat/wazuh-template.json https://raw.githubusercontent.com/wazuh/wazuh/4.4/extensions/elasticsearch/7.x/wazuh-template.json >> $LOG_FILE 2>&1
chmod go+r /etc/filebeat/wazuh-template.json >> $LOG_FILE 2>&1

curl -s https://packages.wazuh.com/4.x/filebeat/wazuh-filebeat-0.2.tar.gz | tar -xvz -C /usr/share/filebeat/module >> $LOG_FILE 2>&1

sed -e '3s/output.elasticsearch.password:.*/output.elasticsearch.password: '"$(cat /vagrant/data/mdp/password.txt)"'/' /vagrant/data/wazuh/filebeat_config.yml > /vagrant/data/wazuh/filebeat.yml

mv /vagrant/data/wazuh/filebeat.yml /etc/filebeat/filebeat.yml

sudo chmod 600 /etc/filebeat/filebeat.yml
sudo chown root:root /etc/filebeat/filebeat.yml

cp /vagrant/data/certificat/certs.zip ~/ >> $LOG_FILE 2>&1

mkdir /etc/filebeat/certs/ca -p >> $LOG_FILE 2>&1
zip -d ~/certs.zip "ca/ca.key" >> $LOG_FILE 2>&1
unzip ~/certs.zip -d ~/certs >> $LOG_FILE 2>&1
cp -R ~/certs/ca/ ~/certs/filebeat/* /etc/filebeat/certs/ >> $LOG_FILE 2>&1
mv /etc/filebeat/certs/filebeat.crt /etc/filebeat/certs/filebeat.crt >> $LOG_FILE 2>&1
mv /etc/filebeat/certs/filebeat.key /etc/filebeat/certs/filebeat.key >> $LOG_FILE 2>&1
chmod -R 500 /etc/filebeat/certs >> $LOG_FILE 2>&1
chmod 400 /etc/filebeat/certs/ca/ca.* /etc/filebeat/certs/filebeat.* >> $LOG_FILE 2>&1

cp /vagrant/data/wazuh/ossec.conf /var/ossec/etc/ossec.conf
sudo chmod 640 /var/ossec/etc/ossec.conf
sudo chown root:wazuh /var/ossec/etc/ossec.conf

echo "=> [7]: Activez et démarrez le service Filebeat"

systemctl daemon-reload >> $LOG_FILE 2>&1
systemctl enable filebeat >> $LOG_FILE 2>&1
systemctl start filebeat >> $LOG_FILE 2>&1
systemctl restart wazuh-manager.service

sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/wazuh.list >> $LOG_FILE 2>&1
sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/elastic-7.x.list >> $LOG_FILE 2>&1
apt-get update >> $LOG_FILE 2>&1