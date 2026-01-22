FROM codeberg.org/eoelab/cenv:python as builder

RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://repo.radeon.com/amdgpu-install/7.1.1/ubuntu/noble/amdgpu-install_7.1.1.70101-1_all.deb && \
    apt install --yes ./amdgpu-install_7.1.1.70101-1_all.deb

FROM codeberg.org/eoelab/cenv:python

# Configure environment
ENV LD_LIBRARY_PATH=/opt/rocm/lib

# Install ROCm repo
COPY --from=builder /etc/apt/keyrings/rocm.gpg /etc/apt/keyrings/rocm.gpg
COPY --from=builder /etc/apt/sources.list.d/amdgpu.list /etc/apt/sources.list.d/rocm.list /etc/apt/sources.list.d/