#!/usr/bin/env bash

set -e

echo "Do you want to set up lua? (y for yes)"
read setup_lua

if [[ "$setup_lua" != "y" ]]; then
	echo "Not setting up lua for Neovim"
	exit 0
fi

echo "Enter the version to install: "
read lua_ls_version

lua_ls=lua-language-server-$lua_ls_version-linux-x64.tar.gz
echo "Setting up lua language server"
curl -LO https://github.com/LuaLS/lua-language-server/releases/download/$lua_ls_version/$lua_ls

lua_ls_path="$HOME/.local/bin/lua-language-server"
mkdir -p $lua_ls_path && tar -xzf $lua_ls -C $lua_ls_path
rm $lua_ls

if ! grep -q "$lua_ls_path/bin" "$HOME/.bashrc"; then
	echo "Adding lua_ls to path..."
	echo "export PATH=\$PATH:$lua_ls_path/bin" >> $HOME/.bashrc
	source .bashrc
fi

echo "Successfully set up lua for Neovim"
