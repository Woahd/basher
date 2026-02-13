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