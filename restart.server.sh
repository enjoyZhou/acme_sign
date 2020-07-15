#!/usr/bin/env sh
echo '证书签发成功，移动证书...'
cp -f /etc/v2ray/v2ray.crt /etc/v2ray/v2ray.key /home/
service v2ray restart
echo '重启完成'