FROM codeberg.org/eoelab/cenv:python AS builder

# install Julia packages in /opt/julias
RUN apt-get update --yes && apt-get install --yes --no-install-recommends gnupg && \
    pip install jill && jill install --upstream USTC --confirm 1.12

FROM codeberg.org/eoelab/cenv:ddev

COPY --from=builder /opt/julias/ /opt/julias/

RUN ln -sf $(find /opt/julias -type f -path '*/bin/julia' | head -n1) /usr/local/bin/julia