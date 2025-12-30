FROM codeberg.org/eoelab/cenv:alpine AS builder

RUN apk add --no-cache git && \
    git clone --depth 1 https://github.com/FreakStudioCN/upypi.git

FROM codeberg.org/eoelab/cenv:alpine

COPY --from=builder /upypi /upypi

RUN apk add --no-cache py3-pip && \
    pip install Flask requests markdown --break-system-packages

WORKDIR /upypi

CMD ["python", "app.py"]