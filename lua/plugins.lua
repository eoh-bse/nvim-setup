return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'nvim-tree/nvim-web-devicons'
	use "olimorris/onedarkpro.nvim"
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-tree/nvim-tree.lua'

	use { 'akinsho/bufferline.nvim', tag = 'v2.*' }

	use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }

	use 'mg979/vim-visual-multi'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
	}

	use 'neovim/nvim-lspconfig'
	use 'numToStr/Comment.nvim'

	-- auto completion plugins
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- telescope
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			use { 'nvim-telescope/telescope-fzf-native.nvim', run =
			'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
		}
	}

	-- git-blame
	use { 'f-person/git-blame.nvim' }

	-- git diffview
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- debugger
	use 'mfussenegger/nvim-dap'
	use 'leoluz/nvim-dap-go'
	use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

    -- scala
    use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } }
end)
