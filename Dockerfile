FROM arm32v6/alpine:latest

MAINTAINER nVentiveUX

COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN set -x \
  && apk add --no-cache --update openjdk8-jre unzip wget x264-libs libmatroska ffmpeg;

RUN set -x \
  && mkdir -p /opt/bubbleupnpserver \
  && wget -q "http://www.bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip" -O /opt/bubbleupnpserver/bubbleupnpserver.zip \
  && unzip /opt/bubbleupnpserver/bubbleupnpserver.zip -d /opt/bubbleupnpserver \
  && chmod +x /opt/bubbleupnpserver/launch.sh \
  && rm /opt/bubbleupnpserver/bubbleupnpserver.zip;

EXPOSE 58050/tcp 58051/tcp 1900/udp

ENTRYPOINT ["/opt/bubbleupnpserver/launch.sh"]

