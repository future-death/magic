# Shadowsocks Server with KCPTUN support Dockerfile

FROM cellsdance/ss

ENV KCP_VER 20230214

RUN \

    apk add --no-cache --virtual .build-deps curl \

    && curl -fSL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz | tar xz -C /usr/local/bin server_linux_amd64 \

    && apk del .build-deps \

    && apk add --no-cache supervisor

COPY supervisord.conf /etc/supervisord.conf

ENV KCP_PORT=10007 KCP_KEY=12345678 KCP_CRYPT=none KCP_MODE=fast2 MTU=1200 SNDWND=1024 RCVWND=160 DATASHARD=10 PARITYSHARD=3

EXPOSE $KCP_PORT/udp

ENTRYPOINT ["/usr/bin/supervisord"]
