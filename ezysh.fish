# ==============================================================================
# ezysh.fish — Fish shell integration & keybindings for ezysh
# ==============================================================================

function _ezysh_widget
    set -l cmd (ezysh)
    if test -n "$cmd"
        commandline -r "$cmd"
        commandline -f repaint
    end
end

bind \ck _ezysh_widget
bind \c@ _ezysh_widget

alias ezy='ezysh'
