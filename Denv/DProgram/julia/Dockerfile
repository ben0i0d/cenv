FROM codeberg.org/eoelab/cenv:python AS builder

# install Julia packages in /opt/julias
RUN apt-get update --yes && apt-get install --yes --no-install-recommends gnupg && \
    pip install jill && jill install --upstream USTC --confirm 1.12

FROM codeberg.org/eoelab/cenv:debian

COPY --from=builder /opt/julias/ /opt/julias/

ENV JULIA_PKG_SERVER=https://mirrors.cernet.edu.cn/julia \
    JULIA_NUM_THREADS=auto

RUN ln -sf $(find /opt/julias -type f -path '*/bin/julia' | head -n1) /usr/local/bin/julia