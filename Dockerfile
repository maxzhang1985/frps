FROM alpine:3.5 
COPY frps /frps

RUN set -x \
  && mkdir -p conf \
  && chmod 777 /frps

COPY frps.ini /conf/frps.ini
VOLUME /var/frp/conf

WORKDIR /
EXPOSE  7000 8080

ENTRYPOINT ./frps -c ./conf/frps.ini
