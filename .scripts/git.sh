#!/usr/bin/env bash

function set_user() {
	# The file names are hardcoded as imports in the git config file.
	if [[ "$1" != "global" ]] && [[ "$1" != "dotfiles" ]]; then
		echo "Only 'global' and 'dotfiles' are valid options for git user setup."
		return 0
	fi

	if gum confirm "Do you want to setup a '$1' git user?"; then
		FILE_PATH=$XDG_CONFIG_HOME/git/custom_$1

		NAME=$(gum input --prompt "Name: ")
		EMAIL=$(gum input --prompt "Email: ")

		gum confirm "Confirm setting '$1' config user '$NAME <$EMAIL>'?"

		rm -rf $FILE_PATH
		touch $FILE_PATH

		git config --file=$FILE_PATH user.name "$NAME"
		git config --file=$FILE_PATH user.email "$EMAIL"
	fi
}

set_user global
set_user dotfiles

# Set custom hooks path for dotfiles bare repo
git config --file=$XDG_CONFIG_HOME/git/custom_dotfiles core.hooksPath ~/.scripts/git-hooks
