# Cenv

**codeberg.org: codeberg.org/eoelab/cenv:TAG**

## Platform
* ARCH: x86_64
* OS: 
    * debian sid
    * alpine edge
* ROCM: 7.1.1
* CUDA: >= 13.1
## Container Usage
1. oci: `podman run -it`, See the `runArgs` section of the devcontainer config file for more options.
2. devcontainer(VScode): `cp -r .devcontainer WORKDIR`

## Note
1. Denv: `git` may not be loaded on the first run. Please `Reload Window`.
    1. Press Ctrl + Shift + P (Windows/Linux) or Cmd + Shift + P (macOS) to open the Command Palette.
    2. Type `Reload Window` in the search bar.
    3. Select the `Reload Window` command.
2. C/C++ environment: `.vscode` config may not be loaded on the first run. Please `Reload Window` to ensure the configuration is loaded.
    1. if you need source, please run `sed -i 's/Types: deb/Types: deb deb-src/' /etc/apt/sources.list.d/debian.sources`
3. upython(micropython): 
    1. run `sudo usermod -aG dialout $USER` before use container, add youself to `dialout`
    2. hardware -> tty:
        * raspberry pico: `/dev/ttyACM0`
        * raspberry pi: `/dev/ttyUSB0`
    3. stub(support pylance): `pip install micropython-XXX-stubs`, search on `pypi.org`.
4. cuda:
    1. **Make sure you have installed the [NVIDIA driver](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#nvidia-drivers) for your Linux Distribution**
    2. **Note that you do not need to install the CUDA Toolkit on the host system, but the NVIDIA driver needs to be installed**
    3. For instructions on getting started with the NVIDIA Container Toolkit, refer to the [installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#installation-guide)
    4. for china,maybe need a mirror site: run `sed -i 's/developer.download.nvidia.com/developer.download.nvidia.cn/g' /etc/apt/sources.list.d/cuda-debian13-x86_64.list`
5. rocm: 
    1. run `sudo apt install rocminfo`
    2. run `sudo usermod -aG video,render $USER` before use container, add youself to `video`,`render`
    3. not include any package, please install what you want(`apt install rocm`)
    4. how to run jax/flax:
        1. apt install hipsolver hipfft miopen-hip rccl rocm-llvm rocprofiler-sdk hsa-amd-aqlprofile libamd-comgr2 libdw1  (***I just want to minimize runtime; you can absolutely do a full ROCm installation.***)
        2. see [rocm-jax](https://github.com/ROCm/rocm-jax/releases)
    5. for china,maybe need a mirror site:
        1. run `sed -i 's/repo.radeon.com/radeon.geekery.cn/g' /etc/apt/sources.list.d/amdgpu.list`
        2. run `sed -i 's/repo.radeon.com/radeon.geekery.cn/g' /etc/apt/sources.list.d/rocm.list`
    6. how to run pytorch: PyTorch doesn’t require user-space ROCm support;
        1. run `pip install --pre torch torchvision --index-url https://download.pytorch.org/whl/nightly/rocm7.0`

## Image dependencies
* `Denv` : Development environment
* `Renv`: Runtime environment
* `Gpu`: GPU environment
* `Jupyter`: Jupyterlab environment

```mermaid
graph LR

B{Base} --> Alpine
B --> Debian

subgraph Alpine
    subgraph AD[Denv]
    upython
    zig
    end
    
    subgraph AR[Renv]
    bipes
    crane
    jre_21
    llama
    novnc
    upypi
    zine
    end
end

subgraph Debian
    subgraph DD[Denv]
    c
    cpp
    python
    end

    subgraph DR[Renv]
    mc_be
    steam
    end

    python-->Gpu
    subgraph Gpu
    rocm
    cuda
    end

    python-->Jupyter
    subgraph Jupyter
    python-nb
    end
end
```



## Mirror source
* debian ustc：https://mirrors.ustc.edu.cn/help/debian.html