FROM arm32v6/alpine:latest

MAINTAINER nVentiveUX

RUN set -x && \
  apk add --no-cache --update openjdk8-jre unzip wget ffmpeg sox x264-libs libmatroska

RUN set -x \
  && mkdir -p /opt/bubbleupnpserver \
  && cd /opt/bubbleupnpserver \
  && wget -q "http://www.bubblesoftapps.com/bubbleupnpserver/BubbleUPnPServer-distrib.zip" -O /opt/bubbleupnpserver/bubbleupnpserver.zip \
  && unzip bubbleupnpserver.zip \
  && chmod +x launch.sh \
  && rm /opt/bubbleupnpserver/bubbleupnpserver.zip;

EXPOSE 58050/tcp 58051/tcp 1900/udp

ENTRYPOINT ["/opt/bubbleupnpserver/launch.sh"]
