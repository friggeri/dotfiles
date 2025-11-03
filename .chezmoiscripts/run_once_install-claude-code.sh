#!/bin/bash

# Install Claude Code CLI if npm is available
if command -v npm &> /dev/null; then
    echo "Installing @anthropic-ai/claude-code..."
    if npm install -g @anthropic-ai/claude-code; then
        echo "Successfully installed @anthropic-ai/claude-code"
    else
        echo "WARNING: Failed to install @anthropic-ai/claude-code (this is not critical)"
        echo "You may need to install it manually with: npm install -g @anthropic-ai/claude-code"
        echo "Common causes: insufficient permissions, network issues, or npm configuration problems"
    fi
else
    echo "npm not found, skipping Claude Code installation"
fi

# Always exit successfully so chezmoi can continue
exit 0
