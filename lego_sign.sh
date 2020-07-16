
#!/bin/sh
#
domain=$1
echo "域名：${domain}"
echo "正在开始签名证书..."
cd /tmp
wget https://github.com/go-acme/lego/releases/download/v3.7.0/lego_v3.7.0_linux_amd64.tar.gz
tar zxvf lego_v3.7.0_linux_amd64.tar.gz
rm -rf lego_v3.7.0_linux_amd64.tar.gz
chmod 755 *
./lego --email="admin@$domain" --domains="$domain" --http -a run

if ls ./.lego/certificates | grep "$domain"
    then
    echo '证书签发成功'
    mkdir -p /root/.cert
    cp -f ./.lego/certificates/$domain.crt /root/.cert/server.crt
    cp -f ./.lego/certificates/$domain.key /root/.cert/server.key
else
    echo '证书签发失败'
fi