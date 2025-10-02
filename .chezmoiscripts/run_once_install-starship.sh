#!/bin/sh
# This script runs only once, even if you run chezmoi apply multiple times
if ! command -v starship >/dev/null 2>&1; then
    echo "Installing starship..."
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
fi