FROM codeberg.org/eoelab/cenv:debian

RUN apt-get update --yes && apt-get install --yes --no-install-recommends openjdk-21-jre-headless && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace