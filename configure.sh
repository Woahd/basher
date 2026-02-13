#!/bin/bash  
  
# Prompt for API key  
echo ""  
echo "========================================="  
echo "  Configuration"  
echo "========================================="  
echo ""  
echo "Please enter your ANTHROPIC_FOUNDRY_API_KEY."  
echo "(The key will be hidden as you type for security)"  
echo ""  
read -rsp "ANTHROPIC_FOUNDRY_API_KEY: " API_KEY < /dev/tty  
echo ""  
  
if [ -z "$API_KEY" ]; then  
    echo "WARNING: No API key provided. You will need to set ANTHROPIC_FOUNDRY_API_KEY manually later."  
fi  
  
ZPROFILE="$HOME/.zprofile"  
  
# Remove any old entries first so we don't get duplicates  
sed -i '' '/# Claude Code \/ Microsoft Foundry Configuration/d' "$ZPROFILE" 2>/dev/null  
sed -i '' '/CLAUDE_CODE_USE_FOUNDRY/d' "$ZPROFILE" 2>/dev/null  
sed -i '' '/ANTHROPIC_FOUNDRY_RESOURCE/d' "$ZPROFILE" 2>/dev/null  
sed -i '' '/ANTHROPIC_DEFAULT_SONNET_MODEL/d' "$ZPROFILE" 2>/dev/null  
sed -i '' '/ANTHROPIC_DEFAULT_HAIKU_MODEL/d' "$ZPROFILE" 2>/dev/null  
sed -i '' '/ANTHROPIC_DEFAULT_OPUS_MODEL/d' "$ZPROFILE" 2>/dev/null  
sed -i '' '/ANTHROPIC_FOUNDRY_API_KEY/d' "$ZPROFILE" 2>/dev/null  
  
# Write clean entries  
echo "" >> "$ZPROFILE"  
echo "# Claude Code / Microsoft Foundry Configuration" >> "$ZPROFILE"  
echo "export CLAUDE_CODE_USE_FOUNDRY=1" >> "$ZPROFILE"  
echo "export ANTHROPIC_FOUNDRY_RESOURCE=it-security-ai" >> "$ZPROFILE"  
echo "export ANTHROPIC_DEFAULT_SONNET_MODEL=claude-sonnet-4-5" >> "$ZPROFILE"  
echo "export ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-haiku-4-5" >> "$ZPROFILE"  
echo "export ANTHROPIC_DEFAULT_OPUS_MODEL=claude-opus-4-6" >> "$ZPROFILE"  
echo "export ANTHROPIC_FOUNDRY_API_KEY=$API_KEY" >> "$ZPROFILE"  
  
# Also export for current session  
export CLAUDE_CODE_USE_FOUNDRY=1  
export ANTHROPIC_FOUNDRY_RESOURCE='it-security-ai'  
export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-5'  
export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4-5'
export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-6'  
export ANTHROPIC_FOUNDRY_API_KEY='$API_KEY'  
  
echo ""  
echo "========================================="  
echo "  Configuration Complete!"  
echo "========================================="  
