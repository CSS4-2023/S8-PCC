#!/bin/bash
IP=$(hostname -I | awk '{print $2}')

LOG_FILE="/vagrant/logs/install_nagios.log"
DEBIAN_FRONTEND="noninteractive"

echo "=> [9]: Grafana Configuration"
apt-get install -y apt-transport-https >> $LOG_FILE 2>&1
apt-get install -y software-properties-common wget >> $LOG_FILE 2>&1
wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key >> $LOG_FILE 2>&1
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
apt-get update >> $LOG_FILE 2>&1

# Install the latest OSS release
apt-get install grafana >> $LOG_FILE 2>&1
# Install the latest Enterprise release
apt-get install -y grafana-enterprise >> $LOG_FILE 2>&1

systemctl restart grafana.service >> $LOG_FILE 2>&1
iptables -I INPUT -p tcp --destination-port 3000 -j ACCEPT
grafana-cli plugins install sni-pnp-datasource >> $LOG_FILE 2>&1

sed -i 's/^;root_url.*/root_url = https:\/\/192.168.4.25\/grafana/g' /etc/grafana/grafana.ini 

systemctl restart grafana-server.service >> $LOG_FILE 2>&1

cd /usr/local/pnp4nagios/share/application/controllers/
wget -O api.php "https://github.com/lingej/pnp-metrics-api/raw/master/application/controller/api.php" >> $LOG_FILE 2>&1
sed -i '/Require valid-user/a\        Require ip 127.0.0.1 ::1' /etc/apache2/sites-enabled/pnp4nagios.conf
systemctl restart apache2.service >> $LOG_FILE 2>&1

mkdir /var/lib/grafana/dashboards
cp /vagrant/data/grafana/admin.json /vagrant/data/grafana/network.json /vagrant/data/grafana/superv.json /vagrant/data/grafana/web.json /vagrant/data/grafana/demo.json /var/lib/grafana/dashboards/

cp /vagrant/data/grafana/datasources.yml /etc/grafana/provisioning/datasources
cp /vagrant/data/grafana/dashboards.yml /etc/grafana/provisioning/dashboards

cat <<EOF

Nagios Server installed at http://$IP/nagios
Grafana Server installed at http://$IP/grafana

EOF

echo "END - Install Supervision Server"
