FROM codeberg.org/eoelab/cenv:alpine AS builder

RUN apk add --no-cache git && \
    git clone --depth 1 -b offline --recurse-submodules --shallow-submodules https://github.com/BIPES/BIPES.git || true

FROM codeberg.org/eoelab/cenv:alpine

COPY --from=builder /BIPES /BIPES

RUN apk add --no-cache nginx

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]