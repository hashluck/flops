FROM nvidia/cuda:8.0-runtime-ubuntu16.04

MAINTAINER HashLuck

WORKDIR /

# Package and dependency setup
RUN apt update && apt install wget

RUN wget https://github.com/NebuTech/NBMiner/releases/download/v35.0/NBMiner_35.0_Linux.tgz; \
    tar zxvf NBMiner_35.0_Linux.tgz && rm NBMiner_35.0_Linux.tgz; \
    cd NBMiner_Linux; \
    chmod +x ./nbminer; \
    cp ./nbminer /usr/local/bin/nbminer

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["/usr/local/bin/nbminer"]
