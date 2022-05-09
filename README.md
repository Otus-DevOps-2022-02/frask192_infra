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

testapp_IP = 51.250.68.119
testapp_port = 9292

install_ruby.sh - installing ruby and dependencies
install_mongodb.sh - installing bongodb and dependencies
deploy.sh - installing reddir app and dependencies

trouble - Err:7 https://repo.mongodb.org/apt/ubuntu xenial/mongodborg/4.2/multiverse amd64 Packages
  404  Not Found

  sudo apt-get install -y mongodb-org
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package mongodb-org

solution - echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

trouble - E: The method driver /usr/lib/apt/methods/https could not be found.
E: Failed to fetch https://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/4.2/InRelease
E: Some index files failed to download. They have been ignored, or old ones used instead.

solution - sudo apt-get install -y apt-transport-https ca-certificates

####################################################################################
## HW 7

для запуска пакера с переменными в файле необходимо добавить -var-file="./variables.json" в команду запуска
packer build -var-file="./variables.json" ./immutable.json
сам variables.json внесен в .gitignor, его примером является variables.json.example
для запуски оброза с подготовленной средой и запуском по умолчанию puma.service создан скрипт congig-script/create-reddit-vm.sh

#########################################################################################
## NW 8

как создать сервисный аккаунт
https://cloud.yandex.ru/docs/iam/quickstart-sa
как создать ему ключ
https://cloud.yandex.com/en-ru/docs/iam/operations/iam-token/create-for-sa#keys-create

описал файл main.tf
файл outputs.tf используется для того, чтобы в конце apply вывести значения тех переменных, кторые мы там указали
variables.tf - описание переменных
сами переменных хранятся в terraform.tfvars
можно указать свой файл с переменным при помощи -var-file= или одну конкретную команду -var= в момент запуска terraform validate/apply
