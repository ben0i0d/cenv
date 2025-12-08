FROM codeberg.org/eoelab/cenv:debian AS builder

USER root

RUN apt-get update --yes && apt-get install --yes  gnupg curl && \
    curl -s https://repos.azul.com/azul-repo.key | gpg --dearmor -o /usr/share/keyrings/azul.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | tee /etc/apt/sources.list.d/zulu.list && \
    apt-get update --yes && apt-get install --yes --no-install-recommends zulu8-ca-jre-headless  

FROM codeberg.org/eoelab/cenv:debian

COPY --from=builder /usr/lib/jvm/zulu8/ /usr/lib/jvm/zulu8/

USER root

WORKDIR /workspace

RUN ln -s /usr/lib/jvm/zulu8/bin/java /usr/bin/java && \
    mkdir -p /workspace

# Configure container startup
ENTRYPOINT ["tini", "-g", "--", "sh", "-c"]
CMD ["java -jar server.jar nogui"]