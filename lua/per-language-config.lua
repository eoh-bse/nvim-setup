vim.cmd [[
	autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
	autocmd FileType javascript,typescript setlocal expandtab tabstop=4 shiftwidth=4
	autocmd FileType java setlocal expandtab tabstop=2 shiftwidth=2 textwidth=100 colorcolumn=100
	autocmd FileType javascript,typescript,css,html,json,terraform setlocal expandtab tabstop=2 shiftwidth=2
	autocmd FileType c,cpp setlocal expandtab tabstop=2 shiftwidth=2 textwidth=80 colorcolumn=80
]]
