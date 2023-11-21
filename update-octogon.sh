#!/bin/bash

# Remove JTR Pot file to reset JTR
rm /root/.john/john.pot
touch /root/.john/john.pot

# Update Kali
/root/Scripts/update-kali.sh

# Update the docker compose project
cd /root/mutillidae-dockerhub/
git pull

# Check if Mutillidae works
cd /root/mutillidae-dockerhub/
git pull
./scripts/stop-containers.sh
./scripts/remove-all-images.sh
./scripts/start-containers.sh
firefox http://mutillidae.local/

# Download a copy of Mutillidae source code to use with OWASP dependency check
cd /var/www/mutillidae/
git pull

# Update Ruby Gems
# If Beef update or bundler install fails, install the missing gems using "gem install <gem name>"
gem update

# Update Beef
cd /opt/beef/
/opt/beef/update-beef
sed -i 's/user:   "beef"/user:   "beefy"/' /opt/beef/config.yaml
sed -i 's/passwd: "beef"/passwd: "beefy"/' /opt/beef/config.yaml

# Check if Beef still works
cd /opt/beef
notify-send -u normal -t 10000 "Starting Beef Framework. Browse to Beef Login to make sure Beef still works"
./beef

# Check if required software is still installed
echo "Required Software"; echo "";
echo -n "Location of Hydra: "; which hydra; echo "";
echo -n "Location of Netcat: "; which netcat; echo "";
echo -n "Location of Wireshark: "; which wireshark; echo "";
echo -n "Location of TCPDump: "; which tcpdump; echo "";
echo -n "Location of John the Ripper: "; which john; echo "";

# Clear bash history
history -c

# Delete files in /tmp
rm /tmp/*

# Delete unneeded files
bleachbit

#Overwrite free disk space with zeros
sfill -fllvz /
