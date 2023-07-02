#!/usr/bin/env bash

# fontname=hack-nerd-font
fontname=jetbrains-nerd-font

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip -O \
	~/Downloads/$fontname.zip

if [ ! -d "~Downloads/$fontname" ]; then
	mkdir ~/Downloads/$fontname
fi

unzip ~/Downloads/$fontname.zip -d ~/Downloads/$fontname
sudo mv ~/Downloads/$fontname /usr/share/fonts/

rm ~/Downloads/$fontname.zip

fc-cache -f -v
