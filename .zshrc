typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export KZSH="$HOME/zsh-sources"

if [[ $- == *i* ]]; then
 #   source /usr/share/nvm/init-nvm.sh
 #   eval "$(keychain --eval --quiet ~/.ssh/id_badbob)"
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:plugins:git' aliases no
source $KZSH/theme.zsh
source $KZSH/plugins.zsh
source $ZSH/oh-my-zsh.sh
source "$KZSH/export.zsh"
source $KZSH/aliases.zsh
source $KZSH/funcs.zsh

#eval $(thefuck --alias)

[ -f "/home/koofte/.ghcup/env" ] && . "/home/koofte/.ghcup/env"

fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit 

typeset -U path PATH
unsetopt autocd

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
