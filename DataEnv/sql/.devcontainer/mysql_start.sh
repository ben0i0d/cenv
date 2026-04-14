#!/usr/bin/env sh
# ===============================================
#       Mysql start script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# start mariadb
mariadbd --user=root --datadir=./.db/mysql &

# wait mariadb ready
until mysqladmin ping -u root --silent; do
  sleep 1
done

# Add user for develop use
mysql -u root <<EOF
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

