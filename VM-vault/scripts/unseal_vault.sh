#!/bin/bash

#Assumes that VAULT_ADDR and VAULT_TOKEN has been set in environmental variables for the "Production" Vault connection

#Set the address to the Transit Vault (or vault you wish to unlock automatically)
TRANSIT_VAULT="http://127.0.0.1:8200"

#Renew the current vault token, which must have access to the secrets path where the unseal keys are stored
vault token renew &>/dev/null

#Check Transit Vault seal status
vault_status=$(VAULT_ADDR=$TRANSIT_VAULT vault status -format "json" | jq --raw-output '.sealed')

# Read the init-output.json file and store the values in variables
json=$(cat /root/init-output.json)

# Parse unseal keys
unseal_keys=($(echo $json | jq -r '.unseal_keys_b64[]'))

# Parse root token
root_token=$(echo $json | jq -r '.root_token')

if [[ $vault_status == 'false' ]]; then
        :
elif [[ $vault_status == 'true' ]]; then
	
        # Create keys array to store unseal keys
        declare -A keys
        keys+=(["key1"]="${unseal_keys[0]}" ["key2"]="${unseal_keys[1]}" ["key3"]="${unseal_keys[2]}" ["key4"]="${unseal_keys[3]}" ["key5"]="${unseal_keys[4]}")

	#Run unseal operation and iterate through the key values until the seal status changes to "false"
        i=1
        while [[ $vault_status == 'true' ]];
                do
                VAULT_ADDR=$TRANSIT_VAULT vault operator unseal ${keys[key$i]} &>/dev/null
                vault_status=$(VAULT_ADDR=$TRANSIT_VAULT vault status -format "json" | jq --raw-output '.sealed')
                i=$[$i+1]
        done
else
        :
fi