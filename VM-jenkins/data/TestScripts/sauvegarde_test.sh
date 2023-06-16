#!/bin/bash

# Description du fichier de test du serveur Sauvegarde

# Le but de ce script est de tester :

# - le bon fonctionnement du serveur Sauvegarde
# - la bonne configuration du serveur ainsi que le stockage des sauvegarde

# Auteur : Clement Barbeau

reset='\033[0m'
blue='\033[36m'
green='\033[32m'
red='\033[31m'


#-------------------GITEA---------------------------

# Répertoire distant à lister
remote_directory="/root/bup_gitea/bup_hour_gitea"

# Commande pour lister le nombre de fichiers dans le répertoire distant
command_to_execute="ls -lA ${remote_directory} | grep -c '^-'"

# Exécution de la commande SSH
output=$(eval "$command_to_execute")

echo -e "${blue}---------------Backup gitea-----------------------${reset}"

# Affichage de la sortie
if (( "$output" >= "10" && "$output" <= "12" )) ; then
    echo -e "${green}Il y a bien le bon nombre de sauvegarde : ${output}${reset}"
else
    echo -e "${red}Le nombre de sauvegarde de gitea n'est pas bon : ${output}${reset}"
fi

#Commande pour recuper le dernier fichier et sa taille
cmd_dernier_fichier="ls -t ${remote_directory} | head -n 1"
dernier_fichier=$(eval "$cmd_dernier_fichier")
cmd_taille_fichier="du -b ${remote_directory}/${dernier_fichier} | awk '{print \$1}'"
taille_fichier=$(eval "$cmd_taille_fichier")
echo "Le dernier fichier de backup gitea est ${dernier_fichier} avec une taille de ${taille_fichier} octets"

#-----------------------DB GITEA-------------------------------

remote_directory="/root/bup_db/bup_hour_db"

command_to_execute="ls -lA ${remote_directory} | grep -c '^-'"

# Exécution de la commande
output=$(eval "$command_to_execute")

echo -e "${blue}---------------Backup db gitea-----------------------${reset}"

# Affichage de la sortie
if (( "$output" >= "20" && "$output" <= "22" )) ; then
    echo -e "${green}Il y a bien le bon nombre de sauvegarde : ${output}${reset}"
else
    echo -e "${red}Le nombre de sauvegarde de gitea n'est pas bon : ${output}${reset}"
fi

#Commande pour recuper le dernier fichier et sa taille
cmd_dernier_fichier="ls -t ${remote_directory} | head -n 1"
dernier_fichier=$(eval "$cmd_dernier_fichier")
cmd_taille_fichier="du -b ${remote_directory}/${dernier_fichier} | awk '{print \$1}'"
taille_fichier=$(eval "$cmd_taille_fichier")
echo "Le dernier fichier de backup de la db gitea est ${dernier_fichier} avec une taille de ${taille_fichier} octets"

#-----------------------DB WEB-------------------------------
remote_directory="/root/bup_db_web/bup_hour_db_web"

command_to_execute="ls -lA ${remote_directory} | grep -c '^-'"

# Exécution de la commande
output=$(eval "$command_to_execute")

echo -e "${blue}---------------Backup db web-----------------------${reset}"

# Affichage de la sortie
if (( "$output" >= "10" && "$output" <= "12" )) ; then
    echo -e "${green}Il y a bien le bon nombre de sauvegarde : ${output}${reset}"
else
    echo -e "${red}Le nombre de sauvegarde de gitea n'est pas bon : ${output}${reset}"
fi

#Commande pour recuper le dernier fichier et sa taille
cmd_dernier_fichier="ls -t ${remote_directory} | head -n 1"
dernier_fichier=$(eval "$cmd_dernier_fichier")
cmd_taille_fichier="du -b ${remote_directory}/${dernier_fichier} | awk '{print \$1}'"
taille_fichier=$(eval "$cmd_taille_fichier")
echo "Le dernier fichier de backup de la db web est ${dernier_fichier} avec une taille de ${taille_fichier} octets"

#-----------------------NAGIOS-------------------------------
remote_directory="/root/nagios"

command_to_execute="ls -lA ${remote_directory} | grep -c '^-'"


# Exécution de la commande SSH
output=$(eval "$command_to_execute")

echo -e "${blue}---------------Backup nagios-----------------------${reset}"

# Affichage de la sortie
if (( "$output" >= "10" && "$output" <= "12" )) ; then
    echo -e "${green}Il y a bien le bon nombre de sauvegarde : ${output}${reset}"
else
    echo -e "${red}Le nombre de sauvegarde de nagios n'est pas bon : ${output}${reset}"
fi

#Commande pour recuper le dernier fichier et sa taille
cmd_dernier_fichier="ls -t ${remote_directory} | head -n 1"
dernier_fichier=$(eval "$cmd_dernier_fichier")
cmd_taille_fichier="du -b ${remote_directory}/${dernier_fichier} | awk '{print \$1}'"
taille_fichier=$(eval "$cmd_taille_fichier")
echo "Le dernier fichier de backup de nagios est ${dernier_fichier} avec une taille de ${taille_fichier} octets"


#-----------------------JENKINS-------------------------------
remote_directory="/root/jenkins"

command_to_execute="ls -lA ${remote_directory} | grep -c '^-'"


# Exécution de la commande SSH
output=$(eval "$command_to_execute")

echo -e "${blue}---------------Backup jenkins-----------------------${reset}"

# Affichage de la sortie
if (( "$output" >= "10" && "$output" <= "12" )) ; then
    echo -e "${green}Il y a bien le bon nombre de sauvegarde : ${output}${reset}"
else
    echo -e "${red}Le nombre de sauvegarde de jenkins n'est pas bon : ${output}${reset}"
fi

#Commande pour recuper le dernier fichier et sa taille
cmd_dernier_fichier="ls -t ${remote_directory} | head -n 1"
dernier_fichier=$(eval "$cmd_dernier_fichier")
cmd_taille_fichier="du -b ${remote_directory}/${dernier_fichier} | awk '{print \$1}'"
taille_fichier=$(eval "$cmd_taille_fichier")
echo "Le dernier fichier de backup de jenkins est ${dernier_fichier} avec une taille de ${taille_fichier} octets"