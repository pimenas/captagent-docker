FROM debian:jessie
MAINTAINER Epi Vou
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install --no-install-recommends --no-install-suggests -yqq ca-certificates git make m4 automake autoconf libtool libcap-dev libexpat-dev libpcap-dev zlib1g-dev openssl libssl-dev bison flex  libjson0 libjson0-dev libcurl4-gnutls-dev libjson-c-dev libuv-dev libgcrypt20-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone -b 6.3.0 https://github.com/sipcapture/captagent.git captagent && cd captagent && \
    ./build.sh && \
    ./configure && \
    make && make install

CMD [ "/usr/local/captagent/sbin/captagent", "-n" ]
