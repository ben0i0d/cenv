FROM codeberg.org/eoelab/cenv:python as builder

RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/cuda-keyring_1.1-1_all.deb && \
    apt install --yes ./cuda-keyring_1.1-1_all.deb

FROM codeberg.org/eoelab/cenv:python

# Install cuda repo
COPY --from=builder /usr/share/keyrings/cuda-archive-keyring.gpg /usr/share/keyrings/cuda-archive-keyring.gpg
COPY --from=builder /etc/apt/sources.list.d/cuda-debian13-x86_64.list /etc/apt/sources.list.d/