FROM alpine:3.5 

ARG FRP_VERSION=0.13.0


RUN set -x \
    && wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -zxf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mv frp_${FRP_VERSION}_linux_amd64 / \
    && mkdir -p conf \
    && chmod 777 /frps


COPY frps.ini /conf/frps.ini

VOLUME /var/frp/conf

WORKDIR /
EXPOSE  7000 8080

ENTRYPOINT ./frps -c ./conf/frps.ini
