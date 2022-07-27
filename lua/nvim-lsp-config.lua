-- Setup lspconfig.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = require('nvim-lsp-keymaps')

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach
})
lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach
})
lspconfig.gopls.setup({
	cmd = { 'gopls', 'serve' },
	filetypes = { 'go', 'gomod' },
	root_dir = lspconfig.util.root_pattern('go.work', 'go.mod', '.git'),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      }
    },
	capabilities = capabilities,
	on_attach = on_attach
})
lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach
})
lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = on_attach
})
