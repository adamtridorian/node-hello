#!/bin/bash
sudo apt-get update
sudo apt-get install -y nodejs npm
mkdir /opt/nodejs
sudo curl https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.gz | tar xvzf - -C /opt/nodejs --strip-components=1
ln -s /opt/nodejs/bin/node /usr/bin/node
ln -s /opt/nodejs/bin/npm /usr/bin/npm
cd /home/adam_boonchaya/node-hello
sudo ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
sudo git config --global --add safe.directory /home/adam_boonchaya/node-hello
sudo git pull
sudo npm install
nohup node server.js > server.log 2>&1 &



