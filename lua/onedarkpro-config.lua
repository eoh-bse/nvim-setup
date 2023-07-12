return function()
	require("onedarkpro").setup({
		theme = "onedark",
		options = {
			transparency = true
		},
		colors = {
			onedark = {
				bg = "#242526"
			}
		}
	});

	vim.cmd("colorscheme onedark")
end
