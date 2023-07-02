# !/usr/bin/env bash

set -o errexit

echo "Installing prerequisites for fuzzy searching..."
sudo dnf install the_silver_searcher ripgrep fd-find wl-clipboard

echo "Installing lazygit..."
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

echo "Installing Jetbrains Nerd Font (for nvim-tree icons)..."
bash install_scripts/install_nerd_fonts.sh
