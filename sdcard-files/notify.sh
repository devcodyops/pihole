#!/bin/bash
#
#
#run this to create environment variables and run the discord notify script to deployment completion
#
#create environment variables (update)
#
export webhook_message="pihole server deployed at '$(date +%T)'"
export webhook_url="Insert your Discord Server Channel webhook URL here"
#
#make discord notify script executable and run
sudo chmod u+x /home/ubuntu/pihole/docker/discord-notify-v2.sh
/home/ubuntu/pihole/docker/discord-notify-v2.sh