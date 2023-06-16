#!/bin/bash

# Codes de couleur ANSI
green='\033[0;32m'
red='\033[0;31m'
reset='\033[0m'

# Adresse IP du serveur DHCP
dhcp_server="172.16.2.36"

# Hostnames de test
correct_hostname="CAUCHY18"
incorrect_hostname="CAUCHY49"

# Fonction pour vérifier un hostname
check_hostname() {
  local lease_hostname="$1"
  local result
  
  # Vérification de la connectivité avec le serveur DHCP
  ping -c 1 $dhcp_server > /dev/null
  if [ $? -eq 0 ]; then # On vérifie que la dernière commande s'est exécutée sans erreurs
    result="${green}Le serveur DHCP ($dhcp_server) est joignable.${reset}"

    # Vérification de la liste des leases DHCP
    leases_file="/var/lib/dhcp/dhcpd.leases" # Le fichier contenant les enregistrements de location
    if [ -f $leases_file ]; then # On vérifie que le fichier existe
      result+="\n${green}Le fichier des leases ($leases_file) existe.${reset}"

      # Recherche du hostname dans la liste des leases
      lease_check=$(dhcp-lease-list | grep $lease_hostname)

      if [ -n "$lease_check" ]; then # On vérifie que la variable n'est pas vide
        result+="\n${green}Le hostname $lease_hostname est présent dans les leases.${reset}"
      else
        result+="\n${red}Le hostname $lease_hostname n'est pas présent dans les leases.${reset}"
      fi
    else
      result+="\n${red}Le fichier des leases ($leases_file) n'existe pas.${reset}"
    fi
  else
    result="${red}Le serveur DHCP ($dhcp_server) est injoignable.${reset}"
  fi
  
  # Affichage du résultat
  echo -e "$result"
}

# Appel de la fonction pour vérifier le hostname correct
echo -e "Test DHCP pour le hostname $correct_hostname :"
echo -e "On s'attend à ce que tous les tests soient positifs"
check_hostname "$correct_hostname"

echo -e "\n"

# Appel de la fonction pour vérifier le hostname incorrect
echo -e "Test DHCP pour le hostname $incorrect_hostname :"
echo -e "On s'attend à ce que le test de présence dans le fichier des leases échoue"
check_hostname "$incorrect_hostname"