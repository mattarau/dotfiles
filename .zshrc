# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
autoload -U colors && colors

# Source PATH
source "${ZDOTDIR:-$HOME}/.zshpath"

# Source configs
for f in $HOME/.config/shell/*; do source "$f"; done



# Automatically list directory contents on `cd`.
auto-ls() { ls; }
chpwd_functions=(auto-ls $chpwd_functions)

# THE FUCK!!!
# Lazy-loading as suggested in this issue:
# https://github.com/nvbn/thefuck/issues/859
if command -v thefuck >/dev/null 2>&1; then
  fuck() {
    eval "$(thefuck --alias)" && fuck
  }
fi

# Fuzzy Finder
fzf_path="${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
[ -f "$fzf_path" ] && source "$fzf_path"

# Syntax Highlight
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-Suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Smarter cd command.
eval "$(zoxide init zsh)"

# Initiate Stardhip shell (Keep at the end)
eval "$(starship init zsh)"

