# frask192_infra
frask192 Infra repository

####################################################################################
## HW 3
simple way
ssh -J user@ipA user@ipB or ssh -i /path/to/rsa/key -J user@ipA user@ipB

additional task

add at ~/.ssh/config

Host bastion
  Hostname ipA
  IdentityFile ~/.ssh/id_rsa
  User user

Host someinternalhost
  Hostname ipB
  ProxyJump user@ipA:22
  User user

ssh someinternalhost

https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts

####################################################################################
## HW 4

bastion_IP = 51.250.68.255
someinternalhost_IP = 10.128.0.27

####################################################################################
## HW 6

testapp_IP = http://51.250.68.119/
testapp_port = 9292

install_ruby.sh - installing ruby and dependencies
install_mongodb.sh - installing bongodb and dependencies
deploy.sh - installing reddir app and dependencies
