FROM codeberg.org/eoelab/cenv:alpine

EXPOSE 80

ENV USER=root \
    DISPLAY=:0

RUN apk add --no-cache \
        xvfb x11vnc fluxbox novnc websockify \
        xterm ttf-dejavu && \
    ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

CMD ["sh", "-c", "Xvfb :0 -screen 0 1440x900x24 & sleep 2 && fluxbox & sleep 2 && x11vnc -display :0 -forever -shared -nopw -quiet & websockify --web=/usr/share/novnc/ 80 localhost:5900"]