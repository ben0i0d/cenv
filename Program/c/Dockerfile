FROM eoelab.org:1027/ben0i0d/cenv:base

USER root

RUN apt-get update --yes && apt-get install --yes gcc gdb cmake && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR "${HOME}"