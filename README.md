# The Unofficial CentOS/RHEL Ubiquiti UniFi Installation Script

Based on the following installation script https://community.ubnt.com/t5/UniFi-Wireless/Installing-UniFi-on-CentOS7-as-a-service/m-p/1973439/highlight/true#M234790 

I have modified it slightly to remove a few unnecessary lines and packages such as smartmontools that I didn't see a need for, as well as some commented out lines that I didn't need to be in my script to make it flow a bit better and read easier.

I liked using this as a basis because it's nice to have the entire process scripted for one, as well as because of the issues of MongoDB 3.6.x that Ubiquiti are advising against from using, and recommending version 3.4.x which this script makes it incredible easy to select which version of MongoDB you want to use.

If you're interested in reading more about the MongoDB 3.6.x issues / recommendations on using MongoDB 3.4.x check out the following links, but without further ado please see the scripts in this respository. All credit to user OverkillSD who I forked this from and made adjustments to fit my needs, link to his original script and post above.

* https://community.ubnt.com/t5/UniFi-Routing-Switching/MongoDB-3-6/td-p/2195435
* https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-8-28-Stable-has-been-released/ba-p/2449036
* https://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-SDN-Controller-5-6-39-LTS-Stable-has-been-released/ba-p/2398954
* Linux systems must be running a version of MongoDB prior to 3.6.x. We recommend 3.4.x. This is most likely to be an issue on Ubuntu 18.04 LTS, as it currently offers MongoDB 3.6.x.
