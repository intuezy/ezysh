# ==============================================================================
# ezysh.plugin.zsh — Zsh integration & keybindings for ezysh
# ==============================================================================

# Add plugin bin directory to PATH if not already present
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"
EZYS_DIR="${0:h}"

if [[ -d "$EZYS_DIR/bin" ]]; then
    path=("$EZYS_DIR/bin" $path)
    export PATH
fi

# ZLE Widget to inject command directly into prompt line
function _ezysh_widget() {
    local cmd
    cmd=$(ezysh)
    if [[ -n "$cmd" ]]; then
        BUFFER="$cmd"
        CURSOR=$#BUFFER
    fi
    zle reset-prompt
}
zle -N _ezysh_widget

# Default Keybindings: Ctrl+K and Ctrl+Space
bindkey '^k' _ezysh_widget
bindkey '^ ' _ezysh_widget
bindkey '^@' _ezysh_widget

# Support vi-mode if active
bindkey -M viins '^k' _ezysh_widget
bindkey -M viins '^ ' _ezysh_widget
bindkey -M viins '^@' _ezysh_widget
bindkey -M vicmd '^k' _ezysh_widget

# Short alias
alias ezy='ezysh'
