FROM codeberg.org/eoelab/cenv:alpine

# Install common tools
RUN apk add --no-cache git openssh-client && \
    # SSH setup
    mkdir -p /root/.ssh && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts && \
    ssh-keyscan codeberg.org >> /root/.ssh/known_hosts
