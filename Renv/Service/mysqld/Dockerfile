FROM codeberg.org/eoelab/cenv:ddev

RUN apt-get update --yes && apt-get install --yes mysql-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
