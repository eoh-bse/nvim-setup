set number
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set smarttab
set splitright
set autoread
syntax on

"removes trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

lua require('plugins')
lua require('material-config')
lua require('lualine-config')
lua require('bufferline-config')
lua require('nvimtree-config')
lua require('toggleterm-config')
lua require('nvimtreesitter-config')
lua require('nvim-cmp-config')
lua require('nvim-lsp-config')
lua require('nvimcomment-config')
lua require('dapui-config')
lua require('godap-config')
lua require('keymaps')

