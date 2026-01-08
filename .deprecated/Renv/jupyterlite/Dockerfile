FROM codeberg.org/eoelab/cenv:python

EXPOSE 8000

WORKDIR /opt

RUN pip install jupyterlite-core jupyterlab_server jupyterlite-pyodide-kernel && pip cache purge && \
    jupyter lite build

CMD [ "jupyter", "lite", "serve" ]