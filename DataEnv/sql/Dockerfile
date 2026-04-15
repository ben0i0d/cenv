FROM codeberg.org/eoelab/cenv:python

RUN apt-get update --yes && apt-get install --yes --no-install-recommends duckdb mysql-server mysql-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*