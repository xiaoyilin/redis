FROM ubuntu:18.04
MAINTAINER xiaoyilin <406735078@qq.com>
LABEL version="1.0" 
LABEL description="Redis"
ENV HOSTNAME xiaoyilin-redis

# Redis版本
ENV VERSION 5.0.7
# 下载地址
ENV DOWNLOAD_URL http://download.redis.io/releases/redis-5.0.7.tar.gz

USER root
RUN apt-get update &&  \
    apt-get install -y wget && \
    apt-get dist-upgrade -y && \
    apt-get install -y build-essential && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y  libffi-dev && \
    apt-get install -y libssl-dev && \
    apt-get autoremove

WORKDIR /opt

RUN  wget $DOWNLOAD_URL &&  tar -xvf redis-5.0.7.tar.gz && rm -rf redis-5.0.7.tar.gz
WORKDIR /opt/redis-5.0.7
RUN  make PREFIX=/opt/redis install   && \
     mkdir /opt/redis/etc/           && \
     mkdir /opt/redis/bin/           && \
     cp redis.conf /opt/redis/etc/  && \
     cd /opt/redis/bin/            && \
     cp redis-benchmark redis-cli redis-server /opt/redis/bin/
    
