#!/usr/bin/env bash

echo "Do you want to set up typescript/javascript? (y for yes)"
read setup_tsjs

if [[ $setup_tsjs -ne 'y' ]]; then
	echo "Not setting up typescript/javascript for Neovim"
	exit 0
fi

if [! node --version]; then
	echo 'node is not installed'
	exit 1
fi

echo "Installing typescript/javascript language servers..."
sudo npm i -g typescript typescript-language-server vscode-langservers-extracted
