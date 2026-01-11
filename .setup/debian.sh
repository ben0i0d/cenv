#!/usr/bin/env sh
# ===============================================
# DevContainer setup script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# Install Git
apt-get update && apt-get install -y git openssh-client

# Add GitHub's SSH host key
mkdir -p /root/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts
ssh-keyscan codeberg.org >> ~/.ssh/known_hosts