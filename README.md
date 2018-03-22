# docker-bubbleupnpserver
[![Build Status](https://travis-ci.org/nVentiveUX/docker-bubbleupnpserver.svg?branch=master)](https://travis-ci.org/nVentiveUX/docker-bubbleupnpserver)

Docker image for BubbleUPnP Server installation. Think for RaspberryPi.

## Quick start

Clone this repository and build the Docker image.

```shell
$ git clone git@ssh.github.com:nVentiveUX/docker-bubbleupnpserver.git
$ cd docker-bubbleupnpserver
$ docker build --rm -t nventiveux/docker-bubbleupnpserver -t nventiveux/docker-bubbleupnpserver:latest .
```

Run as a service

```shell
$ docker service create \
  --name bubbleupnpserver \
  --replicas 1 \
  --network host \
  --no-resolve-image \
  nventiveux/docker-bubbleupnpserver:latest
$ docker logs bubbleupnpserver.1.<ID>
```

Run as a regular container

```shell
$ docker run -d \
  --name bubbleupnpserver \
  --net=host \
  --restart=always \
  nventiveux/docker-bubbleupnpserver:latest
$ docker logs bubbleupnpserver
```
