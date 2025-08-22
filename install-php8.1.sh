#!/bin/sh
#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset
#
# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
#
echo -n "$Cyan \n Installing PHP.. $Color_Off"
echo -n "$Cyan \n Installing PHP in Progress \n $Color_Off"
sudo apt update -y > /dev/null 2>&1
echo "=== Installing required dependencies ==="
sudo apt-get install software-properties-common -y >/dev/null 2>&1

echo "=== Adding PHP PPA repository (ondrej/php) ==="
sudo add-apt-repository ppa:ondrej/php -y >/dev/null 2>&1

echo "=== Updating package lists ==="
sudo apt-get update -y >/dev/null 2>&1

echo "=== Installing PHP 8.1 and extensions ==="
sudo apt-get install -y \
  php8.1-cli \
  php8.1-curl \
  php8.1-gd \
  php8.1-gmp \
  php8.1-mbstring \
  php8.1-mysql \
  php8.1-snmp \
  php8.1-xml \
  php8.1-zip \
  php8.1-fpm >/dev/null 2>&1

echo "=== PHP 8.1 installation completed successfully ==="
php -m
php -v
#install-compser
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer
