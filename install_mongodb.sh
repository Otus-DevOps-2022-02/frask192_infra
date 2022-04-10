#!/bin/bash

ECHO "##############################################"
echo "######   add key and repo for mongodb   ######"
ECHO "##############################################"

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

ECHO "##############################################"
echo "######         INSTALL mongodb          ######"
ECHO "##############################################"

sudo apt-get update
sudo apt-get install -y mongodb-org

ECHO "##############################################"
echo "######          start mongodb           ######"
ECHO "##############################################"

sudo systemctl start mongod
sudo systemctl enable mongod
