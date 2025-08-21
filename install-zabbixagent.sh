sudo wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu$(lsb_release -rs)_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu$(lsb_release -rs)_all.deb
sudo apt update
sudo apt -y install zabbix-agent
sudo systemctl restart zabbix-agent 
sudo systemctl enable zabbix-agent
echo "ServerActive=139.59.105.236" | sudo tee -a /etc/zabbix/zabbix_agentd.conf
echo "Hostname=$(hostname)" | sudo tee -a /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent 
