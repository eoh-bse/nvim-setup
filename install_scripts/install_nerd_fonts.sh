#!/usr/bin/env bash

set -e

fontname=$1
fonts_download_path=$HOME/Downloads
fonts_install_path=$HOME/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$fontname.zip -O \
	$fonts_download_path/$fontname.zip

mkdir -p $fonts_install_path/$fontname

unzip $fonts_download_path/$fontname.zip -d $fonts_install_path/$fontname

rm $fonts_download_path/$fontname.zip

fc-cache -f -v
