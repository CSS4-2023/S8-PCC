#!/bin/bash

# Chemin du dossier source
src_dir="/usr/local/pnp4nagios/var"

# Chemin du dossier de destination
dest_dir="/usr/local/pnp4nagios"

# Nom du fichier .tgz
bup_zip="perfdata_$(date +%d-%m-%Y-%H:%M).zip"

cd $src_dir

# Création de l'archive .tgz
zip -r "$dest_dir/$bup_zip" perfdata/

# Transfert du fichier .tgz vers le serveur distant avec scp
sudo scp -i /vagrant/data/backup_key -o 'StrictHostKeyChecking no' "$dest_dir/$bup_zip" root@192.168.4.110:/root/nagios

# Suppression du zip
rm -rf "$dest_dir/$bup_zip"