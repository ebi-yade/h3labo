FROM ubuntu:20.04
WORKDIR /work
RUN apt-get update && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt-get update && \
    apt-get install golang-go iproute2 python3-pip -y && \
    pip3 install --no-input tcconfig
CMD ["go", "run", "pong.go"]
