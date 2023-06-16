#!/bin/bash
reset='\033[0m'
blue='\033[36m'
green='\033[32m'
red='\033[31m'

###################################################
###     Vérification de la connexion SSH        ###   OK
###################################################

ssh_cmd=sshpass -p '(!css4!)' ssh -o KexAlgorithms=diffie-hellman-group1-sha1 -o Ciphers=aes256-cbc -oHostKeyAlgorithms=+ssh-rsa Admin@172.16.2.33
echo -e "${blue}Vérification de la connexion SSH en 172.16.2.33 :${reset}"
# Run the SSH command and capture the output
ssh_output=$(eval "$ssh_cmd" 2>&1)
# Check if the SSH command was successful
if [ $? -eq 0 ]; then
  echo -e "${green}Test réussi : Connexion SSH à 172.16.2.33 réussie${reset}"
else
  echo -e "${red}Test échoué : Connexion SSH à 172.16.2.33 échouée${reset}"
fi



#########################################################
###     Récupération du fichier de configuration      ###   OK
#########################################################

# Récupération du fichier de configuration
sshpass -p '(!css4!)' scp -o "StrictHostKeyChecking=no" -o KexAlgorithms=diffie-hellman-group1-sha1 -o Ciphers=aes256-cbc -o HostKeyAlgorithms=+ssh-rsa Admin@172.16.2.33:system:/running-config running-config-router

files="/root/.jenkins/workspace/Routeur_FunctionalTest/running-config-router"

###########################################################
###     Vérification de la configuration initiale       ###   OK
###########################################################

echo -e "${blue}Vérification de la configuration minimale (hostname et mot de passe) :${reset}"
if [[ $(grep "hostname R-E4-I2-CSS" $files) && $(grep "enable password" $files) ]]; then
    echo -e "${green}Test réussi : Configuration initiale correcte${reset}"
else
    echo -e "${red}Test échoué : Configuration initiale incorrecte${reset}"
fi



###################################################################
###     Vérification des interfaces       			###   OK
###################################################################


declare -A interfaces=(
  ["GigabitEthernet0/1.10"]="172.16.0.1"
  ["GigabitEthernet0/1.20"]="172.16.1.1"
  ["GigabitEthernet0/1.30"]="172.16.2.1"
  ["GigabitEthernet0/1.40"]="172.16.2.33"
  ["GigabitEthernet0/2"]="172.16.2.18"
)

echo -e "${blue}Vérification des interfaces dans la configuration :${reset}"

for interface in "${!interfaces[@]}"; do
  if grep -q "^interface $interface" $files; then
    echo -e "${green}L'interface $interface existe dans la configuration :${reset}"
    grep -A3 "^interface $interface" $files
    echo
  else
    echo -e "{$red}L'interface $interface n'existe pas dans la configuration.${reset}"
  fi
done

echo -e "${blue}Vérification des adresses IP dans la configuration :${reset}"
for interface in "${!interfaces[@]}"; do
  expected_ip=${interfaces[$interface]}
  ip=$(grep -A3 -E "^interface $interface" $files | awk '/\s*ip address\s+/ {print $3}')
  ip=$(echo "$ip" | tr -d '[:space:]')
if [[ $ip == $expected_ip ]]; then
    echo -e "${green}L'interface $interface a l'adresse IP configurée : $ip ${reset}"
  else
    echo -e "${red}Aucune adresse IP n'est configurée pour l'interface $interface. ${reset}"
    echo -e "${blue}Adresse IP souhaitée : $expected_ip ${reset}"
    echo -e "${blue}Adresse IP configurée : $ip ${reset}"
  fi
done

# Ping de la passerelle par défaut
echo -e "${blue}Ping de la passerelle par défaut :${reset}"
if ping -c 1 172.16.2.19 >/dev/null; then
  echo -e "${green}Test réussi : Ping de la passerelle par défaut OK ${reset}"
else
  echo -e "${red}Test échoué : Impossible de pinger la passerelle par défaut ${reset}"
fi
# Ping des interfaces
echo -e "${blue} Ping des interfaces : ${reset}"
for interface in "${!interfaces[@]}"; do
  ip=${interfaces[$interface]}
  if ping -c 1 $ip >/dev/null; then
    echo -e "${green}Test réussi : Ping de $interface ($ip) OK ${reset}"
  else
    echo -e "${red}Test échoué : Impossible de pinger $interface ($ip) ${reset}"
  fi
done


###################################################################
###     Vérification de la configuration SNMP       		###   OK
###################################################################


#Vérification des paramètres SNMP
echo -e "${blue}Vérification des paramètres SNMP :${reset}"
if grep -q "snmp-server community private RO" $files; then
  echo -e "${green}Les groupes SNMP et les communautés sont correctement configurés.${reset}"
else
  echo -e "${red}Les groupes SNMP et/ou les communautés ne sont pas correctement configurés.${reset}"
fi
echo
#Vérification des notifications SNMP
echo -e "${blue}Vérification des notifications SNMP : ${reset}"
if grep -q "snmp-server enable traps snmp linkdown linkup" $files; then
  echo -e "${green}Les notifications SNMP pour les événements de lien sont activées.${reset}"
else
  echo -e "${red}Les notifications SNMP pour les événements de lien ne sont pas activées.${reset}"
fi
echo

#Fin du script
echo -e "${blue}Vérification de la configuration terminée. ${reset}"
S