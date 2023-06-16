#!/bin/bash

IP=$(hostname -I | awk '{print $2}')

LOG_FILE="/vagrant/logs/install_wazuh.log"
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"

echo "START - Install VM Wazuh - "$IP

echo "=> [1]: Installing required packages..."

apt-get install curl -y
apt-get update $APT_OPT >> $LOG_FILE 2>&1
apt upgrade -y >> $LOG_FILE 2>&1

echo "=> [2]: Wazuh Start Configuration"

curl -so wazuh-agent.deb https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.4.3-1_amd64.deb && sudo WAZUH_MANAGER='172.16.2.12' WAZUH_AGENT_GROUP='default' dpkg -i ./wazuh-agent.deb

sudo systemctl daemon-reload
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent
