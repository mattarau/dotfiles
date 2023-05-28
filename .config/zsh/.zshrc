# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# Source PATH
source "$ZDOTDIR/.zshpath"

# Source aliases
for a in $ZDOTDIR/aliases/*; do source "$a"; done

# Source plugins
for p in $ZDOTDIR/plugins/*; do source "$p"; done

# Initiate Starship prompt (Keep at the end)
eval "$(starship init zsh)"

