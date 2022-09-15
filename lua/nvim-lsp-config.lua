-- Setup lspconfig.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
	}
})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = false

local on_attach = require('nvim-lsp-keymaps')

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lspconfig = require('lspconfig')

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	}
})

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
			shadow = true,
			fieldalignment = true,
			nilness = true,
			unusedWrite = true,
			useany = true,
			unusedvariable = true,
			},
			staticcheck = true,
		}
	},
	init_options = {
		usePlaceholders = true
	},
	capabilities = capabilities,
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	}
})

function GoOrganizeImports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

lspconfig.clangd.setup({
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
lspconfig.yamlls.setup({})
lspconfig.terraformls.setup({
    filetypes = {
        "terraform",
        "tf",
    }
})

vim.cmd [[
	autocmd BufWritePre *.scala :lua vim.lsp.buf.formatting()
	autocmd BufWritePre *.go,*js,*ts,*cpp,*c :lua vim.lsp.buf.formatting()
	autocmd BufWritePre *.go :lua GoOrganizeImports(1000)
]]
