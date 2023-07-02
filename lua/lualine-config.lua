return function()
	require('lualine').setup({
		sections = {
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = true,
					path = 1
				}
			}
		}
	})
end
