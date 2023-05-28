# Set ZSH Dot Dir
export ZDOTDIR=$HOME/.config/zsh

# Source extra env if available
[ -f "$ZDOTDIR/.zshenv" ] && source "$ZDOTDIR/.zshenv"
