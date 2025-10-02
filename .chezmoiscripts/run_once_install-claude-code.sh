#!/bin/bash

# Install Claude Code CLI if npm is available
if command -v npm &> /dev/null; then
    echo "Installing @anthropic-ai/claude-code..."
    npm install -g @anthropic-ai/claude-code
else
    echo "npm not found, skipping Claude Code installation"
fi
