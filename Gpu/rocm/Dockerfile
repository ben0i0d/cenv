FROM codeberg.org/eoelab/cenv:python as builder

RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://repo.radeon.com/amdgpu-install/7.2/ubuntu/noble/amdgpu-install_7.2.70200-1_all.deb && \
    apt install --yes ./amdgpu-install_7.2.70200-1_all.deb

FROM codeberg.org/eoelab/cenv:python

# Configure environment
ENV LD_LIBRARY_PATH=/opt/rocm/lib

# Install ROCm repo
COPY --from=builder /etc/apt/keyrings/ /etc/apt/keyrings/
COPY --from=builder /etc/apt/sources.list.d /etc/apt/sources.list.d