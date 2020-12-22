#!/bin/bash

# Name: start-apache.sh
# Author: Jeremy Druin
# Description: Attempts to start Apache2 web server in case Apache failed to start during boot

MAX_TRIES=5
WAIT_TIME="10s"

MESSAGE="[*] Going to check status of Apache web server. Will try to start Apache up to $MAX_TRIES times"
logger -s $MESSAGE

export DISPLAY=:0
notify-send "Starting Apache Web Server"

for i in {1..$MAX_TRIES}
do
	logger -s "[*] Checking status of Apache web server"
	ps auxw | grep apache2 | grep -v grep > /dev/null

	if [ $? != 0 ]
	then
		logger -s "[*] Trying to start Apache web server"
		/etc/init.d/apache2 start > /dev/null
		logger -s "[*] Waiting $WAIT_TIME seconds fo Apache web server to start"
		sleep $WAIT_TIME
	else
		logger -s "[*] Apache web server started"
		notify-send "Apache Started"
		break;
	fi
done
