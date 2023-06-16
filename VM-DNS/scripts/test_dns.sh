#!/bin/bash

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
        echo "   > Succès: Domaine résolu avec succès."
        ip=$(echo "$result" | awk '/^Address: / {print $2}')
        echo "   > Adresse IP associée au domaine: $ip"
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
        echo "   > Échec: Aucun enregistrement PTR trouvé pour cette adresse IP."
    elif echo "$result" | grep -q "name ="; then
        echo "   > Succès: Résolution inverse réussie."
        domain=$(echo "$result" | awk -F "= " '{print $2}')
        echo "   > Domaine associé à l'adresse IP: $domain"
    else
        echo "   > Échec: Erreur lors de la résolution inverse."
    fi

    echo
}

# Appel des fonctions
test_dns_resolution "$domain"
test_reverse_resolution "$ip_address"