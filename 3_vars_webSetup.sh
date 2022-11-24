#!/bin/bash


#Variables Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/download/2109_the_card"
ARTFACT="2109_the_card"
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
wget $URL 


echo "###############################################"
echo "Extracting downloaded files"
echo "###############################################"
mv $ARTFACT webApp.zip && unzip webApp.zip > /dev/null


echo "###############################################"
echo "Cleaning and Copying files to server folder"
echo "###############################################"
sudo rm -rf /var/www/html/*
sudo cp -r $ARTFACT/* /var/www/html

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

ls $TEMPDIR
