# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=3000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shared/.zshrc'

PS1="%F{#f4b8e4}%n@%m %1~: %f"

autoload -Uz compinit
compinit
# End of lines added by compinstall

update_system() {
    /home/shared/.config/scripts/update_system.sh
}

eval "$(zoxide init --cmd cd zsh)"

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    	builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
