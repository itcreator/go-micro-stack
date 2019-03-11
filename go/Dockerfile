FROM golang:1.12

RUN mkdir /src
WORKDIR /src

### consul agent
RUN apt-get update -y \
    && apt-get install -y unzip \
    && cd /tmp \
    && wget https://releases.hashicorp.com/consul/1.0.2/consul_1.0.2_linux_amd64.zip \
    && unzip consul_1.0.2_linux_amd64.zip \
    && chmod +x consul \
    && mv consul /usr/bin/consul \
    && rm -R /tmp/* \
    && rm -r /var/lib/apt/lists/*

#install Glide package manager
RUN go get github.com/Masterminds/glide \
    && go get github.com/derekparker/delve/cmd/dlv
