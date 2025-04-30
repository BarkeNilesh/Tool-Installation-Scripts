#!/bin/bash

echo "Removing any old Docker installation..."
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

echo "Installing dependencies..."
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

echo "Adding Docker CE repo..."
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "Installing latest Docker..."
sudo yum install -y docker-ce docker-ce-cli containerd.io

echo "Enabling and starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding user to docker group..."
sudo usermod -aG docker $USER

echo "Docker version:"
docker --version

echo "✅ Docker is installed. Run 'newgrp docker' or re-login to use Docker without sudo."

