FROM codeberg.org/eoelab/cenv:debian

EXPOSE 80

ENV USER=root

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
      openbox xterm \
      tigervnc-standalone-server novnc websockify xfonts-base && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["bash", "-c", "vncserver :0 -geometry 1440x900 -SecurityTypes None && websockify --web=/usr/share/novnc/ 80 localhost:5900"]
