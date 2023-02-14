vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
		side = 'left',
		hide_root_folder = true
	},
	renderer = {
		highlight_opened_files = 'all'
	}
})

local function open_nvim_tree(data)
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
	local is_directory = vim.fn.isdirectory(data.file) == 1

	if not is_directory then
		return
	end

	vim.cmd.cd(data.file)

	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
