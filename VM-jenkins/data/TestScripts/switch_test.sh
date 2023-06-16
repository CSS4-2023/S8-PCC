#!/bin/bash
reset='\033[0m'
blue='\033[36m'
green='\033[32m'
red='\033[31m'

###################################################
###     Vérification de la connexion SSH        ###   OK
###################################################

ssh_cmd=sshpass -p '(!css4!)' ssh -o KexAlgorithms=diffie-hellman-group1-sha1 -o Ciphers=aes256-cbc -oHostKeyAlgorithms=+ssh-rsa Admin@172.16.2.34
echo -e "${blue}Vérification de la connexion SSH en 172.16.2.34 :${reset}"
# Run the SSH command and capture the output
ssh_output=$(eval "$ssh_cmd" 2>&1)
# Check if the SSH command was successful
if [ $? -eq 0 ]; then
  echo -e "${green}Test réussi : Connexion SSH à 172.16.2.34 réussie${reset}"
else
  echo -e "${red}Test échoué : Connexion SSH à 172.16.2.34' échouée${reset}"
fi

#########################################################
###     Récupération du fichier de configuration      ###   OK
#########################################################

# Récupération du fichier de configuration
sshpass -p '(!css4!)' scp -o "StrictHostKeyChecking=no" -o KexAlgorithms=diffie-hellman-group1-sha1 -o Ciphers=aes256-cbc -o HostKeyAlgorithms=+ssh-rsa admin@172.16.2.34:system:/running-config running-config-switch

file="/root/.jenkins/workspace/Switch_FunctionalTest/running-config-switch"
###########################################################
###     Vérification de la configuration initiale       ###   OK
###########################################################

echo -e "${blue}Vérification de la configuration minimale (hostname et mot de passe) :${reset}"
if [[ $(grep "hostname S-E4-I2-CSS" $file) && $(grep "enable password" $file) ]]; then
    echo -e "${green}Test réussi : Configuration initiale correcte${reset}"
else
    echo -e "${red}Test échoué : Configuration initiale incorrecte${reset}"
fi

###################################################################
###     Vérification des interfaces       			###   OK
###################################################################


declare -A interfaces=(
  ["FastEthernet0/1"]="10"
  ["FastEthernet0/2"]="10"
  ["FastEthernet0/3"]="20"
  ["FastEthernet0/4"]="20"
  ["FastEthernet0/5"]="30"
  ["FastEthernet0/6"]="30"
  ["FastEthernet0/7"]="40"
  ["FastEthernet0/8"]="40"
)

echo -e "${blue}Vérification des interfaces dans la configuration :${reset}"

for interface in "${!interfaces[@]}"; do
  if grep -q "^interface $interface" $file; then
    echo -e "${green}L'interface $interface existe dans la configuration :${reset}"
    grep -A3 "^interface $interface" $file
    echo
  else
    echo -e "${red}L'interface $interface n'existe pas dans la configuration.${reset}"
  fi
done

echo -e "${blue}Vérification des VLANs dans la configuration :${reset}"
for interface in "${!interfaces[@]}"; do
  expected_vlan=${interfaces[$interface]}
  vlan=$(grep -A3 -E "^interface $interface" $file | awk '/\s*switchport access vlan\s+/ {print $NF}')
  vlan=$(echo "$vlan" | tr -d '[:space:]')
  if [[ $vlan = $expected_vlan ]]; then
    echo -e "${green}L'interface $interface est correctement configurée avec le VLAN : $vlan ${reset}"
  else
    echo -e "${red}Le VLAN configuré pour l'interface $interface est incorrect.${reset}"
    echo "VLAN attendu: $expected_vlan"
    echo "VLAN actuel: $vlan"
  fi
done

#Vérification de la configuration de l'interface GigabitEthernet0/1
echo -e "${blue}Vérification de la configuration de l'interface GigabitEthernet0/1 :${reset}"
if grep -q "interface GigabitEthernet0/1" $file && grep -q "switchport mode trunk" $file; then
  echo -e "${green}L'interface GigabitEthernet0/1 est configurée en mode trunk.${reset}"
else
  echo -e "${red}L'interface GigabitEthernet0/1 n'est pas correctement configurée en mode trunk.${reset}"
fi
echo

#Vérification de la configuration de l'interface Vlan40 - Management
echo -e "${blue}Vérification de la configuration de l'interface management${reset} "
interface='Vlan40'
  if grep -q "^interface $interface" $file; then
    echo -e "${green}L'interface $interface existe dans la configuration :${reset}"
    grep -A3 "^interface $interface" $file
    echo
  else
    echo -e "${red}L'interface $interface n'existe pas dans la configuration.${reset}"
  fi
# Ping de la passerelle par défaut
echo -e "${blue}Ping de la passerelle par défaut${reset}"
if ping -c 1 172.16.2.33 >/dev/null; then
  echo -e "${green}Test réussi : Ping de la passerelle par défaut OK${reset}"
else
  echo -e "${red}Test échoué : Impossible de pinger la passerelle par défaut${reset}"
fi
# Ping de l'interface de management
echo -e "${blue}Ping de l'interface Management :"
if ping -c 1 172.16.2.34 >/dev/null; then
  echo -e "${green}Test réussi : Ping de l'interface VLAN 40 - Management - OK${reset}"
else
  echo -e "${red}Test échoué : Impossible de pinger l'interface VLAN 40 - Management${reset}"
fi

###################################################################
###     Vérification de la configuration SNMP       		###   OK
###################################################################


#Vérification des paramètres SNMP
echo -e "${blue}Vérification des paramètres SNMP :${reset}"
if grep -q "snmp-server community private RO" $file; then
  echo -e "${green}Les communautés SNMP sont correctement configurés.${reset}"
else
  echo -e "${red}Les communautés SNMP ne sont pas correctement configurés.${reset}"
fi
echo
#Vérification des notifications SNMP
echo -e "${blue}Vérification des notifications SNMP :${reset}"
if grep -q "snmp-server enable traps snmp linkdown linkup" $file; then
  echo -e "${green}Les notifications SNMP pour les événements de lien sont activées.${reset}"
else
  echo -e "${red}Les notifications SNMP pour les événements de lien ne sont pas activées.${reset}"
fi
echo

#Fin du script
echo -e "${blue}Vérification de la configuration du switch terminée.${reset}"