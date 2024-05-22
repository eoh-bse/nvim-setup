#!/usr/bin/env bash

set -e

echo "Do you want to set up lua? (y for yes)"
read setup_lua

if [[ "$setup_lua" != "y" ]]; then
	echo "Not setting up lua for Neovim"
	exit 0
fi

sudo pacman -S lua-language-server

echo "Successfully set up lua for Neovim"
