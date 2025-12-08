FROM codeberg.org/eoelab/cenv:steam

USER root

RUN apt-get update --yes && apt-get install --yes --no-install-recommends wine && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 

USER ${USER}