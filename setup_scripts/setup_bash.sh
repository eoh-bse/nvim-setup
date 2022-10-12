#!/usr/bin/env bash

echo "Do you want to set up bash? (y for yes)"
read setup_bash

if [[ "$setup_bash" != "y" ]]; then
	echo "Not setting up bash for Neovim"
	exit 0
fi

echo "Setting up bash language server..."
sudo npm i -g bash-language-server
