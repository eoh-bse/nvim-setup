return require('nvim-tree').setup({
	disable_netrw = true,
	hijack_netrw = true,
	update_focused_file = {
		enable = true,
		-- update_cwd = true
	},
	diagnostics = {
		enable = true
	},
	view = {
		side = 'left'
	},
	renderer = {
		highlight_opened_files = 'all'
	}
})
