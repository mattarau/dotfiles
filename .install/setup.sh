#!/usr/bin/env bash

if [[ $((git --version) 2>&1) == *"requesting install"* ]]; then
  echo
	echo "Git is not installed. Requesting install."
	echo "Run this script again after it's done."
  echo

	exit
fi

# Based on the Atlassian Bare Repo tutorial
# https://www.atlassian.com/git/tutorials/dotfiles

# Clone the dotfiles bare repo
git clone --bare https://github.com/mattarau/dotfiles.git $HOME/.cfg

# Define the config alias as a function for this script's shell scope
# For global scope, an alias is defined in .config/zsh/aliases/dotfiles
function dotfiles() {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

# Backup any conflicting files
mkdir -p .config-backup
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}

# Copy the config files
dotfiles checkout

# Set the config repo to not show untracked files
dotfiles config --local status.showUntrackedFiles no
# Set the config repo to show the remote branches
dotfiles config --local remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source $SCRIPT_DIR/homebrew.sh

source $SCRIPT_DIR/git.sh
