#!/usr/bin/env bash
# ==============================================================================
# ezysh installer — Fast, automated setup for ezysh
# ==============================================================================

set -e

REPO="intuezy/ezysh"
INSTALL_DIR="$HOME/.local/bin"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ezysh"

echo -e "\033[1;35m"
echo "  ⚡ Installing ezysh..."
echo -e "\033[0m"

# Ensure ~/.local/bin exists
mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"

# Download binary script
curl -fsSL "https://raw.githubusercontent.com/$REPO/main/bin/ezysh" -o "$INSTALL_DIR/ezysh"
chmod +x "$INSTALL_DIR/ezysh"

# Check shell configuration file
CURRENT_SHELL="$(basename "$SHELL")"
if [ "$CURRENT_SHELL" = "zsh" ] || [ -n "$ZSH_VERSION" ]; then
    RC_FILE="$HOME/.zshrc"
elif [ "$CURRENT_SHELL" = "bash" ] || [ -n "$BASH_VERSION" ]; then
    RC_FILE="$HOME/.bashrc"
else
    RC_FILE="$HOME/.profile"
fi

# Append widget/keybindings if not already present
if [ -f "$RC_FILE" ] && ! grep -q "ezysh" "$RC_FILE"; then
    echo "" >> "$RC_FILE"
    echo "# ── ezysh Command Palette ────────────────────────" >> "$RC_FILE"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$RC_FILE"
    echo 'alias ezy="ezysh"' >> "$RC_FILE"
    if [ "$CURRENT_SHELL" = "zsh" ]; then
        echo 'function _ezysh_widget() { local cmd; cmd=$(ezysh); if [[ -n "$cmd" ]]; then BUFFER="$cmd"; CURSOR=$#BUFFER; fi; zle reset-prompt; }' >> "$RC_FILE"
        echo 'zle -N _ezysh_widget' >> "$RC_FILE"
        echo 'bindkey "^k" _ezysh_widget' >> "$RC_FILE"
        echo 'bindkey "^ " _ezysh_widget' >> "$RC_FILE"
    fi
fi

# Run initial sync
"$INSTALL_DIR/ezysh" --sync >/dev/null 2>&1 || true

echo -e "\033[1;32m  ✔ ezysh installed successfully!\033[0m"
echo -e "\033[0;37m  Restart your shell or run: \033[1;33msource $RC_FILE\033[0m"
echo -e "\033[0;37m  Press \033[1;35mCtrl + K\033[0m\033[0;37m or type \033[1;35mezy\033[0m\033[0;37m to open your palette!\033[0m\n"
