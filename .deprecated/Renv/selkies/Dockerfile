FROM codeberg.org/eoelab/cenv:debian as builder

ARG SELKIES_VERSION=1.6.2 \
    DISTRIB_RELEASE=24.04 \
    ARCH=amd64

RUN apt-get update --yes && apt-get install --yes jq tar gzip curl && \
    cd /opt && \
    curl -fsSL "https://github.com/selkies-project/selkies/releases/download/v${SELKIES_VERSION}/gstreamer-selkies_gpl_v${SELKIES_VERSION}_ubuntu${DISTRIB_RELEASE}_amd64.tar.gz" | tar -xzf - && \
    curl -O -fsSL "https://github.com/selkies-project/selkies/releases/download/v${SELKIES_VERSION}/selkies_gstreamer-${SELKIES_VERSION}-py3-none-any.whl" && \
    curl -fsSL "https://github.com/selkies-project/selkies/releases/download/v${SELKIES_VERSION}/selkies-gstreamer-web_v${SELKIES_VERSION}.tar.gz" | tar -xzf - && \
    curl -fsSL "https://github.com/selkies-project/selkies/releases/download/v${SELKIES_VERSION}/selkies-js-interposer_v${SELKIES_VERSION}_ubuntu${DISTRIB_RELEASE}_${ARCH}.tar.gz" | tar -xzf -

FROM codeberg.org/eoelab/cenv:debian

ARG SELKIES_VERSION=1.6.2 

EXPOSE 8080

COPY --from=builder /opt/gst-web /opt/gst-web
#COPY --from=builder /opt/gstreamer /opt/gstreamer
COPY --from=builder /opt/selkies_gstreamer-${SELKIES_VERSION}-py3-none-any.whl /opt/
COPY --from=builder /opt/selkies_joystick_interposer.so /usr/local/lib/
COPY start.sh /usr/local/bin/

RUN apt-get update --yes && apt-get install --yes python3-pip \
        # for evdev
        linux-libc-dev gcc python3-dev \
        # for x11
        xvfb \
        # for gi
        python3-gi python3-gst-1.0 \
        # for GstWebRTC
        gstreamer1.0-plugins-bad gir1.2-gst-plugins-bad-1.0 \
        # for distutils
        python3-setuptools \
        # for gstreamer plugins: ['nice', 'x264']
        gstreamer1.0-nice gstreamer1.0-plugins-ugly \
        # for xsel
        xsel \
        # fot turnserver
        coturn \
        # for pipewire
        pipewire \
        # for xfce4
        xfce4 && \
    pip install /opt/selkies_gstreamer-${SELKIES_VERSION}-py3-none-any.whl --break-system-packages && rm /opt/selkies_gstreamer-${SELKIES_VERSION}-py3-none-any.whl && pip cache purge && \
    chmod +x /usr/local/bin/start.sh

CMD start.sh