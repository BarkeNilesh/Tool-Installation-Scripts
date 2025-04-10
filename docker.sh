# Installation of Docker in Ubuntu
#!/bin/bash

#1. Update system packages
sudo apt update
sudo apt upgrade -y

#2. Install required dependencies
sudo apt install -y ca-certificates curl gnupg lsb-release

#3. Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg


#4. Set up the Docker repository
# Replace $(lsb_release -cs) with your Ubuntu codename if needed (e.g., jammy for 22.04).

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#5. Update apt again and install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#6. Verify Docker installation
sudo docker version

