#!/bin/bash

#Description du fichier de test de la VM-wordpress
#Le but de ce script est de tester :
# - le bon fonctionnement de la machine virtuelle qui héberge le service Wordpress
# - la configuration du service Wordpress (fichier de configuration)
# - vérification de la connexion avec la base de donnée

#Variables de connexion au wordpress
# Define the server URL for the welcome page
WEB_URL_CLIENT="http://css.e4.sirt.tp/web"

# Define the server URL for the admin page
WEB_URL_ADMIN="http://172.16.0.100"

# Username admin
USERNAME="admin"

# Password admin wordpress
PASSWORD="(!css4!)"

# Variables de connexion à la base de données
# Adresse IP
DB_HOST="172.16.1.4"
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
        echo "VALIDE: $url a renvoyé le statut HTTP $expected_status"
    else
        echo "ERREUR: $url a renvoyé le statut HTTP $http_status, attendu $expected_status"
    fi
}

# Vérification de la page d'accueil
echo "TEST [1] : Vérification de la page d'accueil"
check_http_status "$WEB_URL_CLIENT" 200

# Connexion à l'administration
echo "TEST [2] : Connexion à l'administration"
login_url="$WEB_URL_ADMIN/wp-login.php"
login_data="log=$USERNAME&pwd=$PASSWORD&wp-submit=Log+In"
login_response=$(curl -s -o /dev/null -w "%{http_code}" -d "$login_data" "$login_url")
if [[ "$login_response" == "302" ]]; then
    echo "VALIDE: Connexion réussie à $login_url"
else
    echo "ERREUR: Impossible de se connecter à $login_url"
fi

# Vérification de la page de connexion après déconnexion
echo "TEST [3] : Vérification de la page de connexion après déconnexion"
check_http_status "$login_url" 200

# Vérification du statut du service Apache
echo "TEST [4] : Vérification du statut du service Apache"
apache_status=$(systemctl is-active apache2)

if [ "$apache_status" = "active" ]; then
    echo "VALIDE: Le service Apache est actif."
else
    echo "ERREUR: Le service Apache n'est pas actif."
fi

# Vérification de la présence du fichier de configuration
echo "TEST [5] : Vérification de la présence du fichier de configuration"
if ls /vagrant/data/ | grep -q 'wp-config.php'; then
    echo "VALIDE: Le fichier wp-config.php est présent dans /vagrant/data/"
else
    echo "ERREUR: Le fichier wp-config.php n'est pas présent dans /vagrant/data/"
fi

# Vérification de la présence du fichier de configuration dans la VM
echo "TEST [6] : Vérification de la présence du fichier de configuration"
if ls /var/www/html/ | grep -q 'wp-config.php'; then
    echo "VALIDE: Le fichier wp-config.php est présent dans /var/www/html/"
else
    echo "ERREUR: Le fichier wp-config.php n'est pas présent dans /var/www/html/"
fi

# Vérification de la connexion à la base de données
echo "TEST [7] : Vérification de la connexion à la base de données"
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "USE $DB_NAME;" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "VALIDE: La connexion à la base de données est établie."
else
    echo "ERREUR: La connexion à la base de données a échoué."
fi

# Vérification de la disponibilité de WordPress
echo "TEST [8] : Vérification de la disponibilité de WordPress"
if ls /var/www/html/ | grep -q 'wp-admin'; then
    echo "VALIDE: Les fichiers de WordPress sont présents dans /var/www/html/"
else
    echo "ERREUR: Les fichiers de WordPress ne sont pas présents dans /var/www/html/"
fi
