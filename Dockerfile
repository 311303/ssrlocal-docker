FROM alpine:latest
MAINTAINER Jesusalexander <brpoper@gmail.com>

RUN apk update \
	&& apk add python libsodium unzip wget \
	&& mkdir /ssr \
	&& cd /ssr \
	&& wget --no-check-certificate https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip \
	&& unzip manyuser.zip  \
	&& cd shadowsocksr-manyuser/shadowsocks


ADD shadowsocks.json /ssr/shadowsocks.json

EXPOSE $SERVER_PORT
EXPOSE $LOCAL_PORT

CMD	python /ssr/shadowsocksr-manyuser/shadowsocks/local.py -c /ssr/shadowsocks.json