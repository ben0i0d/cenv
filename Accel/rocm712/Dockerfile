FROM codeberg.org/eoelab/cenv:debian as builder

RUN apt-get update --yes && apt-get install --yes wget gnupg2 && \
    wget https://repo.amd.com/rocm/packages/gpg/rocm.gpg -O - | gpg --dearmor | tee /etc/apt/keyrings/amdrocm.gpg > /dev/null && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/amdrocm.gpg] https://repo.amd.com/rocm/packages/ubuntu2404 stable main" > /etc/apt/sources.list.d/rocm.list

FROM codeberg.org/eoelab/cenv:debian

# For Jax
ENV AMD_COMGR_NAMESPACE=1 \
    LD_LIBRARY_PATH=/opt/base/lib/python3.13/site-packages/_rocm_sdk_core/lib

# Install ROCm repo
COPY --from=builder /etc/apt/keyrings/ /etc/apt/keyrings/
COPY --from=builder /etc/apt/sources.list.d /etc/apt/sources.list.d