FROM codeberg.org/eoelab/cenv:debian as builder

ENV ZIG_VERSIONS="https://ziglang.org/download/index.json" \
    ZIG_PUBKEY="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

RUN apt-get update --yes && apt-get install --yes curl jq tar xz-utils minisign && \
    
    ARCH=$(uname -m) && LATEST_VERSION=$(curl -s $ZIG_VERSIONS | jq -r 'keys[] | select(. != "master")' | sort -V | tail -n1) && \
    
    curl -LO https://zigmirror.com/zig-${ARCH}-linux-${LATEST_VERSION}.tar.xz && \
    curl -LO https://zigmirror.com/zig-${ARCH}-linux-${LATEST_VERSION}.tar.xz.minisig && \
    minisign -Vm zig-${ARCH}-linux-${LATEST_VERSION}.tar.xz -P ${ZIG_PUBKEY} && \

    tar -xf zig-${ARCH}-linux-${LATEST_VERSION}.tar.xz && mv zig-${ARCH}-linux-${LATEST_VERSION} zig

FROM codeberg.org/eoelab/cenv:debian

ENV PATH="/opt/zig:${PATH}"

COPY --from=builder zig /opt/zig

# spport zls
RUN apt-get update --yes && apt-get install --yes tar xz-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*