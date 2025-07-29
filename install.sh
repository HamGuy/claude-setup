#!/bin/bash

# Installer script for ccsetup command

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="/usr/local/bin"

echo "Installing ccsetup to $INSTALL_DIR..."

# Check if we have write permissions to INSTALL_DIR
if [ ! -w "$INSTALL_DIR" ]; then
    echo "Error: No write permissions to $INSTALL_DIR. Try running with sudo:"
    echo "sudo $0"
    exit 1
fi

# Copy the script to the install directory
cp "$SCRIPT_DIR/ccsetup" "$INSTALL_DIR/ccsetup"

# Create a directory for the configuration files next to the script
CONFIG_DIR="$INSTALL_DIR/ccsetup-config"
mkdir -p "$CONFIG_DIR"

# Copy configuration files to the config directory if they exist locally
if [ -d "$SCRIPT_DIR/.claude" ] && [ -f "$SCRIPT_DIR/.mcp.json" ]; then
    cp -r "$SCRIPT_DIR/.claude" "$CONFIG_DIR/"
    cp "$SCRIPT_DIR/.mcp.json" "$CONFIG_DIR/"
    echo "Configuration files copied locally."
else
    echo "Configuration files not found locally. They will be downloaded when needed."
fi

# Make the main script executable
chmod +x "$INSTALL_DIR/ccsetup"

echo "Installation complete!"
echo "You can now use 'ccsetup init [directory]' to initialize Claude Code configuration."