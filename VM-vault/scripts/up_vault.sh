#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/up_vault.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Launching Hashicorp Vault Server - "$IP

echo "=> [1]: Set config Vault server"
# Create config.hcl file
echo '
storage "raft" {
  path    = "/root/vault/data"
  node_id = "node1"
}

listener "tcp" {
  address     = "Vault.e4.sirt.tp:8200"
  tls_disable = "true"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = "true"
}

api_addr = "http://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8201"
ui = true
' | tee /root/config.hcl \
>> $LOG_FILE 2>&1

# Create data folder
mkdir -p /root/vault/data \
>> $LOG_FILE 2>&1

echo "=> [2]: Launching Vault server..." 

# Export address variable
echo 'export VAULT_ADDR="http://127.0.0.1:8200"' | sudo tee -a /root/.bashrc \
>> $LOG_FILE 2>&1
echo 'export VAULT_ADDR="http://127.0.0.1:8200"' | tee -a .bashrc \
>> $LOG_FILE 2>&1
source .bashrc 
source /root/.bashrc

vault server -config=/root/config.hcl > /var/log/vault.log 2>&1 &

echo "END - Launchingg Hashicorp Vault Server"

cat <<EOF

Vault Server up at http://Vault.e4.sirt.tp:8200

EOF


