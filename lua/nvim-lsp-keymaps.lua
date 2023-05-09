-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gl', vim.lsp.codelens.run, bufopts)
	vim.keymap.set('n', 'glr', vim.lsp.codelens.refresh, bufopts)
	vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

local lsp_formatting_options = {
	formatting_options = {
		trimTrailingWhitespace = true,
		insertFinalNewline = true,
	},
	async = false
}

local setup_on_attach = function(auto_format, command, additional_action)
	return function(client, bufnr)
		if not auto_format then
			return on_attach
		end

		local options = {
			buffer = bufnr
		}

		if command then
			options.command = command
		else
			options.callback = function(event)
				vim.lsp.buf.format(lsp_formatting_options)
				if additional_action then
					additional_action()
				end
			end
		end

		vim.api.nvim_create_autocmd('BufWritePre', options)
		return on_attach(client, bufnr)
	end
end

return setup_on_attach
