#!/bin/bash
#
#Script to Notify final provisioning complete
#
#Check Docker container status and write to file
sudo docker ps -a > /home/ubuntu/dockerstatus.txt
#
#Email deployment status your email address (use your email address you configured in /etc/ssmtp/ssmtp.conf)
#
sudo mpack -s "Pihole Deployed" /home/ubuntu/dockerstatus.txt devcodyops@gmail.com
#
#End script