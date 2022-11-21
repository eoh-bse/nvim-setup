#!/usr/bin/env bash

set -e

echo "Do you want to set up typescript/javascript? (y for yes)"
read setup_tsjs

if [[ "$setup_tsjs" != "y" ]]; then
	echo "Not setting up typescript/javascript for Neovim"
	exit 0
fi

if ! command -v node &> /dev/null; then
	echo 'node is not installed'
	exit 1
fi

echo "Installing typescript/javascript language servers..."
sudo npm i -g typescript typescript-language-server vscode-langservers-extracted

echo "Successfully set up javascript and typescript for Neovim"
