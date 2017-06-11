FROM golang:1.8

RUN mkdir /src
WORKDIR /src

### consul agent
RUN apt-get update -y \
    && apt-get install -y unzip \
    && cd /tmp \
    && wget https://releases.hashicorp.com/consul/0.7.5/consul_0.7.5_linux_amd64.zip \
    && unzip consul_0.7.5_linux_amd64.zip \
    && chmod +x consul \
    && mv consul /usr/bin/consul \
    && rm -R /tmp/* \
    && rm -r /var/lib/apt/lists/*

#install Glide package manager
RUN go get github.com/Masterminds/glide
