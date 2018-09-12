#!/bin/bash

#Update UniFi:
#Based on https://community.ubnt.com/t5/UniFi-Wireless/Installing-UniFi-on-CentOS7-as-a-service/m-p/1973439/highlight/true#M234790

#Download the script with wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh

#REQUIRED / IMPORTANT OR ELSE THE SCRIPT WILL FAIL TO DOWNLOAD
#Modify your script with vi el7-update-unifi.sh to set your version for the UniFi Controller
#Select your version number from the current UniFi Controller software versions web page https://help.ubnt.com/hc/en-us/articles/360008240754#1
#Replace unifiversion="x.x.xx" with the version number you want to target from the web page, leave the version number inside the quotes

#Set the script as executable with chmod +x el7-update-unifi.sh
#Run the script with sudo ./el7-update-unifi.sh

#Set version numbers for download here:
unifiversion="x.x.xx"
 
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
