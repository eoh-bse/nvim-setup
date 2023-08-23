return function()
	local telescope = require("telescope")
	telescope.setup({
		preview = true,
		file_ignore_patterns = {
			"node_modules/"
		}
	})

	telescope.load_extension("fzf")
end
