#!/bin/bash

# Setup nginx
bash nginx/nginx.sh
sudo nginx -s reload
# Setup wstunnel
apt install unzip
wget https://github.com/erebe/wstunnel/releases/download/v3.0/wstunnel-x64-linux.zip 
unzip wstunnel-x64-linux.zip
sudo chmod 755 wstunnel
sudo ln -s $PWD/wstunnel /usr/bin/wstunnel
sudo cp wstunnel.service /etc/systemd/system/
systemctl enable wstunnel && systemctl restart wstunnel
# Setup Openvpn