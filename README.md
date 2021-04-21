# docker-bubbleupnpserver
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/nVentiveUX/docker-bubbleupnpserver/Docker%20Image%20CI?style=for-the-badge)](https://github.com/nVentiveUX/docker-bubbleupnpserver/actions/workflows/dockerimage.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/nventiveux/docker-bubbleupnpserver?style=for-the-badge)](https://hub.docker.com/r/nventiveux/docker-bubbleupnpserver)

![Logo from BubbleUPnP](https://www.bubblesoftapps.com/bubbleupnpserver2/bubbleupnp_web_logo.png)

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
