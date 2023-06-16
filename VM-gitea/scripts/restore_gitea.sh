#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/restore_gitea.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Restore gitea Server - "$IP

echo "=> [1]: Gitea setup"
wget -O /usr/local/bin/gitea https://dl.gitea.com/gitea/1.19.2/gitea-1.19.2-linux-amd64 \
>> $LOG_FILE 2>&1

chmod +x /usr/local/bin/gitea \
>> $LOG_FILE 2>&1

gitea --version \
>> $LOG_FILE 2>&1

echo "=> [2]: Add git user and configure directories"
# Create git user
adduser --system --shell /bin/bash \
--gecos 'Git Version Control' \
--group --disabled-password --home /home/git git \
>> $LOG_FILE 2>&1

# Create needed directory
mkdir -pv /var/lib/gitea/{custom,data,log,repos} \
>> $LOG_FILE 2>&1

# Edit ownership
chown -Rv git:git /var/lib/gitea \
>> $LOG_FILE 2>&1

# Fix permissions
chmod -Rv 750 /var/lib/gitea \
>> $LOG_FILE 2>&1

# Create and configure gitea directory in /etc/
mkdir -v /etc/gitea \
>> $LOG_FILE 2>&1

chown -Rv root:git /etc/gitea \
>> $LOG_FILE 2>&1

chmod -Rv 770 /etc/gitea \
>> $LOG_FILE 2>&1

echo "=> [4]: Create systemd gitea service"
# Create systemd service file
touch /etc/systemd/system/gitea.service \
>> $LOG_FILE 2>&1

# Add configuration to service file
echo "[Unit]
Description=Gitea
After=syslog.target
After=network.target

[Service]
RestartSec=3s
Type=simple
User=git
Group=git
WorkingDirectory=/var/lib/gitea/

ExecStart=/usr/local/bin/gitea web --config /etc/gitea/app.ini
Restart=always.
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea

[Install]
WantedBy=multi-user.target
" | tee /etc/systemd/system/gitea.service \
>> $LOG_FILE 2>&1

echo "=> [3]: Recover backup_key from vault"
# Export right token
echo 'export VAULT_TOKEN="$(cat /vagrant/data/backup_token)"' | sudo tee -a /root/.bashrc \
>> $LOG_FILE 2>&1
source /root/.bashrc
BACKUP=$(printenv VAULT_TOKEN)
echo "VAULT-TOKEN : $BACKUP"

# Recover backup_key
VAULT_ADDR=http://Vault.e4.sirt.tp:8200 vault kv get -field=key secret/bup_key/private_key > /vagrant/data/backup_key

# Correct backup_key to format it rightly
echo -e "\n" >> /vagrant/data/backup_key

echo "=> [4]: Recover gitea dump file"
# Retrieve the filename of the latest gitea dump .zip file in the remote directory
pathgiteadump=$(ssh -o "StrictHostKeyChecking=no" -i /vagrant/data/backup_key root@192.168.4.110 'ls -t /root/bup_gitea/bup_hour_gitea/* | head -1')


# Copy the gitea file to the local directory
scp -i /vagrant/data/backup_key root@192.168.4.110:"$pathgiteadump" .


giteadump=$(basename "$pathgiteadump")

# Unzip the file
unzip "$giteadump" \
>> $LOG_FILE 2>&1

echo "=> [5]: Restore gitea server"

mv /home/vagrant/app.ini /etc/gitea/
cp -R /home/vagrant/data/. /var/lib/gitea/data/
cp -R /home/vagrant/log/. /var/lib/gitea/log/
cp -R /home/vagrant/repos/. /var/lib/gitea/data/gitea-repositories/
chown -R git:git /etc/gitea/app.ini /var/lib/gitea

# Start service
systemctl enable gitea \
>> $LOG_FILE 2>&1
systemctl restart gitea \
>> $LOG_FILE 2>&1
systemctl status gitea \
>> $LOG_FILE 2>&1

cat <<EOF

Gitea Server installed at http://Gitea.e4.sirt.tp:3000

EOF

echo "END - Install gitea Server"

