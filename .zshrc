# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# Source PATH
source "${ZDOTDIR:-$HOME}/.zshpath"

