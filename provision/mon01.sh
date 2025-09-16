#!/bin/bash

sudo apt-get update -y

sudo apt-get install -y apt-transport-https software-properties-common wget

sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

sudo apt-get update

echo "install grafana"

sudo apt-get install grafana

echo "install loki"

wget https://github.com/grafana/loki/releases/download/v3.5.5/loki-linux-amd64.zip

unzip loki-linux-amd64.zip

sudo chmod +x loki-linux-amd64

sudo mv loki-linux-amd64 /usr/local/bin/loki

rm loki-linux-amd.zip

echo "create configs for loki"

sudo mkdir -p /etc/loki
sudo cp /vagrant/configs/loki-config.yaml /etc/loki/config.yaml
sudo cp /vagrant/systemd/loki.service /etc/systemd/system/

echo "install tempo"

wget https://github.com/grafana/tempo/releases/download/v2.8.2/tempo_2.8.2_linux_amd64.tar.gz
tar -xvf tempo_2.8.2_linux_amd64.tar.gz
sudo mv tempo /usr/local/bin/tempo
rm tempo_2.8.2_linux_amd64.tar.gz

echo "create configs for tempo"
sudo mkdir -p /etc/loki
sudo cp /vagrant/configs/tempo-config.yaml /etc/tempo/config.yaml
sudo cp /vagrant/systemd/tempo.service /etc/systemd/system/

# for update unit-files in systemd
sudo systemctl daemon-reload
# for auto start when VMs running
sudo systemctl enable grafana-server loki tempo
# for start services
sudo systemctl restart grafana-server loki tempo