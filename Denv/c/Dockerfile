FROM codeberg.org/eoelab/cenv:debian

ENV PATH="/usr/lib/ccache:$PATH"

RUN apt-get update --yes && apt-get install --yes gcc libc6-dev gdb ccache && \
    apt-get clean && rm -rf /var/lib/apt/lists/*