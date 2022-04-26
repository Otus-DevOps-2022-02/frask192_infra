#!/bin/bash

sudo apt-get install -y apt-transport-https ca-certificates

echo "##############################################"
echo "######   add key and repo for mongodb   ######"
echo "##############################################"

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

echo "##############################################"
echo "######         INSTALL mongodb          ######"
echo "##############################################"

sudo apt-get update
sudo apt-get install -y mongodb-org

echo "##############################################"
echo "######          start mongodb           ######"
echo "##############################################"

sudo systemctl start mongod
sudo systemctl enable mongod
