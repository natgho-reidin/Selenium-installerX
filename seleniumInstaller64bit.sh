#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

apt-get -y update
apt-get -y upgrade
apt-get install -y python-pip
apt-get install -y python3-pip
pip install --upgrade pip
pip3 install --upgrade pip
apt-get install -y unzip
pip install -U selenium
pip install --upgrade selenium
apt-get install -y python-setuptools
pip3 install selenium
pip3 install --upgrade selenium
apt-get -y install xserver-xephyr
pip3 install logbook
pip3 install pymysql
easy_install email

# Install chromium browser
apt-get install -y chromium-browser

# work for servers install pyvirtualdisplay module and extras...
apt-get install -y xvfb
easy_install pyvirtualdisplay
pip3 install pyvirtualdisplay

# Geckodriver not running with firefox 50.0.1, so should be install downgrade 45.0.2 version
apt-get -y remove firefox
apt-get install -y firefox=45.0.2+build1-0ubuntu1

# Hold firefox version
apt-mark hold firefox

# If you want to update firefox version, please uncomment bottom line
# apt-mark unhold firefox

# Create all file for drivers and configure
mkdir /opt/seleniumdrivers
chmod 755 /opt/seleniumdrivers
cd /opt/seleniumdrivers

# Download and configure mozilla driver
wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux64.tar.gz --no-check-certificate
tar -xvzf geckodriver-v0.11.1-linux64.tar.gz
rm geckodriver-v0.11.1-linux64.tar.gz
chmod +x geckodriver

# Download Java selenium server...
wget http://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.1.jar

# download and configure chrome driver
wget https://chromedriver.storage.googleapis.com/2.26/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
rm chromedriver_linux64.zip
chmod +x chromedriver

# Add selenium files linux path 
sh -c "echo 'export PATH=$PATH:/opt/seleniumdrivers' >> /etc/profile"

clear
echo "Installiation Complete :) Please restart system."
