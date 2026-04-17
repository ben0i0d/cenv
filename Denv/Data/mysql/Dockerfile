FROM codeberg.org/eoelab/cenv:ddev

RUN apt-get update --yes && apt-get install --yes duckdb mysql-server mysql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
