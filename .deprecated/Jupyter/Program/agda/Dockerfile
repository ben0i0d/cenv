FROM codeberg.org/eoelab/jupyter:python

RUN pip install agda_kernel && \
    python -m agda_kernel.install && \
    pip cache purge
