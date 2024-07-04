cd /home/adam_boonchaya/node-hello
sudo ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
sudo git config --global --add safe.directory /home/adam_boonchaya/node-hello
sudo git pull
sudo npm install

sudo lsof -t -i:3000 | xargs -r sudo kill
nohup node index.js > server.log 2>&1 &
echo "Node.js server started."
