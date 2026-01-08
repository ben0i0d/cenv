FROM codeberg.org/eoelab/cenv:edge

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

USER root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    # Install tini for process management
    apk add --no-cache tini openssh-server && \
    # generate host keys
    ssh-keygen -A && \
    # Create necessary dir&file
    mkdir -p /root/.ssh &&  touch /root/.ssh/authorized_keys

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["sh"]