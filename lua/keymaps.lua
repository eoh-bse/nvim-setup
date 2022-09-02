local function keymap(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- exit to normal mode in terminal mode
keymap('t', '<F2>', '<C-\\><C-n>', nil)

-- split
keymap('n', '<A-s>', ':vsplit<CR>', nil) -- decrease vertical split size
keymap('n', '<A-k>', ':vertical resize +5<CR>', nil) -- increase vertical split size
keymap('n', '<A-j>', ':vertical resize -5<CR>', nil) -- decrease vertical split size
keymap('n', '<A-w>', ':bd<CR>', nil)

-- bufferline shortcuts
keymap('n', '<C-h>', ':BufferLineCyclePrev<CR>', nil)
keymap('n', '<C-l>', ':BufferLineCycleNext<CR>', nil)
keymap('n', '<C-j>', ':BufferLineMovePrev<CR>', nil)
keymap('n', '<C-k>', ':BufferLineMoveNext<CR>', nil)

-- nvim-tree shortcuts
keymap('n', '<C-b>', ':NvimTreeToggle<CR>', nil)
keymap('n', 'tr', ':NvimTreeRefresh<CR>', nil)

-- telescope shortcuts
keymap('n', '<C-p>', ":lua require('telescope.builtin').git_files({ show_untracked = true })<CR>", nil)
keymap('n', '<C-f>', ":lua require('telescope.builtin').find_files()<CR>", nil)
keymap('n', '<A-f>', ":lua require('telescope.builtin').live_grep({ show_untracked = true })<CR>", nil)
keymap('n', 'Fr', ":lua require('telescope.builtin').lsp_references()<CR>", nil)

-- dap shortcuts
keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", nil)
keymap('n', '<F6>', ":lua require'dap'.terminate()<CR>", nil)
keymap('n', '<F7>', ":lua require'dap'.toggle_breakpoint()<CR>", nil)
keymap('n', '<F8>', ":lua require'dapui'.eval()<CR>", nil)
keymap('n', '<F9>', ":lua require'dapui'.float_element('scopes')<CR>", nil)
keymap('n', '<F10>', ":lua require'dap'.step_over()<CR>", nil)
keymap('n', '<F11>', ":lua require'dap'.step_into()<CR>", nil)
keymap('n', '<F12>', ":lua require'dap'.clear_breakpoints()<CR>", nil)
keymap('n', 'dc', ":lua require'dapui'.close()<CR>", nil)
