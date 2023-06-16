#!/bin/bash

# Description du fichier de test de la VM-supervision

# Le but de ce script est de tester :

# - le statut des services (Nagios, Grafana, Postfix)
# - le bon fonctionnement des services supervisé par le serveur Nagios
# - la bonne configuration du service Nagios (via des check et check-nrpe)

# Auteur : Clovis Soulétis

reset='\033[0m'
blue='\033[36m'
green='\033[32m'
yellow="\033[38;5;226m"
orange="\033[38;5;208m"
red='\033[31m'

check_service_status() {
    local output=$(eval "systemctl status $1 2>&1")

    echo -e "${blue}Test service status on : $1${reset}"

    if [[ $output == *"could not be found"* ]]; then
        echo -e "---> ${red}Service not available${reset}"
    elif [[ $output == *"inactive"* ]]; then
        echo -e "---> ${red}Service inactive${reset}"
    else
        echo -e "---> ${green}Service active${reset}"
    fi
    echo ""
}

test_services() {
    local host_name=$1
    local services=("${@:2}") # Liste des services à tester à partir du 2ème paramètre

    echo -e "${blue}Test services on : $host_name${reset}"

    for service in "${services[@]}"; do
        local output=$(eval "$service 2>&1")
        echo $output
        if echo "$output" | grep -iqE 'error|refused|timeout'; then
            echo -e "${red}Service state : down !${reset}"
        elif echo "$output" | grep -iq 'critical'; then
            echo -e "${orange}Service state : critical !${reset}"
        elif echo "$output" | grep -iq 'warning'; then
            echo -e "${yellow}Service state : warning${reset}"
        else
            echo -e "${green}Service OK !${reset}"
        fi
    done
    echo ""
}

echo -e "${blue}Checking the status of supervision virtual machine services ...${reset}"
echo ""

# Lancement de la fonction check_service_status pour vérifier l'état des services importants de la VM-supervision
check_service_status nagios
check_service_status grafana-server
check_service_status postfix

echo -e "${blue}Checking the status of services supervised by Nagios ...${reset}"
echo ""

# On se place dans le dossier pouvant exécuter les fonctions check
cd /usr/local/nagios/libexec

# Liste des services avec leurs fonctions check associées
pfSense=("./check_ping -H 172.16.2.19 -w 100.0,20% -c 500.0,60%")
Internet_Connection=("./check_ping -H 192.168.4.2 -w 100.0,20% -c 500.0,60%")
Switch=("./check_ping -H 172.16.2.34 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.2.34" "./check_snmp -o .1.3.6.1.2.1.1.5.0 -H 172.16.2.34 -C private" "./check_snmp -o .1.3.6.1.2.1.1.3.0 -H 172.16.2.34 -C private" "./check_snmp -o '.1.3.6.1.4.1.9.9.48.1.1.1.2.1,.1.3.6.1.4.1.9.9.48.1.1.1.5.1,.1.3.6.1.4.1.9.9.48.1.1.1.6.1' -H 172.16.2.34 -C private" "./check_snmp -o '.1.3.6.1.4.1.9.2.1.57.0,.1.3.6.1.4.1.9.2.1.58.0' -H 172.16.2.34 -C private" "./check_snmp -o '1.3.6.1.2.1.31.1.1.1.1.100,1.3.6.1.2.1.2.2.1.8.100,1.3.6.1.2.1.31.1.1.1.1.10002,1.3.6.1.2.1.2.2.1.8.10002,1.3.6.1.2.1.31.1.1.1.1.10004,1.3.6.1.2.1.2.2.1.8.10004,1.3.6.1.2.1.31.1.1.1.1.10006,1.3.6.1.2.1.2.2.1.8.10006,1.3.6.1.2.1.31.1.1.1.1.10008,1.3.6.1.2.1.2.2.1.8.10008,1.3.6.1.2.1.31.1.1.1.1.10101,1.3.6.1.2.1.2.2.1.8.10101' -H 172.16.2.34 -C private")
Router=("./check_ping -H 172.16.2.33 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.2.33" "./check_snmp -o .1.3.6.1.2.1.1.5.0 -H 172.16.2.34 -C private" "./check_snmp -o .1.3.6.1.2.1.1.3.0 -H 172.16.2.33 -C private" "./check_snmp -o '.1.3.6.1.4.1.9.9.48.1.1.1.2.1,.1.3.6.1.4.1.9.9.48.1.1.1.5.1,.1.3.6.1.4.1.9.9.48.1.1.1.6.1' -H 172.16.2.33 -C private" "./check_snmp -o '.1.3.6.1.4.1.9.2.1.57.0,.1.3.6.1.4.1.9.2.1.58.0' -H 172.16.2.33 -C private" "./check_snmp -o '1.3.6.1.2.1.31.1.1.1.1.1,1.3.6.1.2.1.2.2.1.8.1,1.3.6.1.2.1.31.1.1.1.1.2,1.3.6.1.2.1.2.2.1.8.2,1.3.6.1.2.1.31.1.1.1.1.3,1.3.6.1.2.1.2.2.1.8.3,1.3.6.1.2.1.31.1.1.1.1.4,1.3.6.1.2.1.2.2.1.8.4,1.3.6.1.2.1.31.1.1.1.1.5,1.3.6.1.2.1.2.2.1.8.5,1.3.6.1.2.1.31.1.1.1.1.7,1.3.6.1.2.1.2.2.1.8.7,1.3.6.1.2.1.31.1.1.1.1.8,1.3.6.1.2.1.2.2.1.8.8,1.3.6.1.2.1.31.1.1.1.1.9,1.3.6.1.2.1.2.2.1.8.9,1.3.6.1.2.1.31.1.1.1.1.10,1.3.6.1.2.1.2.2.1.8.10' -H 172.16.2.33 -C private")
Reverse_proxy=("./check_ping -H 172.16.2.21 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.2.21" "./check_nrpe -H 172.16.2.21 -c check_load2" "./check_nrpe -H 172.16.2.21 -c check_mem" "./check_nrpe -H 172.16.2.21 -c check_disk")
Load_balancing=("./check_ping -H 172.16.2.20 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.2.20" "./check_nrpe -H 172.16.2.20 -c check_load2" "./check_nrpe -H 172.16.2.20 -c check_mem" "./check_nrpe -H 172.16.2.20 -c check_disk")
DNS=("./check_ping -H 172.16.2.36 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.2.36" "./check_nrpe -H 172.16.2.36 -c check_load2" "./check_nrpe -H 172.16.2.36 -c check_mem" "./check_nrpe -H 172.16.2.36 -c check_disk")
Vault=("./check_ping -H 172.16.2.6 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.2.6" "./check_nrpe -H 172.16.2.6 -c check_load2" "./check_nrpe -H 172.16.2.6 -c check_mem" "./check_nrpe -H 172.16.2.6 -c check_disk")
Sauvegarde=("./check_ping -H 192.168.4.110 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 192.168.4.110" "./check_nrpe -H 192.168.4.110 -c check_load2" "./check_nrpe -H 192.168.4.110 -c check_mem" "./check_nrpe -H 192.168.4.110 -c check_disk")
Gitea_Database=("./check_ping -H 172.16.1.3 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.1.3" "./check_nrpe -H 172.16.1.3 -c check_load2" "./check_nrpe -H 172.16.1.3 -c check_mem" "./check_nrpe -H 172.16.1.3 -c check_disk" "./check_nrpe -H 172.16.1.3 -c check_tcp -p 3306" "./check_nrpe -H 172.16.1.3 -c check_mysqld")
Gitea_Server=("./check_ping -H 172.16.2.3 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.2.3" "./check_tcp -H 172.16.2.3 -p 3000" "./check_nrpe -H 172.16.2.3 -c check_load2" "./check_nrpe -H 172.16.2.3 -c check_mem" "./check_nrpe -H 172.16.2.3 -c check_disk")
Web_Database=("./check_ping -H 172.16.1.4 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.1.4" "./check_nrpe -H 172.16.1.4 -c check_load2" "./check_nrpe -H 172.16.1.4 -c check_mem" "./check_nrpe -H 172.16.1.4 -c check_disk" "./check_nrpe -H 172.16.1.4 -c check_tcp -p 3306" "./check_nrpe -H 172.16.1.4 -c check_mysqld")
Web_Server1=("./check_ping -H 172.16.0.100 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.0.100" "./check_http -H 172.16.0.100" "./check_nrpe -H 172.16.0.100 -c check_load2" "./check_nrpe -H 172.16.0.100 -c check_mem" "./check_nrpe -H 172.16.0.100 -c check_disk")
Web_Server2=("./check_ping -H 172.16.0.99 -w 100.0,20% -c 500.0,60%" "./check_ssh -H 172.16.0.99" "./check_http -H 172.16.0.99" "./check_nrpe -H 172.16.0.99 -c check_load2" "./check_nrpe -H 172.16.0.99 -c check_mem" "./check_nrpe -H 172.16.0.99 -c check_disk")

# Lancement de la fonction test_services pour vérifier l'état des services supervisés par Nagios
test_services "pfSense" "${pfSense[@]}"
test_services "Internet_Connection" "${Internet_Connection[@]}"
test_services "Switch" "${Switch[@]}"
test_services "Router" "${Router[@]}"
test_services "Reverse-proxy" "${Reverse_proxy[@]}"
test_services "Load-balancing" "${Load_balancing[@]}"
test_services "DNS" "${DNS[@]}"
test_services "Vault" "${Vault[@]}"
test_services "Sauvegarde" "${Sauvegarde[@]}"
test_services "Gitea_Database" "${Gitea_Database[@]}"
test_services "Gitea_Server" "${Gitea_Server[@]}"
test_services "Web_Database" "${Web_Database[@]}"
test_services "Web_Server1" "${Web_Server1[@]}"
test_services "Web_Server2" "${Web_Server2[@]}"