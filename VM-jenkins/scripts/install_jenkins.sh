#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_jenkins.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Install Jenkins Server - "$IP

echo "=> [1]: Install Java"
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1

apt-get install $APT_OPT \
  default-jdk \
  >> $LOG_FILE 2>&1

echo "=> [2]: Install Jenkins"

sudo wget -P /root https://get.jenkins.io/war-stable/latest/jenkins.war \
>> $LOG_FILE 2>&1 

echo "=> [3]: Restore Jenkins"

sudo rm -rf /root/.jenkins

jenkins=$(ssh -o "StrictHostKeyChecking=no" -i /vagrant/data/backup_key "root@192.168.4.110" "ls -t /root/jenkins | head -n 1")
scp -i /vagrant/data/backup_key root@192.168.4.110:/root/jenkins/$jenkins /root/$jenkins
cd /root
unzip $jenkins >> $LOG_FILE 2>&1
nom="${jenkins%.*}"
mv $nom /root/.jenkins
chown -R root:root /root/.jenkins
rm -rf *.zip

# Ajout de la commande cron : toutes les 30 minutes le script de backup va s'exécuter
echo "*/30 * * * * bash /vagrant/scripts/backup.sh" | crontab -

echo "=> [4]: Set up Jenkins service"

# Create the service file
cat <<EOF > /etc/systemd/system/jenkins.service
[Unit]
Description=Jenkins Server
After=network.target

[Service]
ExecStart=/usr/bin/java -jar /root/jenkins.war
User=root
Type=simple
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# Enable and start Jenkins service
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

cat <<EOF

Jenkins Server installed at http://172.16.2.10:8080

EOF

echo "END - Install Jenkins Server"

