FROM codeberg.org/eoelab/cenv:debian

# Tested on Alpine. For vanilla, Forge runs normally. As an experimental consideration, we are thinking about switching to Alpine.

RUN apt-get update --yes && apt-get install --yes --no-install-recommends openjdk-21-jre-headless && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace