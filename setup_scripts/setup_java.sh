#!/usr/bin/env bash

set -e

echo "Do you want to set up java? (y for yes)"
read setup_java

if [[ "$setup_java" != "y" ]]; then
	echo "Not setting up java for Neovim"
	exit 0
fi

if ! command -v java &> /dev/null; then
	echo "JDK is not installed"
	exit 1
fi

echo "Setting up java language server and debugger..."
gzip_name="jdtls.tar.gz"
dir_name="java-language-server"
bin_dir="$HOME/.local/bin"
jdtls_path="$bin_dir/$dir_name"

mkdir -p $dir_name
wget -c https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz -O $gzip_name
tar -xzf $gzip_name -C $dir_name
rm -rf $jdtls_path
mv $dir_name $bin_dir

if ! grep -q "$jdtls_path/bin" "$HOME/.bashrc"; then
	echo "Adding jdtls to path..."
	echo "export PATH=\$PATH:$jdtls_path/bin" >> $HOME/.bashrc
	source $HOME/.bashrc
fi

rm $gzip_name

echo "Successfully set up java for Neovim"
