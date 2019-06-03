FROM ubuntu:18.04
MAINTAINER xiaoyilin <406735078@qq.com>
LABEL version="1.0" 
LABEL description="Redis"
ENV HOSTNAME xiaoyilin-redis

# Redis版本
ENV VERSION 5.0.5
# 下载地址
ENV DOWNLOAD_URL http://download.redis.io/releases/redis-5.0.5.tar.gz

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
    
