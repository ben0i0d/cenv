#!/usr/bin/env sh
# ===============================================
#       Mysql bootstrap script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# Storage for mysqld & duckdb
mkdir -p ./.db/mysql ./.db/duckdb
## only initialize when first time
if [ ! -d "./.db/mysql/mysql" ]; then
  mysqld --initialize-insecure --user=root --datadir=./.db/mysql
fi

# start mysqld
mysqld --user=root --datadir=./.db/mysql &

# wait mysqld ready
until mysqladmin ping -u root --silent; do
  sleep 1
done

# Add user for develop use
mysql -u root <<EOF
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

