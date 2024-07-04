#!/bin/bash
sudo apt-get update
sudo apt-get install -y nodejs npm
cd /home/adam_boonchaya/node-hello
sudo ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
sudo git config --global --add safe.directory /home/adam_boonchaya/node-hello
sudo git pull
sudo npm install
sudo cp -r * /var/www/html
sudo rm -rf /var/www/html/.git
sudo chown -R www-data:www-data /var/www/html/*
cd /var/www/html

# Start the Node.js application using pm2
sudo pm2 start /var/www/html/your-app-file.js --name "node-hello"

# Ensure pm2 restarts the app on reboot
sudo pm2 startup systemd
sudo pm2 save


