#!/bin/bash

# Update the package index
sudo apt update

# Install required packages to allow apt to use a repository over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again after adding the repository
sudo apt update

# Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Start and enable the Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add the current user to the 'docker' group to avoid using 'sudo' with Docker
sudo usermod -aG docker $USER
#after this user need to logout and log back in for group membership change to take place

# Print Docker version
docker version

