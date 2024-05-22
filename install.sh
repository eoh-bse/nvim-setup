# !/usr/bin/env bash

set -o errexit

echo "Installing prerequisites for fuzzy searching..."
sudo pacman -S fzf the_silver_searcher ripgrep fd-find wl-clipboard

echo "Installing lazygit..."
sudo pacman -S lazygit

echo "Installing JetbrainsMono Nerd Font (for nvim-tree icons)..."
sudo pacman -S ttf-jetbrains-mono-nerd
