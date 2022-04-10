#!/bin/bash

ECHO "##############################################"
echo "######           INSTALL git            ######"
ECHO "##############################################"

sudo apt install -y git

ECHO "##############################################"
echo "######           INSTALL app            ######"
ECHO "##############################################"

git clone -b monolith https://github.com/express42/reddit.git
cd reddit/
sudo bundle install
puma -d
