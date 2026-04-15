FROM codeberg.org/eoelab/cenv:alpine

RUN apk add --no-cache openjdk21-jre-headless openssh-server && \
    # generate host keys
    ssh-keygen -A && \
    # Create authorize file
    mkdir -p /root/.ssh && touch /root/.ssh/authorized_keys

WORKDIR /workspace