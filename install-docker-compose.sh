#!/bin/sh

sudo curl -L --fail https://github.com/docker/compose/releases/download/1.18.0/run.sh -o /usr/local/bin/docker-compose 2>&1;
sudo chmod +x /usr/local/bin/docker-compose;