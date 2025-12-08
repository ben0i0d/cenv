FROM codeberg.org/eoelab/cenv:alpine

# install mpremote
RUN apk add py3-pip picocom && \
    echo '[global]\nindex-url = https://mirrors.ustc.edu.cn/pypi/web/simple' >  /etc/pip.conf && \
    pip install mpy-cross-v6.3 mpremote --break-system-packages