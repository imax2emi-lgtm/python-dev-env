#!/bin/bash

# Update and upgrade system
echo "Updating system packages..."
apt-get update
apt-get upgrade -y

# Install essential packages
echo "Installing essential packages..."
apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    tree \
    htop \
    net-tools \
    openssh-server \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libffi-dev

# Install Python build dependencies
echo "Installing Python build dependencies..."
apt-get install -y \
    make \
    gcc \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    liblzma-dev

# Configure Git
echo "Configuring Git..."
git config --global user.name "Vagrant User"
git config --global user.email "vagrant@localhost"
git config --global init.defaultBranch main

# Create development directory structure
echo "Creating directory structure..."
mkdir -p /home/vagrant/workspace
mkdir -p /home/vagrant/.local/bin
mkdir -p /home/vagrant/.virtualenvs

# Add to PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/vagrant/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> /home/vagrant/.bashrc
echo 'eval "$(pyenv init --path)"' >> /home/vagrant/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> /home/vagrant/.bashrc

# Set proper ownership
chown -R vagrant:vagrant /home/vagrant

echo "Bootstrap script completed successfully!"