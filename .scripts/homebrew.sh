# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure brew in the the PATH (if "$ZDOTDIR/.zshpath" is not yet sourced).
PATH="/opt/homebrew/bin:$PATH"

# Install Homebrew Bundle
brew bundle install --file="$HOME/.scripts/Brewfile"

# -----------------------------------------------------------------------------
# Post-install
# -----------------------------------------------------------------------------

# FZF Install
$(brew --prefix)/opt/fzf/install --xdg --key-bindings --completion --no-update-rc --no-bash --no-fish
