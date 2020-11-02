#!/usr/bin/env bash

git clone "https://github.com/timChase98/ECE256VunerableWebServer" /
cd /ECE256VunerableWebServer

python3 -m pip install django

ipaddr=`hostname -I | awk '{print $1}'`

sed -i "s/XXX/$ipaddr/g" djangoproject/settings.py

echo "/ECE256VunerableWebServer/manage.py runserver 0.0.0.0:8000 &" >> /etc/rc.local
