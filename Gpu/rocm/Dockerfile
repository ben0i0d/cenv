FROM codeberg.org/eoelab/cenv:python

# Configure environment
ENV LD_LIBRARY_PATH=/opt/rocm/lib

# Install ROCm repo
RUN apt-get update --yes && apt-get install --yes wget && \
    wget https://repo.radeon.com/amdgpu-install/7.1/ubuntu/noble/amdgpu-install_7.1.70100-1_all.deb && \
    apt install --yes ./amdgpu-install_7.1.70100-1_all.deb && \
    rm amdgpu-install_7.1.70100-1_all.deb