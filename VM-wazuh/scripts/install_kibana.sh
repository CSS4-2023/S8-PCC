#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

LOG_FILE="/vagrant/logs/install_kibana.log"
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - Install VM Kibana - "$IP

apt-get update $APT_OPT >> $LOG_FILE 2>&1
apt upgrade -y >> $LOG_FILE 2>&1

echo "=> [2]: Kibana Start Configuration"

curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/elasticsearch.gpg --import && chmod 644 /usr/share/keyrings/elasticsearch.gpg >> $LOG_FILE 2>&1

echo "deb [signed-by=/usr/share/keyrings/elasticsearch.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list >> $LOG_FILE 2>&1

apt-get update >> $LOG_FILE 2>&1

echo "=> [3]: Kibana installation and configuration"

apt-get install kibana=7.17.9 >> $LOG_FILE 2>&1

echo "=> [4]: Copie du certificat"

cp /vagrant/data/certificat/certs.zip ~/ >> $LOG_FILE 2>&1

unzip ~/certs.zip -d ~/certs
rm -f ~/certs/ca/ca.key
mkdir /etc/kibana/certs/ca -p
cp ~/certs/ca/ca.crt /etc/kibana/certs/ca
cp ~/certs/kibana/* /etc/kibana/certs/
chown -R kibana: /etc/kibana/certs
chmod -R 500 /etc/kibana/certs
chmod 400 /etc/kibana/certs/ca/ca.* /etc/kibana/certs/kibana.*

curl -so /etc/kibana/kibana.yml https://packages.wazuh.com/4.4/tpl/elastic-basic/kibana.yml

echo "=> [5]: Configuration kibana.yml"

sed -e '4s/elasticsearch.password:.*/elasticsearch.password: '"$(cat /vagrant/data/mdp/password.txt)"'/' /vagrant/data/kibana/kibana_config.yml > /vagrant/data/kibana/kibana.yml
mv /vagrant/data/kibana/kibana.yml /etc/kibana/kibana.yml
sudo chmod 660 /etc/kibana/kibana.yml
sudo chown root:kibana /etc/kibana/kibana.yml

echo "=> [6]: Création /usr/share/kibana/data"

mkdir /usr/share/kibana/data
chown -R kibana:kibana /usr/share/kibana

echo "=> [7]: Installation Wazuh Kibana plugin"

cd /usr/share/kibana
sudo -u kibana /usr/share/kibana/bin/kibana-plugin install https://packages.wazuh.com/4.x/ui/kibana/wazuh_kibana-4.4.1_7.17.9-1.zip

setcap 'cap_net_bind_service=+ep' /usr/share/kibana/node/bin/node

echo "=> [8]: Activation et démarrage service Kibana"

systemctl daemon-reload
systemctl enable kibana
systemctl start kibana.service

echo "=> [9]: Configuration wazuh.yml"

mkdir /usr/share/kibana/data/wazuh
mkdir /usr/share/kibana/data/wazuh/config
sudo chown -R kibana:kibana /usr/share/kibana/data/wazuh
sudo chmod -R 700 /usr/share/kibana/data/wazuh
cp /vagrant/data/kibana/wazuh.yml /usr/share/kibana/data/wazuh/config/wazuh.yml
sudo chmod 600 /usr/share/kibana/data/wazuh/config/wazuh.yml
sudo chown kibana:kibana /usr/share/kibana/data/wazuh/config/wazuh.yml

systemctl start kibana.service

echo "=> [10]: Désactivation des référentiels"

sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/elastic-7.x.list
apt-get update