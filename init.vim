"Vim Settings
filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8

syntax on

set number
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set shiftround
set colorcolumn=125
set splitright
set ignorecase
set smartcase
set linebreak
set confirm
set autoread
au FocusGained * :checktime

set wrap
set linebreak
set showbreak=>\ \ \

"remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

lua require('plugins')
lua require('bufferline-config')
lua require('onedarkpro-config')
lua require('lualine-config')
lua require('nvimtree-config')
lua require('toggleterm-config')
lua require('nvimtreesitter-config')
lua require('nvim-cmp-config')
lua require('nvim-lsp-config')
lua require('nvimcomment-config')
lua require('telescope-config')
lua require('dapui-config')
lua require('godap-config')
lua require('keymaps')
