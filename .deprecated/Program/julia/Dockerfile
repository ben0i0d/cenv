FROM codeberg.org/eoelab/cenv:python AS builder

# install Julia packages in /opt/julias
RUN apt-get update --yes && apt-get install --yes --no-install-recommends gnupg && \
    pip install jill && jill install --confirm 1

FROM codeberg.org/eoelab/cenv:debian

ARG JULIA_MIRROR

COPY --from=builder /opt/julias/ /opt/julias/

ENV JULIA_PKG_SERVER=${JULIA_MIRROR} \
    JULIA_NUM_THREADS=8

RUN ln -s "`find /opt/julias -name 'bin'`/julia" /usr/local/bin/julia 