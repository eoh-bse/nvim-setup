require('toggleterm').setup({
	size = 30,
	open_mapping = [[<C-\>]],
	hide_numbers = true,
})

-- set up lazygit with toggleterm
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = 'lazygit',
	hidden = true,
	direction = 'float',
})

function Lazygit_toggle()
	lazygit:toggle()
end

vim.keymap.set('n', '<A-g>', ':lua Lazygit_toggle()<CR>', { noremap = true, silent = true })
