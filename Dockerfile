FROM certbot/certbot

MAINTAINER Roman Pogorelchuk <roman.pogorelchuk@gmail.com>

RUN apk update && apk add --no-cache murmur icu && mkdir /data && chown murmur /data
ADD murmur.ini /data/murmur.ini

VOLUME ["/data"]
EXPOSE 64738/udp

RUN certbot certonly --standalone --agree-tos --email roman.pogorelchuk@gmail.com -d mumble.sirius-srv.net

#USER murmur
ENTRYPOINT ["/usr/bin/murmurd", "-fg", "-ini", "/data/murmur.ini"]
#certbot --apache -d desktop.sirius-srv.net