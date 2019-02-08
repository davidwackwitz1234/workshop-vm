#!/usr/bin/env bash
DOCKER_COMPOSE_VERSION="1.23.1"
TERRAFORM_VERSION="0.11.11"

# Install Docker
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    python

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
curl -s -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# Install Terraform
apt-get install -y unzip
echo "Downloading terraform (${TERRAFORM_VERSION}) ..."
wget -P /tmp --quiet "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
echo "Setting up terraform (${TERRAFORM_VERSION}) ..."
unzip -o -d /usr/local/bin /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
chmod +x /usr/local/bin/terraform

# Install aws-cli
rm -rf /usr/local/aws && rm -rf /usr/local/bin/aws
wget -q "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && \
    rm -rf awscli-bundle

# Check versions
docker --version
docker-compose --version
terraform -v
aws --version