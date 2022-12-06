# ngosang/restic-rest-server

[![Latest release](https://img.shields.io/github/v/release/ngosang/docker-restic-rest-server)](https://github.com/ngosang/docker-restic-rest-server/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/ngosang/restic-rest-server)](https://hub.docker.com/r/ngosang/restic-rest-server/)
[![Donate PayPal](https://img.shields.io/badge/Donate-PayPal-yellow.svg)](https://www.paypal.com/paypalme/diegoheras0xff)
[![Donate Bitcoin](https://img.shields.io/badge/Donate-Bitcoin-f7931a.svg)](https://www.blockchain.com/btc/address/14EcPN47rWXkmFvjfohJx2rQxxoeBRJhej)
[![Donate Ethereum](https://img.shields.io/badge/Donate-Ethereum-8c8c8c.svg)](https://www.blockchain.com/eth/address/0x0D1549BbB00926BF3D92c1A8A58695e982f1BE2E)

Docker image for [Restic Rest Server](https://github.com/restic/rest-server) with support for multi-architecture.

The image does not contain changes compared to the official image. You can use the official documentation from [here](https://hub.docker.com/r/restic/rest-server) and [here](https://github.com/restic/rest-server#docker).

## Docker Registry

Docker images are available in [GHCR](https://github.com/users/ngosang/packages/container/package/restic-rest-server) and [DockerHub](https://hub.docker.com/r/ngosang/restic-rest-server).

```bash
docker pull ghcr.io/ngosang/restic-rest-server
or
docker pull ngosang/restic-rest-server
```

## Supported Architectures

The architectures supported by this image are:

* linux/386
* linux/amd64
* linux/arm/v6
* linux/arm/v7
* linux/arm64/v8
* linux/ppc64le
* linux/s390x

## Usage

Here are some example snippets to help you get started creating a container.

### docker-compose

Compatible with docker-compose v2 schemas.

```yaml
---
version: "2.1"
services:
  restic-rest-server:
    # https://hub.docker.com/r/restic/rest-server
    image: ngosang/restic-rest-server
    container_name: restic-rest-server
    environment:
      - TZ=Europe/Madrid
      - PASSWORD_FILE=/data/.htpasswd
    volumes:
      - /media/hdd_raid/BACKUPS/restic:/data
    ports:
      - 8000:8000
    restart: unless-stopped
```
