# docker-bubbleupnpserver
Docker image for BubbleUPnP Server installation. Think for RaspberryPi.

## Quick start

Clone this repository and build the Docker image.

```shell
$ git clone git@ssh.github.com:nVentiveUX/docker-bubbleupnpserver.git
$ cd docker-bubbleupnpserver
$ docker build --rm -t nventiveux/docker-bubbleupnpserver -t nventiveux/docker-bubbleupnpserver:latest .
```

Run the service

```shell
$ sudo docker service create \
  --name bubbleupnpserver \
  --replicas 1 \
  --network host \
  nventiveux/docker-bubbleupnpserver:latest
```

Check

```shell
$ docker logs bubbleupnpserver.1.<ID>
```
