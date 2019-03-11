FROM golang:1.12

RUN mkdir /src
WORKDIR /src

### consul agent
RUN apt-get update -y \
    && apt-get install -y unzip \
    && cd /tmp \
    && wget https://releases.hashicorp.com/consul/1.4.3/consul_1.4.3_linux_amd64.zip \
    && unzip consul_1.4.3_linux_amd64.zip \
    && chmod +x consul \
    && mv consul /usr/bin/consul \
    && rm -R /tmp/* \
    && rm -r /var/lib/apt/lists/*

#install Glide package manager
RUN go get github.com/Masterminds/glide \
    && go get github.com/derekparker/delve/cmd/dlv
