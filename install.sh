#!/bin/bash  
  
set -e  
  
echo "========================================="  
echo "  macOS Development Environment Setup"  
echo "========================================="  
echo ""  
  
# Install Homebrew  
echo "[1/6] Installing Homebrew..."  
if command -v brew &>/dev/null; then  
    echo "Homebrew is already installed. Skipping..."  
else  
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
fi  
  
# Configure Homebrew in shell profile  
echo >> /Users/employee/.zprofile  
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/employee/.zprofile  
eval "$(/opt/homebrew/bin/brew shellenv zsh)"  
  
# Install packages via Homebrew (skip if already installed)  
echo "[2/6] Installing Git..."  
brew install git || echo "Git is already installed. Skipping..."  
  
echo "[3/6] Installing Visual Studio Code..."  
brew install --cask visual-studio-code || echo "VS Code is already installed. Skipping..."  
  
echo "[4/6] Installing Google Chrome..."  
brew install --cask google-chrome || echo "Google Chrome is already installed. Skipping..."  
  
echo "[5/6] Installing Docker..."  
brew install docker || echo "Docker is already installed. Skipping..."  
  
# Install Claude Code  
echo "[6/6] Installing Claude Code..."  
curl -fsSL https://claude.ai/install.sh | bash || echo "Claude Code install encountered an issue. Continuing..."  
  
# Prompt for API key  
echo ""  
echo "========================================="  
echo "  Configuration"  
echo "========================================="  
echo ""  
read -rp "Enter your ANTHROPIC_FOUNDRY_API_KEY: " API_KEY  
  
if [ -z "$API_KEY" ]; then  
    echo "WARNING: No API key provided. You will need to set ANTHROPIC_FOUNDRY_API_KEY manually later."  
fi  
  
# Write environment variables to .zprofile  
cat >> /Users/employee/.zprofile << EOF  
  
# Claude Code / Microsoft Foundry Configuration  
export CLAUDE_CODE_USE_FOUNDRY=1  
export ANTHROPIC_FOUNDRY_RESOURCE=it-security-ai  
export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-5'  
export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4-5'  
export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-6'  
export ANTHROPIC_FOUNDRY_API_KEY=${API_KEY}  
EOF  
  
# Source the profile so variables are available in the current session  
source /Users/employee/.zprofile  
  
echo ""  
echo "========================================="  
echo "  Setup Complete!"  
echo "========================================="  
echo ""  
echo "The following have been installed:"  
echo "  - Homebrew"  
echo "  - Git"  
echo "  - Visual Studio Code"  
echo "  - Google Chrome"  
echo "  - Docker"  
echo "  - Claude Code"  
echo ""  
echo "Environment variables have been written to /Users/employee/.zprofile"  
echo ""  
echo "Please restart your terminal or run 'source ~/.zprofile' to load all settings."  