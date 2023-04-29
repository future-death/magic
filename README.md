# ss-and-kcptun
Bash script to deploy shadowsocks and kcptun.
usage:

docker pull cellsdance/ss_kcptun

docker run -d --restart=always -p 10006:10006 -p 10006:10006/udp -p 10007:10007/udp --name ss_kcptun_server cellsdance/ss_kcptun

docker run -d --restart=always -e "SS_PORT=10006" -e "SS_PASSWORD=12345678" -e "SS_METHOD=chacha20-ietf-poly1305" -e "SS_TIMEOUT=600" -e "KCP_PORT=10007" -e "KCP_MODE=fast2" -e "MTU=1200" -e "SNDWND=1024" -e "RCVWND=160" -p 10006:10006 -p 10006:10006/udp -p 10007:10007/udp --name ss_kcptun_server cellsdance/ss_kcptun
