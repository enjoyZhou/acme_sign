### 申请TLS证书
#### acme.sh
1.首先将节点域名解析到节点服务器，并且可以ping通
```
# 使用必读
# 使用前请将节点域名解析到节点，并且可以ping通
# 请将命令中的domain.com替换成节点域名
curl -fsSL https://github.com/enjoyZhou/acme_sign/raw/master/sign.sh | bash -s domain.com
```
2.申请完成后证书将会保存至/root/.cert/server.crt /root/.cert/server.key
#### Lego.sh
1.首先将节点域名解析到节点服务器，并且可以ping通
```
# 使用必读
# 使用前请将节点域名解析到节点，并且可以ping通
# 请将命令中的domain.com替换成节点域名
curl -fsSL https://github.com/enjoyZhou/acme_sign/raw/master/lego_sign.sh | bash -s domain.com
```
2.申请完成后证书将会保存至/root/.cert/server.crt /root/.cert/server.key
