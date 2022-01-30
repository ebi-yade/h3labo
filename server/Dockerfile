FROM ubuntu:20.04
WORKDIR /work
RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt update && \
    apt install -y iproute2 python3-pip && \
    pip3 install --no-input tcconfig

# install dependencies for your application
RUN apt install -y cmake curl git libpcre3 libpcre3-dev zlib1g-dev && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable && \
    curl -O https://nginx.org/download/nginx-1.16.1.tar.gz && \
    tar xzvf nginx-1.16.1.tar.gz && \
    git clone --recursive https://github.com/cloudflare/quiche
ENV PATH $PATH:$HOME/.cargo/bin
RUN cd nginx-1.16.1 && \
    patch -p01 < ../quiche/nginx/nginx-1.16.patch && \
    ./configure \
      --prefix=$PWD \
      --build="quiche-$(git --git-dir=../quiche/.git rev-parse --short HEAD)" \
      --with-http_ssl_module \
      --with-http_v2_module \
      --with-http_v3_module \
      --with-openssl=../quiche/quiche/deps/boringssl \
      --with-quiche=../quiche && \
    make && \
    mkdir logs && \
    cp ../nginx.h3.conf ./conf/nginx.conf
# run your server application in the foreground
CMD ["/work/nginx-1.16.1/objs/nginx", "-g", "daemon off;"]
