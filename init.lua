-- Vim Settings

vim.cmd([[
set encoding=utf-8
set termguicolors

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

require('per-language-config')

require('plugins')
require('bufferline-config')
require('onedarkpro-config')
require('lualine-config')
require('nvimtree-config')
require('toggleterm-config')
require('nvimtreesitter-config')
require('vsnip-config')
require('nvim-cmp-config')
require('nvim-lsp-config')
require('nvimcomment-config')
require('telescope-config')
require('nvim-dap-config')
require('dapui-config')
require('godap-config')
require('gitblame-config')
require('keymaps')
