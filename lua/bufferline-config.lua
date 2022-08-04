vim.opt.termguicolors = true

require('bufferline').setup({
	options = {
		separator_style = 'slant',
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "("..count..")"
		end,
		offsets = {{
			filetype = 'NvimTree',
			text = 'Explorer',
			highlight = 'Directory',
			text_align = 'right',
		}}
	}
})
