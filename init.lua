-- Vim Settings

-- for lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- for nvim-tree.nvim
vim.g.loaded_netrw = false
vim.g.loaded_netrwPlugin = false

-- for bufferline.nvim
vim.opt.termguicolors = true

-- for vim-vsnip
vim.g.vsnip_snippet_dir = "~/.config/nvim/vsnip_snippets/"

-- for gitblame.nvim
vim.g.gitblame_enabled = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

vim.cmd([[
set encoding=utf-8

" let nvim-treesitter do the syntax highlighting
syntax off

set number
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set shiftround
set textwidth=110
set colorcolumn=110
set splitright
set ignorecase
set smartcase
set linebreak
set confirm
set autoread
set shortmess+=c
au FocusGained * :checktime

set wrap
set linebreak
set showbreak=>\ \ \
]])

require("per-language-config")
require("plugins")
require("keymaps")
