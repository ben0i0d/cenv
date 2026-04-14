#!/usr/bin/env sh
# ===============================================
#       ccache setup script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# Install ccache
apt-get update && apt-get install -y ccache

# Storage for ccache
mkdir -p ./.cache/ccache && ccache --set-config=compression=true && ccache --max-size=32G