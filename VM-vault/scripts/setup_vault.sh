#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/setup_vault.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - Setting up Hashicorp Vault Server - "$IP

echo "=> [1]: Initializing vault"
# Initialize Vault
vault operator init -format=json > /root/init-output.json

echo "=> [2]: Vault operator unseal"

# Unseal vault
bash /vagrant/scripts/unseal_vault.sh \
>> $LOG_FILE 2>&1

echo "=> [3]: Create secret backup..."

# Export token variable
echo 'export VAULT_TOKEN="$(cat /root/init-output.json | jq -r '.root_token')"' | sudo tee -a /root/.bashrc \
>> $LOG_FILE 2>&1
source /root/.bashrc
ROOT=$(printenv VAULT_TOKEN)
echo "ROOT-TOKEN : $ROOT"

# Enable secrets engine
vault secrets enable -path=secret/bup_key kv

# Store private-key in kv
vault kv put secret/bup_key/private_key key="$(cat /vagrant/data/backup)"

echo "=> [4]: Create backup policy & token for external servers..."

# Create policy file
echo '
# Read-only permit
path "secret/bup_key/private_key" {
  capabilities = [ "read" ]
}
' | tee /root/backup-policy.hcl \
>> $LOG_FILE 2>&1

# Create policy
vault policy write backup /root/backup-policy.hcl

# Create and export backup token variable (8760h=1y)
echo 'export BACKUP_TOKEN="$(vault token create -ttl=8760h -policy="backup" -field=token)"' | sudo tee -a /root/.bashrc \
>> $LOG_FILE 2>&1
source /root/.bashrc
BACKUP=$(printenv BACKUP_TOKEN)
echo "BACKUP-TOKEN : $BACKUP"
echo "$BACKUP" | tee /vagrant/data/backup_token \
>> $LOG_FILE 2>&1

echo "=> [5]: Create secret test..."

# Enable secrets engine
vault secrets enable -path=secret/test_key kv

# Store private-key in kv
vault kv put secret/test_key/private_key key="$(cat /vagrant/data/test)"

echo "=> [6]: Create test policy & token for external servers..."

# Create policy file
echo '
# Read-only permit
path "secret/test_key/private_key" {
  capabilities = [ "read" ]
}
' | tee /root/test-policy.hcl \
>> $LOG_FILE 2>&1

# Create policy
vault policy write test /root/test-policy.hcl

# Create and export test token variable (8760h=1y)
echo 'export TEST_TOKEN="$(vault token create -ttl=8760h -policy="test" -field=token)"' | sudo tee -a /root/.bashrc \
>> $LOG_FILE 2>&1
source /root/.bashrc
TEST=$(printenv TEST_TOKEN)
echo "TEST-TOKEN : $TEST"
echo "$TEST" | tee /vagrant/data/test_token \
>> $LOG_FILE 2>&1

echo "=> [7]: Create secret passwd..."

# Enable secrets engine
vault secrets enable -path=secret/passwd_key kv

# Store private-key in kv
vault kv put secret/passwd_key/passwd key="$(cat /vagrant/data/passwd)"

echo "=> [8]: Create passwd policy & token for external servers..."

# Create policy file
echo '
# Read-only permit
path "secret/passwd_key/passwd" {
  capabilities = [ "read" ]
}
' | tee /root/passwd-policy.hcl \
>> $LOG_FILE 2>&1

# Create policy
vault policy write passwd /root/passwd-policy.hcl

# Create and export passwd token variable (8760h=1y)
echo 'export PASSWD_TOKEN="$(vault token create -ttl=8760h -policy="passwd" -field=token)"' | sudo tee -a /root/.bashrc \
>> $LOG_FILE 2>&1
source /root/.bashrc
PASSWD=$(printenv PASSWD_TOKEN)
echo "PASSWD-TOKEN : $PASSWD"
echo "$PASSWD" | tee /vagrant/data/passwd_token \
>> $LOG_FILE 2>&1


echo "END - Setting up Hashicorp Vault Server"

cat <<EOF

Vault Server up at http://Vault.e4.sirt.tp:8200

EOF


