#!/usr/bin/env sh
# ===============================================
# DevContainer setup script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# Install Git
apt-get update && apt-get install -y git 

# Add GitHub's SSH host key
ssh-keyscan github.com >> ~/.ssh/known_hosts