#!/usr/bin/env sh
# ===============================================
#       Python setup script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# Support for pip_cache
mkdir -p ./.cache/pip