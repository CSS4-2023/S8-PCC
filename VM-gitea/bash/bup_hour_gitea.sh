#!/bin/bash

current_date=$(date +"%Y-%m-%d")
current_time=$(date +"%H:%M:%S")

path="/vagrant/bup_hour_gitea/${current_date}_${current_time}_bup_gitea.zip"

cd /tmp
sudo -u git /usr/local/bin/gitea dump -c /etc/gitea/app.ini -f /home/git/bup_gitea
sudo mv /home/git/bup_gitea.zip $path
sudo scp -i /vagrant/data/backup_key -o 'StrictHostKeyChecking no' $path root@192.168.4.110:/root/bup_gitea/bup_hour_gitea
rm -rf $path
