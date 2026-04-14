#!/usr/bin/env sh
# ===============================================
#       Mysql setup script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# Storage for mysql
mkdir -p ./.db/mysql
mkdir -p ./.db/duckdb
## only initialize when first time
if [ ! -d "./.db/mysql/mysql" ]; then
  mysql_install_db --user=root --datadir=./.db/mysql
fi