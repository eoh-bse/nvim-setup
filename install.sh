# !/usr/bin/env bash

set -o errexit

echo "Installing Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo 'Installing prerequisites for fzf'
sudo dnf install the_silver_searcher ripgrep

echo 'Installing Hack Nerd Font (for nvim-tree icons)'
bash install_nerd_fonts.sh

if [! go version]; then
	echo 'go is not installed'
	exit 1
fi

if [! node --version]; then
	echo 'node is not installed'
	exit 1
fi

echo 'Installing language servers...'
sudo npm i -g typescript typescript-language-server vscode-langservers-extracted bash-language-server

go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest

echo "If you want things to look even better, install Jetbrains Mono font: https://www.jetbrains.com/lp/mono/#how-to-install"
