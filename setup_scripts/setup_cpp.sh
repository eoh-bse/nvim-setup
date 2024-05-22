#!/usr/bin/env bash

set -e

echo "Do you want to set up C/C++? (y for yes)"
read setup_cpp

if [[ "$setup_cpp" != "y" ]]; then
	echo "Not setting up C++ for Neovim"
	exit 0
fi

echo "Installing C/C++ compilers and CMake..."
sudo pacman -S clang cmake

echo "Successfully set up C/C++ for Neovim"
