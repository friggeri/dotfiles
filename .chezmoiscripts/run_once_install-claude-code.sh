#!/bin/bash

# Install Claude Code CLI if npm is available
if command -v npm &> /dev/null; then
    echo "Installing @anthropic-ai/claude-code..."
    if npm install -g @anthropic-ai/claude-code; then
        echo "Successfully installed @anthropic-ai/claude-code"
    else
        echo "WARNING: Failed to install @anthropic-ai/claude-code"
        echo "This may be due to permission issues. You can try installing it manually with:"
        echo "  sudo npm install -g @anthropic-ai/claude-code"
        echo "or:"
        echo "  npm install -g @anthropic-ai/claude-code --prefix ~/.local"
        echo "Continuing with dotfiles installation..."
    fi
else
    echo "npm not found, skipping Claude Code installation"
fi
