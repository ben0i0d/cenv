FROM ubuntu:24.04

ARG UBUNTU_MIRROR

ARG VERSION=6.3

ENV PATH="${PATH}:/opt/rocm/bin" \
    DEBIAN_FRONTEND=noninteractive

    # switch to mirror
RUN sed -i "s@//.*archive.ubuntu.com@//${UBUNTU_MIRROR}@g" /etc/apt/sources.list.d/ubuntu.sources && \
    apt-get update && apt-get install -y --no-install-recommends ca-certificates wget gnupg2 && \
    # add ROCm GPG key
    mkdir --parents --mode=0755 /etc/apt/keyrings && \
    wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | gpg --dearmor | tee /etc/apt/keyrings/rocm.gpg > /dev/null && \
    # add ROCm repository
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] http://repo.radeon.com/amdgpu/${VERSION}/ubuntu noble main" | tee /etc/apt/sources.list.d/amdgpu.list && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] http://repo.radeon.com/rocm/apt/${VERSION} noble main" | tee --append /etc/apt/sources.list.d/rocm.list && \
    echo "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600" | tee /etc/apt/preferences.d/rocm-pin-600 && \
    # Install ROCm-ml-libraries
    apt-get update &&  apt-get install -y --no-install-recommends rocm-ml-libraries && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # Configure the system linker by indicating where to find the shared objects 
    echo "/opt/rocm/lib\n/opt/rocm/lib64" >  /etc/ld.so.conf.d/rocm.conf

