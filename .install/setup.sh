#!/usr/bin/env bash

# Based on the Atlassian Bare Repo tutorial
# https://www.atlassian.com/git/tutorials/dotfiles

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Clone the dotfiles bare repo
git clone --bare https://github.com/mattarau/dotfiles.git $HOME/.cfg

# Define the config alias as a function for this script's shell scope
function config() {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

# Backup any conflicting files
mkdir -p .config-backup
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

# Copy the config files
config checkout

# Set the config repo to not show untracked files
config config --local status.showUntrackedFiles no

source $SCRIPT_DIR/homebrew.sh
