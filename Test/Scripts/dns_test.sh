#!/bin/bash

# Description du fichier de test de la VM-DNS

# Le but de ce script est de tester :

# - le bon fonctionnement du service DNS
# - la bonne configuration du service DNS (via test de résolution)

# Auteur : Tristan Caro

reset='\033[0m'
blue='\033[36m'
green='\033[32m'
red='\033[31m'

# Adresse IP du DNS
DNS_IP="172.16.2.36"

# Domaine à tester
DOMAIN="VM-DNS.e4.sirt.tp"

# Fonction de test de résolution DNS
test_dns_resolution() {
    echo "Test de résolution DNS pour le domaine: $DOMAIN"
    result=$(nslookup "$DOMAIN")

    if echo "$result" | grep -q "NXDOMAIN"; then
        echo "   > Échec: Domaine non trouvé."
    elif echo "$result" | grep -q "Name:"; then
        echo -e "${green}   > Succès: Domaine résolu avec succès.${reset}"
        ip=$(echo "$result" | awk '/^Address: / {print $2}')
        echo -e "${green}   > Adresse IP associée au domaine: $ip${reset}"
    else
        echo "   > Échec: Erreur lors de la résolution du domaine."
    fi

    echo
}

# Fonction de test de résolution inverse
test_reverse_resolution() {
    echo "Test de résolution inverse pour l'adresse IP: $DNS_IP"
    result=$(nslookup "$DNS_IP")
    if echo "$result" | grep -q "NXDOMAIN"; then
        echo -e "${red}   > Échec: Aucun enregistrement PTR trouvé pour cette adresse IP.${reset}"
    elif echo "$result" | grep -q "name ="; then
        echo -e "${green}   > Succès: Résolution inverse réussie.${reset}"
        domain=$(echo "$result" | awk -F "= " '{print $2}')
        echo -e "${green}   > Domaine associé à l'adresse IP: $domain${reset}"
    else
        echo -e "${red}   > Échec: Erreur lors de la résolution inverse.${reset}"
    fi

    echo
}

# Appel des fonctions
test_dns_resolution "$domain"
test_reverse_resolution "$ip_address"