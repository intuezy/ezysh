# ==============================================================================
# ezysh.plugin.bash — Bash integration & keybindings for ezysh
# ==============================================================================

# Widget to inject command directly into Bash readline buffer
_ezysh_bash_widget() {
    local cmd
    cmd="$(ezysh)"
    if [ -n "$cmd" ]; then
        READLINE_LINE="$cmd"
        READLINE_POINT=${#READLINE_LINE}
    fi
}

if command -v ezysh >/dev/null 2>&1; then
    bind -x '"\C-k": _ezysh_bash_widget'
    bind -x '"\C-@": _ezysh_bash_widget'
fi

alias ezy='ezysh'
