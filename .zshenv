# Default Apps
export TERMINAL="alacritty"
export COLORTERM="truecolor"

# Ensure that a non-login, non-interactive shell has a defined enviroment.
# This is an adaptation of the idea of this zsh mailing list message:
# https://www.zsh.org/mla/users/2003/msg00600.html
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zshpath" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshpath"
fi
