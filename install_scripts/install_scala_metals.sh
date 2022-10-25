#!/usr/bin/env bash

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
chmod +x cs
./cs setup

rm ./cs

coursier install bloop
coursier install metals

cp ~/.local/share/coursier/bin/metals ~/.cache/nvim/nvim-metals/
