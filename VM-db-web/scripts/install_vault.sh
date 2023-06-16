#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_vault.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Install Hashicorp Vault - "$IP

echo "=> [1]: Package installation & update"
apt-get update $APT_OPT \
  >> $LOG_FILE 2>&1

apt-get install $APT_OPT \
  gpg \
  >> $LOG_FILE 2>&1

echo "=> [2]: Prepare installation"
# Download the signing key to a new keyring
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
>> $LOG_FILE 2>&1

# Verify the key's fingerprint
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint \
>> $LOG_FILE 2>&1

# Add the Hashicorp repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
>> $LOG_FILE 2>&1

# apt update
sudo apt update \
>> $LOG_FILE 2>&1

echo "=> [3]: Install Vault"
# Installing vault
sudo apt install vault \
>> $LOG_FILE 2>&1

echo "=> [4]: Recover backup_key from vault"
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

echo "=> [5]: Recover passwd from vault"
# Export right token
echo 'export VAULT_TOKEN="$(cat /vagrant/data/passwd_token)"' | sudo tee -a /root/.bashrc \
>> $LOG_FILE 2>&1
source /root/.bashrc
PASSWD=$(printenv VAULT_TOKEN)
echo "VAULT-TOKEN : $PASSWD"

# Recover backup_key
VAULT_ADDR=http://Vault.e4.sirt.tp:8200 vault kv get -field=key secret/passwd_key/passwd > /vagrant/data/passwd

cat <<EOF

Vault installed

EOF

echo "END - Install Hashicorp Vault"

