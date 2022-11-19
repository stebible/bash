#!/bin/bash


#Variables Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL="https://www.tooplate.com/download/2209_the_card"
#2=`cut -d / -f 5 $2`
TEMPDIR="/tmp/webfiles"



echo "###############################################"
echo "Install Packages"
echo "###############################################"
sudo yum install $PACKAGE -y > /dev/null


echo "###############################################"
echo "Start and Enable HTTPD Service"
echo "###############################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC

mkdir -p $TEMPDIR
cd $TEMPDIR

echo "###############################################"
echo "Downloading Webfiles"
echo "###############################################"
wget $1


echo "###############################################"
echo "Extracting downloaded files"
echo "###############################################"
mv $2 webApp.zip && unzip webApp.zip > /dev/null


echo "###############################################"
echo "Cleaning and Copying files to server folder"
echo "###############################################"
sudo rm -rf /var/www/html/*
sudo cp -r $2/* /var/www/html

echo "###############################################"
echo "Restarting HTTPD Service"
echo "###############################################"
sudo systemctl restart $SVC
 

echo "###############################################"
echo "Clean Temp Folder"
echo "###############################################"
sudo rm -rf $TEMPDIR


echo "###############################################"
echo "Checking Service Status"
echo "###############################################"
sudo systemctl status $SVC

ls /var/www/html
