require('nvim-treesitter').setup({
	ensure_installed = {
		'go',
		'gomod',
		'gowork',
		'java',
		'scala',
		'c_sharp',
		'html',
		'css',
		'scss',
		'javascript',
		'typescript',
		'tsx',
		'json',
		'bash',
		'dockerfile',
		'lua',
		'regex',
		'proto'
	},
	auto_install = true,
	highlight = {
		enable = true
	}
})
