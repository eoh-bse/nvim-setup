local cmp = require('cmp')
local types = require('cmp.types')

cmp.setup({
	completion = {
		completeopt = 'menu,menuone,noinsert,noselect',
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end,
		['<C-j>'] = cmp.mapping.scroll_docs(3),
		['<C-k>'] = cmp.mapping.scroll_docs( -3),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'treesitter' },
		{ name = 'buffer' },
		{ name = 'vsnip' }, -- For vsnip users.
		{ name = 'path' },
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})
