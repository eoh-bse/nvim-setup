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
	cmd = { 'gopls' },
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
	capabilities = capabilities,
	on_attach = on_attach,
	autostart = true
})

function goimports(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

-- vim.cmd [[
--   autocmd BufWrite *.go lua vim.lsp.buf.formatting()
--   autocmd BufWrite *.go lua goimports(1000)
-- ]]

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach
})
lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = on_attach
})
