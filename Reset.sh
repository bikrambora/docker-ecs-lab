#!/bin/bash
git fetch origin master
git reset --hard origin/master
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q) -f
chmod +x Reset.sh
