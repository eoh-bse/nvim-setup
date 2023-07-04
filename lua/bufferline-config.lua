return function()
	require('bufferline').setup({
		options = {
			diagnostics = 'nvim_lsp',
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				return "(" .. count .. ")"
			end,
			indicator = {
				style = "underline"
			},
			offsets = {
				-- {
				-- 	filetype = 'NvimTree',
				-- 	text = 'Explorer',
				-- 	highlight = 'Directory',
				-- 	text_align = 'right'
				-- }
			},
			always_show_bufferline = false
		},
		highlights = {
			buffer_selected = {
				bold = true
			}
		}
	})
end
