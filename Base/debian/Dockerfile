FROM codeberg.org/eoelab/cenv:sid-slim

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

USER root

# Configure environment
ENV DEBIAN_FRONTEND=noninteractive 

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
    # Install tini for process management
    apt-get update --yes && apt-get install --yes --no-install-recommends tini openssh-server nano && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # Create necessary dir&file
    mkdir -p /root/.ssh &&  touch /root/.ssh/authorized_keys

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["bash"]