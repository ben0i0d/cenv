FROM codeberg.org/eoelab/cenv:python as builder

RUN apt-get update && apt-get install -y wget curl gnupg2 && \
    curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&options=mr&search=0x0C0E6AF955CE463C03FC51574D098D70AFBE5E1F" | gpg --dearmor -o /usr/share/keyrings/intel-graphics.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/intel-graphics.gpg] https://ppa.launchpadcontent.net/kobuk-team/intel-graphics/ubuntu noble main" >> /etc/apt/sources.list.d/intel-graphics.list && \
    echo "deb-src [signed-by=/usr/share/keyrings/intel-graphics.gpg] https://ppa.launchpadcontent.net/kobuk-team/intel-graphics/ubuntu noble main"  >> /etc/apt/sources.list.d/intel-graphics.list && \
    
    wget -qO- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor -o /usr/share/keyrings/oneapi.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/oneapi.gpg] https://apt.repos.intel.com/oneapi all main" >> /etc/apt/sources.list.d/oneAPI.list

FROM codeberg.org/eoelab/cenv:python
# Install intel-graphics & oneapi repo
COPY --from=builder /etc/apt/sources.list.d/intel-graphics.list /etc/apt/sources.list.d/oneAPI.list /etc/apt/sources.list.d/
COPY --from=builder /usr/share/keyrings/intel-graphics.gpg /usr/share/keyrings/oneapi.gpg /usr/share/keyrings/