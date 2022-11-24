#!/bin/bash


echo "###############################################"
echo "Install Packages"
echo "###############################################"
sudo yum install httpd wget unzip -y > /dev/null

sudo systemctl start httpd
sudo systemctl enable httpd

mkdir -p /tmp/webfiles
cd /tmp/webfiles

echo "###############################################"
echo "Downloading Webfiles"
echo "###############################################"
wget "https://www.tooplate.com/download/2109_the_card" 


echo "###############################################"
echo "Extracting downloaded files"
echo "###############################################"
mv 2109_the_card webApp.zip && unzip webApp.zip > /dev/null


echo "###############################################"
echo "Cleaning and Copying files to server folder"
echo "###############################################"
sudo rm -rf /var/www/html/*
sudo cp -r 2109_the_card/* /var/www/html/

echo "###############################################"
echo "Restarting HTTPD Service"
echo "###############################################"
sudo systemctl restart httpd
 

echo "###############################################"
echo "Clean Temp Folder"
echo "###############################################"
sudo rm -rf /tmp/webfiles


echo "###############################################"
echo "Checking Service Status"
echo "###############################################"
sudo systemctl status httpd

ls /var/www/html


