FROM ubuntu:20.04
WORKDIR /work
RUN apt update && \
    apt install iproute2 python3-pip -y && \
    pip3 install --no-input tcconfig

# install dependencies for your application
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y software-properties-common && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt update && \
    apt install -y golang
