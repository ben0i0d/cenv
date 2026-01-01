# jupyter-image-stacks

## Jupyterlab Image stacks for Data Science

**codeberg.org: codeberg.org/eoelab/cenv:TAG**

### HOW TO USE

**Jupyterlab run as root**

**handle permissions carefully before use**

### Global description
1. If you build or fork the image yourself, replace the base image in the Dockerfile with the image on DockerHub
2. For commercial software such as Mathematica, MATLAB, etc., we only provide packaging, and the specific activation method and possible consequences are borne by the user
3. The following code fixes the issue of missing Chinese characters in matplotlib plots.(You need to install `wqy-zenhei` beforehand.)
```
from matplotlib.font_manager import FontProperties
# Set the path to the Chinese font
zh_font = FontProperties(fname="/usr/share/fonts/truetype/wqy/wqy-zenhei.ttc")
# Set the Chinese font as the default font in matplotlib
plt.rcParams["font.family"] = zh_font.get_name()
```
### List of images that are currently being built
* Jupyter: benchmarking against the jupyter official minimal-notebook image
    * Description
        1. Upstream has switched to `debian:sid-slim`
        2. Provided packages: .zip extraction
        3. Supports Python

### List of plugins

**Global**
* jupyterlab-language-pack-zh-CN:Support for Chinese
* jupyterlab-lsp：It is used for autocompletion, parameter suggestion, function document query, and jump definition
* jupyterlab-execute-time: Displays the execution time of each cell
* jedi-language-server: Python Language server

## Upstream

**Package version**
* Python 3.13
* jupyterlab 4

### Upstream of the project
https://github.com/jupyter/docker-stacks

**However, we are quite different from the upstream in terms of sources, packages, localizations, extensions, etc., so if you have a problem with this project, please do not ask the Jupyter team questions, as it will increase their workload**

### kernel
* Python：https://ipython.org/**Default Mirror source**
* pip bfsu：https://mirrors.bfsu.edu.cn/help/pypi/
* apt ustc：https://mirrors.ustc.edu.cn/help/debian.html

## Necessary copyright notice
For code derived from other teams, we added the original copyright notice to the file header, and we retain and support the copyrights of other development teams