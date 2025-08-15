#!/bin/bash
set -e

echo "[+] Updating packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "[+] Removing old versions of Docker if present..."
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

echo "[+] Installing required dependencies..."
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

echo "[+] Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg

echo "[+] Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[+] Updating package index..."
sudo apt-get update -y

echo "[+] Installing Docker CE, CLI, and Containerd..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[+] Enabling and starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "[+] Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "[✓] Docker installation completed!"
echo "You may need to log out and log back in to use Docker without sudo."
docker --version
