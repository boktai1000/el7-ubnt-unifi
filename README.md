# Unofficial EL7 UniFi Install Script by boktai1000
GitHub Site Link:
* https://github.com/boktai1000/el7-ubnt-unifi

Based on the following installation script:
* https://community.ubnt.com/t5/UniFi-Wireless/Installing-UniFi-on-CentOS7-as-a-service/m-p/1973439/highlight/true#M234790 
* **Special thanks to Ubiquiti forum user OverkillSD, who created the original script this is based off of** 

## About this script - Read me first!

This installation script is a fork of the installation script by Ubiquiti forum user **OverkillSD** with a few minor edits to fit my preferences and needs, with some additional flexibility in some areas. For example, one area where this script differs is the exclusion of the smartmontools package which I didn't see the need for.

The biggest area where my script differs is that UniFi controller versions have to be selected manually, meaning that by default the script will actually not work by default. You will have to modify the script to insert the version number you'd like to target for your Ubiquiti UniFi Controller.

This script is targeting MongoDB 3.4.x by default as that is the recommended version from Ubiquiti as of this time of writing. If this ever changes in the future, selecting a new version should be as simply as modifying the variable where you select your Ubiquiti UniFi controller version, but I've prepopulated this field for MongoDB already. 

See the follow information for information from Ubiquiti regarding MongoDB versions:
* https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

You can run the scripts directly with the following commands or reference them directly in the repository and copy or SCP the files over.

## Giving users a choice

This script is all about giving users a choice on what version they want to download, and what is right for their environment. Keeping that idea in mind, I thought it would be nice to also list a couple alternatives for users to evaluate or look at which may provide a better experience based on what you're looking for, as well as what Operating System you're working with.

Official Ubiquiti Installation Guide
* https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

UniFi Installation Scripts by AmazedMender16
* https://community.ubnt.com/t5/UniFi-Wireless/UniFi-Installation-Scripts-UniFi-Easy-Update-Scripts-Works-on/td-p/2375150

Installing UniFi on CentOS7 as a service by yaplej
* https://community.ubnt.com/t5/UniFi-Wireless/Installing-UniFi-on-CentOS7-as-a-service/td-p/1524666
* https://docs.google.com/document/d/1aroCdNzB9NR7PIvqF5J_6vi0nHqsiJPI1rTG3O9Vwc4/edit?usp=sharing 

Unofficial RHEL/CentOS UniFi Controller rpm packages
* https://community.ubnt.com/t5/UniFi-Wireless/Unofficial-RHEL-CentOS-UniFi-Controller-rpm-packages/td-p/1744595

# Installing the UniFi Controller

## Option 1: (Default) Install LTS Stable 
You can run it directly with
* `curl -s https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-install-unifi.sh | sudo bash`

## Option 2: Grab latest version of other branches
Download the script to your box with wget, or copy/paste it manually.
* `wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-install-unifi.sh`

Select your branch
* `vi el7-install-unifi.sh`
* Comment out the LTS Stable branch
* `#unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">LTS Stable<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"`
* Uncomment the branch of your choice

Set the script as executable
* `chmod +x el7-install-unifi.sh`

Run the script to begin automated installation
* `sudo ./el7-install-unifi.sh`


## Option 3: Manually target version of choice
Download the script to your box with wget, or copy/paste it manually.
* `wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-install-unifi.sh`

Select your target version
* `vi el7-install-unifi.sh`
* Comment out LTS Stable and then uncomment unifiversion="x.x.xx"
* `#unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">LTS Stable<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"`
* `unifiversion="x.x.xx"`
* Replace unifiversion="x.x.xx" with the version number you want to target, leave the version number inside the quotes

Set the script as executable
* `chmod +x el7-install-unifi.sh`

Run the script to begin automated installation
* `sudo ./el7-install-unifi.sh`

# Updating the UniFi Controller

## Option 1: (Default) Install LTS Stable 
You can run it directly with
* `curl -s https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh | sudo bash`

## Option 2: Grab latest version of other branches
Download the script to your box with wget, or copy/paste it manually.
* `wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh`

Select your branch
* `vi el7-update-unifi.sh`
* Comment out the LTS Stable branch
* `#unifiversion="$(curl --silent --include --no-buffer --header "Connection: Upgrade" --header "Upgrade: websocket" --header "Sec-WebSocket-Version: 13" https://help.ubnt.com/hc/en-us/articles/360008240754#1 | grep -A1 ">LTS Stable<" | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")"`
* Uncomment the branch of your choice

Set the script as executable
* `chmod +x el7-update-unifi.sh`

Run the script to begin automated installation
* `sudo ./el7-update-unifi.sh`



## Option 3: Manually target version of choice
Download the script to your box with wget, or copy/paste it manually.
* `wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh`

Set your target version
* `vi el7-update-unifi.sh`
* Replace unifiversion="x.x.xx" with your preferred version from https://help.ubnt.com/hc/en-us/articles/360008240754#1 
* Leave the version number you select inside the quotes
* Note that it is recommended to target the same branch that you're currently on, or be sure to read information about upgrade from branches

Set the script as executable
* `chmod +x el7-update-unifi.sh`

Run the script to begin automated upgrade
* `sudo ./el7-update-unifi.sh`
