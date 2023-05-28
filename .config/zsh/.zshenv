# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export COLORTERM="truecolor"

# Default Apps
export TERMINAL="alacritty"

# Ensure that a non-login, non-interactive shell has a defined enviroment.
# This is an adaptation of the idea of this zsh mailing list message:
# https://www.zsh.org/mla/users/2003/msg00600.html
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "$ZDOTDIR/.zshpath" ]]; then
  source "$ZDOTDIR/.zshpath"
fi
