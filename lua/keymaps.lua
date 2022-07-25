function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- close current buffer (file)
keymap('n', '<A-w>', ':bd<CR>>', nil)

keymap('n', '<C-h>', ':BufferLineCyclePrev<CR>', nil)
keymap('n', '<C-l>', ':BufferLineCycleNext<CR>', nil)
keymap('n', '<C-j>', ':BufferLineMovePrev<CR>', nil)
keymap('n', '<C-k>', ':BufferLineMoveNext<CR>', nil)
keymap('n', '<C-b>', ':NvimTreeToggle<CR>', nil)
keymap('n', '<C-p>', ':GFiles<CR>', nil)
keymap('n', '<C-f>', ':Files<CR>', nil)
keymap('n', '<A-f>', ':Rg<CR>\'', nil)

-- lsp shortcuts
local lspOptions = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)

-- dap shortcuts
local dap = require('dap')
keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", nil)
keymap('n', '<F6>', ":lua require'dap'.terminate()<CR>", nil)
keymap('n', '<F7>', ":lua require'dap'.toggle_breakpoint()<CR>", nil)
keymap('n', '<F8>', ":lua require'dapui'.eval()<CR>", nil)
keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", nil)
keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", nil)
keymap('n', '<F12>', ":lua require'dap'.repl.open()<CR>", nil)

