#!/bin/bash

echo "Instalando Consul--------------------"
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul -y
echo "Finaliza Consul Instalación ----------------"
echo " Inicia agente"
consul agent -ui -data-dir=. -node=agent-three -bind=192.168.100.4 -enable-script-checks=true -config-dir=/etc/consul.d