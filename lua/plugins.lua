local plugins = {
	{
		"olimorris/onedarkpro.nvim",
		config = require("onedarkpro-config"),
		priority = 100
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = require("nvimtree-config"),
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy"
	},
	{
		"neovim/nvim-lspconfig",
		config = require("nvim-lsp-config"),
		event = { "BufReadPre", "BufNewFile" }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = require("nvimtreesitter-config"),
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		event = { "BufReadPost", "BufNewFile" }
	},
	{
		"nvim-lualine/lualine.nvim",
		config = require("lualine-config"),
		event = "VeryLazy"
	},
	{
		"hrsh7th/nvim-cmp",
		config = require("nvim-cmp-config"),
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip"
		},
		event = { "InsertEnter" }
	},
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		config = require("telescope-config"),
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
			}
		},
		event = "VeryLazy"
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = require("bufferline-config"),
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy"
	},
	{
		"mg979/vim-visual-multi",
		event = { "BufReadPost", "BufNewFile" }
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = require("toggleterm-config"),
		event = "VeryLazy"
	},
	{
		"mfussenegger/nvim-dap",
		config = require("nvim-dap-config"),
		event = { "BufReadPost", "BufNewFile" }
	},
	{
		"rcarriga/nvim-dap-ui",
		config = require("dapui-config"),
		event = { "BufReadPost", "BufNewFile" }
	},
	{
		"leoluz/nvim-dap-go",
		config = true,
		ft = { "go", "gomod", "gowork", "gosum" }
	},
	{
		"f-person/git-blame.nvim",
		event = { "BufReadPost", "BufNewFile" }
	},
	{
		"numToStr/Comment.nvim",
		config = true,
		event = "VeryLazy"
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPost", "BufNewFile" }
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function() vim.fn["mkdp#util#install"]() end,
		ft = { "markdown" }
	}
}

local options = {
	performance = {
		cache = {
			enabled = true
		},
		rtp = {
			disabled_plugins = {
				"netrwPlugin",
				"tutor"
			}
		}
	}
}

require("lazy").setup(plugins, options)
