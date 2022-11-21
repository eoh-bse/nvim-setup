#!/usr/bin/env bash

set -e

echo "Do you want to set up golang? (y for yes)"
read setup_go

if [[ "$setup_go" != "y" ]]; then
	echo "Not setting up golang for Neovim"
	exit 0
fi

if ! command -v go &> /dev/null; then
	echo 'go is not installed'
	exit 1
fi

echo "Setting up golang language server and debugger..."
go install golang.org/x/tools/gopls@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/go-delve/delve/cmd/dlv@latest

echo "Successfully set up golang for Neovim"
