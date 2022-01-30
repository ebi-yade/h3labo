FROM ubuntu:20.04
WORKDIR /work
RUN apt-get update && \
    apt-get install iproute2 iputils-ping python3-pip -y && \
    pip3 install --no-input tcconfig
