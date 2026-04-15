#!/usr/bin/env sh
# ===============================================
#       UV bootstrap script
# Run automatically after container creation
# ===============================================

# Exit immediately on error.
set -e

# ensure UV exist
if command -v uv >/dev/null 2>&1; then
    echo "uv already installed, skipping."
else
    curl -LsSf https://astral.sh/uv/install.sh | env UV_UNMANAGED_INSTALL="/usr/local/bin" sh
fi

# Support for uv_cache
mkdir -p ./.cache/uv