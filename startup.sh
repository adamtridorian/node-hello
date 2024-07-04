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
sudo npm start


