#!/bin/bash

echo "#########################################################"
date
echo "#########################################################"

sudo ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? == 0 ]
then
	echo "################HTTPD Service is running#################"
else
	echo "##############HTTPD Service is not running###############"
	echo "#########################################################"
	echo "#################Turning on the process##################"
	echo "#########################################################"
	sudo systemctl start httpd
	if [ $? -eq 0 ]
	then
		echo "Process stated successfully"
	else
		echo "Process Starting Failed, contact the admin"
	fi
fi
