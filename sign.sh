#!/usr/bin/env sh

domain=$1
echo "acme_sign Version：0.0.5"
echo "安装依赖..."
yum install -y socat
echo "域名：${domain}"
echo "正在开始签名证书..."
cd ~
wget https://github.com/enjoyZhou/acme_sign/raw/master/restart.server.sh
mkdir -p .acme_sign.sh
mv -f restart.server.sh ~/.acme_sign.sh/restart.server.sh
wget -O -  https://get.acme.sh | sh
alias acme.sh=~/.acme.sh/acme.sh

. ~/.acme.sh/acme.sh  --issue -d $domain --standalone -k ec-256
. ~/.acme.sh/acme.sh --installcert -d $domain --ecc --key-file /etc/v2ray/v2ray.key --fullchain-file /etc/v2ray/v2ray.crt --reloadcmd ". ~/.acme_sign.sh/restart.server.sh"