# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# Source PATH
source "${ZDOTDIR:-$HOME}/.zshpath"

# Source configs
for f in $HOME/.config/shell/*; do source "$f"; done



# Syntax Highlight
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-Suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Smarter cd command.
eval "$(zoxide init zsh)"

# Initiate Stardhip shell (Keep at the end)
eval "$(starship init zsh)"
