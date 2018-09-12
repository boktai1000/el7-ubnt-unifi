# Unofficial EL7 UniFi Controller Installation Script by boktai1000
GitHub Site Link:
* https://github.com/boktai1000/el7-ubnt-unifi

Based on the following installation script:
* https://community.ubnt.com/t5/UniFi-Wireless/Installing-UniFi-on-CentOS7-as-a-service/m-p/1973439/highlight/true#M234790 
* **Special thanks to Ubiquiti Forum User OverkillSD, who created the original script this is based off of.** 

This installation script is a fork of said script with a few minor edits to fit my preferences and needs, with some additional flexibility in some areas. For example one area where this script differs is the exclusive of the smartmontools package which I didn't see the need for.

The biggest area where my script differs is that versions have to be selected manually, meaning that by default the script will actually not work by default. You will have to modify the script to insert the version number you'd like to target for your Ubiquiti UniFi Controller.

This script is targetting MongoDB 3.4.x by default as that is the recommended version from Ubiquiti as of this time of writing. If this ever changes in the future, selecting a new version should be as simply as modifying the variable where you select your Ubiquiti UniFi controller version, but I've prepopulated this field for MongoDB already. 

See the follow information for information from Ubiquiti regarding MongoDB versions:
* https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

You can run the scripts directly with the following commands, or reference them directly in the repository and copy or SCP the files over.


## Installing the UniFi Controller

Download the script to your box with wget, or copy/paste it manually.
* `wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-install-unifi.sh`

Set the script as executable
* `chmod +x el7-install-unifi.sh`

Set your target version
* `vi el7-install-unifi.sh`
* Replace unifiversion="x.x.xx" with your preferred version from https://help.ubnt.com/hc/en-us/articles/360008240754#1 

Run the script to begin automated installation
* `sudo ./el7-install-unifi.sh`


## Updating the UniFi Controller

Download the script to your box with wget, or copy/paste it manually.
* `wget https://raw.githubusercontent.com/boktai1000/el7-ubnt-unifi/master/scripts/el7-update-unifi.sh`

Set the script as executable
* `chmod +x el7-update-unifi.sh`

Set your target version
* `vi el7-update-unifi.sh`
* Replace unifiversion="x.x.xx" with your preferred version from https://help.ubnt.com/hc/en-us/articles/360008240754#1 
* Note that it is recommended to target the same branch that you're currently on, or be sure to read information about upgrade from branches

Run the script to begin automated installation
* `sudo ./el7-update-unifi.sh`
