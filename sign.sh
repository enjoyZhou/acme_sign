#!/bin/sh

echo '正在安装依赖'

if cat /etc/os-release | grep "centos" > /dev/null
    then
    yum update > /dev/null
    yum install tar wget -y > /dev/null
else
    apt update > /dev/null
    apt-get install tar wget -y > /dev/null
fi

domain=$1
cd ~
wget https://github.com/enjoyZhou/acme_sign/raw/master/restart.server.sh
mkdir -p .acme_sign.sh
mv -f restart.server.sh ~/.acme_sign.sh/restart.server.sh
wget -O -  https://get.acme.sh | sh
alias acme.sh=~/.acme.sh/acme.sh

acme.sh --install-cert -d $domain \
--key-file       /etc/v2ray/v2ray.key  \
--fullchain-file /etc/v2ray/v2ray.crt \
--reloadcmd     ". ~/.acme_sign.sh/restart.server.sh"