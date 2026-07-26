# Runs fast fetch
alias ff="fastfetch"
# Echo ekmek
alias un="echo ekmek"
# Gets random joke
alias joke='curl -s https://v2.jokeapi.dev/joke/Programming | jq -r ".setup + \" \" + .delivery"'
#! alias alice='llama-server -m ~/aimodels/alice.llama.31.8.guff -t 8' obsolute
# Cat wrpaer
alias cat="bat -p --pager never"
# Cat with pager
alias catp="bat --pager never"
# Orginal cat fallback
alias _cat="command cat"
# Go to projects
alias pr="cd ~/projects"
# Go to actove projects
alias pa="cd ~/projects/__active__"
# Go to dynarch project
alias pad="cd ~/projects/dynarch"
# Go to dynarch compiler project
alias dcr="cd ~/projects/dynarch/dynarch-compiler-rs"
# Open yazi
alias y="yazi"
# cd back
alias ..="cd .."
# cd back 2 times
alias ...='cd ../..'
# cd back 3 times
alias ....='cd ../../..'
# cd back 4 times
alias .....='cd ../../../..'
# find a file
alias f='find . -type f -name'
# find something
alias fa='find . -name'
# nvim
alias n='nvim'
# nvim vonfig
alias ncc='cd ~/.config/nvim; nvim'
# Hyprland Package Manager
alias hp='hyprpm'
# Reset sudo permisons
alias rsudo='sudo -k'
# Readme live update
alias rdm="ls README.md | entr -r sh -c 'clear && mdcat README.md'"
# Better ls
alias ls="eza --icons --git"
# Better ls but lah
alias ll="eza --icons --git -lah"
# Better ls but idk what is this at this point
alias lg="eza --icons --git -lah --no-permissions --no-filesize --no-user --no-time"
# Orginal ls fallback
alias _ls="command ls"
# rage
alias what="echo the fuck"
# RAGE
alias WHAT="echo THE FUCK"
# Clear with scrollback buffer
alias clear="printf '\033[2J\033[3J\033[1;1H'"
# Orginal clear fallback
alias _clear="command clear"
# Connect to warp
alias wcc="warp-cli connect"
# Disconnect to warp
alias wcd="warp-cli disconnect"
# Status of warp
alias wcs="warp-cli status"
# Chane warp mode
alias wcm="warp-cli mode"
# Source zshrc
alias sz="source ~/.zshrc"
# Modify zsh configs
alias zc="cd ~/zsh-sources; nvim"
# Modify zshrc
alias zr="nvim ~/.zshrc"
# Theme manager
alias kft="~/scripts/env_mng/kft_env.sh"
# Global theme set
alias kset="~/scripts/env_mng/kft_env.sh set"
# Best seed for my celular automate
alias bestlook="echo 1769212211"
# better mkdir
alias mkdir="mkdir -pv"
# Orginal mkdir fallback
alias _mkdir="command mkdir"
# make but better
alias mk="make -j$(nproc)"
# make but clean n rebuild
alias mkc="make clean && -j$(nproc)"
# gdb but better
alias gdb="gdb -tui"
# remove olphans
alias rmophan='pacman -Qdtq | fzf -m --prompt="Remove orphan: " --marker="✔ " | xargs -r sudo pacman -Rns'
# just reality
alias gf='echo "Reletionship fault (you got dumped)"'
# nsfw image fetcher
alias nsfw='/home/koofte/projects/cat/ii.sh'
