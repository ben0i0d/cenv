#!/usr/bin/env sh
# ===============================================
#       venv bootstrap script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# ensure venv exist
if command -v python3 -m venv >/dev/null 2>&1; then
    echo "venv already installed, skipping."
else
    apt-get update --yes && apt-get install --yes --no-install-recommends python3-venv
fi

# Support for pip_cache
mkdir -p ./.cache/pip