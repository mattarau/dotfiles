echo
echo "Move on with installation and configuration (your password is required)? [y/N]: "

read -r REPLY </dev/tty

case "$REPLY" in
y | Y)
	SCRIPT_DIR="$HOME/.scripts"

	/bin/bash "$SCRIPT_DIR"/homebrew.sh

	/bin/bash "$SCRIPT_DIR"/git.sh
	;;
*)
	echo "Nothing has been installed nor configured."

	exit
	;;
esac
