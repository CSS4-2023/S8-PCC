#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_vault.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Install Hashicorp Vault Server - "$IP

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

cat <<EOF

Vault Server installed at http://Vault.e4.sirt.tp:8200

EOF

echo "END - Install Hashicorp Vault Server"

