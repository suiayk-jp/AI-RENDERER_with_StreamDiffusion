FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive PIP_PREFER_BINARY=1 \
    CUDA_HOME=/usr/local/cuda-11.8 TORCH_CUDA_ARCH_LIST="8.6"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && apt-get install -y --no-install-recommends \
    make wget tar build-essential libgl1-mesa-dev curl unzip git \
    python3-dev python3-pip libglib2.0-0 && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/bin/python3 /usr/bin/python

RUN pip3 install torch==2.1.0 torchvision==0.16.0 xformers huggingface_hub==0.24.7 \
    --index-url https://download.pytorch.org/whl/cu118

WORKDIR /home/ubuntu/ai-renderer

