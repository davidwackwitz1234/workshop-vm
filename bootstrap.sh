#!/usr/bin/env bash
DOCKER_COMPOSE_VERSION="1.22.0"
TERRAFORM_VERSION="0.11.8"

# Install Docker
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88 > /dev/null

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce

usermod -aG docker vagrant

# Install docker-compose
sudo curl -s -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


# Install Terraform
apt-get install -y unzip
echo "Downloading terraform (${TERRAFORM_VERSION}) ..."
wget -P /tmp --quiet "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
echo "Setting up terraform (${TERRAFORM_VERSION}) ..."
unzip -o -d /usr/local/bin /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
chmod +x /usr/local/bin/terraform