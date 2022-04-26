#!/bin/bash

yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=4 \
--create-boot-disk \
image-folder-id=standard-images,image-family=reddit-full,size=10GB \
--network-interface \
subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--zone ru-central1-a \
--ssh-key ~/.ssh/id_rsa.pub
