local lsp_autocmd_group = vim.api.nvim_create_augroup("UserLspConfig", {});
local setup_lsp_keymaps = require("nvim-lsp-keymaps")

local lsp_formatting_options = {
	formatting_options = {
		trimTrailingWhitespace = true,
		insertFinalNewline = true,
	},
	async = false
}

local setup_on_attach = function(auto_format, command, additional_action)
	return function(client, bufnr)
		if not auto_format or not client.supports_method("textDocument/formatting") then return end

		local options = {
			group = lsp_autocmd_group,
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

		vim.api.nvim_create_autocmd("BufWritePre", options)
	end
end

return function()
	-- Setup lspconfig.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions

	vim.diagnostic.config({
		virtual_text = true,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false
		}
	})

	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities_with_snippet =
		require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities_with_snippet.textDocument.completion.completionItem.snippetSupport = true

	local capabilities_without_snippet =
		require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities_without_snippet.textDocument.completion.completionItem.snippetSupport = false

	vim.lsp.config("lua_ls", {
		capabilities = capabilities_with_snippet,
		on_attach = setup_on_attach(true, nil, nil),
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				}
			}
		}
	})
	vim.lsp.enable("lua_ls")

	vim.lsp.config("pyright", {
		capabilities = capabilities_with_snippet,
		on_attach = setup_on_attach(true, nil, nil)
	})
	vim.lsp.enable("pyright")

	vim.lsp.config("bashls", {
		capabilities = capabilities_with_snippet,
		on_attach = setup_on_attach(true, nil, nil)
	})
	vim.lsp.enable("bashls")

	local function go_organize_imports(wait_ms)
		local params = vim.lsp.util.make_range_params(0, "utf-8")
		params.context = { only = { "source.organizeImports" } }
		vim.lsp.buf_request_sync(0, "workspace/executeCommand", {
			command = "gopls.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(0) },
		}, wait_ms)
	end

	vim.lsp.config("gopls", {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		root_markers = { "go.work", "go.mod", ".git" },
		settings = {
			gopls = {
				codelenses = {
					gc_details = true,
					tidy = true,
					upgrade_dependency = true
				},
				usePlaceholders = true,
				analyses = {
					unusedparams = true,
					shadow = true,
					nilness = true,
					unusedwrite = true,
					useany = true,
					unusedvariable = true,
				},
				staticcheck = true,
			}
		},
		capabilities = capabilities_without_snippet,
		on_attach = setup_on_attach(true, nil, function() go_organize_imports(1000) end),
		flags = {
			debounce_text_changes = 150
		}
	})
	vim.lsp.enable("gopls")

	vim.lsp.config("clangd", {
		cmd = {
			"clangd",
			"--background-index",
			-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
			-- to add more checks, create .clang-tidy file in the root directory
			-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
			"--clang-tidy",
			"--completion-style=detailed",
			"--header-insertion=iwyu"
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		init_options = {
			usePlaceholders = true,
			completeUnimported = true
		},
		capabilities = capabilities_without_snippet,
		on_attach = setup_on_attach(true, nil, nil)
	})
	vim.lsp.enable("clangd")

	-- lspconfig.arduino_language_server.setup({
	-- 	capabilities = capabilities_with_snippet,
	-- 	on_attach = setup_on_attach(false, nil, nil)
	-- })
	-- lspconfig.html.setup({
	-- 	capabilities = capabilities_with_snippet,
	-- 	on_attach = setup_on_attach(true, nil, nil)
	-- })
	vim.lsp.config("cssls", {
		capabilities = capabilities_with_snippet,
		on_attach = setup_on_attach(true, nil, nil)
	})
	vim.lsp.enable("cssls")

	vim.lsp.config("ts_ls", {
		capabilities = capabilities_with_snippet,
		on_attach = setup_on_attach(true, nil, nil)
	})
	vim.lsp.enable("ts_ls")
	-- lspconfig.eslint.setup({
	-- 	capabilities = capabilities_with_snippet,
	-- 	on_attach = setup_on_attach(true, "EslintFixAll", nil)
	-- })
	--
	-- lspconfig.jsonls.setup({
	-- 	capabilities = capabilities_with_snippet,
	-- 	on_attach = setup_on_attach(true, nil, nil)
	-- })

	setup_lsp_keymaps(lsp_autocmd_group)
end
