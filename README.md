# docker-bubbleupnpserver
[![Build Status](https://travis-ci.org/nVentiveUX/docker-bubbleupnpserver.svg?branch=master)](https://travis-ci.org/nVentiveUX/docker-bubbleupnpserver) [![Docker Pulls](https://img.shields.io/docker/pulls/nventiveux/docker-bubbleupnpserver)](https://hub.docker.com/r/nventiveux/docker-bubbleupnpserver)

Docker image for BubbleUPnP Server installation.

## Quick start

Run as a service

```shell
$ docker service create \
  --name bubbleupnpserver \
  --replicas 1 \
  --network host \
  --no-resolve-image \
  nventiveux/docker-bubbleupnpserver:latest
```

Run as a daemon

```shell
$ {
ARCH=$(dpkg --print-architecture)

if [[ "${ARCH}" == "armhf" ]]; then
  printf "Clean potential old instances...\\n";
  docker stop bubbleupnpserver &>/dev/null;
  docker rm bubbleupnpserver &>/dev/null;
  docker rmi nventiveux/docker-bubbleupnpserver:latest_arm32v6 &>/dev/null;

  printf "Starting up bubbleupnpserver container for %s...\\n" ${ARCH};
  docker run -d \
    --name bubbleupnpserver \
    --net=host \
    --restart=always \
    nventiveux/docker-bubbleupnpserver:latest_arm32v6;
else
  printf "Clean potential old instances...\\n";
  docker stop bubbleupnpserver &>/dev/null;
  docker rm bubbleupnpserver &>/dev/null;
  docker rmi nventiveux/docker-bubbleupnpserver:latest_amd64;

  printf "Starting up bubbleupnpserver container for %s...\\n" ${ARCH};
  docker run -d \
    --name bubbleupnpserver \
    --net=host \
    --restart=always \
    nventiveux/docker-bubbleupnpserver:latest_amd64;
fi
}
```
