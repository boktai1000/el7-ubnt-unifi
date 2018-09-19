#!/bin/bash

#Update UniFi:
#Based on https://community.ubnt.com/t5/UniFi-Wireless/Installing-UniFi-on-CentOS7-as-a-service/m-p/1973439/highlight/true#M234790

#Install UniFi:
#Based on https://community.ubnt.com/t5/UniFi-Wireless/Installing-UniFi-on-CentOS7-as-a-service/m-p/1973439/highlight/true#M234790
#
###Option 1: (Default) Upgrade LTS Stable
##You can run it directly with curl -s https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh | sudo bash
##LTS Stable
unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">LTS Stable<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"
#
#
#
###Option 2: Grab latest version of other branches, be sure to comment out LTS Stable, and then uncomment your version of choice
##Download the script with wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh
##Modify your script with vi el7-update-unifi.sh to set your version for the UniFi Controller
##Set the script as executable with chmod +x el7-update-unifi.sh
##Run the script with sudo ./el7-update-unifi.sh
##
##LTS Stable Candidate
#unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">LTS Stable Candidate<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"
#
##Stable
#unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">Stable<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"
#
##Stable Candidate (Beta Blog)
#unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">Stable Candidate (Beta Blog)<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"
#
##Stable Candidate (Updates Blog)
#unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">Stable Candidate (Updates Blog)<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"
#
#
#
###Option 3: Manually target version of choice, be sure to comment out LTS Stable and then uncomment unifiversion="x.x.xx"
##Replace unifiversion="x.x.xx" with the version number you want to target from the web page, leave the version number inside the quotes
##Set the script as executable with chmod +x el7-update-unifi.sh
##Run the script with sudo ./el7-update-unifi.sh
#unifiversion="x.x.xx"
 
#Stop Service:
systemctl stop unifi

#Download latest software:
cd /usr/src
wget "http://dl.ubnt.com/unifi/$unifiversion/UniFi.unix.zip" -O /usr/src/UniFi.unix.zip

#Extract UniFi Video software:
unzip UniFi.unix.zip -d /opt/

#Set permissions:
chown -R unifi:unifi /opt/UniFi
chown -R unifi:unifi /var/opt/UniFi

#Start Service:
systemctl start unifi
