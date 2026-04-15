FROM codeberg.org/eoelab/cenv:debian

ENV PATH="/opt/base/bin:${PATH}" \
    PIP_INDEX_URL="https://mirrors.ustc.edu.cn/pypi/simple"

# install venv
RUN apt-get update --yes && apt-get install --yes --no-install-recommends python3-venv && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    python3 -m venv /opt/base