#!/usr/bin/env bash

if [[ $( (git --version) 2>&1) == *"requesting install"* ]]; then
	echo
	echo "Git is not installed. Requesting install."
	echo "Run this script again after it's done."
	echo

	exit
fi

# Based on the Atlassian Bare Repo tutorial
# https://www.atlassian.com/git/tutorials/dotfiles

REPO_PATH=$HOME/.cfg

if [ -d "$REPO_PATH" ]; then
	echo
	echo "The dotfiles bare repo directory already exists."
	echo
	echo "Overwrite the content in the \`$REPO_PATH\` directory? [y/N]: "

	read -r REPLY </dev/tty

	case "$REPLY" in
	y | Y)
		rm -rf "$REPO_PATH"

		;;
	*)
		echo "Nothing has been changed."

		exit
		;;
	esac
fi

# Clone the dotfiles bare repo
git clone --bare https://github.com/mattarau/dotfiles.git "$REPO_PATH"

# Define the config alias as a function for this script's shell scope
# For global scope, an alias is defined in .config/zsh/aliases/dotfiles
function dotfiles() {
	/usr/bin/git --git-dir="$REPO_PATH" --work-tree="$HOME" "$@"
}

# Backup any conflicting files
BACKUP_PATH=$HOME/.config-backup
mkdir -p "$BACKUP_PATH"
dotfiles checkout 2>&1 | grep -E "\s+\.|README.md" | awk \{'print $1'\} | tr '\n' '\0' | xargs -0 sh -c '
echo 
for file_path; do
  GREEN="\033[0;32m"
  ORANGE="\033[0;33m"
  NC="\033[0m" # No Color

  BACKUP_PATH="~/.config-backup/$file_path"
  
  echo "moving ${ORANGE}~/$file_path${NC} to ${GREEN}$BACKUP_PATH${NC}"
  
  mkdir -p "$(dirname $BACKUP_PATH)"
  mv "$file_path" "$BACKUP_PATH"
done
' _ # Multi-command solution from: https://stackoverflow.com/a/6958957

# Copy the config files
dotfiles checkout

# Set the config repo to not show untracked files
dotfiles config --local status.showUntrackedFiles no
# Set the config repo to show the remote branches
dotfiles config --local remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

source "$SCRIPT_DIR"/homebrew.sh

source "$SCRIPT_DIR"/git.sh
