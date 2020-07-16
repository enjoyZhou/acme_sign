#!/usr/bin/env sh
echo "证书签发成功，移动证书..."
mkdir -p /root/.cert
cp -f /etc/v2ray/v2ray.crt /root/.cert/server.crt
cp -f /etc/v2ray/v2ray.key /root/.cert/server.key
service v2ray restart
echo "重启完成"