require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'go',
		'gomod',
		'gowork',
		'java',
		'scala',
		'c_sharp',
		'c',
		'cpp',
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
		'proto',
		"yaml",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true
	}
})
