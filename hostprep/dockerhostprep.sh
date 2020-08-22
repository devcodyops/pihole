#!/bin/bash
#
#Update Ubuntu
#
sudo apt update && sudo apt -y upgrade
#
##Disable ubuntu dns server service
#
sudo systemctl stop systemd-resolved.service
sudo systemctl disable systemd-resolved.service
#
#Update/Add DNS server to /etc/resolv.conf file
#sudo nano resolv.conf
#
sudo sed -i "s:nameserver 127.0.0.53:nameserver 8.8.8.8:g" /etc/resolv.conf
#
#change hostname to pihole
#
sudo sed -i "s:ubuntu:pihole:g" /etc/hostname
#
#Update /etc/hosts file to resolve pihole hostname
#
sudo sed '2i 127.0.0.1 pihole' /etc/hosts > hosts.new
sudo cp hosts.new /etc/hosts
#
#Install Docker
#
sudo apt -y install docker.io
#
#Install Docker Compose
#
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
#
#End pihole docker host prep