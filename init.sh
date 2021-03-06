#!/bin/bash
cd /srv/
# Setup nginx
bash nginx/nginx.sh
sudo nginx -s reload
# Setup wstunnel
apt install unzip

wget https://github.com/erebe/wstunnel/releases/download/v3.0/wstunnel-x64-linux.zip 
unzip wstunnel-x64-linux.zip
sudo chmod 755 /srv/wstunnel
cd /home/ubuntu/my-cloud-init
sudo ln -sf /srv/wstunnel /usr/bin/wstunnel
sudo cp wstunnel.service /etc/systemd/system/wstunnel.service
sudo systemctl enable wstunnel && sudo systemctl restart wstunnel
# Setup Openvpn

