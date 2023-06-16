#!/bin/bash

# Description du fichier de test du DHCP

# Le but de ce script est de tester :

# - le bon fonctionnement du service DHCP dans l'infra
# - la bonne configuration du service DHCP

# Auteur : Tristan Caro

# Codes de couleur ANSI
green='\033[0;32m'
red='\033[0;31m'
reset='\033[0m'

# Adresse IP du serveur DHCP
dhcp_server="172.16.2.36"

# Adresses IPs de test
correct_ip="172.16.2.37"
incorrect_ip="172.16.5.98"

# Fonction pour vérifier une adresse IP
check_ip() {
  local lease_ip="$1"
  local result
  
  # Vérification de la connectivité avec le serveur DHCP
  ping -c 1 $dhcp_server > /dev/null
  if [ $? -eq 0 ]; then # On vérifie que la dernière commande s'est exécutée sans erreurs
    result="${green}Le serveur DHCP ($dhcp_server) est joignable.${reset}"

    # Vérification de la liste des leases DHCP
    leases_file="/var/lib/dhcp/dhcpd.leases" # Le fichier contenant les enregistrements de location
    if [ -f $leases_file ]; then # On vérifie que le fichier existe
      result+="\n${green}Le fichier des leases ($leases_file) existe.${reset}"

      # Recherche de l'adresse IP dans la liste des leases
      lease_check=$(dhcp-lease-list | grep "$lease_ip")

      if [ -n "$lease_check" ]; then # On vérifie que la variable n'est pas vide
        result+="\n${green}L'adresse IP $lease_ip est présente dans les leases.${reset}"
      else
        result+="\n${red}L'adresse IP $lease_ip n'est pas présente dans les leases.${reset}"
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

# Appel de la fonction pour vérifier l'adresse IP correcte
echo -e "Test DHCP pour l'adresse IP $correct_ip :"
echo -e "On s'attend à ce que tous les tests soient positifs"
check_ip "$correct_ip"

echo -e "\n"

# Appel de la fonction pour vérifier l'adresse IP incorrecte
echo -e "Test DHCP pour l'adresse IP $incorrect_ip :"
echo -e "On s'attend à ce que le test de présence dans le fichier des leases échoue"
check_ip "$incorrect_ip"
