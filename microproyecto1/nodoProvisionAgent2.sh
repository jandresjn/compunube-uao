#!/bin/bash

echo "Instalando Consul--------------------"
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install consul -y
echo "Finaliza Consul Instalación ----------------"
echo " Inicia agente"
consul agent -ui -data-dir=. -node=agent-three -bind=192.168.100.4 -enable-script-checks=true -config-dir=/etc/consul.d

echo "instalando"
# Actualizar el sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar Node.js y npm
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Establecer la variable de entorno CI en true para evitar mensajes gráficos en npm
export CI=true

# Instalar paquetes de npm
sudo npm install -g gulp
sudo npm install -g webpack
 # Agrego el cómo se vería (lo que mostré en el gedit durante la presentación)
git clone https://github.com/omondragon/consulService
cd consulService/app
sed -i 's/HOST='"'"'192.168.100.3'"'"'/HOST='"'"'192.168.100.4'"'"'/g' index.js

# Nótese que desde la versión anterior del github había agregado el haproxy.cfg en la carpeta src para hacer la modificación desde allí.

sudo cp -f /srv/website/haproxy.cfg /etc/haproxy/haproxy.cfg 


