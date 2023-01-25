vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup({
	disable_netrw = true,
	hijack_netrw = true,
	update_focused_file = {
		enable = true,
		-- update_cwd = true
	},
	open_on_setup = true,
	diagnostics = {
		enable = true
	},
	view = {
		side = 'left',
		hide_root_folder = true
	},
	renderer = {
		highlight_opened_files = 'all'
	}
})
