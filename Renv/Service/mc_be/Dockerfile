FROM codeberg.org/eoelab/cenv:debian

RUN apt-get update --yes && apt-get install --yes --no-install-recommends libcurl4 openssh-server && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # Create authorize file
    mkdir -p /root/.ssh && touch /root/.ssh/authorized_keys

WORKDIR /workspace