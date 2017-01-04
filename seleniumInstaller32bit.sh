sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y python-pip
sudo apt-get install -y python3-pip
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip
sudo apt-get install -y unzip
sudo pip install -U selenium
sudo -H pip install --upgrade selenium
sudo apt-get install -y python-setuptools
sudo pip3 install selenium
sudo pip3 install --upgrade selenium
sudo apt-get -y install xserver-xephyr
sudo pip3 install logbook
sudo pip3 install pymysql

# Install chromium browser
sudo apt-get install -y chromium-browser

# work for servers install pyvirtualdisplay module and extras...
sudo apt-get install -y xvfb
sudo easy_install pyvirtualdisplay
sudo pip3 install pyvirtualdisplay

# Geckodriver not running with firefox 50.0.1, so should be install downgrade 45.0.2 version
sudo apt-get remove firefox
sudo apt-get install -y firefox=45.0.2+build1-0ubuntu1

# Hold firefox version
sudo apt-mark hold firefox

# If you want to update firefox version, please uncomment bottom line
# sudo apt-mark unhold firefox

# Create all file for drivers and configure
mkdir /opt/seleniumdrivers
chmod 755 /opt/seleniumdrivers
cd /opt/seleniumdrivers
# Download and configure mozilla driver
wget https://github.com/mozilla/geckodriver/releases/download/v0.11.1/geckodriver-v0.11.1-linux32.tar.gz --no-check-certificate
tar -xvzf geckodriver-v0.11.1-linux32.tar.gz
rm geckodriver-v0.11.1-linux32.tar.gz
chmod +x geckodriver

# Download Java selenium server...
wget http://selenium-release.storage.googleapis.com/3.0/selenium-server-standalone-3.0.1.jar

# download and configure chrome driver
wget https://chromedriver.storage.googleapis.com/2.26/chromedriver_linux32.zip
unzip chromedriver_linux32.zip
rm chromedriver_linux32.zip
chmod +x chromedriver

# Add selenium files linux path 
echo "export PATH=$PATH:/opt/seleniumdrivers" >> /etc/profile

clear
echo "Installiation Complete :) Please restart system."
