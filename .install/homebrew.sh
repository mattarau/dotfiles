# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew Bundle
brew bundle install

# -----------------------------------------------------------------------------
# Post-install
# -----------------------------------------------------------------------------

# FZF Install
$(brew --prefix)/opt/fzf/install --xdg --key-bindings --completion --no-update-rc --no-bash --no-fish
