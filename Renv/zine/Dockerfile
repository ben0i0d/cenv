FROM codeberg.org/eoelab/cenv:alpine AS builder

ENV ZINE_VERSION=v0.11.2

WORKDIR /tmp

RUN wget https://github.com/kristoff-it/zine/releases/download/${ZINE_VERSION}/x86_64-linux-musl.tar.xz && \
    tar -xf x86_64-linux-musl.tar.xz 

FROM codeberg.org/eoelab/cenv:alpine

COPY --from=builder /tmp/zine /usr/local/bin/zine