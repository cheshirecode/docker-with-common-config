#!/bin/sh
sudo curl -L --fail https://github.com/docker/compose/releases/download/1.18.0/run.sh -o /usr/local/bin/docker-compose 2>&1;
sudo chmod +x /usr/local/bin/docker-compose;

sudo usermod -aG docker ubuntu

# # WSL
# sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose &&
# sudo chmod +x /usr/local/bin/docker-compose