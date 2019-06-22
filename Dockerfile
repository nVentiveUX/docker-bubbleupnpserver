FROM arm32v6/alpine:3.10
MAINTAINER nVentiveUX

ENV BUBBLE_APP_DIR=/opt/bubbleupnpserver \
    BUBBLE_USER=bubble

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN set -eux; \
  apk add --no-cache --update \
    ca-certificates \
    ffmpeg \
    iptables \
    openjdk8-jre-base \
    sox \
    unzip \
    wget;

RUN set -eux; \
  addgroup -g 1000 -S ${BUBBLE_USER}; \
  adduser -u 1000 -D -G ${BUBBLE_USER} ${BUBBLE_USER};

RUN set -eux; \
  mkdir -pv ${BUBBLE_APP_DIR}; \
  wget -q "http://www.bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip" -O ${BUBBLE_APP_DIR}/bubbleupnpserver.zip; \
  unzip ${BUBBLE_APP_DIR}/bubbleupnpserver.zip -d ${BUBBLE_APP_DIR}; \
  chown -R ${BUBBLE_USER}:${BUBBLE_USER} ${BUBBLE_APP_DIR}; \
  chmod +x ${BUBBLE_APP_DIR}/launch.sh; \
  rm ${BUBBLE_APP_DIR}/bubbleupnpserver.zip;

USER ${BUBBLE_USER}

EXPOSE 58050/tcp 58051/tcp 1900/udp

CMD ["sh", "-c", "${BUBBLE_APP_DIR}/launch.sh"]

