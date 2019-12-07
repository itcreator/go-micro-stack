FROM golang:1.13

RUN mkdir /src
WORKDIR /src

ARG CONSUL_VERSION=1.6.2

### consul agent
RUN apt-get update -y \
    && apt-get install -y unzip \
    && cd /tmp \
    && wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip \
    && unzip consul_${CONSUL_VERSION}_linux_amd64.zip \
    && chmod +x consul \
    && mv consul /usr/bin/consul \
    && rm -R /tmp/* \
    && rm -r /var/lib/apt/lists/*

#install Glide package manager
RUN go get github.com/Masterminds/glide \
    && go get github.com/derekparker/delve/cmd/dlv
