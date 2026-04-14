FROM codeberg.org/eoelab/cenv:python

RUN apt-get update --yes && apt-get install --yes --no-install-recommends duckdb mariadb-server mariadb-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    mysql_install_db --user=root --datadir=/var/lib/mysql

CMD ["mysqld", "--user=root", "--datadir=/var/lib/mysql", "--bind-address=0.0.0.0"]