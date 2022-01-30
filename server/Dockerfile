FROM ubuntu:20.04
WORKDIR /work
RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt update && \
    apt install -y iproute2 python3-pip && \
    pip3 install --no-input tcconfig

# install dependencies for your application
RUN apt install -y golang-go
CMD ["go", "run", "pong.go"]
