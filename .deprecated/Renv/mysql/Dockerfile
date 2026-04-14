FROM codeberg.org/eoelab/cenv:alpine

EXPOSE 3306

RUN apk add --no-cache mariadb mariadb-client && \
    mysql_install_db --user=root --datadir=/var/lib/mysql && \
    mkdir -p /run/mysqld

CMD ["mysqld", "--user=root", "--datadir=/var/lib/mysql", "--bind-address=0.0.0.0"]