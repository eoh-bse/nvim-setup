local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return function()
	local keymaps_on_attach = require("nvimtree-keymaps")

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
			float = {
				enable = true,
				open_win_config = function()
					local screen_w = vim.opt.columns:get()
					local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
					local tree_w = screen_w * WIDTH_RATIO
					local tree_h = screen_h * HEIGHT_RATIO
					local tree_w_int = math.floor(tree_w)
					local tree_h_int = math.floor(tree_h)
					local start_point_x = (screen_w - tree_w) / 2
					local start_point_y = (vim.opt.lines:get() - tree_h) / 2 - vim.opt.cmdheight:get()

					return {
						border = "double",
						relative = "editor",
						row = start_point_y,
						col = start_point_x,
						width = tree_w_int,
						height = tree_h_int
					}
				end
			},
			width = function()
				return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
			end
		},
		renderer = {
			root_folder_label = false,
			highlight_opened_files = 'all'
		},
		on_attach = keymaps_on_attach
	})

	-- open nvim-tree at startup
	-- local function open_nvim_tree(data)
	-- 	local is_directory = vim.fn.isdirectory(data.file) == 1
	--
	-- 	if not is_directory then
	-- 		return
	-- 	end
	--
	-- 	vim.cmd.cd(data.file)
	--
	-- 	require("nvim-tree.api").tree.open()
	-- end
	--
	-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end
