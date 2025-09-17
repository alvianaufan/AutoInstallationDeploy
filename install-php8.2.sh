#!/bin/bash
set -e

echo "=== PHP 8.2 + PHP-FPM Installer Script ==="

# Install prerequisites
sudo apt install -y software-properties-common ca-certificates lsb-release apt-transport-https

# Add Ondřej Surý's PPA for PHP
sudo add-apt-repository -y ppa:ondrej/php

# Update package lists again
sudo apt update -y

# Install PHP 8.2 with common extensions and FPM
sudo apt install -y \
  php8.2 \
  php8.2-cli \
  php8.2-common \
  php8.2-mysql \
  php8.2-xml \
  php8.2-mbstring \
  php8.2-curl \
  php8.2-zip \
  php8.2-bcmath \
  php8.2-intl \
  php8.2-gd \
  php8.2-fpm

# Enable and start PHP-FPM service
sudo systemctl enable php8.2-fpm
sudo systemctl start php8.2-fpm

# Verify installation
php -v
systemctl status php8.2-fpm --no-pager

echo "=== PHP 8.2 + PHP-FPM installation completed successfully! ==="
