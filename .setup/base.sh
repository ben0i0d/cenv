#!/usr/bin/env sh
# ===============================================
# DevContainer setup script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# Detect OS
if command -v apk >/dev/null 2>&1; then
    PKG_INSTALL="apk add --no-cache"
elif command -v apt-get >/dev/null 2>&1; then
    PKG_INSTALL="apt-get update && apt-get install -y"
fi

# Install common tools
sh -c "$PKG_INSTALL git openssh-client"

# SSH setup
mkdir -p /root/.ssh
ssh-keyscan github.com >> /root/.ssh/known_hosts
ssh-keyscan codeberg.org >> /root/.ssh/known_hosts