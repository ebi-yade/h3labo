FROM ubuntu:20.04
WORKDIR /work
RUN apt update && \
    apt install iproute2 python3-pip -y && \
    pip3 install --no-input tcconfig

# install dependencies for your application
RUN apt install iputils-ping
