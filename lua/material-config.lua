vim.g.material_style = 'darker'

require('material').setup({
	italics = {
			comments = true
	},
	plugins = {
			nvim_tree = true
	},
	lualine_style = 'default'
})


vim.cmd 'colorscheme material'
