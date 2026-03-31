FROM codeberg.org/eoelab/cenv:debian as builder

ENV ZIG_INDEX="https://ziglang.org/download/index.json" \
    ZIG_PUBKEY="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

# for master: VERSION=$(curl -s $ZIG_INDEX | jq -r .master.version)
# for latest: VERSION=$(curl -s $ZIG_INDEX | jq -r 'keys[] | select(. != "master")' | sort -V | tail -n1)
RUN apt-get update --yes && apt-get install --yes ca-certificates curl jq tar xz-utils minisign && \
    
    ARCH=$(uname -m) && VERSION=$(curl -s $ZIG_INDEX | jq -r .master.version) && \
    
    curl -LO https://zigmirror.com/zig-${ARCH}-linux-${VERSION}.tar.xz && \
    curl -LO https://zigmirror.com/zig-${ARCH}-linux-${VERSION}.tar.xz.minisig && \
    minisign -Vm zig-${ARCH}-linux-${VERSION}.tar.xz -P ${ZIG_PUBKEY} && \

    tar -xf zig-${ARCH}-linux-${VERSION}.tar.xz && mv zig-${ARCH}-linux-${VERSION} zig

FROM codeberg.org/eoelab/cenv:debian

ENV PATH="/opt/zig:${PATH}"

COPY --from=builder zig /opt/zig

# spport zls
RUN apt-get update --yes && apt-get install --yes tar xz-utils ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*