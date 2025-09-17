#!/bin/bash

# Bash script to install Supervisor on Ubuntu

set -e  # Exit immediately if a command exits with a non-zero status

echo "Updating package list..."
sudo apt update -y

echo "Installing Supervisor..."
sudo apt install -y supervisor

echo "Enabling Supervisor to start on boot..."
sudo systemctl enable supervisor

echo "Starting Supervisor service..."
sudo systemctl start supervisor

echo "Checking Supervisor status..."
sudo systemctl status supervisor --no-pager

echo "Supervisor installation and setup completed!"
