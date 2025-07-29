#!/bin/bash

# Claude Setup - One-Click Installation Script
# Installer script for ccsetup command (User installation - no sudo required)

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REPO_URL="https://github.com/HamGuy/claude-setup"
INSTALL_DIR="$HOME/.local/bin"
CONFIG_DIR="$INSTALL_DIR/ccsetup-config"
TEMP_DIR="/tmp/claude-setup-install-$$"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Functions
print_step() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}

# Trap cleanup on exit
trap cleanup EXIT

print_step "Installing ccsetup to $INSTALL_DIR (user installation)..."

# Create the install directory if it doesn't exist
mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"

# Check if running from local repository or downloaded script
if [ -f "$SCRIPT_DIR/ccsetup" ]; then
    # Local installation - copy files directly
    print_step "Installing from local repository..."
    cp "$SCRIPT_DIR/ccsetup" "$INSTALL_DIR/ccsetup"
    
    # Copy configuration files if they exist locally
    if [ -d "$SCRIPT_DIR/.claude" ] && [ -f "$SCRIPT_DIR/.mcp.json" ]; then
        cp -r "$SCRIPT_DIR/.claude" "$CONFIG_DIR/"
        cp "$SCRIPT_DIR/.mcp.json" "$CONFIG_DIR/"
        print_success "Configuration files copied from local repository"
    else
        print_warning "Configuration files not found locally. They will be downloaded when needed."
    fi
else
    # Remote installation - download from GitHub
    print_step "Downloading claude-setup from GitHub..."
    
    # Check for required tools
    if ! command -v curl >/dev/null 2>&1; then
        print_error "curl is required but not installed. Please install curl first."
        exit 1
    fi
    
    if ! command -v unzip >/dev/null 2>&1; then
        print_error "unzip is required but not installed. Please install unzip first."
        exit 1
    fi
    
    mkdir -p "$TEMP_DIR"
    
    # Download the repository
    zip_file="$TEMP_DIR/claude-setup.zip"
    if ! curl -fsSL "${REPO_URL}/archive/refs/heads/main.zip" -o "$zip_file"; then
        print_error "Failed to download claude-setup from GitHub"
        exit 1
    fi
    
    print_step "Extracting files..."
    if ! unzip -q "$zip_file" -d "$TEMP_DIR"; then
        print_error "Failed to extract downloaded files"
        exit 1
    fi
    
    # Find the extracted directory
    extracted_dir=$(find "$TEMP_DIR" -name "claude-setup-*" -type d | head -1)
    
    if [ -z "$extracted_dir" ] || [ ! -d "$extracted_dir" ]; then
        print_error "Could not find extracted claude-setup directory"
        exit 1
    fi
    
    # Copy files from extracted directory
    if [ ! -f "$extracted_dir/ccsetup" ]; then
        print_error "ccsetup script not found in downloaded files"
        exit 1
    fi
    
    cp "$extracted_dir/ccsetup" "$INSTALL_DIR/ccsetup"
    
    # Copy configuration files
    if [ -d "$extracted_dir/.claude" ]; then
        cp -r "$extracted_dir/.claude" "$CONFIG_DIR/"
        print_success "Copied .claude configuration from GitHub"
    else
        print_warning ".claude directory not found in download"
    fi
    
    if [ -f "$extracted_dir/.mcp.json" ]; then
        cp "$extracted_dir/.mcp.json" "$CONFIG_DIR/"
        print_success "Copied .mcp.json configuration from GitHub"
    else
        print_warning ".mcp.json file not found in download"
    fi
fi

# Make the main script executable
chmod +x "$INSTALL_DIR/ccsetup"

echo "Installation complete!"
echo ""
echo "The ccsetup command has been installed to: $INSTALL_DIR/ccsetup"
echo ""
echo "Make sure $INSTALL_DIR is in your PATH. You can add it by running:"
echo "echo 'export PATH=\$HOME/.local/bin:\$PATH' >> ~/.zshrc"
echo "source ~/.zshrc"
echo ""
echo "Then you can use 'ccsetup init [directory]' to initialize Claude Code configuration."
