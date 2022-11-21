vim.cmd [[
	autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
	autocmd FileType javascript,typescript setlocal expandtab tabstop=4 shiftwidth=4
	autocmd FileType json,terraform setlocal expandtab tabstop=2 shiftwidth=2
	autocmd FileType cpp setlocal expandtab tabstop=2 shiftwidth=2 textwidth=80 colorcolumn=80
]]
