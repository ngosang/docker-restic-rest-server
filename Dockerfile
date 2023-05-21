FROM golang:alpine3.18 AS builder

ENV RESTIC_REST_SERVER_VERSION 0.11.0
ENV CGO_ENABLED 0

RUN cd /tmp \
    # download rest-server source code
    && wget https://github.com/restic/rest-server/archive/refs/tags/v${RESTIC_REST_SERVER_VERSION}.tar.gz -O rest-server.tar.gz \
    && tar xvf rest-server.tar.gz \
    && cd rest-server-* \
    # build the executable
    # flag -ldflags "-s -w" produces a smaller executable
    && go build -ldflags "-s -w" -v -o /tmp/rest-server ./cmd/rest-server \
    # prepare other resources
    && mv docker /tmp/docker

FROM alpine:3.18

ENV DATA_DIRECTORY /data
ENV PASSWORD_FILE /data/.htpasswd

RUN apk add --no-cache --update apache2-utils

COPY --from=builder /tmp/docker/create_user /tmp/docker/delete_user /usr/bin/
COPY --from=builder /tmp/docker/entrypoint.sh /entrypoint.sh
COPY --from=builder /tmp/rest-server /usr/bin

VOLUME /data
EXPOSE 8000

CMD [ "/entrypoint.sh" ]

# Help
#
# Local build
# docker build -t restic-rest-server:custom .
#
# Multi-arch build
# docker buildx create --use
# docker buildx build -t restic-rest-server:custom --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/ppc64le,linux/s390x .
#
# add --push to publish in DockerHub
