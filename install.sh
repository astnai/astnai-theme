#!/bin/bash

# ==============================================================================
# ASTNAI THEME INSTALLER
# ==============================================================================

echo "🎨 Installing Astnai Theme..."
echo ""

# ------------------------------------------------------------------------------
# PREREQUISITES CHECK
# ------------------------------------------------------------------------------

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "❌ Oh My Zsh not found!"
    echo ""
    echo "Please install Oh My Zsh first:"
    echo "sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
    echo ""
    exit 1
fi

# Check if theme file exists
if [ ! -f "astnai.zsh-theme" ]; then
    echo "❌ Theme file 'astnai.zsh-theme' not found!"
    echo "Make sure you're running this script from the theme directory."
    echo ""
    exit 1
fi

# ------------------------------------------------------------------------------
# INSTALLATION PROCESS
# ------------------------------------------------------------------------------

# Copy theme file
echo "📁 Copying theme file..."
cp astnai.zsh-theme ~/.oh-my-zsh/themes/

if [ $? -eq 0 ]; then
    echo "✅ Theme file copied successfully"
else
    echo "❌ Failed to copy theme file"
    exit 1
fi

# Create backup of current .zshrc
echo "💾 Creating backup of .zshrc..."
backup_file="$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
cp ~/.zshrc "$backup_file"

if [ $? -eq 0 ]; then
    echo "✅ Backup created: $(basename "$backup_file")"
else
    echo "⚠️  Warning: Could not create backup of .zshrc"
fi

# Update .zshrc to use the new theme
echo "⚙️  Configuring theme in .zshrc..."

# Check if ZSH_THEME line exists
if grep -q "ZSH_THEME=" ~/.zshrc; then
    # Replace existing theme
    sed -i.tmp 's/ZSH_THEME=".*"/ZSH_THEME="astnai"/' ~/.zshrc
    rm ~/.zshrc.tmp 2>/dev/null
    echo "✅ Theme configured (replaced existing theme)"
else
    # Add theme line if it doesn't exist
    echo 'ZSH_THEME="astnai"' >> ~/.zshrc
    echo "✅ Theme configured (added to .zshrc)"
fi

# ------------------------------------------------------------------------------
# COMPLETION MESSAGE
# ------------------------------------------------------------------------------

echo ""
echo "🎉 Installation completed successfully!"
echo ""
echo "📋 Next steps:"
echo "   1. Restart your terminal, or"
echo "   2. Run: source ~/.zshrc"
echo ""
echo "📁 Your previous .zshrc was backed up as:"
echo "   $(basename "$backup_file")"
echo ""
echo "🎨 Enjoy your new theme!"
echo ""