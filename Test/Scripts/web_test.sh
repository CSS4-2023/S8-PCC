#!/bin/bash

#Description du fichier de test de la VM-wordpress
#Le but de ce script est de tester :
# - le bon fonctionnement de la machine virtuelle qui héberge le service Wordpress
# - la configuration du service Wordpress (fichier de configuration)
# - vérification de la connexion avec la base de donnée

# Auteur : Thomas Dabout

reset='\033[0m'
blue='\033[36m'
green='\033[32m'
red='\033[31m'

#Variables de connexion au wordpress
# Define the server URL for the welcome page
WEB_URL_CLIENT="https://css.e4.sirt.tp/web"

# Define the server URL for the admin page
WEB_URL_ADMIN="https://css.e4.sirt.tp/web/wp-login.php"

# Username admin
USERNAME="admin"

# Password admin wordpress
PASSWORD="(!css4!)"

# Variables de connexion à la base de données
# Adresse IP
DB_HOST="DBweb.e4.sirt.tp"
# Nom
DB_NAME="wordp"
# Utilisateur
DB_USER="wordp"
# Mdp
DB_PASSWORD="(!css4!)"

# Function to check the status of an HTTP request
check_http_status() {
    local url="$1"
    local expected_status="$2"
    local http_status=$(curl -s -o /dev/null -w "%{http_code}" "$url")

    if [[ "$http_status" == "$expected_status" ]]; then
        echo -e "${green}   VALIDE: $url a renvoyé le statut HTTP $expected_status${reset}"
    else
        echo -e "${red}     ERREUR: $url a renvoyé le statut HTTP $http_status, attendu $expected_status${reset}"
    fi
}

# Vérification de la page d'accueil
echo "TEST [1] : Vérification de la page d'accueil"
check_http_status "$WEB_URL_CLIENT" 200

# Connexion à l'administration
echo "TEST [2] : Connexion à l'administration"
login_url="$WEB_URL_ADMIN"
login_data="log=$USERNAME&pwd=$PASSWORD&wp-submit=Log+In"
login_response=$(curl -s -o /dev/null -w "%{http_code}" -d "$login_data" "$login_url")
if [[ "$login_response" == "302" ]]; then
    echo -e "${green}   VALIDE: Connexion réussie à $login_url${reset}"
else
    echo -e "${red}     ERREUR: Impossible de se connecter à $login_urls${reset}"
fi

# Vérification de la page de connexion après déconnexion
echo "TEST [3] : Vérification de la page de connexion après déconnexion"
check_http_status "$login_url" 200

# Vérification du statut du service Apache
echo "TEST [4] : Vérification du statut du service Apache"
apache_status=$(systemctl is-active apache2)

if [ "$apache_status" = "active" ]; then
    echo -e "${green}   VALIDE: Le service Apache est actif${reset}"
else
    echo -e "${red}     ERREUR: Le service Apache n'est pas actif${reset}"
fi

# Vérification de la présence du fichier de configuration
echo "TEST [5] : Vérification de la présence du fichier de configuration"
if ls /vagrant/data/ | grep -q 'wp-config.php'; then
    echo -e "${green}   VALIDE: Le fichier wp-config.php est présent dans /vagrant/data/${reset}"
else
    echo -e "${red}     ERREUR: Le fichier wp-config.php n'est pas présent dans /vagrant/data/${reset}"
fi

# Vérification de la présence du fichier de configuration dans la VM
echo "TEST [6] : Vérification de la présence du fichier de configuration"
if ls /var/www/html/ | grep -q 'wp-config.php'; then
    echo -e "${green}   VALIDE: Le fichier wp-config.php est présent dans /var/www/html/${reset}"
else
    echo -e "${red}     ERREUR: Le fichier wp-config.php n'est pas présent dans /var/www/html/${reset}"
fi

# Vérification de la connexion à la base de données
echo "TEST [7] : Vérification de la connexion à la base de données"
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "USE $DB_NAME;" 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "${green}   VALIDE: La connexion à la base de données est établie${reset}"
else
    echo -e "${red}     ERREUR: La connexion à la base de données a échoué${reset}"
fi

# Vérification de la disponibilité de WordPress
echo "TEST [8] : Vérification de la disponibilité de WordPress"
if ls /var/www/html/ | grep -q 'wp-admin'; then
    echo -e "${green}   VALIDE: Les fichiers de WordPress sont présents dans /var/www/html/${reset}"
else
    echo -e "${red}     ERREUR: Les fichiers de WordPress ne sont pas présents dans /var/www/html/${reset}"
fi

# Vérification de l'installation de l'agent Wazuh
echo "TEST [9] : Vérification de l'installation de l'agent Wazuh"
wazuh_status=$(systemctl is-active wazuh-agent)

if [ "$wazuh_status" = "active" ]; then
    echo -e "${green}   VALIDE: L'agent Wazuh est installé et actif${reset}"
else
    echo -e "${red}     ERREUR: L'agent Wazuh n'est pas installé ou inactif${reset}"
fi



