FROM codeberg.org/eoelab/cenv:debian

# Install common tools
RUN apt-get update --yes && apt-get install --yes --no-install-recommends git openssh-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # SSH setup
    mkdir -p /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts && \
    ssh-keyscan codeberg.org >> /root/.ssh/known_hosts
