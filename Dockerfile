FROM alpine:3.5 

ARG FRP_VERSION=0.13.0                                                                                                                                                                                                                      
 
RUN set -x \
    && mkdir -p conf \
    && apk update \
    && apk add ca-certificates wget \                                                                                                                                                                                                      
    && update-ca-certificates \
    && wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -zxf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mv frp_${FRP_VERSION}_linux_amd64/frps ./frps \
    && mv frp_${FRP_VERSION}_linux_amd64/frps.ini /conf/frps.ini \
    && ls \
    && chmod 777 ./frps


WORKDIR /
EXPOSE  7000 8080

ENTRYPOINT ./frps -c ./conf/frps.ini
