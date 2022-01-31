FROM ubuntu:20.04
RUN apt update && \
    apt install iproute2 python3-pip -y && \
    pip3 install --no-input tcconfig

# install dependencies for your application
ENV HOME /home/ubuntu
WORKDIR $HOME
ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y software-properties-common && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt update && \
    apt install -y git golang && \
    git clone https://github.com/ebi-yade/quic-go && \
    cd quic-go
