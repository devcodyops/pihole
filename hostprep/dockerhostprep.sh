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
#Install docker-compose pre-reqs (python3 and pip)
sudo apt -y install libffi-dev libssl-dev
sudo apt -y install python3-dev
sudo apt -y install python3 python3-pip
#
#Install docker-compose
sudo pip3 install docker-compose
#
#Install ssmtp and mail utils for automated email of provisioning completion
sudo apt -y install ssmtp mailutils mpack
sudo mv -f /usr/bin/ssmtp.conf /etc/ssmtp/ssmtp.conf
#
#Install curl
sudo apt -y intsall curl
#
#Install sensors
sudo apt -y install lm-sensors
#
#End pihole docker host prep