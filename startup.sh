#!/bin/bash

# Update package repositories and install Node.js and npm
sudo apt-get update
sudo apt-get install -y nodejs npm

# Create directory for Node.js installation and extract Node.js binaries
mkdir /opt/nodejs
sudo curl -sL https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.gz | sudo tar -xz -C /opt/nodejs --strip-components=1

# Create symbolic links to node and npm binaries
sudo ln -s /opt/nodejs/bin/node /usr/bin/node
sudo ln -s /opt/nodejs/bin/npm /usr/bin/npm

# Navigate to your Node.js application directory
cd /home/adam_boonchaya/node-hello

# Add GitHub SSH key to known_hosts (if needed for private repositories)
sudo ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Configure Git settings (optional, for updating the repository)
sudo git config --global --add safe.directory /home/adam_boonchaya/node-hello

# Pull latest changes from Git repository
sudo git pull

# Install Node.js application dependencies
sudo npm install

# Start Node.js server as a background process
nohup node server.js > server.log 2>&1 &
