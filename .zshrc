# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# Source PATH
source "${ZDOTDIR:-$HOME}/.zshpath"

# Source configs
for f in $HOME/.config/shell/*; do source "$f"; done


# Initiate Stardhip shell (Keep at the end)
eval "$(starship init zsh)"
