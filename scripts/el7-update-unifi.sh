#!/bin/bash

#Update UniFi:

#You can run it directly with curl -s https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh | sudo bash

#Set version numbers for download:
unifiversion="$(curl -L --silent https://help.ubnt.com/hc/en-us/articles/115000441548-UniFi-Current-Controller-Versions | grep -oP "LTS \K([0-9\.]+)")"
 
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
