FROM codeberg.org/eoelab/cenv:ddev

RUN apt-get update --yes && apt-get install --yes g++ gdb ccache && \
    apt-get clean && rm -rf /var/lib/apt/lists/*