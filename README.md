# ngosang/restic-rest-server

[![Latest release](https://img.shields.io/github/v/release/ngosang/docker-restic-rest-server)](https://github.com/ngosang/docker-restic-rest-server/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/ngosang/restic-rest-server)](https://hub.docker.com/r/ngosang/restic-rest-server)
[![Docker Stars](https://img.shields.io/docker/stars/ngosang/restic-rest-server)](https://hub.docker.com/r/ngosang/restic-rest-server)
[![GitHub Repo stars](https://img.shields.io/github/stars/ngosang/docker-restic-rest-server)](https://github.com/ngosang/docker-restic-rest-server)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/ngosang)

Docker image for [Restic REST Server](https://github.com/restic/rest-server) with support for multi-architecture.

:warning: This repository is archived because the [official Docker image for Restic REST Server](https://hub.docker.com/r/restic/rest-server) has support for multi-architecture since version 0.12.0. Use the official Docker image instead, the configuration is the same.

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
    image: ngosang/restic-rest-server
    container_name: restic-rest-server
    environment:
      - TZ=Europe/Madrid
      - PASSWORD_FILE=/data/.htpasswd
    volumes:
      - /host_path/restic/data:/data
    ports:
      - 8000:8000
    restart: unless-stopped
```
