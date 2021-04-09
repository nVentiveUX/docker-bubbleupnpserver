# docker-bubbleupnpserver
[![Docker Image CI](https://github.com/nVentiveUX/docker-bubbleupnpserver/workflows/Docker%20Image%20CI/badge.svg)](https://hub.docker.com/repository/docker/nventiveux/docker-bubbleupnpserver) [![Docker Pulls](https://img.shields.io/docker/pulls/nventiveux/docker-bubbleupnpserver)](https://hub.docker.com/r/nventiveux/docker-bubbleupnpserver)

Docker image for [BubbleUPnP Server](https://bubblesoftapps.com/) installation.

## Quick start

```shell
$ {
printf "Clean potential old instances...\\n";
docker stop bubbleupnpserver &>/dev/null;
docker rm bubbleupnpserver &>/dev/null;
docker rmi nventiveux/docker-bubbleupnpserver &>/dev/null;

printf "Starting up bubbleupnpserver container...\\n";
docker run -d \
  --name bubbleupnpserver \
  --net=host \
  --restart=always \
  nventiveux/docker-bubbleupnpserver -nologfile;
}
```
