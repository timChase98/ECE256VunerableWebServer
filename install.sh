#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo -e "\x1b[91mPlease run as root\x1b[0m"
  exit
fi

git clone "https://github.com/timChase98/ECE256VunerableWebServer" /djangoproject
cd /djangoproject
# apt-get update
apt-get install -y python3-django

ipaddr=`hostname -I | awk '{print $1}'`
sed -i "s/XXX/$ipaddr/g" djangoproject/settings.py

cp djangoWeb.service /lib/systemd/system/
chmod 644 /lib/systemd/system/djangoWeb.service
sudo systemctl daemon-reload
sudo systemctl enable djangoWeb.service
reboot now
