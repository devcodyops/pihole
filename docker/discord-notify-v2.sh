#!/bin/bash
#
##to run this script you need to export $webhook_message and $webhook_url variables with your custom values and then call this script 
#
message=\"$webhook_message\"
url="$webhook_url"
#
## discord webhook
#echo $message
#echo $url
#
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $message}" $url