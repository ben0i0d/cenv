FROM codeberg.org/eoelab/cenv:python as builder

RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://repo.radeon.com/amdgpu-install/7.2.2/ubuntu/noble/amdgpu-install_7.2.2.70202-1_all.deb && \
    apt install --yes ./amdgpu-install_7.2.2.70202-1_all.deb && \
    sed -i "s/\/30.30.2/\/30.30.1/" /etc/apt/sources.list.d/amdgpu.list && \
    sed -i "s|graphics/7.2.2|graphics/7.2.1|" /etc/apt/sources.list.d/rocm.list

FROM codeberg.org/eoelab/cenv:python

# Configure environment
ENV LD_LIBRARY_PATH=/opt/rocm/lib

# Install ROCm repo
COPY --from=builder /etc/apt/keyrings/ /etc/apt/keyrings/
COPY --from=builder /etc/apt/sources.list.d /etc/apt/sources.list.d