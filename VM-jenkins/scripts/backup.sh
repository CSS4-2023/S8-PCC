#!/bin/bash

# Chemin du dossier source
src_dir=".jenkins/"

# Chemin du dossier de destination
dest_dir="/root"

# Nom du fichier .zip
bup_zip="$(date +%d-%m-%Y-%H:%M)_bup_jenkins.zip"

cd $dest_dir

# Création de l'archive .zip
zip -r "$dest_dir/$bup_zip" $src_dir

# Transfert du fichier .tgz vers le serveur distant avec scp
sudo scp -i /vagrant/data/backup_key -o 'StrictHostKeyChecking no' "$dest_dir/$bup_zip" root@192.168.4.110:/root/jenkins

# Suppression du zip
rm -rf "$dest_dir/$bup_zip"
