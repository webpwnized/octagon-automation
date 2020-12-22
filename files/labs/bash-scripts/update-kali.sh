#!/bin/bash
apt-get update
apt-get dist-upgrade -y
apt-get autoremove -y
apt clean
apt-get remove javascript-common
(cd /opt/beef && ./update-beef)
(cd /var/www/mutillidae && git pull)
rm ~/.john/john.pot
history -c
bleachbit
