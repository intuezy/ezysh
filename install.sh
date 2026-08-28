#!/usr/bin/env bash
# ==============================================================================
# ezysh installer — Fast, automated, universal setup for ezysh
# Author: intuezy (https://github.com/intuezy)
# License: MIT
# ==============================================================================

set -e

REPO="intuezy/ezysh"
TARGET_DIR="$HOME/.ezysh"
BIN_DIR="$HOME/.local/bin"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ezysh"

echo -e "\033[1;35m"
echo "  ⚡ Installing ezysh — The Aesthetic Shell Command Palette..."
echo -e "\033[0m"

# ── 1. Check Dependencies ────────────────────────
MISSING_DEPS=()
command -v fzf >/dev/null 2>&1 || MISSING_DEPS+=("fzf")
command -v python3 >/dev/null 2>&1 || MISSING_DEPS+=("python3")
command -v git >/dev/null 2>&1 || MISSING_DEPS+=("git")

if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
    echo -e "\033[1;33m  ⚠ Warning: The following dependencies are recommended but not found:\033[0m"
    for dep in "${MISSING_DEPS[@]}"; do
        echo "    - $dep"
    done
    echo -e "  Please install them using your package manager (e.g. brew, apt, dnf, pacman).\n"
fi

# ── 2. Clone or Update Repository ────────────────
mkdir -p "$BIN_DIR"
mkdir -p "$CONFIG_DIR"

if [ -d "$TARGET_DIR/.git" ]; then
    echo "  🔄 Updating existing ezysh installation..."
    git -C "$TARGET_DIR" pull --quiet
else
    echo "  📥 Cloning ezysh to $TARGET_DIR..."
    rm -rf "$TARGET_DIR"
    git clone --quiet "https://github.com/$REPO.git" "$TARGET_DIR"
fi

# ── 3. Symlink Executables ───────────────────────
ln -sf "$TARGET_DIR/bin/ezysh" "$BIN_DIR/ezysh"
ln -sf "$TARGET_DIR/bin/ezysh" "$BIN_DIR/ezy"
chmod +x "$TARGET_DIR/bin/ezysh"

# ── 4. Shell Integration ─────────────────────────
CURRENT_SHELL="$(basename "$SHELL" 2>/dev/null || echo "sh")"

setup_shell_rc() {
    local rc="$1"
    local source_line="$2"
    if [ -f "$rc" ]; then
        if ! grep -q "ezysh" "$rc"; then
            echo "" >> "$rc"
            echo "# ── ezysh Command Palette ────────────────────────" >> "$rc"
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$rc"
            echo "$source_line" >> "$rc"
            echo "  ✔ Added ezysh configuration to $rc"
        fi
    fi
}

# Zsh
if [ -f "$HOME/.zshrc" ] || [ "$CURRENT_SHELL" = "zsh" ]; then
    setup_shell_rc "$HOME/.zshrc" "source $TARGET_DIR/ezysh.plugin.zsh"
fi

# Bash
if [ -f "$HOME/.bashrc" ] || [ "$CURRENT_SHELL" = "bash" ]; then
    setup_shell_rc "$HOME/.bashrc" "source $TARGET_DIR/ezysh.plugin.bash"
fi

# Fish
if [ -d "$HOME/.config/fish" ] || [ "$CURRENT_SHELL" = "fish" ]; then
    mkdir -p "$HOME/.config/fish/conf.d"
    ln -sf "$TARGET_DIR/ezysh.fish" "$HOME/.config/fish/conf.d/ezysh.fish"
    echo "  ✔ Symlinked ezysh.fish to ~/.config/fish/conf.d/"
fi

# ── 5. Run Initial Database Sync ─────────────────
"$BIN_DIR/ezysh" --sync >/dev/null 2>&1 || true

echo ""
echo -e "\033[1;32m  ✔ ezysh installed successfully!\033[0m"
echo -e "\033[0;37m  Restart your terminal or reload your shell to activate.\033[0m"
echo -e "\033[0;37m  Trigger shortcut: \033[1;35mCtrl + K\033[0m\033[0;37m or run: \033[1;35mezy\033[0m\n"
