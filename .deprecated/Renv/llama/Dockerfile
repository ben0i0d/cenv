FROM codeberg.org/eoelab/cenv:alpine AS builder

USER root

RUN apk add git make cmake g++ curl-dev linux-headers && \
    git clone --depth 1 https://github.com/ggml-org/llama.cpp.git && \
    cd llama.cpp && \
    cmake -B build -DBUILD_SHARED_LIBS=OFF && cmake --build build --config Release -j $(nproc)

FROM codeberg.org/eoelab/cenv:alpine

EXPOSE 80

COPY --from=builder /llama.cpp/build/bin/llama-server /usr/local/bin/llama-server

RUN apk add libcurl libgomp libstdc++
