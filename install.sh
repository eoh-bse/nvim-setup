# !/usr/bin/env bash

set -o errexit

echo "Installing Packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Installing prerequisites for fuzzy searching..."
sudo dnf install the_silver_searcher ripgrep fd-find wl-clipboard

echo "Installing lazygit..."
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

echo "Installing Hack Nerd Font (for nvim-tree icons)..."
bash install_scripts/install_nerd_fonts.sh

echo "If you want things to look even better, install Jetbrains Mono font: https://www.jetbrains.com/lp/mono/#how-to-install"

echo "Make sure to follow nvim-metals installation instruction at https://github.com/scalameta/nvim-metals"
echo "Make sure to have JAVA_HOME environment variable set in your terminal profile (like .bashrc) as mentioned in https://scalameta.org/metals/docs/editors/vim"
