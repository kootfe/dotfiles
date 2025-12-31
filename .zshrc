typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export KZSH="$HOME/zsh-sources"
if [[ $- == *i* ]]; then
    #fastfetch
    if ! pgrep -u "$USER" ssh-agent >/dev/null; then
        eval "$(ssh-agent -s)" >/dev/null
    fi
    ssh-add ~/projects/__active__/.sshkeys/ed25519_gitlab \
        ~/projects/__active__/.sshkeys/ed25519_github 2>/dev/null
fi
# Powerlevel10k instant prompt — keep this at top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Your ZSH paths and init scripts
export ZSH="$HOME/.oh-my-zsh"

source $KZSH/init.zsh
source $KZSH/theme.zsh
source $KZSH/funcs.zsh
source $KZSH/plugins.zsh
source $KZSH/export.zsh
source $ZSH/oh-my-zsh.sh
source $KZSH/aliases.zsh

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash



export PATH=$PATH:/home/koofte/.spicetify
