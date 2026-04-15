FROM codeberg.org/eoelab/cenv:alpine

RUN wget https://github.com/kristoff-it/zine/releases/download/v0.11.2/x86_64-linux-musl.tar.xz && \
    tar -xf x86_64-linux-musl.tar.xz && rm x86_64-linux-musl.tar.xz && \
    mv zine /usr/local/bin/