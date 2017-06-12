FROM golang:1.8

RUN mkdir /tmp/protobuf
WORKDIR /tmp/protobuf

#todo: optimize it
#### protobuf protoc
RUN apt-get update -y \
    && apt-get install -y autoconf automake libtool curl make g++ unzip \
    && apt-get autoremove \
    && git clone https://github.com/google/protobuf -b 3.3.x --depth 1  . \
    && ./autogen.sh \
    && ./configure \
    && make \
#    && make check \
    && make install \
    && ldconfig \
    && protoc --version \
    && go get -u github.com/micro/protobuf/proto github.com/micro/protobuf/protoc-gen-go \
    && apt-get remove -y autoconf automake libtool curl make g++ unzip \
    && rm -R /tmp/* \
    && rm -r /var/lib/apt/lists/*
