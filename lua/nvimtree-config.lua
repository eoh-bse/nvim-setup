return function()
	local keymaps_on_attach = require("nvim-tree-keymaps")

	require('nvim-tree').setup({
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
			root_folder_label = false,
			highlight_opened_files = 'all'
		},
		on_attach = keymaps_on_attach
	})

	local function open_nvim_tree(data)
		local is_directory = vim.fn.isdirectory(data.file) == 1

		if not is_directory then
			return
		end

		vim.cmd.cd(data.file)

		require("nvim-tree.api").tree.open()
	end

	vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end
