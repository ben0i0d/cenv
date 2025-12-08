FROM codeberg.org/eoelab/cenv:debian

RUN apt-get update --yes && apt-get install --yes --no-install-recommends g++ gdb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*