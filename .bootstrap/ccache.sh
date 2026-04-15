#!/usr/bin/env sh
# ===============================================
#       ccache bootstrap script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# ensure ccache exist
if command -v ccache >/dev/null 2>&1; then
    echo "ccache already installed, skipping."
else
    apt-get update && apt-get install -y ccache
fi

# Storage for ccache
mkdir -p ./.cache/ccache && ccache --set-config=compression=true && ccache --max-size=32G