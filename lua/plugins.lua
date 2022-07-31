return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use 'kyazdani42/nvim-web-devicons'
	use 'marko-cerovac/material.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-tree.lua'

	use { 'akinsho/bufferline.nvim', tag = 'v2.*' }

	use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }

	use { 'junegunn/fzf', run = ':call fzf#install()' }
	use 'junegunn/fzf.vim'

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

	-- debugger
	use 'mfussenegger/nvim-dap'
	use 'leoluz/nvim-dap-go'
	use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }

    -- git
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
end)

