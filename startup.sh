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
sudo useradd -m -d /home/nodeapp nodeapp
sudo chown -R nodeapp:nodeapp /opt/app
sudo cat >/etc/supervisor/conf.d/node-hello.conf << EOF
[program:nodeapp]
directory=/home/adam_boonchaya/node-hello
command=npm start
autostart=true
autorestart=true
user=nodeapp
environment=HOME="/home/nodeapp",USER="nodeapp",NODE_ENV="production"
stdout_logfile=syslog
stderr_logfile=syslog
EOF

supervisorctl reread
supervisorctl update



