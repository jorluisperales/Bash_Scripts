#!/bin/bash

# Installing Dependencies
echo "###########################################"
echo "Installing packages"
echo "###########################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service
echo "###########################################"
echo "Start & Enable HTTPD Service"
echo "###########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating a Temp Directory
echo "###########################################"
echo "Starting Artifact Deployment"
echo "###########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2131_wedding_lite.zip > /dev/null
unzip 2131_wedding_lite.zip > /dev/null
sudo cp -r 2131_wedding_lite/* /var/www/html
echo

# Bounce Service
echo "###########################################"
echo "Restarting HTTPD service"
echo "###########################################"
systemctl restart httpd
echo

# Clean up
echo "###########################################"
echo "Removing Temporary Files"
echo "###########################################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html
