"Vim Settings
" filetype on
" filetype indent on
" filetype plugin on

set encoding=UTF-8
set termguicolors

" let nvim-treesitter do the syntax highlighting
syntax off

set number
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set shiftround
set textwidth=125
set colorcolumn=125
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

lua require('per-language-config')

lua require('plugins')
lua require('bufferline-config')
lua require('onedarkpro-config')
lua require('lualine-config')
lua require('nvimtree-config')
lua require('toggleterm-config')
lua require('nvimtreesitter-config')
lua require('vsnip-config')
lua require('nvim-cmp-config')
lua require('nvim-lsp-config')
lua require('nvimcomment-config')
lua require('telescope-config')
lua require('nvim-dap-config')
lua require('dapui-config')
lua require('godap-config')
lua require('nvim-scala-config')
lua require('gitblame-config')
lua require('keymaps')
