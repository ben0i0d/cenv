FROM codeberg.org/eoelab/cenv:js

RUN apt-get update --yes && apt-get install --yes --no-install-recommends git && apt-get clean && rm -rf /var/lib/apt/lists/* && \
    npm install hexo-cli hexo-deployer-git -g && \
    npm cache clean --force