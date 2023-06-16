#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

LOG_FILE="/vagrant/logs/install_elasticsearch.log"
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - Install VM Elasticsearch - "$IP

echo "=> [1]: Installing required packages..."

apt-get update $APT_OPT >> $LOG_FILE 2>&1
apt upgrade -y >> $LOG_FILE 2>&1

echo "=> [2]: Elasticsearch Start Configuration"

curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/elasticsearch.gpg --import && chmod 644 /usr/share/keyrings/elasticsearch.gpg >> $LOG_FILE 2>&1

echo "deb [signed-by=/usr/share/keyrings/elasticsearch.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list >> $LOG_FILE 2>&1

apt-get update 

apt-get install elasticsearch=7.17.9 >> $LOG_FILE 2>&1

curl -so /etc/elasticsearch/elasticsearch.yml https://packages.wazuh.com/4.4/tpl/elastic-basic/elasticsearch_cluster_initial_node.yml >> $LOG_FILE 2>&1

cp /vagrant/data/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo chmod 640 /etc/elasticsearch/elasticsearch.yml
sudo chown root:elasticsearch /etc/elasticsearch/elasticsearch.yml


echo "=> [3]: Configuration elasticsearch.yml"

echo "Le fichier /etc/elasticsearch/elasticsearch.yml a été mis à jour." >> $LOG_FILE 2>&1

cp /vagrant/data/elasticsearch/instances.yml /usr/share/elasticsearch/instances.yml
sudo chmod 644 /usr/share/elasticsearch/instances.yml
sudo chown root:root /usr/share/elasticsearch/instances.yml

/usr/share/elasticsearch/bin/elasticsearch-certutil cert ca --pem --in instances.yml --keep-ca-key --out ~/certs.zip >> $LOG_FILE 2>&1

echo "=> [4]: Création du certificat"

cp ~/certs.zip /vagrant/data/certificat/ >> $LOG_FILE 2>&1

unzip ~/certs.zip -d ~/certs >> $LOG_FILE 2>&1
mkdir /etc/elasticsearch/certs/ca -p >> $LOG_FILE 2>&1
cp -R ~/certs/ca/ ~/certs/elasticsearch-1/* /etc/elasticsearch/certs/ >> $LOG_FILE 2>&1
mv /etc/elasticsearch/certs/elasticsearch-1.crt /etc/elasticsearch/certs/elasticsearch.crt >> $LOG_FILE 2>&1
mv /etc/elasticsearch/certs/elasticsearch-1.key /etc/elasticsearch/certs/elasticsearch.key >> $LOG_FILE 2>&1
chown -R elasticsearch: /etc/elasticsearch/certs >> $LOG_FILE 2>&1
chmod -R 500 /etc/elasticsearch/certs >> $LOG_FILE 2>&1
chmod 400 /etc/elasticsearch/certs/ca/ca.* /etc/elasticsearch/certs/elasticsearch.* >> $LOG_FILE 2>&1

echo "=> [5]: Activation et démarrage service Elasticsearch"

systemctl daemon-reload >> $LOG_FILE 2>&1 
systemctl enable elasticsearch >> $LOG_FILE 2>&1 
systemctl start elasticsearch >> $LOG_FILE 2>&1

echo "=> [6]: Initialisation du cluster & stockage des mdp"

echo "y" | /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto > /vagrant/data/mdp/elasticsearch-passwords.txt

grep -oP 'PASSWORD elastic = \K.*' /vagrant/data/mdp/elasticsearch-passwords.txt > /vagrant/data/mdp/password.txt

echo "=> [7]: Désactivation des référentiels"

sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/elastic-7.x.list
apt-get update 